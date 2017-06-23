import { Component, OnInit } from '@angular/core';
import { ServerApiService } from '../server-api.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  currentUser: string = "NOT_SET";
  user_name: string = "";

  constructor(
    private _serverApi: ServerApiService,
    private _router: Router,
  )
  {
    this._serverApi.isLoggedIn()
      .then( () => this._router.navigate( ['/dashboard'] ) )
      .catch( data => this.currentUser = data );
  }

  ngOnInit() {
  }

  doLogin() {
    this._serverApi.login( this.user_name )
      .then( () => this._router.navigate( ['/dashboard'] ) )
      .catch( err => console.log( "Error: LoginComponent: doLogin: API error:", err ) );
  }
}
