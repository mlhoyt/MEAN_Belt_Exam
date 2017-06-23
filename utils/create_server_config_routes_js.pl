#!/usr/bin/env perl

######################################################################
# External Dependecies
######################################################################

use File::Basename;

######################################################################
# Program Documentation
######################################################################

######################################################################
# Global Variables
######################################################################

$opt_file = shift @ARGV;

######################################################################
# Command-line Processing
######################################################################

######################################################################
# Main Program
######################################################################

open( OFH, "> ${opt_file}" ) or do {
    die( "Fatal: Cannot write file \"${opt_file}\"!" );
};

print OFH "// -*- javascript -*-\n";
print OFH "\n";
print OFH "let bodyParser = require( 'body-parser' );\n";
print OFH "let path = require( 'path' );\n";
print OFH "\n";
print OFH "module.exports = function( globals ) {\n";
print OFH "  // globals.app.use( bodyParser.urlencoded( { extended: true } ) );\n";
print OFH "  globals.app.use( bodyParser.json() );\n";
print OFH "\n";
print OFH "  // let {{TABLE_NAME}}_ctrlr = require( '../controllers/{{TABLE_NAME}}.js' );\n";
print OFH "\n";
print OFH "  // globals.app.post   ( '/{{URL}}',     ( req, res ) => {{TABLE_NAME}}_ctrlr.create   ( req, res ) );\n";
print OFH "  // globals.app.get    ( '/{{URL}}',     ( req, res ) => {{TABLE_NAME}}_ctrlr.read_all ( req, res ) );\n";
print OFH "  // globals.app.get    ( '/{{URL}}/:pk', ( req, res ) => {{TABLE_NAME}}_ctrlr.read_one ( req, res ) );\n";
print OFH "  // globals.app.put    ( '/{{URL}}/:pk', ( req, res ) => {{TABLE_NAME}}_ctrlr.update   ( req, res ) );\n";
print OFH "  // globals.app.delete ( '/{{URL}}/:pk', ( req, res ) => {{TABLE_NAME}}_ctrlr.delete   ( req, res ) );\n";
print OFH "\n";
print OFH "  // Default (delegate to front-end router)\n";
print OFH "  globals.app.all( '*', ( req, res ) => res.sendFile( path.resolve( './client/dist/index.html' ) ) );\n";
print OFH "}\n";

close( OFH );

