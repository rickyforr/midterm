"use strict";

const db = require('../db/queries.js');

const express = require('express');
const router  = express.Router();
//const bcrypt  = require('bcrypt');



module.exports = function (knex) {

  //This is for New Resources logic //



     router.post("/addcomment", (req, res) => {



      var comment={};
      comment.resource_id = req.session.resourceId;
      comment.user_id = req.session.userId;
      comment.text = req.body.comment;

      db(knex).saveComment(comment, function(com) {


               res.status(200).render("resource_comment");
        });

  })




  return router;
}



