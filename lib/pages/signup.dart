import 'package:flutter/material.dart';
import 'package:project/main.dart';
import 'package:project/main.dart';
import '../database/auth.dart'; // Import the authentication helper

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String _email = '';
  String _passwd = '';
  String _confirmPasswd = '';

  Future _showAlert(BuildContext context, String message) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              message,
              style: const TextStyle(fontSize: 16),
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(18.0)),
            ),
            actions: [
              ElevatedButton(
                child: const Text('Close'),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 155.0,
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                const SizedBox(height: 45.0),
                TextFormField(
                  key: UniqueKey(),
                  obscureText: false,
                  initialValue: _email,
                  autofocus: true,
                  onChanged: (value) => _email = value,
                  decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0))),
                ),
                const SizedBox(height: 25.0),
                TextFormField(
                  key: UniqueKey(),
                  obscureText: true,
                  initialValue: _passwd,
                  onChanged: (value) => _passwd = value,
                  decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0))),
                ),
                const SizedBox(height: 25.0),
                TextFormField(
                  key: UniqueKey(),
                  obscureText: true,
                  initialValue: _confirmPasswd,
                  onChanged: (value) => _confirmPasswd = value,
                  decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "Confirm Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0))),
                ),
                const SizedBox(
                  height: 35.0,
                ),
                Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.deepPurpleAccent,
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    padding:
                        const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    onPressed: () async {
                      if (_passwd == _confirmPasswd) {
                        // Register new user
                        await UserAuthenticator()
                            .registerWithEmailAndPassword(_email, _passwd)
                            .then((res) {
                          if (res == true) {
                            _showAlert(context, "Registration successful!");
                            setState(() {
                              _email = '';
                              _passwd = '';
                              _confirmPasswd = '';
                            });
                          } else {
                            _showAlert(context, "Registration failed!");
                          }
                        });
                      } else {
                        _showAlert(context, "Passwords do not match!");
                      }
                    },
                    child: const Text(
                      "Sign Up",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  },
                  child: const Text(
                    " have an account Login",
                    style: TextStyle(color: Colors.deepPurpleAccent),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
