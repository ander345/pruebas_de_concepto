import { MouseEvent } from '@agm/core';
import { Component, OnInit } from '@angular/core';
import { Coordenada } from './models/coordenada';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent implements OnInit{
  ubicacionCentral: Coordenada;
  ubicacionEnProceso: Coordenada;

  coordenadas : Coordenada[] = [];

  ngOnInit(): void {
    this.ubicacionCentral = new Coordenada(-12.0431805, -77.0282364);
  }


  mapClicked($event: MouseEvent) {
    let coord = new Coordenada($event.coords.lat, $event.coords.lng);
    this.coordenadas.push(coord);
  }
}

