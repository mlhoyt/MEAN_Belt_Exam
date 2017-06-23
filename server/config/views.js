// -*- javascript -*-

let express = require( 'express' );
let path = require( 'path' );

module.exports = function( globals ) {
  globals.app.use( express.static( path.join( __dirname, '../../client/dist' ) ) );
  globals.app.use( express.static( path.join( __dirname, '../../node_modules' ) ) );
};
