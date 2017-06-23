import { Component, OnInit } from '@angular/core';
import { ServerApiService } from '../server-api.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit {
  search_filter: string = "";
  //all_scores: Array<Score>;
  all_scores = [];

  constructor(
    private _serverApi: ServerApiService,
    private _router: Router,
  )
  {
  }

  ngOnInit() {
    this._serverApi.get_all_scores()
      .then( data => this.all_scores = data )
      .catch( err => console.log( "Error: DashboardComponent: ngOnInit: API error:", err ) );
  }

  doPlay() {
    console.log( "Debug: DashboardComponent: doPlay: activated" );
    // this._router.navigate( ['/lets_play'] );
  }

  doSearchFilter() {
    console.log( "Debug: DashboardComponent: doPlay: activated: search_filter:", this.search_filter );
  }
}
