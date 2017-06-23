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

print OFH "import { Injectable } from '\@angular/core';\n";
print OFH "import { Http } from '\@angular/http';\n";
print OFH "\n";
print OFH "import 'rxjs/add/operator/map';\n";
print OFH "import 'rxjs/add/operator/toPromise';\n";
print OFH "\n";
print OFH "\@Injectable()\n";
print OFH "export class {{TABLE_NAME}}ApiService {\n";
print OFH "  constructor(\n";
print OFH "    private _http: Http\n";
print OFH "  )\n";
print OFH "  {}\n";
print OFH "\n";
print OFH "  create( item ) {\n";
print OFH "    return this._http.post( '{{URL}}', item )\n";
print OFH "      .map( data => data.json() )\n";
print OFH "      .toPromise();\n";
print OFH "  }\n";
print OFH "\n";
print OFH "  read_all() {\n";
print OFH "    return this._http.get( '{{URL}}' )\n";
print OFH "      .map( data => data.json() )\n";
print OFH "      .toPromise();\n";
print OFH "  }\n";
print OFH "\n";
print OFH "  read_one( pk ) {\n";
print OFH "    return this._http.get( '{{URL}}/${pk}' )\n";
print OFH "      .map( data => data.json() )\n";
print OFH "      .toPromise();\n";
print OFH "  }\n";
print OFH "\n";
print OFH "  update( item, pk ) {\n";
print OFH "    return this._http.put( '{{URL}}/${pk}', item )\n";
print OFH "      .map( data => data.json() )\n";
print OFH "      .toPromise();\n";
print OFH "  }\n";
print OFH "\n";
print OFH "  delete( pk ) {\n";
print OFH "    return this._http.delete( '{{URL}}/${pk}' )\n";
print OFH "      .map( data => data.json() )\n";
print OFH "      .toPromise();\n";
print OFH "  }\n";
print OFH "}\n";

close( OFH );

