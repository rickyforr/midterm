"use strict";

const db = require('../db/queries.js');

const express = require('express');
const router  = express.Router();




module.exports = function (knex) {

  //This is for New Comments logic //

  router.post("/", (req, res) => {

     let comment = {}
      comment.user_id = '5'
      comment.resource_id = '1'
      comment.c_text = req.body.comment

    db(knex).saveComment(comment, function(comment) {

    res.redirect("/resource_id");

          });


})


  return router;
}



