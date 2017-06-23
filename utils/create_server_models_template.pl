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
print OFH "let mongoose = require('mongoose');\n";
print OFH "\n";
print OFH "let Schema = mongoose.Schema;\n";
print OFH "\n";
print OFH "module.exports = function( globals ) {\n";
print OFH "  let {{TABLE_NAME}}Schema = new mongoose.Schema(\n";
print OFH "    {\n";
print OFH "      // Unique Field/s\n";
print OFH "      // {{FIELD_NAME}}: {\n";
print OFH "      //   type: {{String, Number, Boolean, Date, Mixed=>{}, Array=>[<TYPE>], ObjectId=>Schema.Types.ObjectId}},\n";
print OFH "      //   required: {{true, false}}, ]  # -or- [ {{true, false}}, '{{MESSAGE}}'\n";
print OFH "      //   unique: true,\n";
print OFH "      //   minlength: {{Number}} },\n";
print OFH "      //   maxlength: {{Number}} },\n";
print OFH "      //   min: {{Number|new Date('YYYY-MM-DD')}} },\n";
print OFH "      //   max: {{Number|new Date('YYYY-MM-DD')}} },\n";
print OFH "      //   enum: globals.{{DATA}}_TYPES,\n";
print OFH "      //   trim: true,\n";
print OFH "      //   validate: [\n";
print OFH "      //     {\n";
print OFH "      //       validator: function( value ) {\n";
print OFH "      //         return ...; # boolean /{{REGEX}}/.test( value );\n";
print OFH "      //       },\n";
print OFH "      //       message: '...{ VALUE }...'\n";
print OFH "      //     },\n";
print OFH "      //     ...\n";
print OFH "      //   ],\n";
print OFH "      // },\n";
print OFH "      // ...\n";
print OFH "\n";
print OFH "      // Many-to-* Relationship/s\n";
print OFH "      // _{{FIELD_NAME}}: [{\n";
print OFH "      //   type: Schema.Types.ObjectId, ref: '{{TABLE_NAME}}',\n";
print OFH "      //   default: [],\n";
print OFH "      // }],\n";
print OFH "      // ...\n";
print OFH "\n";
print OFH "      // One-to-* Relationship/s\n";
print OFH "      // _{{FIELD_NAME}}: {\n";
print OFH "      //   type: Schema.Types.ObjectId, ref: '{{TABLE_NAME}}',\n";
print OFH "      // },\n";
print OFH "      // ...\n";
print OFH "    },\n";
print OFH "    {\n";
print OFH "      timestamps: true,\n";
print OFH "    }\n";
print OFH "  );\n";
print OFH "\n";
print OFH "  let {{TABLE_NAME}} = mongoose.model( '{{TABLE_NAME}}', {{TABLE_NAME}}Schema );\n";
print OFH "}\n";

close( OFH );

