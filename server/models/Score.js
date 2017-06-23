// -*- javascript -*-

let mongoose = require('mongoose');

let Schema = mongoose.Schema;

module.exports = function( globals ) {
  let ScoreSchema = new mongoose.Schema(
    {
      nrCorrect: {
        type: Number,
        required: true,
        min: 0,
      },
      nrAsked: {
        type: Number,
        required: true,
        min: 1,
      },
      user: {
        type: String,
        required: true,
        minlength: 1,
      },
    },
    {
      timestamps: true,
    }
  );

  let Score = mongoose.model( 'Score', ScoreSchema );
}
