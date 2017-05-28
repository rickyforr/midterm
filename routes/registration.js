"use strict";

const db = require('../db/queries.js');

const express = require('express');
const router  = express.Router();
//const bcrypt  = require('bcrypt');



module.exports = function (knex) {

  //This is the Registration//

  router.post("/", (req, res) => {

    const email = req.body.email;
    const username = req.body.uname
    const password = req.body.pword

    let user = {}
      user.name = username
      user.email = email
      user.password = password

    db(knex).saveUser(user, function(user) {

    res.status(200).render("user_page");
          });


    })



  return router;

}




