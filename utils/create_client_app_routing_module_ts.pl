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

printf OFH "import { NgModule } from '\@angular/core';\n";
printf OFH "import { Routes, RouterModule } from '\@angular/router';\n";
printf OFH "import { {{COMP}}Component } from '.../{{COMP}}.component';\n";
printf OFH "\n";
printf OFH "const routes: Routes = [\n";
printf OFH "// NOTE: path-URL has NO leading '/'\n";
printf OFH "// NOTE: redirectTo-URL CAN (but does not have to) have leading '/'\n";
printf OFH "// NOTE: component.html: <a [routerLink]=\"['/{{URL}}', ...]\">...</a>'\n";
printf OFH "// NOTE: component.ts: this._router.navigate( ['/{{URL}}', '{{URL}}'|{{VAR}}, ... ] );\n";
printf OFH "// { path: '{{URL}}', [ pathMatch: 'full', ] component: {{COMP}}Component },\n";
printf OFH "// { path: '{{URL}}', [ pathMatch: 'full', ] redirectTo: '/{{URL}}' },\n";
printf OFH "];\n";
printf OFH "\n";
printf OFH "\@NgModule({\n";
printf OFH "  imports: [ RouterModule.forRoot( routes ) ],\n";
printf OFH "  exports: [ RouterModule ]\n";
printf OFH "})\n";
printf OFH "export class AppRoutingModule {}\n";

close( OFH );

