import 'dart:io'; 
import 'package:rent_car_dashboard/data/models/cars.dart';
import 'package:rent_car_dashboard/ui/screens/dashboard_scene/screens/vehicule_scene/controllers/vehicule_controller.dart';
import 'package:rent_car_dashboard/utils/app_colors.dart';
import 'package:rent_car_dashboard/utils/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';  // Import your CarController
import 'dart:io'; 
import 'package:rent_car_dashboard/ui/screens/dashboard_scene/screens/vehicule_scene/controllers/vehicule_controller.dart';
import 'package:rent_car_dashboard/utils/app_colors.dart';
import 'package:rent_car_dashboard/utils/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' show Uint8List, kIsWeb;

class AddCarPopup extends StatefulWidget {
  @override
  _AddCarPopupState createState() => _AddCarPopupState();
}

class _AddCarPopupState extends State<AddCarPopup> {
  final VehiculeController carController = Get.find();
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;
  Uint8List? _webImage;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _colorController = TextEditingController();
  final TextEditingController _gearboxController = TextEditingController();
  final TextEditingController _fuelController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  Future<void> _pickImage() async {
    if (kIsWeb) {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        final Uint8List webImage = await image.readAsBytes();
        setState(() {
          _webImage = webImage;
          _imageFile = image;
        });
      }
    } else {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        _imageFile = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.bgSecondayLight,
      title: Text('Add Vehicle'),
      content: SingleChildScrollView(
        child: Container(
          width: 600,
          child: Column(
            children: [
              _imageFile == null
                  ? GestureDetector(
                      onTap: _pickImage,
                      child: Container(
                        width: 600,
                        height: 300,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Icon(
                          Icons.add_a_photo,
                          color: Colors.grey[600],
                          size: 50,
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: _pickImage,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: kIsWeb
                            ? Image.memory(
                                _webImage!,
                                width: 600,
                                height: 300,
                                fit: BoxFit.cover,
                              )
                            : Image.file(
                                File(_imageFile!.path),
                                width: 600,
                                height: 300,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
              AppPadding.paddingH24,
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Vehicle Name'),
              ),
              AppPadding.paddingH16,
              TextField(
                controller: _priceController,
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
              ),
              AppPadding.paddingH16,
              TextField(
                controller: _colorController,
                decoration: InputDecoration(labelText: 'Color'),
              ),
              AppPadding.paddingH16,
              TextField(
                controller: _gearboxController,
                decoration: InputDecoration(labelText: 'Gearbox'),
              ),
              AppPadding.paddingH16,
              TextField(
                controller: _fuelController,
                decoration: InputDecoration(labelText: 'Fuel'),
              ),
              AppPadding.paddingH16,
              TextField(
                controller: _brandController,
                decoration: InputDecoration(labelText: 'Brand'),
              ),
              AppPadding.paddingH16,
              TextField(
                controller: _ratingController,
                decoration: InputDecoration(labelText: 'Rating'),
              ),
              AppPadding.paddingH16,
              TextField(
                controller: _locationController,
                decoration: InputDecoration(labelText: 'Location'),
              ),
              AppPadding.paddingH16,
            ],
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            // Add a new car
            carController.addCar(
              CarItem(
                name: _nameController.text,
                price: double.tryParse(_priceController.text) ?? 0,
                image: _imageFile?.path ?? 'assets/cars/default.png', // Use default image if none is picked
                color: _colorController.text,
                gearbox: _gearboxController.text,
                fuel: _fuelController.text,
                brand: _brandController.text,
                rating: _ratingController.text,
                location: _locationController.text,
              ),
            );
            Get.back(); // Close the dialog
          },
          child: Text('Add Car'),
        ),
        TextButton(
          onPressed: () {
            Get.back(); // Close the dialog without adding a car
          },
          child: Text(
            'Cancel',
            style: TextStyle(color: Colors.blue),
          ),
          style: TextButton.styleFrom(
            foregroundColor: Colors.blue,
            backgroundColor: Colors.transparent,
            splashFactory: InkSplash.splashFactory,
          ),
        ),
      ],
    );
  }
}