 

class CarItem {
  final String name;
  final double price;
  final String image;
  final String color;
  final String gearbox;
  final String fuel;
  final String brand;
  final String rating;
  final String location;

  CarItem({
    required this.name,
    required this.price,
    required this.image,
    required this.color,
    required this.gearbox,
    required this.fuel,
    required this.brand,
    required this.rating,
    required this.location});
}

class CarList {
  List<CarItem> cars;
  CarList({required this.cars});
}
