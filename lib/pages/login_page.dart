// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// class LoginPage extends StatefulWidget {
//   // final Function()? onTap;
//   const LoginPage({super.key});
//
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   //text editing controllers
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//
//   //sign user in method
//   void signIn() async {
//     //show loading indicator
//     showDialog(
//       context: context,
//       builder: (context) {
//         return const Center(
//           child: CircularProgressIndicator(),
//         );
//       },
//     );
//
//     //signing in
//     try {
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: emailController.text,
//         password: passwordController.text,
//       );
//       //pop loading indicator
//       Navigator.pop(context);
//
//     } on FirebaseAuthException catch (e) {
//       //pop loading indicator
//       Navigator.pop(context);
//
//       //show error message for email
//       if (e.code == 'user-not-found') {
//         //display error message
//         wrongEmailMessage();
//       }
//
//       //show error message for password
//       else if (e.code == 'wrong-password') {
//         //display error message
//         wrongPasswordMessage();
//       }
//     }
//   }
//
//   //wrong email message
//   void wrongEmailMessage() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return const AlertDialog(
//           title: const Text('Incorrect Email'),
//         );
//       },
//     );
//   }
//
//   //wrong password message
//   void wrongPasswordMessage() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return const AlertDialog(
//           title: const Text('Incorrect Password'),
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.brown[200],
//       appBar: AppBar(
//         title: Text('Login'),
//         centerTitle: true,
//         backgroundColor: Colors.brown[400],
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('lib/images/6843e877f5594dfe0f1c2fd294451983.jpg'),
//             fit: BoxFit.cover,
//           ),
//         ),
//       child: Padding(
//         padding: EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             TextFormField(
//               controller: emailController,
//               decoration: InputDecoration(
//                 labelText: 'Email',
//                 labelStyle: TextStyle(color: Colors.white),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.brown, width: 2.0),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.brown, width: 2.0),
//                 ),
//                 fillColor: Colors.brown[400],
//                 filled: true,
//               ),
//             ),
//             SizedBox(height: 20.0),
//             TextFormField(
//               controller: passwordController,
//               obscureText: true,
//               decoration: InputDecoration(
//                 labelText: 'Password',
//                 labelStyle: TextStyle(color: Colors.white),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.brown, width: 2.0),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.brown, width: 2.0),
//                 ),
//                 fillColor: Colors.brown[400],
//                 filled: true,
//               ),
//             ),
//             SizedBox(height: 20.0),
//             ElevatedButton(
//               onPressed: () {
//                 // Sign the user in
//                 signIn();
//                 // Navigator.pushReplacementNamed(context, '/home');
//               },
//               child: Text('Login'),style: ButtonStyle(
//                 backgroundColor: MaterialStateProperty.all<Color>(Colors.brown),
//               foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
//               ),
//             ),
//           SizedBox(height: 10.0),
//           TextButton(
//             onPressed: () {
//               // Navigate to the register page
//               Navigator.pushNamed(context, '/register');
//             },
//             child: const Text('Don\'t have an account? Register', style: TextStyle(color: Colors.white),
//           ),
//         ),
//           ],
//         ),
//       ),
//     ),
//     );
//   }
// }


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  // Text editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Sign in user method
  void signIn(BuildContext context) async {
    try {
      // Show loading indicator
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()),
      );

      // Sign in with Firebase
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Navigate to home page
      Navigator.pushReplacementNamed(context, '/home');
    } on FirebaseAuthException catch (e) {
      // Show error message
      Navigator.pop(context); // Remove loading indicator
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message ?? 'An error occurred'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[200],
      appBar: AppBar(
        title: Text('Login'),
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
                obscureText: true,
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
              ElevatedButton(
                onPressed: () => signIn(context), // Sign the user in
                child: Text('Login'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.brown),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                ),
              ),
              SizedBox(height: 10.0),
              TextButton(
                onPressed: () {
                  // Navigate to the register page
                  Navigator.pushNamed(context, '/register');
                },
                child: const Text(
                  'Don\'t have an account? Register',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
