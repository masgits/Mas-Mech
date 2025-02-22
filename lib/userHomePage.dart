// ignore_for_file: file_names, unnecessary_string_interpolations, avoid_print

//import 'dart:core';
//import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'dart:async';
//import 'dart:convert';
// ignore: unnecessary_import
//import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:masmech/global/global_var.dart';
import 'package:masmech/userProfilePage.dart';
import 'package:masmech/userRecentActivity.dart';
import 'package:masmech/userVehicleDetails.dart';
import 'package:masmech/widgets/base_page.dart';
import 'package:google_fonts/google_fonts.dart';

class UserHomePage extends StatelessWidget {
  final String firstName;
  const UserHomePage({super.key, required this.firstName});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeHomePage(firstName: firstName),
    );
  }
}

class WelcomeHomePage extends StatefulWidget {
  final String firstName;
  const WelcomeHomePage({super.key, required this.firstName});

  @override
  // ignore: library_private_types_in_public_api
  _WelcomeHomePageState createState() => _WelcomeHomePageState();
}

class _WelcomeHomePageState extends State<WelcomeHomePage> {
  // ignore: prefer_final_fields
  int _currentIndex = 0;

  // Declare _pages as an empty list initially
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    // Initialize _pages here, after widget.firstName is available
    _pages = [
      HomeContent(firstName: widget.firstName),
      const RecentTab(),
      const VehicleTab(),
      const ProfileTab(),
    ];
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        toolbarHeight: 30.0,
        //title: const Text("Welcome to MasMech"),
        //automaticallyImplyLeading: false, // Hides back button
      ),
      body: _pages[_currentIndex], // Displays the content based on selected tab
      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: onTabTapped,
          selectedItemColor: const Color.fromARGB(255, 6, 227, 194),
          unselectedItemColor: Colors.black,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'Recent Activity',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.car_repair),
              label: 'Vehicle Details',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Personal Info',
            ),
          ],
        ),
      ),
    );
  }
}

