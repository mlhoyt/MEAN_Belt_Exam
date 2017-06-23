import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';
import { AppRoutingModule } from './app-routing.module';

import { AppComponent } from './app.component';
import { HomeComponent } from './home/home.component';
import { LoginComponent } from './login/login.component';
import { NewQuestionComponent } from './new-question/new-question.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { LetsPlayComponent } from './lets-play/lets-play.component';
import { FilterPipe } from './filter-pipe';

import { ServerApiService } from './server-api.service';
import { StatusMsgDataService } from './status-msg-data.service';

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    LoginComponent,
    NewQuestionComponent,
    DashboardComponent,
    LetsPlayComponent,
    FilterPipe,
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpModule,
    AppRoutingModule,
  ],
  providers: [
    ServerApiService,
    StatusMsgDataService,
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
