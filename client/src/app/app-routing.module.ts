import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { LoginComponent } from './login/login.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { NewQuestionComponent } from './new-question/new-question.component';
import { LetsPlayComponent } from './lets-play/lets-play.component';

const routes: Routes = [
// NOTE: path-URL has NO leading '/'
// NOTE: redirectTo-URL CAN (but does not have to) have leading '/'
// NOTE: component.html: <a [routerLink]="['/{{URL}}', ...]">...</a>'
// NOTE: component.ts: this._router.navigate( ['/{{URL}}', '{{URL}}'|{{VAR}}, ... ] );
// { path: '{{URL}}', [ pathMatch: 'full', ] component: {{COMP}}Component },
// { path: '{{URL}}', [ pathMatch: 'full', ] redirectTo: '/{{URL}}' },
  { path: 'new_question', pathMatch: 'full', component: NewQuestionComponent },
  { path: 'lets_play', pathMatch: 'full', component: LetsPlayComponent },
  { path: 'dashboard', pathMatch: 'full', component: DashboardComponent },
  { path: '', pathMatch: 'full', component: LoginComponent },
];

@NgModule({
  imports: [ RouterModule.forRoot( routes ) ],
  exports: [ RouterModule ]
})
export class AppRoutingModule {}
