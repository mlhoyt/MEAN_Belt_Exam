// -*- javascript -*-

let mongoose = require('mongoose');

let Schema = mongoose.Schema;

module.exports = function( globals ) {
  let QuestionSchema = new mongoose.Schema(
    {
      text: {
        type: String,
        required: true,
        minlength: 15,
      },
      answer: {
        type: String,
        required: true,
        minlength: 1,
      },
      fake1: {
        type: String,
        required: true,
        minlength: 1,
      },
      fake2: {
        type: String,
        required: true,
        minlength: 1,
      },
    },
    {
      timestamps: true,
    }
  );

  let Question = mongoose.model( 'Question', QuestionSchema );
}
