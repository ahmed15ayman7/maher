import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:maher/components/ui/GradientButton2.dart';
import 'package:maher/components/ui/GradientButton.dart';
import 'package:maher/components/ui/bg_card.dart';
import 'package:maher/components/ui/bottomSheet.dart';
import 'package:maher/components/ui/custom_app_bar.dart';
import 'package:maher/components/ui/custom_text_field.dart';
import 'package:maher/components/ui/gradient_checkbox.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:maher/screens/auth/verify_screen.dart';

class SelectLocationScreen extends StatefulWidget {
  const SelectLocationScreen({super.key});

  @override
  State<SelectLocationScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<SelectLocationScreen> {
  final MapController _mapController = MapController();
  final Location _location = Location();
  final TextEditingController _searchController = TextEditingController();
  static const LatLng _initialPosition =
      LatLng(24.7136, 46.6753); // Riyadh coordinates
  LocationData? _currentLocation;
  LatLng? _selectedLocation; // Add this line to track selected location
  bool _saveForLater = false;
  String _address = 'الرياض، رمزي: RRAB2886. 2886. 6332';
  String tileLayerUrl =
      'https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}{r}.png';
  final TextEditingController _customLocationController =
      TextEditingController();
  String? _selectedLocation2;
  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      final locationData = await _location.getLocation();
      setState(() {
        _currentLocation = locationData;
        _selectedLocation =
            LatLng(locationData.latitude!, locationData.longitude!);
      });

      _mapController.move(
        LatLng(locationData.latitude!, locationData.longitude!),
        15,
      );

      await _getAddressFromCoordinates(
          locationData.latitude!, locationData.longitude!);
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  void _handleTap(TapPosition tapPosition, LatLng point) {
    setState(() {
      _selectedLocation = point;
    });
    _getAddressFromCoordinates(point.latitude, point.longitude);
  }

  Future<void> _getAddressFromCoordinates(
      double latitude, double longitude) async {
    final url = Uri.parse(
        'https://nominatim.openstreetmap.org/reverse?lat=$latitude&lon=$longitude&format=json');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data.containsKey('display_name')) {
          setState(() {
            _address = data['display_name'];
          });
        } else {
          _showSnackbar('No address found for these coordinates.');
        }
      } else {
        _showSnackbar(
            'Failed to fetch address. Status code: ${response.statusCode}');
      }
    } catch (e) {
      _showSnackbar('Error fetching address: $e');
    }
  }

  void _showSnackbar(String message) {
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(content: Text(message)),
    // );
  }

  Future<void> _searchLocation(String query) async {
    final url = Uri.parse(
        'https://nominatim.openstreetmap.org/search?q=$query&format=json&limit=1');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data.isNotEmpty) {
          final latitude = double.parse(data[0]['lat']);
          final longitude = double.parse(data[0]['lon']);
          final displayName = data[0]['display_name'];

          setState(() {
            _selectedLocation = LatLng(latitude, longitude);
            _mapController.move(_selectedLocation!, 15.0);
            _address = displayName;
          });
        } else {
          _showSnackbar('No results found for "$query".');
        }
      } else {
        _showSnackbar(
            'Failed to fetch location data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      _showSnackbar('Error searching location: $e');
    }
  }

  final List<LocationButton> _locationButtons = [
    LocationButton(title: 'المنزل', gradient: true),
    LocationButton(title: 'العمل', gradient: true),
    LocationButton(title: 'منزل صديق', gradient: true),
  ];
  void _saveLocation() {
    // Here you would implement the logic to save the location
    final String locationName = _customLocationController.text.isEmpty
        ? _selectedLocation2 ?? 'موقع جديد'
        : _customLocationController.text;

    if (_currentLocation != null) {
      // Save location data
      print(
          'Saving location: $locationName at ${_currentLocation!.latitude}, ${_currentLocation!.longitude}');

      // Clear input and selection
      setState(() {
        _customLocationController.clear();
        _selectedLocation = null;
      });
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => VerificationScreen(showBottomSheet: true)));
    }
  }

  void _showSuccessBottomSheet(BuildContext context) {
    CustomBottomSheet.show(
        context: context,
        builder: (sheetContext) => Column(children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.close, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Expanded(
                      child: Text(
                        'قم بحفظ موقعك',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: "CustomFont"),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Location buttons
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _locationButtons
                        .map((button) => GradientButton2(
                              text: button.title,
                              onTap: () {
                                setState(() {
                                  _selectedLocation2 = button.title;
                                });
                              },
                              isText: true,
                            ))
                        .toList(),
                  ),

                  SizedBox(height: 16),

                  // Custom location input

                  CustomTextField(
                    controller: _customLocationController,
                    label: "عنوان آخر",
                    placeholder: 'ادخل اسم العنوان الذي تريد حفظه',
                  ),
                  SizedBox(height: 20),

                  // Save button
                  GradientButton(
                    text: 'تأكيد الحفظ',
                    onTap: _saveLocation,
                  )
                ],
              ),
            ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: _initialPosition,
              initialZoom: 15,
              onTap: _handleTap,
              onPositionChanged: (position, hasGesture) async {
                if (hasGesture) {
                  final center = position.center!;
                  await _getAddressFromCoordinates(
                      center.latitude, center.longitude);
                }
              },
            ),
            children: [
              TileLayer(
                urlTemplate: tileLayerUrl,
                subdomains: ['a', 'b', 'c'],
                userAgentPackageName: 'com.example.app',
              ),
              MarkerLayer(
                markers: _selectedLocation != null
                    ? [
                        Marker(
                          point: _selectedLocation!,
                          width: 80,
                          height: 80,
                          child: Icon(Icons.location_on,
                              color: Color(0xFFE100FF), size: 40),
                        ),
                      ]
                    : [],
              ),
            ],
          ),
          CustomAppBar(
            title: 'آلية تحديد موقعك',
            image: "assets/images/LocationIconW.png",
            showBackButton: true,
          ),
          Positioned(
            top: 100,
            left: 16,
            right: 16,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomTextField(
                label: '',
                controller: _searchController,
                placeholder: 'إبحث عن موقعك',
                prefix: '🔍',
                textColor: Colors.white,
                placeholderColor: Colors.grey,
                onChanged: (query) {
                  if (query.isNotEmpty) {
                    _searchLocation(query);
                  }
                },
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BgCard(
              isCustom: true,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'حدد العناوين المحفوظة',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xFF00CED1),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          Image.asset(
                            "assets/images/LocationIcon.png",
                            width: 24,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              _address,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        GradientCheckbox(
                          value: _saveForLater,
                          onChanged: (value) {
                            setState(() {
                              _saveForLater = value ?? false;
                            });
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'حفظ الموقع للإستخدامه لاحقا',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    GradientButton(
                      onTap: () {
                        _showSuccessBottomSheet(context);
                        print("lkjhgjk");
                      },
                      text: 'تأكيد موقعك',
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 250,
            right: 16,
            child: FloatingActionButton(
              onPressed: _getCurrentLocation,
              backgroundColor: Colors.white,
              child: Icon(Icons.my_location, color: Color(0xFF1D1E23)),
            ),
          ),
        ],
      ),
    );
  }
}

class LocationButton {
  final String title;
  final bool gradient;

  LocationButton({
    required this.title,
    this.gradient = false,
  });
}
