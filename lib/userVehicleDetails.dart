// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:masmech/widgets/base_page.dart';

class VehicleTab extends StatelessWidget {
  const VehicleTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppBar(
            //title: const Text('SIGN UP'),
            backgroundColor: const Color.fromARGB(255, 235, 253, 255),
            toolbarHeight: 30.0,
            //foregroundColor: const Color.fromARGB(255, 195, 231, 15),
            //automaticallyImplyLeading: false, // Hides the back button if needed
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'images/MASMECH_LOGO_2.png',
                  width: 150,
                  height: 150,
                  semanticLabel: 'MasMech Logo',
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8.0,
            ),
            child: Row(
              children: [
                Text(
                  'Vehicle Details',
                  style: TextStyle(
                    fontSize: 22,
                    //fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Container(
              height: 450,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 200, 200, 200),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const Text(
                                'Vehicle Make',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 5, 92, 157),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 4.0),
                                child: SizedBox(
                                  width: 150,
                                  height: 35,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor: const Color.fromARGB(
                                          255, 255, 255, 255),
                                      hintText: 'e.g BMW',
                                      hintStyle: const TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                      //prefixIcon: Icon(Icons.person),
                                      //prefixIconColor: Color.fromARGB(255, 5, 92, 157),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 10.0),
                                      //labelStyle: const TextStyle(fontSize: 4),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Plate Number',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 5, 92, 157),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 4.0),
                                child: SizedBox(
                                  width: 150,
                                  height: 35,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor: const Color.fromARGB(
                                          255, 255, 255, 255),
                                      //labelText: 'First Name',
                                      //prefixIcon: Icon(Icons.person),
                                      //prefixIconColor: Color.fromARGB(255, 5, 92, 157),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 10.0),
                                      labelStyle: const TextStyle(fontSize: 12),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Colour',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 5, 92, 157),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 4.0),
                                child: SizedBox(
                                  width: 150,
                                  height: 35,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor: const Color.fromARGB(
                                          255, 255, 255, 255),
                                      //labelText: 'First Name',
                                      //prefixIcon: Icon(Icons.person),
                                      //prefixIconColor: Color.fromARGB(255, 5, 92, 157),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 10.0),
                                      labelStyle: const TextStyle(fontSize: 12),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Year of Manufacture',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 5, 92, 157),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 4.0),
                                child: SizedBox(
                                  width: 150,
                                  height: 35,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor: const Color.fromARGB(
                                          255, 255, 255, 255),
                                      //labelText: 'First Name',
                                      //prefixIcon: Icon(Icons.person),
                                      //prefixIconColor: Color.fromARGB(255, 5, 92, 157),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 10.0),
                                      labelStyle: const TextStyle(fontSize: 12),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(width: 20.0),

                          //2nd Column with three rows i.e last name, phone and password
                          Column(
                            children: [
                              const Text(
                                'Vehicle Model',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 5, 92, 157),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 4.0),
                                child: SizedBox(
                                  width: 150,
                                  height: 35,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor: const Color.fromARGB(
                                          255, 255, 255, 255),
                                      hintText: 'e.g 5 Series (530e)',
                                      hintStyle: const TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                      //labelText: 'First Name',
                                      //prefixIcon: Icon(Icons.person),
                                      //prefixIconColor: Color.fromARGB(255, 5, 92, 157),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 10.0),
                                      labelStyle: const TextStyle(fontSize: 12),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Fuel Type',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 5, 92, 157),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 4.0),
                                child: SizedBox(
                                  width: 150,
                                  height: 35,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor: const Color.fromARGB(
                                          255, 255, 255, 255),
                                      hintText: 'e.g Gasoline',
                                      hintStyle: const TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                      //labelText: 'First Name',
                                      //prefixIcon: Icon(Icons.person),
                                      //prefixIconColor: Color.fromARGB(255, 5, 92, 157),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 10.0),
                                      //labelStyle: const TextStyle(fontSize: 12),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Mileage',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 5, 92, 157),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 4.0),
                                child: SizedBox(
                                  width: 150,
                                  height: 35,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor: const Color.fromARGB(
                                          255, 255, 255, 255),
                                      //labelText: 'First Name',
                                      //prefixIcon: Icon(Icons.person),
                                      //prefixIconColor: Color.fromARGB(255, 5, 92, 157),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 10.0),
                                      //labelStyle: const TextStyle(fontSize: 12),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: 150,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            //minimumSize: const Size(150, 50),
                            backgroundColor:
                                const Color.fromARGB(255, 5, 92, 157),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: const Text(
                            'SAVE',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
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
