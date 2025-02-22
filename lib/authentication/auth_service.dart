// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class AuthService {
  Future<void> loginWithUsername(String username, String password) async {
    print("Starting loginWithUsername...");
    DatabaseReference usersRef = FirebaseDatabase.instance.ref().child("users");
    print("Connected to Firebase Database");

    // Query the database for the username
    DataSnapshot snapshot =
        await usersRef.orderByChild("userName").equalTo(username).get();
    print("Query executed for username: $username");

    if (snapshot.exists) {
      // Retrieve the email associated with the username
      print("Username found in database");
      Map userData = (snapshot.value as Map).values.first;
      print("User data retrieved: $userData");
      String email = userData["email"];
      print("Email associated with username: $email");
      String firstName = userData["firstName"];
      print("First name associated with username: $firstName");

      // Use the email to authenticate with Firebase
      try {
        print("Attempting to authenticate email: $email");
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        print("Login successful!");
      } catch (error) {
        print("Firebase Auth failed with error: $error");
        throw Exception("Invalid username or password!");
      }
    } else {
      print("Username not found!");
      throw Exception("Username not found!");
    }
  }

  Future<String?> getFirstName(String username) async {
    DatabaseReference usersRef = FirebaseDatabase.instance.ref().child("users");

    // Query the database for the username
    DataSnapshot snapshot =
        await usersRef.orderByChild("userName").equalTo(username).get();

    if (snapshot.exists) {
      // Retrieve the first name
      Map userData = (snapshot.value as Map).values.first;
      String firstName = userData["firstName"];
      return firstName;
    } else {
      print("Username not found!");
      return null;
    }
  }
}
