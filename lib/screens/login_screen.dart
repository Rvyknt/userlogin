import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:userlogin/constants/custom_button.dart';
import 'package:userlogin/screens/category_screen.dart';
import 'package:userlogin/screens/home_screen.dart';
import 'package:userlogin/widgtes/auth_page_avatar.dart';
import 'package:userlogin/widgtes/auth_page_widget.dart';
import 'package:userlogin/widgtes/sponsor_text_field.dart';
import '../constants/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // text editing controllers
  final sponsorIdController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();

  // Selected option
  String selectedOption = "";

  void verifyMobile() {}

  // sign user in method
  void signUserIn() {
    final sponsorId = sponsorIdController.text;
    final email = emailController.text;
    final phoneNumber = phoneNumberController.text;
    const String selectedOption = '';

    print('Selected Option: $selectedOption');
    print('Sponsor ID: $sponsorId');
    print('Email: $email');
    print('Phone Number: $phoneNumber');

    if (selectedOption == 'sponsorId' && sponsorId == '12345' && phoneNumber == '1234567890') {
      // Navigate to the dashboard page
      Navigator.of(context).pushNamed('/home');
    } else if (selectedOption == 'email' && email == 'testemail@email.com' && phoneNumber == '1234567890') {
      // Navigate to the category page
      Navigator.of(context).pushNamed('/category');
    } else {
      // Show an error message or handle invalid input
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Login Error'),
            content: const Text('Invalid input or option selected.'),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const SizedBox(height: 50),

                const AuthPageTitle(),

                // logo
                const AuthPageAvatar(),

                SponsorTextField(
                  controller: sponsorIdController,
                  hintText: 'Sponser ID',
                  obscureText: false,
                  selectedOption: 'sponsorId',
                ),

                // text-fields
                Container(
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 32, bottom: 8),
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: sponsorIdController,
                        hintText: 'Enter Sponsor ID',
                        obscureText: false,
                        selectedOption: 'sponsorId',
                      ),

                      // or continue with
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 0.5,
                                color: Colors.grey[400],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                'Or continue with',
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 0.5,
                                color: Colors.grey[400],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // email text-field
                      CustomTextField(
                        controller: emailController,
                        hintText: 'Registered Email Address',
                        obscureText: false,
                        selectedOption: 'email',
                      ),

                      const SizedBox(height: 10),

                      // phoneNumber text-field
                      CustomTextField(
                        controller: phoneNumberController,
                        hintText: 'Registered Mobile Number',
                        obscureText: true,
                        selectedOption: '',
                      ),
                    ],
                  ),
                ),

                // forgot password ?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot phoneNumber?',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),

                // sign in button
                Container(
                  padding: const EdgeInsets.only(bottom: 32, top: 18),
                  child: Column(
                    children: [
                      CustomButton(
                        title: 'Verify',
                        colorTitle: Colors.white,
                        colorButton: Colors.teal,
                        onTap: () {
                          verifyMobile();
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomButton(
                        title: 'Sign In',
                        colorTitle: Colors.white,
                        colorButton: Colors.black87,
                        onTap: signUserIn,
                      ),
                    ],
                  ),
                ),

                // not a member? register now
                Container(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a member?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Register now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
