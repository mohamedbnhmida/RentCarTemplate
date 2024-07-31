
import 'package:rent_car_dashboard/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AddVehicleButton extends StatelessWidget {
  final VoidCallback onPressed;

  AddVehicleButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
               shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25), // Corner radius
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
               // Shadow elevation
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.add),
                SizedBox(width: 8),
                Text('Add'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}