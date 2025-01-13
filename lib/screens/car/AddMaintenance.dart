import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:maher/components/card/ImageUploadCard.dart';
import 'package:maher/components/ui/GradientButton.dart';
import 'package:maher/components/ui/bottomSheet.dart';

import 'package:maher/components/ui/custom_app_bar.dart';
import 'package:maher/components/ui/custom_dropdown.dart';
import 'package:maher/components/ui/custom_text_field.dart';
import 'package:maher/widgets/brand_of_car.dart';
import 'package:maher/widgets/car-model-selection.dart';
import 'package:maher/widgets/color_of_car.dart';
import 'package:maher/widgets/number-of-cylinders.dart';
import 'package:maher/widgets/types-oil.dart';

class AddMaintenanceScreen extends StatefulWidget {
  @override
  _AddMaintenanceScreenState createState() => _AddMaintenanceScreenState();
}

class _AddMaintenanceScreenState extends State<AddMaintenanceScreen> {
  String? selectedBrand;
  String? selectedModel;
  String? selectedColor;
  String? selectedFuelType;
  String? selectedCylinders;
  String selectedLetter = 'أ';
  final List<String> letters = ['أ', 'ب', 'د'];
  String selectedNumber = '1';
  final List<String> numbers = ['1', '2', '3', '4'];

  // Controller for year
  String selectedYear = '2000';
  final List<String> years = ['1999', '2000', '2001'];

  // Controller for mileage
  final TextEditingController _mileageController = TextEditingController();

  // Controller for registration document
  String? registrationDocument;

// Add these controllers to your state class
  final TextEditingController _plateLetterController1 = TextEditingController();
  final TextEditingController _plateLetterController2 = TextEditingController();
  final TextEditingController _plateLetterController3 = TextEditingController();
  final TextEditingController _plateEngController1 = TextEditingController();
  final TextEditingController _plateEngController2 = TextEditingController();
  final TextEditingController _plateEngController3 = TextEditingController();
  final TextEditingController _plateNumberController1 = TextEditingController();
  final TextEditingController _plateNumberController2 = TextEditingController();
  final TextEditingController _plateNumberController3 = TextEditingController();
  final TextEditingController _plateNumberController4 = TextEditingController();
  final TextEditingController _plateNumber2Controller1 =
      TextEditingController();
  final TextEditingController _plateNumber2Controller2 =
      TextEditingController();
  final TextEditingController _plateNumber2Controller3 =
      TextEditingController();
  final TextEditingController _plateNumber2Controller4 =
      TextEditingController();

  @override
  void dispose() {
    _plateLetterController1.dispose();
    _plateLetterController2.dispose();
    _plateLetterController3.dispose();
    _plateEngController1.dispose();
    _plateEngController2.dispose();
    _plateEngController3.dispose();
    _plateNumberController1.dispose();
    _plateNumberController2.dispose();
    _plateNumberController3.dispose();
    _plateNumberController4.dispose();
    _plateNumber2Controller1.dispose();
    _plateNumber2Controller2.dispose();
    _plateNumber2Controller3.dispose();
    _plateNumber2Controller4.dispose();
    super.dispose();
  }

  // Method to handle plate letter selection
  void _selectLetter(String letter) {
    setState(() {
      selectedLetter = letter;
    });
  }

  void _addRegistrationDocument() {
    // Add your document picker logic here
    print('Adding registration document');
  }

