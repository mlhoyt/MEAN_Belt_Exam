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

  let Score_ctrlr = require( '../controllers/Score.js' );

  globals.app.post   ( '/api/scores/',    ( req, res ) => Score_ctrlr.create   ( req, res ) );
  globals.app.get    ( '/api/scores/',    ( req, res ) => Score_ctrlr.read_all ( req, res ) );
  globals.app.get    ( '/api/scores/:pk', ( req, res ) => Score_ctrlr.read_one ( req, res ) );
  globals.app.put    ( '/api/scores/:pk', ( req, res ) => Score_ctrlr.update   ( req, res ) );
  globals.app.delete ( '/api/scores/:pk', ( req, res ) => Score_ctrlr.delete   ( req, res ) );

  globals.app.post ( '/actions/login', ( req, res ) => {
    if( req.body.user ) {
      req.session.user = req.body.user;
      res.json(true)
    }
    else {
      res.status( 500 ).json( "No user name given" );
    }
  });

  globals.app.get ( '/actions/isLoggedIn', ( req, res ) => {
    if( req.session.user ) {
      res.json( req.session.user );
    }
    else {
      res.status( 500 ).json();
    }
  });

  globals.app.get ( '/actions/logout', (req, res) => {
    req.session.destroy();
    res.redirect( '/' );
  });

  // Default (delegate to front-end router)
  globals.app.all( '*', ( req, res ) => res.sendFile( path.resolve( './client/dist/index.html' ) ) );
}
