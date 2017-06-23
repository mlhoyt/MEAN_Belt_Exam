import { Component, OnInit } from '@angular/core';
import { Question } from '../question';

@Component({
  selector: 'app-new-question',
  templateUrl: './new-question.component.html',
  styleUrls: ['./new-question.component.css']
})
export class NewQuestionComponent implements OnInit {
  new_q: Question = new Question();

  constructor() { }

  ngOnInit() {
  }

  doCancel() {
    console.log( "Debug: NewQuestionComponent: doCancel activated" );
  }

  doSubmit() {
    console.log( "Debug: NewQuestionComponent: doSubmit activated: new_q", this.new_q );
  }
}
