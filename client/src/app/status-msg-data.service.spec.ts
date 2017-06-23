import { TestBed, inject } from '@angular/core/testing';

import { StatusMsgDataService } from './status-msg-data.service';

describe('StatusMsgDataService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [StatusMsgDataService]
    });
  });

  it('should be created', inject([StatusMsgDataService], (service: StatusMsgDataService) => {
    expect(service).toBeTruthy();
  }));
});
