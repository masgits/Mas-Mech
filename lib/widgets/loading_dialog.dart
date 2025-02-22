import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoadingDialog extends StatelessWidget {
  String messageText;

  LoadingDialog({super.key, required this.messageText});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      child: Container(
        //margin: const EdgeInsets.all(2),
        width: double.infinity,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 5, 92, 157),
            borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              const SizedBox(width: 5),
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Color.fromARGB(255, 255, 255, 255)),
              ),
              const SizedBox(width: 8),
              Text(
                messageText,
                style: const TextStyle(
                    fontSize: 14, color: Color.fromARGB(255, 255, 255, 255)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
