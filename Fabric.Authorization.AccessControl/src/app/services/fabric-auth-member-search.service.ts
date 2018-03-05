import { HttpClient, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Response } from "@angular/http";
import { Observable } from 'rxjs/Rx';
import { catchError, retry } from 'rxjs/operators';

import { User } from '../models/user';
import { Role } from '../models/role';
import { Group } from '../models/group';
import { Exception } from '../models/exception';
import { FabricAuthBaseService } from './fabric-auth-base.service';
import { AuthMemberSearchResult } from '../models/authMemberSearchResult';
import { AuthMemberSearchRequest } from '../models/authMemberSearchRequest';

@Injectable()
export class FabricAuthMemberSearchService extends FabricAuthBaseService {

  static readonly baseMemberApiUrl = `${FabricAuthBaseService.authUrl}/members`;

  constructor(httpClient: HttpClient) {
    super(httpClient);
  }

  public searchMembers(request: AuthMemberSearchRequest) : Observable<AuthMemberSearchResult[]> {

    let params = new HttpParams()
      .set('clientId', request.clientId);

    if (request.pageSize) {
      params.set('pageSize', request.pageSize.toString());
    }

    if (request.pageNumber) {
      params.set('pageNumber', request.pageNumber.toString());
    }

    if (request.sortKey) {
      params.set('sortKey', request.sortKey);
    }

    if (request.sortDirection) {
      params.set('sortDirection', request.sortDirection);
    }

    if (request.filter) {
      params.set('filter', request.filter);
    }

    return this.httpClient
      .get<AuthMemberSearchResult[]>(FabricAuthMemberSearchService.baseMemberApiUrl, {params})
      .pipe(retry(FabricAuthBaseService.retryCount), catchError(this.handleError));
  }
}
