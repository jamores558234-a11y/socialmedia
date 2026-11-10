import 'package:flutter/material.dart';
import '../socialmedia.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late String errorMessage;
  late bool isError;

  @override
  void initState() {
    errorMessage = 'This is error message';
    isError = false;
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void checklogin(String username, String password) {
    setState(() {
      if (username == "") {
        errorMessage = "Please input your username";
        isError = true;
      } else if (password == "") {
        errorMessage = "Please input your password";
        isError = true;
      } else {
        errorMessage = "";
        isError = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/yzz.png',
                    height: 150,
                    width: 150,
                  ),
                  const SizedBox(width: 12),
                  Text("YJiZZ", style: txtStyle),
                ],
              ),
              const SizedBox(height: 15),
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Username',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Password',
                  prefixIcon: Icon(Icons.password),
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  checklogin(usernameController.text, passwordController.text);
                  if (!isError) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SocialMedia(),
                      ),
                    );
                  }
                },
                child: Text("Login", style: txtStyle2),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}

var txtStyle = const TextStyle(
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
  fontSize: 14,
);

var registertxtStyle = const TextStyle(
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
  fontSize: 14,
);

var errortxtStyle = const TextStyle(
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
  fontSize: 14,
  color: Colors.red,
);

var txtStyle2 = const TextStyle(
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
  fontSize: 14,
  color: Colors.white,
);