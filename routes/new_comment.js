"use strict";

const db = require('../db/queries.js');

const express = require('express');
const router  = express.Router();
//const bcrypt  = require('bcrypt');



module.exports = function (knex) {

  //This is for New Resources logic //

  router.post("/resource_", (req, res) => {
    var resource  = {};
        resource.url = req.body.url;
        resource.title = req.body.title;
        resource.desc = req.body.dscript;
        //hardcoded for experimental reasons
        resource.user_id = 3;

    db(knex).saveResource(resource, function() {


       db(knex).getResourcesByUser(3, function(resourcesFromDB) {

          res.status(200)
        });


    })

  })

  return router;
}



