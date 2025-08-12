import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/resources/color_manager.dart';
import '../widgets/vehicle_details_form.dart';
import '../widgets/vehicle_details_header.dart';

class VehicleDetails extends StatefulWidget {
  const VehicleDetails({super.key});

  @override
  State<VehicleDetails> createState() => _VehicleDetailsState();
}

class _VehicleDetailsState extends State<VehicleDetails> {
  final _vehicleNameController = TextEditingController();
  final _vehicleNameNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  Color selectedColor = Colors.blue;

  final List<Color> presetColors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
  ];
  late StreamSubscription<bool> keyboardSubscription;
  @override
  void initState() {
    super.initState();
    final keyboardVisibilityController = KeyboardVisibilityController();
    keyboardSubscription = keyboardVisibilityController.onChange.listen(
      (bool visible) {
        if (!visible) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
    );
  }

  @override
  void dispose() {
    _vehicleNameController.dispose();
    _vehicleNameNode.dispose();
    keyboardSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorManager.blue,
              ColorManager.lightGrey,
              ColorManager.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            VehicleDetailsHeader(onPressed: _onArrowBackPressed),
            Expanded(
              flex: 4,
              child: Container(
                height: 600.h,
                padding: EdgeInsets.all(24.r),
                decoration: BoxDecoration(
                  color: ColorManager.lightGrey,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(40.r)),
                ),
                child: VehicleDetailsForm(
                  vehicleNameController: _vehicleNameController,
                  vehicleNameNode: _vehicleNameNode,
                  formKey: _formKey,
                  onLoginPressed: _onLoginPressed,
                  selectedColor: selectedColor,
                  availableColors: presetColors,
                  onColorChanged: (color) {
                    setState(() => selectedColor = color);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onLoginPressed() {
    // if (_formKey.currentState?.validate() ?? false) {}
  }

  void _onArrowBackPressed() {
    context.pop();
  }
}
