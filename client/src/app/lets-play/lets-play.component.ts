import { Component, OnInit } from '@angular/core';
import { Question } from '../question';
import { ServerApiService } from '../server-api.service';
import { Router } from '@angular/router';
import { StatusMsgDataService } from '../status-msg-data.service';
import { Subscription } from 'rxjs/Subscription';

@Component({
  selector: 'app-lets-play',
  templateUrl: './lets-play.component.html',
  styleUrls: ['./lets-play.component.css']
})
export class LetsPlayComponent implements OnInit {
  currentUser: string = "NOT_SET";

  status_msg: string;
  status_msg_subscription: Subscription;

  selected_questions: Array<Question> = [];
  chosen_answers: Array<string> = [];

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
    this._serverApi.get_random_questions()
      .then( data => this.selected_questions = data )
      .catch( err => console.log( "Error: LetsPlayComponent: ngOnInit: API error:", err ) );
  }

  doCancel() {
    this._router.navigate( ['/'] );
  }

  doSubmit() {
    console.log( "Debug: LetsPlayComponent: doSubmit: activated" );
    console.log( "Debug: LetsPlayComponent: chosen_answers:", this.chosen_answers );
    let nrCorrect = 0;
    let nrAsked = this.selected_questions.length;
    for( let i = 0; i < this.selected_questions.length; ++i ) {
      if( this.selected_questions[i].answer == this.chosen_answers[i] ) {
        nrCorrect++;
      }
    }
    console.log( "Debug: LetsPlayComponent: nrCorrect:", nrCorrect, "nrAsked", nrAsked );
    this._serverApi.create_score( { nrCorrect: nrCorrect, nrAsked: nrAsked, user: this.currentUser } );
    this.status_msg = "That was great, " + this.currentUser + "!" +
      " You score is " + nrCorrect + "/" + nrAsked + " (" + (nrCorrect / nrAsked) + ")";
    this._statusMsgData.subject.next( this.status_msg );
    this._router.navigate( ['/'] );
  }
}
