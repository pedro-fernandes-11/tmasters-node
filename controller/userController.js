const bcrypt = require('bcrypt')
const userModel = require("../model/user.js")

const saltRounds = 10

module.exports = {
    register: function(req, res){
        res.render('registration.ejs')
    },

    store: function(req, res){
        var user = req.body.user
        userModel.get(user)
        .then(result =>
            {
                console.log(result)
                if(result.length){
                    res.render('login.ejs', {msg: 'Usuário já existe, faça login'})
                    res.end()
                }else{
                    bcrypt.hash(req.body.pass, saltRounds, function(err, hash){
                        userModel.insert(req.body.user, req.body.name, hash)
                        res.redirect('/login')
                    })
                }
            })
        .catch(err =>
            console.log(err))
        
    },

    login: function(req, res){
        res.render('login.ejs')
    },

    auth: function(req, res){
        var user = req.body.user
        userModel.get(user)
        .then(result =>
            {
                if(result.length){
                    bcrypt.compare(req.body.pass, result[0]['pass'], function(err, resultComparison){
                        if (err) throw err
                        if (resultComparison){
                            req.session.loggedin = true
                            req.session.username = result[0]['name']
                            res.redirect('/')
                        }else{
                            res.render('login.ejs', {msg: 'Login failed for user '+user})
                            res.end()
                        }
                    })
                }else{
                    res.render('login.ejs', {msg: 'Login failed for user '+user})
                    res.end()
                }
            })
        .catch(err =>
            console.log(err))
        
    },

    logout: function(req, res){
        req.session.destroy(function(err){})
        res.redirect('/login')
    }
}