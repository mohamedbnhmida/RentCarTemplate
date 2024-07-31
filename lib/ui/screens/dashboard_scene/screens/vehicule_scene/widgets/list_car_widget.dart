 
import 'package:rent_car_dashboard/data/models/cars.dart';
import 'package:rent_car_dashboard/ui/screens/dashboard_scene/screens/vehicule_scene/controllers/vehicule_controller.dart';
import 'package:rent_car_dashboard/utils/app_colors.dart';
import 'package:rent_car_dashboard/utils/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:flutter/material.dart'; // Ensure this path is correct

class ListCar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  final VehiculeController carController = Get.put(VehiculeController());

    return Obx(() {
      return ListView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: carController.cars.length,
        itemBuilder: (ctx, i) => CarItemWidget(car: carController.cars[i]),
      );
    });
  }
}

class CarItemWidget extends StatelessWidget {
  final CarItem car;

  CarItemWidget({required this.car});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: GestureDetector(
        child: Container(
          height: 180,
          width: double.maxFinite,
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color:Theme.of(context).scaffoldBackgroundColor,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Image.asset(
                      car.image,
                      width: 80,
                      height: 80,
                    ),
                  ),
                  SizedBox(width: 24),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          car.brand,
                          style: TextStyle(
                            color: Theme.of(context).textTheme.displayLarge!.color,
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(Icons.circle, color: Theme.of(context).textTheme.displayLarge!.color, size: 10),
                            SizedBox(width: 5.0),
                            Text(
                              car.fuel,
                              style: TextStyle(
                                color: Theme.of(context).textTheme.displayLarge!.color,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(width: 5.0),
                            Icon(Icons.circle, color: Theme.of(context).textTheme.displayLarge!.color, size: 10),
                            SizedBox(width: 5.0),
                            Text(
                              car.color,
                              style: TextStyle(
                                color: Theme.of(context).textTheme.displayLarge!.color,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(Icons.star, color: Colors.yellow, size: 12),
                            SizedBox(width: 5.0),
                            Text(
                              car.rating,
                              style: TextStyle(
                                color: Theme.of(context).textTheme.displayLarge!.color,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(Icons.location_on, color:Theme.of(context).textTheme.displayLarge!.color, size: 12),
                            SizedBox(width: 5.0),
                            Text(
                              car.location,
                              style: TextStyle(
                                color: Theme.of(context).textTheme.displayLarge!.color,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${car.price}/weeks',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Theme.of(context).textTheme.displayLarge!.color,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}