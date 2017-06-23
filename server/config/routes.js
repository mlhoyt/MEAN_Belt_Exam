// -*- javascript -*-

let bodyParser = require( 'body-parser' );
let path = require( 'path' );

module.exports = function( globals ) {
  // globals.app.use( bodyParser.urlencoded( { extended: true } ) );
  globals.app.use( bodyParser.json() );

  // let {{TABLE_NAME}}_ctrlr = require( '../controllers/{{TABLE_NAME}}.js' );

  // globals.app.post   ( '/{{URL}}',     ( req, res ) => {{TABLE_NAME}}_ctrlr.create   ( req, res ) );
  // globals.app.get    ( '/{{URL}}',     ( req, res ) => {{TABLE_NAME}}_ctrlr.read_all ( req, res ) );
  // globals.app.get    ( '/{{URL}}/:pk', ( req, res ) => {{TABLE_NAME}}_ctrlr.read_one ( req, res ) );
  // globals.app.put    ( '/{{URL}}/:pk', ( req, res ) => {{TABLE_NAME}}_ctrlr.update   ( req, res ) );
  // globals.app.delete ( '/{{URL}}/:pk', ( req, res ) => {{TABLE_NAME}}_ctrlr.delete   ( req, res ) );

  // Default (delegate to front-end router)
  globals.app.all( '*', ( req, res ) => res.sendFile( path.resolve( './client/dist/index.html' ) ) );
}
