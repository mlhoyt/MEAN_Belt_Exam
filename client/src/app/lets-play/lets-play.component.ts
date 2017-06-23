import { Component, OnInit } from '@angular/core';
import { Question } from '../question';
import { ServerApiService } from '../server-api.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-lets-play',
  templateUrl: './lets-play.component.html',
  styleUrls: ['./lets-play.component.css']
})
export class LetsPlayComponent implements OnInit {
  currentUser: string = "NOT_SET";
  selected_questions: Array<Question> = [];
  chosen_answers: Array<string> = [];

  constructor(
    private _serverApi: ServerApiService,
    private _router: Router,
  )
  {
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
    this._router.navigate( ['/'] );
  }
}
