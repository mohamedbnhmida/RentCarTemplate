 
import 'dart:async';

import 'package:get/get.dart';

import '../../../../../../data/models/cars.dart';

class VehiculeController extends GetxController {

  // Observable list of cars
  var cars = <CarItem>[].obs;

CarList allCars = CarList(cars: [
  CarItem(
      name: "Civic",
      price: 123,
      image: "assets/cars/civic.png",
      color: "white",
      gearbox: "automatic",
      fuel: "petrol",
      brand: "Honda",
      rating: "4.5",
      location: "Port-Louis"
  ),
  CarItem(
      name: "8 Series",
      price: 123,
      image: "assets/cars/m8.png",
      color: "blue",
      gearbox: "automatic",
      fuel: "petrol",
      brand: "BMW",
      rating: "4.5",
      location: "Port-Louis"),
  CarItem(
      name: "AMG",
      price: 123,
      image: "assets/cars/mer.png",
      color: "gray",
      gearbox: "automatic",
      fuel: "petrol",
      brand: "Mercedes",
      rating: "4.5",
      location: "Port-Louis"),
  CarItem(
      name: "R35 GTR",
      price: 123,
      image: "assets/cars/nissan_gtr_0.png",
      color: "white",
      gearbox: "automatic",
      fuel: "petrol",
      brand: "Nissan",
      rating: "4.5",
      location: "Port-Louis"),
  CarItem(
      name: "Range Rover",
      price: 123,
      image: "assets/cars/range.png",
      color: "red",
      gearbox: "automatic",
      fuel: "petrol",
      brand: "Rover",
      rating: "4.5",
      location: "Port-Louis"),
  CarItem(
      name: "Camaro",
      price: 123,
      image: "assets/cars/camaro_0.png",
      color: "yellow",
      gearbox: "automatic",
      fuel: "petrol",
      brand: "Chevrolet",
      rating: "4.5",
      location: "Port-Louis"),
  CarItem(
      name: "488 Spider",
      price: 123,
      image: "assets/cars/ferrari_spider_488_0.png",
      color: "blue",
      gearbox: "automatic",
      fuel: "petrol",
      brand: "Ferrari",
      rating: "4.5",
      location: "Port-Louis"),
  CarItem(
      name: "Acura",
      price: 123,
      image: "assets/cars/acura_0.png",
      color: "dark blue",
      gearbox: "automatic",
      fuel: "petrol",
      brand: "Acura",
      rating: "4.5",
      location: "Port-Louis"),
  CarItem(
      name: "Citroen",
      price: 123,
      image: "assets/cars/citroen_0.png",
      color: "Cherry Red",
      gearbox: "automatic",
      fuel: "petrol",
      brand: "Citroen",
      rating: "4.5",
      location: "Port-Louis"),
  CarItem(
      name: "Focus",
      price: 123,
      image: "assets/cars/ford_0.png",
      color: "white",
      gearbox: "automatic",
      fuel: "petrol",
      brand: "Ford",
      rating: "4.5",
      location: "Port-Louis"),
  CarItem(
      name: "Honda",
      price: 123,
      image: "assets/cars/honda_0.png",
      color: "white",
      gearbox: "automatic",
      fuel: "petrol",
      brand: "Honda",
      rating: "4.5",
      location: "Port-Louis"),
  CarItem(
      name: "Land Rover",
      price: 123,
      image: "assets/cars/land_rover_0.png",
      color: "dark grey",
      gearbox: "automatic",
      fuel: "petrol",
      brand: "Rover",
      rating: "4.5",
      location: "Port-Louis"),
  CarItem(
      name: "Alfa Romeo",
      price: 123,
      image: "assets/cars/alfa_romeo_c4_0.png",
      color: "white",
      gearbox: "automatic",
      fuel: "petrol",
      brand: "Alfa",
      rating: "4.5",
      location: "Port-Louis"),
]
);
  var isLoading = true.obs;

 
  @override
  void onInit() {
    super.onInit();
    // Initialize with some cars if needed
      Timer(Duration(seconds: 3), () {
      isLoading.value = false;
    });
    cars.addAll(allCars.cars);
  }

  void addCar(CarItem car) {
    cars.add(car);
  }
}