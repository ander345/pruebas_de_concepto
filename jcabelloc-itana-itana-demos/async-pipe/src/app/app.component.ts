import { Component } from '@angular/core';
import { UsuarioService } from './services/usuario.service';
import { Observable } from 'rxjs';
import { Usuario } from './models/usuario';
@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
})
export class AppComponent {
  title = 'async-pipe';
  tab: number = 1;
  // usuarios: Usuario[] = [];
  // sub: Subscription;
  usuarios$: Observable<Usuario[]> = this.usuarioService.getAll();
  usuario$: Observable<Usuario> = this.usuarioService.getById(1);
  constructor(private usuarioService: UsuarioService) {}

  // setUsuarios(): void {
  //  this.sub = this.usuarioService.getAll().subscribe(usuarios => this.usuarios = usuarios)
  // }

  // ngOnDestroy(): void {
  //   this.sub.unsubscribe();
  // }
}
