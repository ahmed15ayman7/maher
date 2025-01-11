import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../components/ui/custom_app_bar.dart';
import '../../components/ui/custom_text_field.dart';
import '../../components/ui/bg_card.dart';
import '../../components/ui/GradientButton.dart';

class SelectLocationScreen extends StatefulWidget {
  final double latitude;
  final double longitude;

  const SelectLocationScreen({
    super.key,
    required this.latitude,
    required this.longitude,
  });

  @override
  State<SelectLocationScreen> createState() => _SelectLocationScreenState();
}

class _SelectLocationScreenState extends State<SelectLocationScreen> {
  late GoogleMapController _mapController;
  final TextEditingController _searchController = TextEditingController();
  bool _saveForLater = false;
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _markers.add(
      Marker(
        markerId: const MarkerId('current_location'),
        position: LatLng(widget.latitude, widget.longitude),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _mapController.dispose();
    super.dispose();
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    // Set map style to dark
    _mapController.setMapStyle('''
      [
        {
          "elementType": "geometry",
          "stylers": [
            {
              "color": "#242f3e"
            }
          ]
        },
        {
          "elementType": "labels.text.fill",
          "stylers": [
            {
              "color": "#746855"
            }
          ]
        }
      ]
    ''');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: 'حدد موقعك',
        showBackButton: true,
      ),
      body: Stack(
        children: [
          // Map in background
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(widget.latitude, widget.longitude),
              zoom: 15,
            ),
            onMapCreated: _onMapCreated,
            markers: _markers,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            mapToolbarEnabled: false,
          ),
          // Search and content overlay
          SafeArea(
            child: Column(
              children: [
                // Search bar
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CustomTextField(
                    label: '',
                    controller: _searchController,
                    placeholder: 'إبحث عن موقعك',
                    prefix: '🔍',
                    textColor: Colors.white,
                    placeholderColor: Colors.grey,
                  ),
                ),
                const Spacer(),
                // Bottom card
                BgCard(
                  isDark: true,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
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
                      // Location card
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
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: Color(0xFFFF5BF8),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'الرياض، رمزي: RRAB2886. 2886. 6332',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Checkbox
                      Row(
                        children: [
                          Checkbox(
                            value: _saveForLater,
                            onChanged: (value) {
                              setState(() {
                                _saveForLater = value ?? false;
                              });
                            },
                            fillColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.selected)) {
                                  return const Color(0xFFFF5BF8);
                                }
                                return Colors.grey;
                              },
                            ),
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
                      // Confirm button
                      GradientButton(
                        onTap: () {
                          // Handle location confirmation
                        },
                        text: 'تأكيد موقعك',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
