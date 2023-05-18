import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, map, delay } from 'rxjs';
import { Usuario } from '../models/usuario';

@Injectable({
  providedIn: 'root',
})
export class UsuarioService {
  constructor(private http: HttpClient) {}

  getAll(): Observable<Usuario[]> {
    return this.http.get<Usuario[]>('assets/usuarios.json').pipe(delay(2000));
  }

  getById(id: number): Observable<Usuario> {
    return this.http.get<Usuario[]>('assets/usuarios.json').pipe(
      delay(2000),
      map((usuarios) => usuarios.find((user) => user.id === id)!)
    );
  }
}
