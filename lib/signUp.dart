// ignore_for_file: file_names, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:masmech/methods/common_methods.dart';
import 'package:masmech/userLogin.dart';
import 'package:masmech/widgets/base_page.dart';
import 'package:masmech/widgets/loading_dialog.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  CommonMethods cMethods = CommonMethods();

  void checkIfNetworkIsAvailable() async {
    await cMethods.checkConnectivity(context);

    // Dismisses keyboard when validation starts
    FocusScope.of(context).unfocus();

    signUpFormValidation();
  }

  void signUpFormValidation() {
    // First Name Validation
    if (firstNameController.text.trim().isEmpty) {
      cMethods.displaySnackBar("First Name cannot be empty.", context);
    } else if (!RegExp(r"^[a-zA-Z]{2,}$").hasMatch(firstNameController.text)) {
      cMethods.displaySnackBar(
          "First Name must be at least 2 characters and contain only letters.",
          context);
    }

    // Email Validation
    else if (emailAddressController.text.trim().isEmpty) {
      cMethods.displaySnackBar("Email Address cannot be empty.", context);
    } else if (!RegExp(r"^[a-zA-Z0-9.-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
        .hasMatch(emailAddressController.text)) {
      cMethods.displaySnackBar("Please enter a valid email address.", context);
    }

    // Username Validation
    else if (userNameController.text.trim().isEmpty) {
      cMethods.displaySnackBar("User Name cannot be empty.", context);
    } else if (userNameController.text.trim().length < 4) {
      cMethods.displaySnackBar(
          "Username must be at least 4 characters.", context);
    }

    // Last Name Validation
    else if (lastNameController.text.trim().isEmpty) {
      cMethods.displaySnackBar("Last Name cannot be empty.", context);
    } else if (!RegExp(r"^[a-zA-Z]{2,}$").hasMatch(lastNameController.text)) {
      cMethods.displaySnackBar(
          "Last Name must be at least 2 characters and contain only letters.",
          context);
    }

    // Phone Number Validation
    else if (phoneNumberController.text.trim().isEmpty) {
      cMethods.displaySnackBar("Phone Number cannot be empty.", context);
    } else if (!RegExp(r"^\d{10,}$").hasMatch(phoneNumberController.text)) {
      cMethods.displaySnackBar(
          "Phone number must be at least 10 digits.", context);
    }

    // Password Validation
    else if (passwordController.text.trim().isEmpty) {
      cMethods.displaySnackBar("Password cannot be empty.", context);
    } else if (!RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@$!%*?&]{8,}$")
        .hasMatch(passwordController.text)) {
      cMethods.displaySnackBar(
          "Password must be at least 8 characters, including at least one letter and one number.",
          context);
    } else {
      // User registers successfully :)
      registerNewUser();
    }
  }

  registerNewUser() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) =>
          LoadingDialog(messageText: "Registration in progress..."),
    );

    final User? userFirebase = (await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
      email: emailAddressController.text.trim(),
      password: passwordController.text.trim(),
      // ignore: body_might_complete_normally_catch_error
    )
            // ignore: body_might_complete_normally_catch_error
            .catchError((errorMsg) {
      Navigator.pop(context);
      cMethods.displaySnackBar(errorMsg.toString(), context);
    }))
        .user;

    if (!context.mounted) return;
    Navigator.pop(context);

    DatabaseReference usersRef =
        FirebaseDatabase.instance.ref().child("users").child(userFirebase!.uid);
    Map userDataMap = {
      "firstName": firstNameController.text.trim(),
      "email": emailAddressController.text.trim(),
      "userName": userNameController.text.trim(),
      "lastName": lastNameController.text.trim(),
      "phone": phoneNumberController.text.trim(),
      "id": userFirebase.uid,
      "blockStatus": "no",
    };

    // Saves information to the database
    usersRef.set(userDataMap);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const UserLogin(), // Ensure firstName is non-null
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        toolbarHeight: 30.0,
        //automaticallyImplyLeading: false, // Hides back button
      ),
      body: BasePage(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(0),
              child: Center(
                child: Image.asset(
                  'images/MASMECH_LOGO_2.png',
                  width: 170,
                  semanticLabel: 'MasMech Logo',
                ),
              ),
            ),
            const Text(
              'Create account',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 5, 92, 157),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //1st Column with three rows i.e first name, email and username
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: TextFormField(
                            controller: firstNameController,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              labelText: 'First Name',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.person),
                              prefixIconColor: Color.fromARGB(255, 5, 92, 157),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              labelStyle: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: TextFormField(
                            controller: emailAddressController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              labelText: 'Email Address',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.email),
                              prefixIconColor: Color.fromARGB(255, 5, 92, 157),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              labelStyle: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: TextFormField(
                            controller: userNameController,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              labelText: 'User Name',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.account_circle),
                              prefixIconColor: Color.fromARGB(255, 5, 92, 157),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              labelStyle: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 15.0),

                  //2nd Column with three rows i.e last name, phone and password
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: TextFormField(
                            controller: lastNameController,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              labelText: 'Last Name',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.person),
                              prefixIconColor: Color.fromARGB(255, 5, 92, 157),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              labelStyle: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: TextFormField(
                            controller: phoneNumberController,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              labelText: 'Phone Number',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.phone),
                              prefixIconColor: Color.fromARGB(255, 5, 92, 157),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              labelStyle: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: TextFormField(
                            controller: passwordController,
                            keyboardType: TextInputType.text,
                            obscureText: true, //hides text for password
                            decoration: const InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.lock),
                              prefixIconColor: Color.fromARGB(255, 5, 92, 157),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              labelStyle: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Registration handling
                checkIfNetworkIsAvailable();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 5, 92, 157),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: const Text(
                'SIGN UP',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account?',
                  style: TextStyle(fontSize: 14),
                ),
                GestureDetector(
                  onTap: () {
                    // Go to login page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UserLogin()),
                    );
                  },
                  child: const Text(
                    ' Log in',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 5, 92, 157),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
