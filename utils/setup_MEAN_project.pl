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

$opt_project_root   = "/Users/mhoyt/Desktop/DojoMisc/MEAN/Belt_Exam";
$opt_project_name   = basename( $opt_project_root );
$opt_db_server_path = "localhost";
$opt_web_server_path = "localhost";
$opt_web_server_port = "8000";

$opt_use_server_session = 1;
$opt_use_client_forms = 1;
$opt_use_client_routing = 1;

# TABLE_NAME, URL, [ FIELD_NAME:TYPE, ... ]
@opt_models = (
#   [
#     "User",
#     "/users",
#     [
#       [ "email", "string" ],
#       [ "first_name", "string" ],
#       [ "last_name", "string" ],
#       [ "pw", "string" ],
#       [ "birthday", "Date" ]
#     ],
#   ]
);

@opt_components = (
#   "home",
#   "home/registration",
#   "home/login",
#   "home/sucess",
);

######################################################################
# Command-line Processing
######################################################################

######################################################################
# Main Program
######################################################################

# Create Github Repo - {{TRACK}}_{{SECTION}}_{{PROJECT}}

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# x printf STDERR "Info: Project Directory - prep\n";
# x system( "mkdir ${opt_project_root}" );
# x system( "mkdir ${opt_project_root}/logs" );
# x &create_gitignore( "${opt_project_root}/.gitignore" );
# x system( "cd ${opt_project_root}; git init" );
# x system( "# cd ${opt_project_root}; git remote add origin https://github.com/${GITHUB_USERNAME}/{{TRACK}}_{{SECTION}}_{{PROJECT}}.git" );

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# x printf STDERR "Info: Database (MongoDB) - prep\n";
# x system( "which mongod" );
# x system( "mongod --version" );

# x printf STDERR "Info: Database (MongoDB) - setup\n";
# x system( "mkdir -p ${opt_project_root}/db/data/db" );

# x printf STDERR "Info: Database (MongoDB) - launch\n";
# x system( "mongod --dbpath ${opt_project_root}/db/data/db >& ${opt_project_root}/logs/mongod.log &" );

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# x printf STDERR "Info: Client (Angular) - prep\n";
# x system( "which ng" );
# x system( "ng --version" );

# x printf STDERR "Info: Client (Angular) - setup\n";
# x system( "cd ${opt_project_root}; ng new client --skip-install >& logs/ng_new.log" );
# x system( "# TL;DD: cd ${opt_project_root}/client; npm install >& ../logs/client.npm_install.log" );
# x system( "cd ${opt_project_root}/client; cp -r ~/Desktop/DojoMisc/MEAN/client_node_modules node_modules" );

# x printf STDERR "Info: Client (Angular) - launch\n";
# x system( "cd ${opt_project_root}/client; ng build 2>&1 | tee ../logs/ng_build.log" );
# x system( "cd ${opt_project_root}/client; ng build -w 2>&1 >> ../logs/ng_build.log &" );

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# x printf STDERR "Info: Server (Node/Express) - prep\n";
# x system( "which node" );
# x system( "node --version" );
# x system( "which nodemon" );
# x system( "nodemon --version" );

# x printf STDERR "Info: Server (Node/Express) - setup\n";
# x system( "mkdir -p ${opt_project_root}/server/config" );
# x system( "mkdir -p ${opt_project_root}/server/controllers" );
# x system( "mkdir -p ${opt_project_root}/server/models" );
# x system( "cd ${opt_project_root}/; npm init -y >& logs/npm_init.log" );
# x system( "# cd ${opt_project_root}/; npm install express --save >& logs/npm_install.express.log" );
# x system( "# cd ${opt_project_root}/; npm install body-parser --save >& logs/npm_install.body-parser.log" );
# x system( "# cd ${opt_project_root}/; npm install mongoose --save >& logs/npm_install.mongoose.log" );
# x system( "# cd ${opt_project_root}/; npm install express-session --save >& logs/npm_install.express-session.log" );
# x system( "# cd ${opt_project_root}/; npm install bcrypt --save >& logs/npm_install.bcrypt.log" );
# x system( "# cd ${opt_project_root}/; npm install moment --save >& logs/npm_install.moment.log" );
# x system( "./utils/create_server_js.pl ./server.js ${opt_project_name} ${opt_db_server_path} ${opt_web_server_port}" );
# x system( "./utils/create_server_config_models_js.pl ./server/config/models.js" );
# x system( "./utils/create_server_models_template.pl ./server/models/template.table" );
# x system( "./utils/create_server_config_views_js.pl ./server/config/views.js" );
# x system( "./utils/create_server_config_routes_js.pl ./server/config/routes.js" );
# x system( "./utils/create_server_controllers_template.pl ./server/controllers/template.table" );
# x system( "./utils/create_client_template_api_service.pl ./client/src/app/template.table.api_service" );

# x printf STDERR "Info: Server (Node/Express) - launch\n";
# x print( "# cd ${opt_project_root}/; nodemon server.js\n" );

# x printf STDERR "Info: Server (Node/Express) - test\n";
# x system( sprintf "curl http://%s:%s", ${opt_web_server_path}, ${opt_web_server_port} );

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# printf STDERR "Info: Development\n";

