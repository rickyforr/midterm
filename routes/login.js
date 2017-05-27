"use strict";

const db = require('../db/queries.js');

const express = require('express');
const router  = express.Router();
//const bcrypt  = require('bcrypt');


module.exports = function (knex) {

  //This is the Login Logic//

  router.post("/", (req, res) => {

    const email = req.body.email;
    db(knex).getUserByEmail(email, function(user) {

      if (user) {
        if(req.body.password === user.password) {
          db(knex).getResourcesByUser(user.id, function(resourcesFromDB) {
          res.status(200).render("resource", {resources: resourcesFromDB });
        });
        } else {
            req.session.error_message = 'Email and/or password is incorrect.  Please try again.';
            res.status(401).redirect('/');
            return;
        }
      } else {
        req.session.error_message = 'Email and/or password is incorrect.  Please try again.';
        res.status(401).redirect('/');
        return;
      }
    })
  })

  return router;
}






