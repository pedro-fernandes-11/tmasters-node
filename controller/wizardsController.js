const crypto = require('crypto')
const path = require('path')
const fs = require('fs')
const wizardsModel = require("../model/wizards")

module.exports = {
    index: async function(req, res){
        wizardsModel.getAll()
        .then(result => {
            res.render('wizards.ejs', {
                data: result, user: req.session.username, isLoggedIn: req.session.loggedin
            })
        })
        .catch(err =>
            console.log(err))
    },

    create: function(req, res){
        if(req.session.loggedin){
            res.render('addWizard.ejs', {
                user: req.session.username, isLoggedIn: req.session.loggedin
            })
        }else{
            res.redirect('/')
        }
    },

    store: function(req, res){
        var formidable = require('formidable')
        var form = new formidable.IncomingForm()
        form.parse(req, (err, fields, files) => {
            var oldpath = files.img.filepath
            var hash = crypto.createHash('md5').update(Date.now().toString()).digest('hex')
            var imgName = hash + '.' + files.img.mimetype.split('/')[1]
            var newpath = path.join(__dirname, '../public/assets/uploads/', imgName)
            fs.rename(oldpath, newpath, function(err){
                if (err) throw err
            })
            wizardsModel.insert(fields['name'], fields['desc'], imgName)
        })

        res.redirect('/wizards')
    },

    destroy: function(req, res){
        var id = req.params.id
        wizardsModel.get(id)
        .then(result => {
            var img = path.join(__dirname, '../public/assets/uploads/', result[0]['img'])
            if(req.session.loggedin){
                fs.unlink(img, (err) => {})
                wizardsModel.delete(id)
                res.redirect('/wizards')
            }else{
                res.redirect('/')
            }
            
        })
        .catch(err => console.log(err))
        
    },

    edit: async function(req, res){
        var id = req.params.id
        wizardsModel.get(id)
        .then(result => {
            console.log(result)
            if(req.session.loggedin){
                res.render('editWizard.ejs', {data: result[0]})
            }else{
                res.redirect('/')
            }
        })
        .catch(err => console.log(err))
    },

    update: function(req, res){
        var formidable = require('formidable')
        var form = new formidable.IncomingForm()
        form.parse(req, (err, fields, files) => {
            if(files.img.size == 0){
                var id = req.params.id
                var name = fields['name']
                var desc = fields['desc']
                wizardsModel.get(id)
                .then(result => {
                    var imgName = result[0]['img']
                    wizardsModel.update(id, name, desc, imgName)
                })
                .catch(err => console.log(err))
            }else{
                var id = req.params.id
                var name = fields['name']
                var desc = fields['desc']

                wizardsModel.get(id)
                .then(result => {
                    var imgOldPath = path.join(__dirname, '../public/assets/uploads/', result[0]['img'])
                    fs.unlink(imgOldPath, (err) => {})
                })
                .catch(err => console.log(err))

                var oldpath = files.img.filepath
                var hash = crypto.createHash('md5').update(Date.now().toString()).digest('hex')
                var imgName = hash + '.' + files.img.mimetype.split('/')[1]
                var newpath = path.join(__dirname, '../public/assets/uploads/', imgName)
                fs.rename(oldpath, newpath, function(err){
                    if (err) throw err
                })
                wizardsModel.update(id, name, desc, imgName)
            }
        })

        res.redirect('/wizards')
    }
}