# printf STDERR "Info: Database/Server API\n";
# printf STDERR "- [x] Create server/models/{{TABLE_NAME}}.js\n";
# printf STDERR "  - [x] cat server/models/template.table | perl -pe 's/\{\{TABLE_NAME\}\}/NAME/g' > server/models/NAME.js\n";
# printf STDERR "  - [x] Edit server/models/NAME.js\n";
# printf STDERR "- [x] Create server/controllers/{{TABLE_NAME}}.js\n";
# printf STDERR "  - [x] cat server/controllers/template.README | perl -pe 's/\{\{TABLE_NAME\}\}/NAME/g' | perl -pe 's/\{\{PARAM\}\}/NAME/g' > server/controllers/NAME.js\n";
# printf STDERR "  - [x] Edit server/controllers/NAME.js\n";
# printf STDERR "- [x] Update server/config/routes.js for {{TABLE_NAME}}, {{URL}}\n";
# printf STDERR "- [x] Test API\n";

# printf STDERR "Info: Client Database API Service/s\n";
# printf STDERR "- [x] Update src/app/app.module.ts: Import HttpModule\n";
# printf STDERR "- [x] cd ${opt_project_root}/client\n";
# printf STDERR "- [x] ng generate service {{TABLE_NAME}}-api\n";
# printf STDERR "- [x] cat src/app/template.table.api_service | perl -pe 's/\{\{TABLE_NAME\}\}/NAME/g' | perl -pe 's/\{\{URL\}\}/URL/g' > src/app/NAME-api.service.ts\n";
# printf STDERR "- [x] Update src/app/app.module.ts: Register {{TABLE_NAME}}-api.service\n";
# printf STDERR "- [x] ng generate class {{TABLE_NAME}}\n";
# printf STDERR "- [x] Update src/app/{{TABLE_NAME}}.ts: Add content from server/models/{{TABLE_NAME}}.js\n";

# printf STDERR "Info: Client External API Service/s\n";
# printf STDERR "- [ ] cd .../{{MEAN_PROJECT}}/client/\n";
# printf STDERR "- [ ] ng generate service {{EXTERNAL}}-api\n";
# printf STDERR "- [ ] Update src/app/{{EXTERNAL}}-api.service.ts: Leverage src/app/template.table.api_service\n";
# printf STDERR "- [ ] Update src/app/app.module.ts: Register {{EXTERNAL}}-api.service\n";

# Create/Register {{DATA}}-data.service
# printf STDERR "- [x] ng generate service {{DATA}}-data\n";
# &create_client_data_service_ts( "${opt_project_root}/client/src/app/{{DATA}}-data.service.ts", "User", "{{DATA}}" );
# printf STDERR "- [x] Update app.module.ts: Register {{DATA}}DataService\n";
# {{COMP}}.compoent: Needs to start the {{DATA}}-data.service

# printf STDERR "Info: Client Component/s\n";
# printf STDERR "- [ ] cd .../{{MEAN_PROJECT}}/client/\n";
# printf STDERR "- [ ] ng generate component {{NAME}}\n";

# ng generate component app-home
# Update app.component.html: Remove default content; Add app-home.component element

# ng generate component register
# ng generate component login
# ng generate component success
# Update app-home.component.html: Remove default content; Add register.component, login.component, success.component elements

# &create_client_app_routing_module_ts( "${opt_project_root}/client/src/app/app-routing.module.ts" );
# Update app-routing.module.ts: Add applicable components
# Update app-routing.module.ts: Add applicable routes
# Update app.module.ts: Register app-routing.module
# Update {{COMP}}.component.html: User <router-outlet> element and anchor [routerLink] syntax

# Update app.module.ts: Register FormsModule
# Update register.component.*: Add content (including form)
# Update login.component.*: Add content (including form)

# register.component: Needs User instance to bind to form and submit to user-api
# register.component: Needs to inject user-api.service
# register.component: Needs to call user-api.service on "submit"
# register.component: Needs to populate errors on failed "submit"
# register.component: Needs to subscribe to current-user-data.service for when successful
# register.component: Needs to update currentUser on successful "submit"
# register.component: Needs to clear form on successful "submit"
# register.component: Needs to redirect to '/success' on successful "submit"

# login.component: Needs User instance to bind to form and submit to user-api
# login.component: Needs to inject user-api.service
# login.component: Needs to call user-api.service on "submit"
# login.component: Needs to populate errors on failed "submit"
# login.component: Needs to subscribe to current-user-data.service for when successful
# login.component: Needs to update currentUser on successful "submit"
# login.component: Needs to clear form on successful "submit"
# login.component: Needs to redirect to '/success' on successful "submit"

# Create/Build-out logout.component (including redirectTo '/'
# Update app-routing.module for route to logout.component

# Q: How to make login.component, register.component, and success.component redirect if in the wrong state?

# Could have server controller have login function that interacts with the DB and sets req.session accoridingly

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# Shutdown
# 
# Prep
# 
#  cd .../{{MEAN_PROJECT}}
# Shutdown - Client
# 
#  ps -u ${LOGNAME} | grep '@angular/cli' | perl -ne '/^\s*\d+\s+(\d+)\s*tty/ && do { print( "kill -INT ${1}\n" ); exit; }'
# Shutdown - Server
# 
#  <ctrl>+c
# Shutdown - Database
# 
#  cat logs/mongod.log | perl -ne '/starting\s*:\s*pid=(\d+)/ && system( "kill -INT ${1}" );'
# Contact GitHub API Training Shop Blog About

