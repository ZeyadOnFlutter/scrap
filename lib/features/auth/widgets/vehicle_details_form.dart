import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/font_manager.dart';
import '../../../core/resources/styles_manager.dart';
import '../../../core/widgets/custom_drop_down_field.dart';
import '../../../core/widgets/custom_elevated_button.dart';
import '../../../core/widgets/custom_text_field.dart';
import 'auth_header.dart';
import 'vehicle_lists.dart';

class VehicleDetailsForm extends StatelessWidget {
  final TextEditingController vehicleNameController;
  final FocusNode vehicleNameNode;
  final GlobalKey<FormState> formKey;
  final VoidCallback onLoginPressed;

  const VehicleDetailsForm({
    required this.vehicleNameController,
    required this.vehicleNameNode,
    required this.formKey,
    required this.onLoginPressed,
    required this.selectedColor,
    required this.onColorChanged,
    required this.availableColors,
    super.key,
  });

  final Color selectedColor;
  final void Function(Color) onColorChanged;
  final List<Color> availableColors;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 10.h),
            const AuthHeader(
              label1: 'Please Enter Your Vehicle Information Below.',
            ),
            SizedBox(height: 30.h),
            CustomTextField(
              controller: vehicleNameController,
              focusNode: vehicleNameNode,
              hintText: 'Vehicle Name (optional)',
              textInputType: TextInputType.emailAddress,
              //  validator: Validator.validateEmail,
            ),
            SizedBox(height: 24.h),
            CustomDropdownField(
              hintText: 'Manufacturers',
              items: carManufacturers
                  .map(
                    (manufacturers) => DropdownMenuItem(
                      value: manufacturers.toUpperCase(),
                      child: Text(manufacturers),
                    ),
                  )
                  .toList(),
              onChanged: (value) {},
            ),
            SizedBox(height: 20.h),
            CustomDropdownField(
              hintText: 'Model',
              items: carModels
                  .map(
                    (carModels) => DropdownMenuItem(
                      value: carModels.toUpperCase(),
                      child: Text(carModels),
                    ),
                  )
                  .toList(),
              onChanged: (value) {},
            ),
            SizedBox(height: 20.h),
            CustomDropdownField(
              hintText: 'Year',
              items: carYears
                  .map(
                    (carYears) => DropdownMenuItem(
                      value: carYears.toString(),
                      child: Text(carYears.toString()),
                    ),
                  )
                  .toList(),
              onChanged: (value) {},
            ),
            SizedBox(height: 24.h),
            Text(
              'Car Color',
              style: getMediumStyle(
                color: ColorManager.grey,
                fontSize: FontSize.s14,
              ),
            ),
            SizedBox(height: 10.h),
            BlockPicker(
              pickerColor: selectedColor,
              onColorChanged: onColorChanged,
              availableColors: availableColors,
              layoutBuilder: (context, colors, child) {
                return Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: [
                    for (Color color in colors)
                      SizedBox(
                        width: 50.w,
                        height: 50.h,
                        child: child(color),
                      ),
                  ],
                );
              },
            ),
            SizedBox(height: 24.h),
            CustomElevatedButton(
              label: 'Add Vehicle',
              onTap: onLoginPressed,
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
