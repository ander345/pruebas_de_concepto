import { Component, OnInit } from '@angular/core';

import { MatTableDataSource } from '@angular/material/table';
import { Passenger } from 'src/models/passenger';
import { PassengerService } from 'src/service/passenger.service';
import { finalize } from 'rxjs';
@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss'],
  animations: [],
})
export class AppComponent implements OnInit {
  displayedColumns: string[] = [
    '_id',
    'name',
    'trips',
    'airline',
    'airlineCountry',
  ];
  dataPaginacion = new MatTableDataSource<Passenger>([]);
  passengers: Passenger[] = [];
  showSpinner: boolean = true;
  pageSize: number = 5;
  page: number = 0;
  currentPage: number = 0;
  totalPassengers: number = 0;
  totalPages: number = 0;

  constructor(private passengerService: PassengerService) {}

  ngOnInit(): void {
    this.passengerService
      .getAllPagination(this.page, this.pageSize)
      .pipe(finalize(() => (this.showSpinner = false)))
      .subscribe({
        next: (passengersPageable) => {
          this.passengers = passengersPageable.data;
          this.totalPassengers = passengersPageable.totalPassengers;
          this.totalPages = passengersPageable.totalPages;
          this.dataPaginacion = new MatTableDataSource<Passenger>(
            this.passengers
          );
        },
      });
  }

  pageEvents(event: any) {
    console.log(event.pageIndex);
    this.getPage(event.pageIndex, event.pageSize);
  }

  getPage(nroPagina: number, cantidadPorPagina: number): void {
    this.passengerService
      .getAllPagination(nroPagina, cantidadPorPagina)
      .subscribe({
        next: (passengersPageable) => {
          this.passengers = passengersPageable.data;
          this.dataPaginacion = new MatTableDataSource<Passenger>(
            this.passengers
          );
        },
      });
  }
}
