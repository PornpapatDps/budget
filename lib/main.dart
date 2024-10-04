import 'package:flutter/material.dart';
import 'pages/product.dart';
import 'database/model.dart';
import 'pages/login.dart';
import 'pages/signup.dart'; // Import SignUp Page
import 'package:firebase_core/firebase_core.dart';
import 'database/database_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAKoPAFxGKnvFA7vmr2bpsXlblIZ-Z5BT8",
      appId: "1:203604544176:android:fe56c0298bc5d061938975",
      messagingSenderId: "",
      projectId: "ku-6521650939",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const LoginScreen(), // Set LoginScreen as the home
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email = '';
  String _passwd = '';

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
                  Navigator.pop(context); // showDialog() returns true
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
                    'Login',
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
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
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
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                ),
                const SizedBox(height: 35.0),
                Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.deepPurpleAccent,
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    padding:
                        const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    onPressed: () {
                      // Handle login logic here
                    },
                    child: const Text(
                      "Login",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),
                
                // *** Sign Up Button ***
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpScreen()),
                    );
                  },
                  child: const Text(
                    "Don't have an account? Sign Up",
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
