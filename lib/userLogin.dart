// ignore_for_file: file_names, use_build_context_synchronously, avoid_print
import 'package:flutter/material.dart';
import 'package:masmech/authentication/auth_service.dart';
import 'package:masmech/methods/common_methods.dart';
import 'package:masmech/signUp.dart';
import 'package:masmech/userHomePage.dart';
import 'package:masmech/widgets/base_page.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({super.key});

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  CommonMethods cMethods = CommonMethods();

  void checkIfNetworkIsAvailable() async {
    await cMethods.checkConnectivity(context);

    // Dismisses keyboard when validation starts
    FocusScope.of(context).unfocus();

    _login();
  }

  Future<void> _login() async {
    String username = userNameController.text.trim();
    String password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      // Handle empty fields
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Field(s) cannot be empty!')));
      return;
    }

    try {
      print('Attempting login with username: $username'); // Debugging line

      // Calling the login function
      await AuthService().loginWithUsername(username, password);

      // Getting the user's first name
      String? firstName = await AuthService().getFirstName(username);

      // Navigate to UserHomePage upon successful login
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UserHomePage(firstName: firstName ?? 'Guest'),
        ),
      );
    } catch (error) {
      // Debugging line which shows the type of error e.g. Username not found/Incorrect username or password
      print('$error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $error")),
      );
    }
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
              padding: const EdgeInsets.all(0.0),
              child: Center(
                child: Image.asset(
                  'images/MASMECH_LOGO_2.png',
                  width: 200,
                  semanticLabel: 'MasMech Logo',
                ),
              ),
            ),
            const Text(
              'Login',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 5, 92, 157),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 70.0, right: 70.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      controller: userNameController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: 'User Name',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.account_circle),
                        prefixIconColor: Color.fromARGB(255, 5, 92, 157),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 8.0),
                        labelStyle: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                            vertical: 8.0, horizontal: 8.0),
                        labelStyle: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                // Sign In handling
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
                'LOGIN',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account yet?",
                  style: TextStyle(fontSize: 14),
                ),
                GestureDetector(
                  onTap: () {
                    // Go to Sign Up page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUp()),
                    );
                  },
                  child: const Text(
                    ' Sign Up',
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
