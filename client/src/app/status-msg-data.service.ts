import { Injectable } from '@angular/core';
import { Subject } from 'rxjs/Subject';
import { BehaviorSubject } from 'rxjs/BehaviorSubject';

@Injectable()
export class StatusMsgDataService {
  subject = new BehaviorSubject( null );

  constructor() { }

  update( data ) {
    this.subject.next( data );
  }
}
