import { Injectable } from '@angular/core';
import { Http } from '@angular/http';

import 'rxjs/add/operator/map';
import 'rxjs/add/operator/toPromise';

@Injectable()
export class ServerApiService {
  constructor(
    private _http: Http
  )
  {}

  create_question( item ) {
    return this._http.post( '/api/questions', item )
      .map( data => data.json() )
      .toPromise();
  }

  get_all_scores() {
    return this._http.get( '/api/scores' )
      .map( data => data.json() )
      .toPromise();
  }
  
  // create( item ) { return this._http.post( 'api', item ) .map( data => data.json() ) .toPromise(); }
  // read_all() { return this._http.get( 'api' ) .map( data => data.json() ) .toPromise(); }
  // read_one( pk ) { return this._http.get( 'api/' ) .map( data => data.json() ) .toPromise(); }
  // update( item, pk ) { return this._http.put( 'api/', item ) .map( data => data.json() ) .toPromise(); }
  // delete( pk ) { return this._http.delete( 'api/' ) .map( data => data.json() ) .toPromise(); }
}
