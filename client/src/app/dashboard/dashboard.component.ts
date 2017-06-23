import { Component, OnInit } from '@angular/core';
import { Score } from '../score';
import { ServerApiService } from '../server-api.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit {
  currentUser: string = "NOT_SET";
  search_filter: string = "";
  all_scores: Array<Score>;

  constructor(
    private _serverApi: ServerApiService,
    private _router: Router,
  )
  {
    this._serverApi.isLoggedIn()
      .then( data => this.currentUser = data )
      .catch( () => this._router.navigate( ['/'] ) );
  }

  ngOnInit() {
    this._serverApi.get_all_scores()
      .then( data => this.all_scores = data )
      .catch( err => console.log( "Error: DashboardComponent: ngOnInit: API error:", err ) );
  }

  doPlay() {
    console.log( "Debug: DashboardComponent: doPlay: activated" );
    this._router.navigate( ['/lets_play'] );
  }

  doSearchFilter() {
    console.log( "Debug: DashboardComponent: doPlay: activated: search_filter:", this.search_filter );
  }
}
