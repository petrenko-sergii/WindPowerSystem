interface TurbineType {
	Id: number;
	Model: string;
	Capacity: number;
	ManufacturerId: number;
	Manufacturer: Manufacturer;
	Manufacturers: Manufacturer[];
}