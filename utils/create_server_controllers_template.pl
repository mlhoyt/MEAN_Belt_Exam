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
# Subroutine Definitions
######################################################################

open( OFH, "> ${opt_file}" ) or do {
    die( "Fatal: Cannot write file \"${opt_file}\"!" );
};

print OFH "// -*- javascript -*-\n";
print OFH "\n";
print OFH "let mongoose = require('mongoose');\n";
print OFH "\n";
print OFH "let {{TABLE_NAME}} = mongoose.model( '{{TABLE_NAME}}' );\n";
print OFH "\n";
print OFH "module.exports = {\n";
print OFH "  create: function( req, res ) {\n";
print OFH "    let item = new {{TABLE_NAME}}( req.body );\n";
print OFH "    item.save()\n";
print OFH "      .catch( err => res.status( 500 ).json( err ) )\n";
print OFH "      .then( () => res.json( true ) );\n";
print OFH "  },\n";
print OFH "\n";
print OFH "  read_all: function( req, res ) {\n";
print OFH "    {{TABLE_NAME}}.find({})\n";
print OFH "      // .sort( '{{FIELD_NAME}}|-{{FIELD_NAME}}') // createdAt, -createdAt\n";
print OFH "      .catch( err => res.status( 500 ).json( err ) )\n";
print OFH "      .then( data => res.json( data ) );\n";
print OFH "  },\n";
print OFH "\n";
print OFH "  read_one: function( req, res ) {\n";
print OFH "    {{TABLE_NAME}}.findOne({ {{PARAM}}: req.params.pk })\n";
print OFH "      .catch( err => res.status( 500 ).json( err ) )\n";
print OFH "      .then( data => res.json( data ) );\n";
print OFH "  },\n";
print OFH "\n";
print OFH "  update: function( req, res ) {\n";
print OFH "    {{TABLE_NAME}}.updateOne({ {{PARAM}}: req.params.pk }, {\$set: req.body})\n";
print OFH "      .catch( err => res.status( 500 ).json( err ) )\n";
print OFH "      .then( () => res.json( true ) );\n";
print OFH "  },\n";
print OFH "\n";
print OFH "  delete: function( req, res ) {\n";
print OFH "    {{TABLE_NAME}}.remove({ {{PARAM}}: req.params.pk })\n";
print OFH "      .catch( err => res.status( 500 ).json( err ) )\n";
print OFH "      .then( () => res.json( true ) );\n";
print OFH "  },\n";
print OFH "}\n";

close( OFH );

