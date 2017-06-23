import { Component, OnInit } from '@angular/core';
import { StatusMsgDataService } from '../status-msg-data.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {
  status_msg: string = "";

  constructor(
    private _statsMsgData: StatusMsgDataService,
  )
  {
    this._statsMsgData.subject.next( this.status_msg );
  }

  ngOnInit() {
  }

}
