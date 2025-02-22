// ignore_for_file: file_names

import 'package:flutter/material.dart';
//import 'package:masmech/widgets/base_page.dart';

// class RecentTab extends StatelessWidget {
//   const RecentTab({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return BasePage(
//       child: Column(
//         children: [
//           AppBar(
//             title: const Text('Recent Activity'),
//             backgroundColor: const Color.fromARGB(255, 235, 253, 255),
//             toolbarHeight: 30.0,
//           ),
//         ],
//         // body: const Center(
//         //   child: Text('Welcome to the RecentTab!'),
//         // ),
//       ),
//     );
//   }
// }

//import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:masmech/global/global_var.dart';

class RecentTab extends StatefulWidget {
  const RecentTab({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RecentTabState createState() => _RecentTabState();
}

class _RecentTabState extends State<RecentTab> {
  // ignore: unused_field
  late GoogleMapController _mapController;

  // ignore: unused_field
  final LatLng _center = const LatLng(3.1390, 101.6869); // KL Coordinates

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recent Activity'),
        backgroundColor: const Color.fromARGB(255, 235, 253, 255),
        toolbarHeight: 30.0,
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: googlePlexInitialPosition,
        myLocationEnabled: true,
        mapType: MapType.normal,
      ),
    );
  }
}
