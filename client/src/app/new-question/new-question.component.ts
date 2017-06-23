import { Component, OnInit } from '@angular/core';
import { Question } from '../question';
import { ServerApiService } from '../server-api.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-new-question',
  templateUrl: './new-question.component.html',
  styleUrls: ['./new-question.component.css']
})
export class NewQuestionComponent implements OnInit {
  new_q: Question = new Question();

  constructor(
    private _serverApi: ServerApiService,
    private _router: Router,
  )
  {
  }

  ngOnInit() {
  }

  doCancel() {
    console.log( "Debug: NewQuestionComponent: doCancel activated" );
    this._router.navigate( ['/'] );
  }

  doSubmit() {
    console.log( "Debug: NewQuestionComponent: doSubmit activated: new_q", this.new_q );
    this._serverApi.create_question( { text: this.new_q.text, answer: this.new_q.answer, fake1: this.new_q.fake1, fake2: this.new_q.fake2 } )
      .then( () => this._router.navigate( ['/'] ) )
      .catch( err => console.log( "Error: NewQuestionComponent: doSubmit: API error:", err ) );
  }
}
