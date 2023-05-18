export interface Passenger{
    _id: string,
    name: string,
    trips: number,
    airline: Airline[]
}

export interface Airline{
    name: string,
    country: string,
}

