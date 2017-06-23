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

######################################################################
# Command-line Processing
######################################################################

$opt_file = shift @ARGV;

######################################################################
# Main Program
######################################################################

open( OFH, "> ${opt_file}" ) or do {
    die( "Fatal: Cannot write file \"${opt_file}\"!" );
};

printf OFH "// -*- javascript -*-\n";
printf OFH "\n";
printf OFH "let mongoose = require('mongoose');\n";
printf OFH "let fs = require('fs');\n";
printf OFH "let path = require('path');\n";
printf OFH "\n";
printf OFH "module.exports = function( globals ) {\n";
printf OFH "  mongoose.Promise = global.Promise;\n";
printf OFH "\n";
printf OFH "  mongoose.connect( 'mongodb://' + globals.DB_SERVER_PATH + '/' + globals.DB_NAME );\n";
printf OFH "\n";
printf OFH "  let models_path = path.join( __dirname, './../models' );\n";
printf OFH "\n";
printf OFH "  fs.readdirSync( models_path ).forEach( function( file ) {\n";
printf OFH "    if( file.indexOf( '.js' ) >= 0 ) {\n";
printf OFH "      // require the file (this runs the model file which registers the schema)\n";
printf OFH "      require( models_path + '/' + file )( globals );\n";
printf OFH "    }\n";
printf OFH "  });\n";
printf OFH "}\n";

close( OFH );

