import 'package:flutter/material.dart';
import 'package:maher/components/ui/bottomSheet.dart';
import 'package:maher/components/ui/brand_of_car.dart';
import 'package:maher/components/ui/color_of_car.dart';
import 'package:maher/components/ui/custom_app_bar.dart';
import 'package:maher/components/ui/custom_dropdown.dart';

class AddCarScreen extends StatefulWidget {
  @override
  _AddCarScreenState createState() => _AddCarScreenState();
}

class _AddCarScreenState extends State<AddCarScreen> {
  String? selectedBrand;
  String? selectedModel;
  String? selectedColor;
  String? selectedFuelType;
  String? selectedCylinders;

  final List<String> brands = ['Toyota', 'Honda', 'Ford', 'BMW'];
  final List<String> models = ['Model A', 'Model B', 'Model C'];
  final List<String> colors = ['Red', 'Blue', 'Black', 'White'];
  final List<String> fuelTypes = ['Petrol', 'Diesel', 'Electric'];
  final List<String> cylinders = ['4', '6', '8'];
  void onClickCustomDropdown(
    BuildContext context,
    String label,
    List<String> items,
    String? selectedValue,
    ValueChanged<String?> onItemSelected,
  ) {
    CustomBottomSheet.show(
      isDismissible: true,
      context: context,
      initialChildSize: 0.65,
      builder: (sheetContext) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 16),
              label == 'ماركة السيارة'
                  ? CarBrandSelectionScreen()
                  : label == 'موديل السيارة'
                      ? Text('موديل السيارة')
                      : label == 'لون السيارة'
                          ? CarColorSelectionScreen()
                          : label == 'نوع الوقود'
                              ? Text('نوع الوقود')
                              : Text('عدد الأسطوانات'),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(
                title: 'آلية تحديد موقعك',
                showBackButton: true,
              ),
              CustomDropdown(
                label: 'ماركة السيارة',
                selectedValue: selectedBrand,
                onTap: () => onClickCustomDropdown(
                  context,
                  'ماركة السيارة',
                  brands,
                  selectedBrand,
                  (value) {
                    setState(() {
                      selectedBrand = value;
                    });
                  },
                ),
              ),
              const SizedBox(height: 16),
              CustomDropdown(
                label: 'موديل السيارة',
                selectedValue: selectedModel,
                onTap: () => onClickCustomDropdown(
                  context,
                  'موديل السيارة',
                  models,
                  selectedModel,
                  (value) {
                    setState(() {
                      selectedModel = value;
                    });
                  },
                ),
              ),
              const SizedBox(height: 16),
              CustomDropdown(
                label: 'لون السيارة',
                selectedValue: selectedColor,
                onTap: () => onClickCustomDropdown(
                  context,
                  'لون السيارة',
                  colors,
                  selectedColor,
                  (value) {
                    setState(() {
                      selectedColor = value;
                    });
                  },
                ),
              ),
              const SizedBox(height: 16),
              CustomDropdown(
                label: 'نوع الوقود',
                selectedValue: selectedFuelType,
                onTap: () => onClickCustomDropdown(
                  context,
                  'نوع الوقود',
                  fuelTypes,
                  selectedFuelType,
                  (value) {
                    setState(() {
                      selectedFuelType = value;
                    });
                  },
                ),
              ),
              const SizedBox(height: 16),
              CustomDropdown(
                label: 'عدد الأسطوانات',
                selectedValue: selectedCylinders,
                onTap: () => onClickCustomDropdown(
                  context,
                  'عدد الأسطوانات',
                  cylinders,
                  selectedCylinders,
                  (value) {
                    setState(() {
                      selectedCylinders = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
