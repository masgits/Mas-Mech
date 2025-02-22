// ignore_for_file: unrelated_type_equality_checks

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class CommonMethods {
  checkConnectivity(BuildContext context) async
  {
    var connectionResult = await Connectivity().checkConnectivity();
    
    if (connectionResult == ConnectivityResult.none) {
      // No network connection
      if (!context.mounted) return;
      displaySnackBar(
          "Please check your Internet Connection and try again.", context);
      return;
    }

    // Check if actual internet access is available
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isEmpty || result[0].rawAddress.isEmpty) {
        if (!context.mounted) return;
        displaySnackBar(
            "Internet is not accessible. Please try again later.", context);
      }
    } on SocketException {
      if (!context.mounted) return;
      displaySnackBar(
          "Internet is not accessible. Please try again later.", context);
    }
  }

  displaySnackBar(String messageText, BuildContext context) {
    var snackBar = SnackBar(content: Text(messageText));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}