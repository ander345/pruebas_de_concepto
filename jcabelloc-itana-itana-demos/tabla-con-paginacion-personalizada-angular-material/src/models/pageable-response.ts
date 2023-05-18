import { Passenger } from "./passenger";

export interface PageableResponse{
   totalPassengers: number,
   totalPages: number,
   data: Passenger[]
}