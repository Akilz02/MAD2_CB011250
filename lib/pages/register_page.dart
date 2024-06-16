import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State <RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  //sign user up method
  void signUp() async {
    //show loading indicator
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    //signing up
    try {
      //create user with email and password
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        // after creating user, create a new document in cloud firestore called users
        FirebaseFirestore.instance.collection('users')
            .doc(emailController.text)
            .set({
          'username': emailController.text.split('@')[0],
        });

        // Navigate to home page after successful registration
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        //pop loading indicator
        Navigator.pop(context);

        //show error message for password
      }
      //pop loading indicator
      Navigator.pop(context);

    } on FirebaseAuthException catch (e) {
      //pop loading indicator
      Navigator.pop(context);

      //show error message for email
      if (e.code == 'user-not-found') {
        //display error message
        wrongEmailMessage();
      }

      //show error message for password
      else if (e.code == 'wrong-password') {
        //display error message
        wrongPasswordMessage();
      }
    }
  }

  //wrong email message
  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: const Text('Incorrect Email'),
        );
      },
    );
  }

  //wrong password message
  void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: const Text('Incorrect Password'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[200],
      appBar: AppBar(
        title: Text('Register'),
        centerTitle: true,
        backgroundColor: Colors.brown[400],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/images/6843e877f5594dfe0f1c2fd294451983.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.white),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.brown, width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.brown, width: 2.0),
                ),
                fillColor: Colors.brown[400],
                filled: true,
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.white),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.brown, width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.brown, width: 2.0),
                ),
                fillColor: Colors.brown[400],
                filled: true,
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              obscureText: true,
              controller: confirmPasswordController,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                labelStyle: TextStyle(color: Colors.white),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.brown, width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.brown, width: 2.0),
                ),
                fillColor: Colors.brown[400],
                filled: true,
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Implement registration functionality here
                // For simplicity, let's just navigate to the login page
                // Navigator.pushReplacementNamed(context, '/login');
                signUp();
              },
              child: Text('Register'),style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.brown),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
            ),
            SizedBox(height: 20.0),
            TextButton(
              onPressed: () {
                // Navigate to the login page
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: Text('Already have an account? Login'),
            ),
          ],
        ),
      ),
    ),
    );
  }
}