  // Method to handle plate number selection
  void _selectNumber(String number) {
    setState(() {
      selectedNumber = number;
    });
  }

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
      padding: EdgeInsets.all(0),
      initialChildSize: 0.65,
      builder: (sheetContext) {
        return Container(
          padding: const EdgeInsets.all(0),
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
                      ? CarModelSelection()
                      : label == 'لون السيارة'
                          ? CarColorSelectionScreen()
                          : label == 'نوع الوقود'
                              ? TypesOil()
                              : label == "استمارة السيارة"
                                  ? ImageUploadComponent(
                                      onImageSelected: (File image) {
                                        // Handle the selected image
                                        print(
                                            'Selected image path: ${image.path}');
                                      },
                                      // Optional customization
                                      size: 120,
                                      primaryColor: Color(0xFFE100FF),
                                      uploadText: 'تحميل الصورة',
                                      captureText: 'التقاط صورة',
                                    )
                                  : NumberOfCylinders()
            ],
          ),
        );
      },
    );
  }

  int selectedButton = 5000;
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
                title: 'اضافة معلومات الصيانة',
                showBackButton: true,
              ),
              const SizedBox(height: 16),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: CustomTextField(
                    label: "ممشى السيارة",
                    labelIcon: FontAwesomeIcons.gauge,
                  )),
              const SizedBox(height: 16),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: CustomTextField(
                    label: "تاريخ اخر صيانة",
                    labelIcon: FontAwesomeIcons.calendar,
                  )),
              const SizedBox(height: 16),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'صيانة',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: "CustomFont"),
                      ),
                      Icon(
                        FontAwesomeIcons.gear,
                        size: 24,
                        color: Colors.white,
                      ),
                    ],
                  )),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSelectableButton(5000),
                  const SizedBox(width: 16),
                  _buildSelectableButton(10000),
                ],
              ),
              const SizedBox(height: 16),
              const SizedBox(height: 16),
              const SizedBox(height: 16),
              const SizedBox(height: 16),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: GradientButton(
                    text: "اضافة صورة ",
                    icon: Icons.add_circle_outline,
                  )),
              const SizedBox(height: 16),
              const SizedBox(height: 16),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'مثل صورة الفاتورة الخاصة بالصيانة الاخيرة',
                        style: TextStyle(
                            color: Color(0xff909090),
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            fontFamily: "CustomFont"),
                      ),
                    ],
                  )),
              const SizedBox(height: 16),
              const SizedBox(height: 16),
              const SizedBox(height: 16),
              const SizedBox(height: 16),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: GradientButton(
                    text: "اضافة ",
                  )),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSelectableButton(int value) {
    final bool isSelected = selectedButton == value;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedButton = value;
        });
      },
      child: Container(
        width: 170,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              Color(0xFF00CED1),
              Color(0xFFFF5BF8),
              Color(0xFFC903C0),
            ],
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xff1D1E23)),
          child: Center(
            child: Text(
              'كم $value ',
              style: TextStyle(
                  color: isSelected ? Colors.white : Colors.purple,
                  fontSize: 18,
                  decoration: isSelected ? null : TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                  fontFamily: "CustomFont"),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRegistrationButton() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        textDirection: TextDirection.rtl,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'استمارة السيارة',
            style: TextStyle(
                color: Colors.white, fontSize: 12, fontFamily: "CustomFont"),
          ),
          const SizedBox(width: 8),
          TextButton(
            onPressed: () => onClickCustomDropdown(
              context,
              'استمارة السيارة',
              brands,
              selectedBrand,
              (value) {
                setState(() {});
              },
            ),
            child: const Text(
              ' اضافة +',
              style: TextStyle(
                  color: Color(0xffC903C0),
                  fontSize: 12,
                  fontFamily: "CustomFont"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlateTextField({
    required TextEditingController controller,
    double width = 30,
    TextInputAction? textInputAction,
    FocusNode? focusNode,
    Function(String)? onChanged,
    TextDirection textDirection = TextDirection.rtl, // Add text direction
  }) {
    return Container(
      width: width,
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        textAlign: TextAlign.center,
        textDirection: textDirection, // Set text direction
        style: const TextStyle(color: Colors.white),
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
        ),
        maxLength: 1,
        textInputAction: textInputAction,
        onChanged: onChanged,
        buildCounter: (context,
                {required currentLength, required isFocused, maxLength}) =>
            null,
      ),
    );
  }

// Add these to your state class
  final List<FocusNode> _focusNodes = List.generate(14, (index) => FocusNode());

  @override
  void initState() {
    super.initState();
    // Setup focus nodes and controllers
    _setupTextFields();
  }

  void _setupTextFields() {
    // Setup for Arabic letters
    _setupTextField(_plateLetterController1, 0);
    _setupTextField(_plateLetterController2, 1);
    _setupTextField(_plateLetterController3, 2);

    // Setup for English letters
    _setupTextField(_plateEngController1, 3);
    _setupTextField(_plateEngController2, 4);
    _setupTextField(_plateEngController3, 5);

    // Setup for first row numbers
    _setupTextField(_plateNumberController1, 6);
    _setupTextField(_plateNumberController2, 7);
    _setupTextField(_plateNumberController3, 8);
    _setupTextField(_plateNumberController4, 9);

    // Setup for second row numbers
    _setupTextField(_plateNumber2Controller1, 10);
    _setupTextField(_plateNumber2Controller2, 11);
    _setupTextField(_plateNumber2Controller3, 12);
    _setupTextField(_plateNumber2Controller4, 13);
  }

  void _setupTextField(TextEditingController controller, int index) {
    controller.addListener(() {
      if (controller.text.length == 1 && index < _focusNodes.length - 1) {
        _focusNodes[index + 1].requestFocus();
      }
    });
  }

// Update your _buildPlateNumberSelector() method to use focus nodes
  Widget _buildPlateNumberSelector() {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'رقم اللوحة',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF2A2A2A),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFF3A3A3A),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  // ... KSA Section ...
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: Colors.grey.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/ksa_logo.png',
                          height: 14,
                          width: 16,
                        ),
                        Text(
                          'السعودية',
                          style: TextStyle(color: Colors.grey, fontSize: 6),
                        ),
                        Text(
                          'K',
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                        Text(
                          'S',
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                        Text(
                          'A',
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                  // Letters Section
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            color: Colors.grey.withOpacity(0.3),
                            width: 1,
                          ),
                        ),
                      ),
                      child: Column(
                        children: [
                          // Arabic Letters
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildPlateTextField(
                                controller: _plateLetterController1,
                                focusNode: _focusNodes[0],
                                textDirection: TextDirection.rtl,
                              ),
                              _buildPlateTextField(
                                controller: _plateLetterController2,
                                focusNode: _focusNodes[1],
                                textDirection: TextDirection.rtl,
                              ),
                              _buildPlateTextField(
                                controller: _plateLetterController3,
                                focusNode: _focusNodes[2],
                                textDirection: TextDirection.rtl,
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          // English Letters
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildPlateTextField(
                                controller: _plateEngController1,
                                focusNode: _focusNodes[3],
                                textDirection: TextDirection.ltr,
                              ),
                              _buildPlateTextField(
                                controller: _plateEngController2,
                                focusNode: _focusNodes[4],
                                textDirection: TextDirection.ltr,
                              ),
                              _buildPlateTextField(
                                controller: _plateEngController3,
                                focusNode: _focusNodes[5],
                                textDirection: TextDirection.ltr,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Numbers Section
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildPlateTextField(
                                controller: _plateNumberController1,
                                focusNode: _focusNodes[6],
                                textDirection: TextDirection.ltr,
                              ),
                              _buildPlateTextField(
                                controller: _plateNumberController2,
                                focusNode: _focusNodes[7],
                                textDirection: TextDirection.ltr,
                              ),
                              _buildPlateTextField(
                                controller: _plateNumberController3,
                                focusNode: _focusNodes[8],
                                textDirection: TextDirection.ltr,
                              ),
                              _buildPlateTextField(
                                controller: _plateNumberController4,
                                focusNode: _focusNodes[9],
                                textDirection: TextDirection.ltr,
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildPlateTextField(
                                controller: _plateNumber2Controller1,
                                focusNode: _focusNodes[10],
                                textDirection: TextDirection.ltr,
                              ),
                              _buildPlateTextField(
                                controller: _plateNumber2Controller2,
                                focusNode: _focusNodes[11],
                                textDirection: TextDirection.ltr,
                              ),
                              _buildPlateTextField(
                                controller: _plateNumber2Controller3,
                                focusNode: _focusNodes[12],
                                textDirection: TextDirection.ltr,
                              ),
                              _buildPlateTextField(
                                controller: _plateNumber2Controller4,
                                focusNode: _focusNodes[13],
                                textDirection: TextDirection.ltr,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildYearSelector() {
    final List<String> years = List.generate(
      35,
      (index) => (2024 - index).toString(),
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        textDirection: TextDirection.rtl,
        children: [
          const Text(
            'سنة الصنع',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Container(
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                children: [
                  ListWheelScrollView(
                    itemExtent: 50,
                    diameterRatio: 1.5,
                    offAxisFraction: 0.0,
                    squeeze: 1.0,
                    physics: const FixedExtentScrollPhysics(),
                    onSelectedItemChanged: (index) {
                      setState(() {
                        selectedYear = years[index];
                      });
                    },
                    children: years.map((year) {
                      final bool isSelected = selectedYear == year;
                      return Container(
                        alignment: Alignment.center,
                        padding:
                            isSelected ? EdgeInsets.all(10) : EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFF263238)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          year,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.grey,
                            fontSize: 15,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  // Gradient overlay for top fade effect

                  // Center selection indicator
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMileageInput() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        textDirection: TextDirection.rtl,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'ممشي السيارة',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF00CED1),
                    Color(0xFFFF5BF8),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              padding: const EdgeInsets.all(1),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E1E),
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _mileageController,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white),
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: '000000',
                          hintStyle: TextStyle(color: Colors.grey),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: const Text(
                        'كم',
                        style: TextStyle(
                            color: Colors.white, fontFamily: "CustomFont"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
