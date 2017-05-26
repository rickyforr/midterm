"use strict";

const db = require('../db/queries.js');

const express = require('express');
const router  = express.Router();
const bcrypt  = require('bcrypt');



module.exports = function (knex) {

  //This is the Login//

  router.post("/", (req, res) => {
    const email = req.body.email;
    db(knex).getUserByEmail(email, function(user) {

      if (user) {

        if(req.body.password === user.password) {
          console.log("success");
          //req.session.user = user;

          console.log("failed");
//          res.status(200).redirect("/api/users");
          res.status(200).redirect("/api/resources");

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






