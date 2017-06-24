import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'scoreSearch'
})
export class ScoreSearchPipe implements PipeTransform {
  transform( items: any[], pattern: string): any {
    if( !items || !pattern ) {
      return items;
    }
    else {
      return items.filter( item =>
        item.user.toLowerCase().indexOf( pattern.toLowerCase() ) !== -1 ||
        String( item.nrCorrect ).toLowerCase().indexOf( pattern.toLowerCase() ) !== -1 ||
        ( item.nrCorrect / item.nrAsked ).toFixed(1).toLowerCase().indexOf( pattern.toLowerCase() ) !== -1
      );
    }
  }
}
