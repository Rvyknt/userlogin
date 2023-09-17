import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyForm(),
    ),
  );
}

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _sponsorController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();

  bool sponsorSelected = true;
  bool emailSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Form'),
        backgroundColor: Colors.red.shade200,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 8
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      child: Row(
                        children: [
                          Checkbox(
                            value: sponsorSelected,
                            onChanged: (value) {
                              setState(() {
                                sponsorSelected = value ?? false;
                                emailSelected = !sponsorSelected;
                              });
                            },
                          ),
                          const Text('Sponsor ID'),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Row(
                        children: [
                          Checkbox(
                            value: emailSelected,
                            onChanged: (value) {
                              setState(() {
                                emailSelected = value ?? false;
                                sponsorSelected = !emailSelected;
                              });
                            },
                          ),
                          const Text('Email ID'),
                        ],
                      ),
                    )
                  ],
                ),
              ),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
                child: TextFormField(
                  controller: _sponsorController,
                  decoration: InputDecoration(
                    labelText: 'Sponsor',
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      // borderRadius: BorderRadius.circular(radius)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    isDense: true,
                  ),
                  enabled: !emailSelected,
                  onTap: () {},
                  validator: (value) {
                    if (sponsorSelected && (value?.isEmpty ?? true)) {
                      return 'Please enter a sponsor';
                    }

                    return null; // Valid input
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                child: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      // borderRadius: BorderRadius.circular(radius)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    isDense: true,
                  ),
                  enabled: !sponsorSelected,
                  validator: (value) {
                    if (emailSelected && ((value?.isEmpty ?? true) || !(value?.contains('@') ?? false))) {
                      return 'Please enter a valid email address';
                    }
                    return null; // Valid input
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
                child: TextFormField(
                  controller: _mobileController,
                  decoration: InputDecoration(
                    labelText: 'Mobile Number',
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      // borderRadius: BorderRadius.circular(radius)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    isDense: true,
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your mobile number';
                    }
                    return null; // Valid input
                  },
                ),
              ),


              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    String sponsor = _sponsorController.text;
                    String email = _emailController.text;
                    String mobile = _mobileController.text;

                    if (sponsorSelected && mobile.isNotEmpty) {
                      // Navigate to homepage
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => HomePage()),
                      );
                    } else if (emailSelected && mobile.isNotEmpty) {
                      // Navigate to category page
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => CategoryPage()),
                      );
                    }
                  }
                },
                child: const Text('Sign In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: const Center(
        child: Text('Welcome to the Home Page'),
      ),
    );
  }
}

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category Page'),
      ),
      body: const Center(
        child: Text('Welcome to the Category Page'),
      ),
    );
  }
}
