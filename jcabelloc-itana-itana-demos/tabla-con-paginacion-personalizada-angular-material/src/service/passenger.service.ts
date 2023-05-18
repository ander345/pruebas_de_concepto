import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { PageableResponse } from 'src/models/pageable-response';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class PassengerService {
  readonly apiUrl: string = 'https://api.instantwebtools.net/v1/passenger';
  constructor(private http: HttpClient) {}

  getAllPagination( nroPagina: number, cantidadPorPagina: number): Observable<PageableResponse> {
    const url = `${this.apiUrl}?page=${nroPagina}&size=${cantidadPorPagina}`;
    return this.http.get<PageableResponse>(url);
  }

  getAll(): Observable<PageableResponse> {
    return this.http.get<PageableResponse>(this.apiUrl);
  }
}
