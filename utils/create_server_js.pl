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
$opt_project_name = shift @ARGV;
$opt_db_server_path = shift @ARGV;
$opt_web_server_port = shift @ARGV;

######################################################################
# Main Program
######################################################################

open( OFH, "> ${opt_file}" ) or do {
  die( "Fatal: Cannot write file \"${opt_file}\"!" );
};

printf OFH "// -*- javascript -*-\n";
printf OFH "\n";
printf OFH "// ----------------------------------------------------------------------\n";
printf OFH "// DEPENDENCIES\n";
printf OFH "// ----------------------------------------------------------------------\n";
printf OFH "let express = require( 'express' );\n";
printf OFH "let session = require( 'express-session' );\n";
printf OFH "\n";
printf OFH "// ----------------------------------------------------------------------\n";
printf OFH "// GLOBALS\n";
printf OFH "// ----------------------------------------------------------------------\n";
printf OFH "let globals = {};\n";
printf OFH "\n";
printf OFH "globals.DB_SERVER_PATH = '%s';\n", $opt_db_server_path;
printf OFH "globals.DB_NAME = '%s';\n", $opt_project_name;
printf OFH "\n";
printf OFH "// globals.{{DATA}}_TYPES: Array<string> = [ ... ];\n";
printf OFH "\n";
printf OFH "globals.WEB_SERVER_PORT = %s;\n", $opt_web_server_port;
printf OFH "\n";
printf OFH "globals.app = express();\n";
printf OFH "\n";
printf OFH "globals.app.use( session({\n";
printf OFH "  secret: 'NodeJS-Express Project Session Secret',\n";
printf OFH "  resave: false,\n";
printf OFH "  saveUninitialized: true\n";
printf OFH "}));\n";
printf OFH "\n";
printf OFH "// ----------------------------------------------------------------------\n";
printf OFH "// MVC:MODELS\n";
printf OFH "// ----------------------------------------------------------------------\n";
printf OFH "require( './server/config/models.js' )( globals );\n";
printf OFH "\n";
printf OFH "// ----------------------------------------------------------------------\n";
printf OFH "// MVC:VIEWS\n";
printf OFH "// ----------------------------------------------------------------------\n";
printf OFH "require( './server/config/views.js' )( globals );\n";
printf OFH "\n";
printf OFH "// ----------------------------------------------------------------------\n";
printf OFH "// MVC:CONTROLLERS\n";
printf OFH "// ----------------------------------------------------------------------\n";
printf OFH "require( './server/config/routes.js' )( globals );\n";
printf OFH "\n";
printf OFH "// ----------------------------------------------------------------------\n";
printf OFH "// WEB SERVER\n";
printf OFH "// ----------------------------------------------------------------------\n";
printf OFH "globals.app.listen( globals.WEB_SERVER_PORT, function() {\n";
printf OFH "    console.log( 'Server listening on port', globals.WEB_SERVER_PORT ); // INFO\n";
printf OFH "});\n";

close( OFH );

