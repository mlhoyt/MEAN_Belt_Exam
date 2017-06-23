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
$opt_class = shift @ARGV;
$opt_name = shift @ARGV;

######################################################################
# Command-line Processing
######################################################################

######################################################################
# Subroutine Definitions
######################################################################

my $ts_class_name = join( "", map( ucfirst, split( /\-/, $opt_name ) ) ) . "DataService";

open( OFH, "> ${opt_file}" ) or do {
    die( "Fatal: Cannot write file \"${opt_file}\"!" );
};

printf OFH "import { Injectable } from '\@angular/core';\n";
printf OFH "import { Subject } from 'rxjs/Subject';\n";
printf OFH "import { BehaviorSubject } from 'rxjs/BehaviorSubject';\n";
printf OFH "import { %s } from './%s';\n", $opt_class, lc( $opt_class );
printf OFH "\n";
printf OFH "\@Injectable()\n";
printf OFH "export class %s {\n", $ts_class_name;
printf OFH "  subject = new BehaviorSubject( null );\n";
printf OFH "\n";
printf OFH "  constructor() { }\n";
printf OFH "\n";
printf OFH "  update( data: %s ) {\n", $opt_class;
printf OFH "    this.subject.next( data );\n";
printf OFH "  }\n";
printf OFH "}\n";

close( OFH );