class HomeContent extends StatefulWidget {
  final String firstName;
  const HomeContent({super.key, required this.firstName});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  List<String> services = [
    'Battery Replacement',
    'Flat Tire Repair',
    'Brake Repair',
    'Locked Vehicle Assistance',
    'Car Overheating Assistance',
    'Car Headlight Assistance',
    'Starter Motor Replacement',
    'Radiator Repair',
    'Power Steering Fluid Refill',
    'Windshield Wiper Repair'
  ];
  List<String> filteredServices = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterServices);
  }

  void _filterServices() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredServices = query.isEmpty
          ? []
          : services
              .where((service) => service.toLowerCase().contains(query))
              .toList();
    });
  }

  void _navigateToServiceDetail(String serviceName) {
    final serviceDetails = {
      "Battery Replacement": {
        "desc":
            "Ensure your vehicle runs smoothly with our professional battery replacement service. We provide on-the-spot diagnostics to identify battery issues and replace your old battery with a high-quality, long-lasting alternative. Our service is quick, reliable, and hassle-free, designed to get you back on the road in no time.",
        "price": "150"
      },
      "Flat Tire Repair": {
        "desc":
            "Get back on the road quickly with our flat tire repair service. Whether it’s a puncture or a slow leak, our skilled mechanics will assess the damage, provide a safe and effective repair, or replace the tire if needed. We ensure your tires are in top condition for a smooth and secure drive.",
        "price": "50"
      },
      "Brake Repair": {
        "desc":
            "Ensure your safety on the road with our professional brake repair service. Our experts diagnose and fix issues such as worn-out brake pads, malfunctioning calipers, or leaking brake fluid. Trust us to restore your braking system's performance for reliable stopping power and peace of mind.",
        "price": "120"
      },
      "Locked Vehicle Assistance": {
        "desc":
            "Accidentally locked out of your car? Our locked vehicle assistance service provides quick and reliable solutions to regain access to your vehicle without causing damage. Whether you've misplaced your keys or left them inside, our skilled team is here to help you get back on the road promptly.",
        "price": "80"
      },
      "Car Overheating Assistance": {
        "desc":
            "Our car overheating assistance service is designed to address this problem efficiently and effectively. Whether it's a coolant leak, a faulty radiator, or a broken thermostat, our skilled mechanics will quickly diagnose the root cause and take the necessary steps to resolve it.",
        "price": "90"
      },
      "Car Headlight Assistance": {
        "desc":
            "Our car headlight assistance service ensures your headlights are functioning properly, providing optimal illumination for nighttime and adverse weather driving. Whether it’s a burnt-out bulb, wiring issue, or alignment problem, our expert mechanics will identify the issue and fix it promptly.",
        "price": "60"
      },
      "Starter Motor Replacement": {
        "desc":
            "Our starter motor replacement service is designed to get you back on the road quickly and efficiently. Whether it's due to worn-out components, electrical issues, or a complete starter failure, our skilled mechanics will diagnose the problem and replace the faulty motor with a high-quality, reliable replacement.",
        "price": "250"
      },
      "Radiator Repair": {
        "desc":
            "Our radiator repair service provides expert diagnosis and effective solutions, including fixing leaks, flushing out blockages, or replacing damaged components. With our professional care, your vehicle will maintain proper cooling, ensuring safe and efficient operation on every journey.",
        "price": "180"
      },
      "Power Steering Fluid Refill": {
        "desc":
            "Our power steering fluid refill service ensures your vehicle's steering remains responsive and easy to handle. Using high-quality fluids, we’ll restore your power steering system's efficiency, ensuring a comfortable and safe driving experience.",
        "price": "40"
      },
      "Windshield Wiper Repair": {
        "desc":
            "Our windshield wiper repair service will inspect, replace, or repair the blades and motor to ensure that your wipers work effectively. With functioning wipers, you can drive with confidence, knowing that your windshield will be kept clear, enhancing your safety during inclement weather.",
        "price": "30"
      },
    };
    final selectedService = serviceDetails[serviceName];
    if (selectedService != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ServiceDetailPage(
            serviceName: serviceName,
            serviceDesc: selectedService["desc"]!,
            servicePrice: selectedService["price"]!,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        _getGreetingMessage(),
                        style: GoogleFonts.pacifico(
                          textStyle: const TextStyle(
                            fontSize: 20,
                            //fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 5, 92, 157),
                          ),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        widget.firstName,
                        style: GoogleFonts.pacifico(
                          textStyle: const TextStyle(
                            fontSize: 16,
                            //fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 5, 92, 157),
                          ),
                        ),
                      ),
                      const SizedBox(height: 2),
                      // const Icon(
                      //   Icons.wb_sunny,
                      //   size: 20,
                      //   color: Color.fromARGB(255, 5, 92, 157),
                      // ),
                    ],
                  ),
                  Image.asset(
                    'images/MASMECH_LOGO_2.png',
                    width: 150,
                    height: 150,
                    semanticLabel: 'MasMech Logo',
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 200,
            left: 0,
            right: 0,
            bottom: 0,
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //AppBar(
                  //title: const Text('SIGN UP'),
                  //backgroundColor: const Color.fromARGB(255, 238, 8, 8),
                  //elevation: 0,
                  //foregroundColor: const Color.fromARGB(255, 195, 231, 15),
                  //automaticallyImplyLeading: false, // Hides the back button if needed
                  //),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 10.0),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search for Services...',
                        hintStyle: const TextStyle(color: Colors.white),
                        prefixIcon:
                            const Icon(Icons.search, color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide:
                              const BorderSide(color: Colors.white, width: 2.0),
                        ),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 5, 92, 157),
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 15.0),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),

                  if (filteredServices.isNotEmpty)
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: filteredServices.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(filteredServices[index]),
                            onTap: () {
                              _navigateToServiceDetail(filteredServices[index]);
                              _searchController.clear();
                            },
                          );
                        },
                      ),
                    ),

                  Container(
                    height: 200,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300],
                    ),
                    child: const MapContainer(),
                  ),

                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.car_repair,
                            color: Color.fromARGB(255, 5, 92, 157), size: 24),
                        SizedBox(width: 6),
                        Text(
                          'Repair Services',
                          style: TextStyle(
                            fontSize: 18,
                            //fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 225,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 200, 200, 200),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            // ignore: deprecated_member_use
                            color: Colors.black.withOpacity(0.1),
                            //spreadRadius: 3,
                            //blurRadius: 5,
                            //offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: const [
                            ServiceCard(
                              imagePath: 'images/battery_replacement.png',
                              serviceName: 'Battery Replacement',
                              serviceDesc:
                                  'Ensure your vehicle runs smoothly with our professional battery replacement service. We provide on-the-spot diagnostics to identify battery issues and replace your old battery with a high-quality, long-lasting alternative. Our service is quick, reliable, and hassle-free, designed to get you back on the road in no time.',
                              servicePrice: 'PRICE: ',
                            ),
                            ServiceCard(
                              imagePath: 'images/flat_tire.jpg',
                              serviceName: 'Flat Tire Repair',
                              serviceDesc:
                                  'Get back on the road quickly with our flat tire repair service. Whether it’s a puncture or a slow leak, our skilled mechanics will assess the damage, provide a safe and effective repair, or replace the tire if needed. We ensure your tires are in top condition for a smooth and secure drive.',
                              servicePrice: 'PRICE: ',
                            ),
                            ServiceCard(
                              imagePath: 'images/brake_repair.jpg',
                              serviceName: 'Brake Repair',
                              serviceDesc:
                                  "Ensure your safety on the road with our professional brake repair service. Our experts diagnose and fix issues such as worn-out brake pads, malfunctioning calipers, or leaking brake fluid. Trust us to restore your braking system's performance for reliable stopping power and peace of mind.",
                              servicePrice: 'PRICE: ',
                            ),
                            ServiceCard(
                              imagePath: 'images/locked_car.jpg',
                              serviceName: 'Locked Vehicle Assistance',
                              serviceDesc:
                                  "Accidentally locked out of your car? Our locked vehicle assistance service provides quick and reliable solutions to regain access to your vehicle without causing damage. Whether you've misplaced your keys or left them inside, our skilled team is here to help you get back on the road promptly.",
                              servicePrice: 'PRICE: ',
                            ),
                            ServiceCard(
                              imagePath: 'images/car_overheating.jpeg',
                              serviceName: 'Car Overheating Assistance',
                              serviceDesc:
                                  "Our car overheating assistance service is designed to address this problem efficiently and effectively. Whether it's a coolant leak, a faulty radiator, or a broken thermostat, our skilled mechanics will quickly diagnose the root cause and take the necessary steps to resolve it.",
                              servicePrice: 'PRICE: ',
                            ),
                            ServiceCard(
                              imagePath: 'images/car_headlight.jpg',
                              serviceName: 'Car Headlight Assistance',
                              serviceDesc:
                                  'Our car headlight assistance service ensures your headlights are functioning properly, providing optimal illumination for nighttime and adverse weather driving. Whether it’s a burnt-out bulb, wiring issue, or alignment problem, our expert mechanics will identify the issue and fix it promptly.',
                              servicePrice: 'PRICE: ',
                            ),
                            ServiceCard(
                              imagePath: 'images/starter.jpg',
                              serviceName: 'Starter Motor Replacement',
                              serviceDesc:
                                  "Our starter motor replacement service is designed to get you back on the road quickly and efficiently. Whether it's due to worn-out components, electrical issues, or a complete starter failure, our skilled mechanics will diagnose the problem and replace the faulty motor with a high-quality, reliable replacement.",
                              servicePrice: 'PRICE: ',
                            ),
                            ServiceCard(
                              imagePath: 'images/radiator.jpg',
                              serviceName: 'Radiator Repair',
                              serviceDesc:
                                  "Our radiator repair service provides expert diagnosis and effective solutions, including fixing leaks, flushing out blockages, or replacing damaged components. With our professional care, your vehicle will maintain proper cooling, ensuring safe and efficient operation on every journey.",
                              servicePrice: 'PRICE: ',
                            ),
                            ServiceCard(
                              imagePath: 'images/power_steering.jpeg',
                              serviceName: 'Power Steering Fluid Refill',
                              serviceDesc:
                                  "Our power steering fluid refill service ensures your vehicle's steering remains responsive and easy to handle. Using high-quality fluids, we’ll restore your power steering system's efficiency, ensuring a comfortable and safe driving experience.",
                              servicePrice: 'PRICE: ',
                            ),
                            ServiceCard(
                              imagePath: 'images/windshield_wipers_repair.jpg',
                              serviceName: 'Windshield Wiper Repair',
                              serviceDesc:
                                  "Our windshield wiper repair service will inspect, replace, or repair the blades and motor to ensure that your wipers work effectively. With functioning wipers, you can drive with confidence, knowing that your windshield will be kept clear, enhancing your safety during inclement weather.",
                              servicePrice: 'PRICE: ',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String _getGreetingMessage() {
  final hour = DateTime.now().hour;
  if (hour < 12) {
    return 'Good Morning,';
  } else if (hour < 16) {
    return 'Good Afternoon,';
  } else {
    return 'Good Evening,';
  }
}

class MapContainer extends StatefulWidget {
  const MapContainer({super.key});

  @override
  State<MapContainer> createState() => _MapContainerState();
}

class _MapContainerState extends State<MapContainer> {
  final Completer<GoogleMapController> googleMapCompleterController =
      Completer<GoogleMapController>();
  GoogleMapController? _controller;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _loadMapStyle() async {
    try {
      // ignore: unnecessary_string_escapes
      print("Attempting to load map style...");
      final String style = await rootBundle.loadString(
          // ignore: unnecessary_string_escapes
          'assets/map_styles/custom_map_style.json');
      print("Map style loaded successfully!");
      // ignore: deprecated_member_use
      _controller?.setMapStyle(style);
    } catch (e) {
      print("Error loading map style: $e");
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
    googleMapCompleterController.complete(controller);
    _loadMapStyle();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: googlePlexInitialPosition,
      myLocationEnabled: true,
      mapType: MapType.normal,
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String imagePath, serviceName, serviceDesc, servicePrice;

  const ServiceCard({
    super.key,
    required this.imagePath,
    required this.serviceName,
    required this.serviceDesc,
    required this.servicePrice,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ServiceDetailPage(
              serviceName: serviceName,
              serviceDesc: serviceDesc,
              servicePrice: servicePrice,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              width: 150,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                    image: AssetImage(imagePath), fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: 150,
              height: 50,
              padding: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 5, 92, 157),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                serviceName,
                style: const TextStyle(
                  fontSize: 15,
                  //fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceDetailPage extends StatelessWidget {
  final String serviceName, serviceDesc, servicePrice;

  const ServiceDetailPage({
    super.key,
    required this.serviceName,
    required this.serviceDesc,
    required this.servicePrice,
  });

  @override
  Widget build(BuildContext context) {
    return BasePage(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 235, 253, 255),
        ),
        body: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Container(
            width: 580,
            height: 460,
            //padding: const EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              //color: const Color.fromARGB(255, 200, 200, 200),
              color: const Color.fromARGB(255, 200, 200, 200),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    serviceName,
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 5, 92, 157)),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    serviceDesc,
                    style: const TextStyle(
                        fontSize: 18,
                        //fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 5, 92, 157)),
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'PRICE : ',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 5, 92, 157)),
                      ),
                      Text(
                        'RM ',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 5, 92, 157)),
                      ),
                      // Text(
                      //   servicePrice,
                      //   style: const TextStyle(
                      //       fontSize: 18,
                      //       fontWeight: FontWeight.bold,
                      //       color: Color.fromARGB(255, 5, 92, 157)),
                      // ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      // Handle service request
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(content: Text('$serviceName requested successfully!')),
                      // );
                    },
                    //style: ElevatedButton.styleFrom(
                    //minimumSize: const Size(double.infinity, 50),
                    // ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(150, 50),
                      backgroundColor: const Color.fromARGB(255, 5, 92, 157),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'REQUEST',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.bold,
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
