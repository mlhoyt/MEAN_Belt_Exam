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
print OFH "let express = require( 'express' );\n";
print OFH "let path = require( 'path' );\n";
print OFH "\n";
print OFH "module.exports = function( globals ) {\n";
print OFH "  globals.app.use( express.static( path.join( __dirname, '../../client/dist' ) ) );\n";
print OFH "  globals.app.use( express.static( path.join( __dirname, '../../node_modules' ) ) );\n";
print OFH "};\n";

close( OFH );

