// -*- javascript -*-

let bodyParser = require( 'body-parser' );
let path = require( 'path' );

module.exports = function( globals ) {
  // globals.app.use( bodyParser.urlencoded( { extended: true } ) );
  globals.app.use( bodyParser.json() );

  let Question_ctrlr = require( '../controllers/Question.js' );

  globals.app.post   ( '/api/questions/',    ( req, res ) => Question_ctrlr.create   ( req, res ) );
  globals.app.get    ( '/api/questions/',    ( req, res ) => Question_ctrlr.read_all ( req, res ) );
  globals.app.get    ( '/api/questions/:pk', ( req, res ) => Question_ctrlr.read_one ( req, res ) );
  globals.app.put    ( '/api/questions/:pk', ( req, res ) => Question_ctrlr.update   ( req, res ) );
  globals.app.delete ( '/api/questions/:pk', ( req, res ) => Question_ctrlr.delete   ( req, res ) );

  // Default (delegate to front-end router)
  globals.app.all( '*', ( req, res ) => res.sendFile( path.resolve( './client/dist/index.html' ) ) );
}
