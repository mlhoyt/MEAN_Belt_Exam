import { Component, OnInit } from '@angular/core';
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
    private _router: Router,
  )
  {

  }

  ngOnInit() {
  }

  doPlay() {
    console.log( "Debug: DashboardComponent: doPlay: activated" );
    // this._router.navigate( ['/lets_play'] );
  }

  doSearchFilter() {
    console.log( "Debug: DashboardComponent: doPlay: activated: search_filter:", this.search_filter );
  }
}
