import { Component, OnInit } from '@angular/core';
import { Question } from '../question';
import { ServerApiService } from '../server-api.service';
import { Router } from '@angular/router';
import { StatusMsgDataService } from '../status-msg-data.service';
import { Subscription } from 'rxjs/Subscription';

@Component({
  selector: 'app-new-question',
  templateUrl: './new-question.component.html',
  styleUrls: ['./new-question.component.css']
})
export class NewQuestionComponent implements OnInit {
  currentUser: string = "NOT_SET";

  status_msg: string;
  status_msg_subscription: Subscription;

  new_q: Question = new Question();

  constructor(
    private _serverApi: ServerApiService,
    private _router: Router,
    private _statusMsgData: StatusMsgDataService,
  )
  {
    this._serverApi.isLoggedIn()
      .then( data => {
        this.currentUser = data;
        this.status_msg_subscription = this._statusMsgData.subject
          .subscribe( data => { this.status_msg = data; }, err => {}, () => {} );
      })
      .catch( () => this._router.navigate( ['/'] ) );
  }

  ngOnInit() {
    this._statusMsgData.subject.next( this.status_msg );
  }

  doCancel() {
    console.log( "Debug: NewQuestionComponent: doCancel activated" );
    this._router.navigate( ['/'] );
  }

  doSubmit() {
    console.log( "Debug: NewQuestionComponent: doSubmit activated: new_q", this.new_q );
    this.status_msg = "A new question was successfully created!";
    this._statusMsgData.subject.next( this.status_msg );
    this._serverApi.create_question( { text: this.new_q.text, answer: this.new_q.answer, fake1: this.new_q.fake1, fake2: this.new_q.fake2 } )
      .then( () => this._router.navigate( ['/'] ) )
      .catch( err => console.log( "Error: NewQuestionComponent: doSubmit: API error:", err ) );
  }
}
