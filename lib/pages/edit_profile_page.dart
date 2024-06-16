// import 'dart:html';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// class EditProfilePage extends StatefulWidget {
//   @override
//   _EditProfilePageState createState() => _EditProfilePageState();
// }
//
// class _EditProfilePageState extends State<EditProfilePage> {
//   bool _notificationEnabled = true;
//
//   final currentUser = FirebaseAuth.instance.currentUser;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit Profile'),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: StreamBuilder<DocumentSnapshot>(
//           stream: FirebaseFirestore.instance
//               .collection('users')
//               .doc(currentUser!.email)
//               .snapshots(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               final userData = snapshot.data!.data() as Map<String, dynamic>;
//               return Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   children: [
//                     CircleAvatar(
//                       radius: 50,
//                       backgroundImage:
//                           AssetImage('lib/images/cute-sloth-profile 2.jpg'),
//                     ),
//                     SizedBox(height: 20),
//                     Text(
//                       userData['username'],
//                       style:
//                           TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(height: 10),
//                     SwitchListTile(
//                       title: Text('Notifications'),
//                       value: _notificationEnabled,
//                       onChanged: (value) {
//                         setState(() {
//                           _notificationEnabled = value;
//                         });
//                       },
//                     ),
//                     SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: () {
//                         // Implement update profile functionality
//                         Navigator.pop(context);
//                       },
//                       child: Text('Save Changes',
//                           style: TextStyle(color: Colors.white)),
//                       style: ButtonStyle(
//                         backgroundColor: MaterialStateProperty.all(Colors.blue),
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             } else if (snapshot.hasError) {
//               return Center(
//                 child: Text('Error: ${snapshot.error}'),
//               );
//             }
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }),
//     );
//   }
// }

// import 'dart:io';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// class EditProfilePage extends StatefulWidget {
//   @override
//   _EditProfilePageState createState() => _EditProfilePageState();
// }
//
// class _EditProfilePageState extends State<EditProfilePage> {
//   // bool _notificationEnabled = true;
//   final currentUser = FirebaseAuth.instance.currentUser;
//
//   final TextEditingController _nameController = TextEditingController();
//   String? _profileImagePath;
//
//   @override
//   void dispose() {
//     _nameController.dispose();
//     super.dispose();
//   }
//
//   Future<void> _pickImage(ImageSource source) async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: source);
//     if (pickedFile != null) {
//       setState(() {
//         _profileImagePath = pickedFile.path;
//       });
//     }
//   }
//
//   Future<void> _saveChanges() async {
//     if (currentUser != null) {
//       final userDoc = FirebaseFirestore.instance
//           .collection('users')
//           .doc(currentUser!.email);
//
//       await userDoc.update({
//         'username': _nameController.text,
//         // Assuming you have a way to upload the image and get the URL
//         'profileImageUrl': _profileImagePath,
//         // 'notificationsEnabled': _notificationEnabled,
//       });
//
//       Navigator.pop(context);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit Profile'),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: StreamBuilder<DocumentSnapshot>(
//           stream: FirebaseFirestore.instance
//               .collection('users')
//               .doc(currentUser!.email)
//               .snapshots(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               final userData = snapshot.data!.data() as Map<String, dynamic>;
//
//               // Initialize fields with data from Firestore
//               if (userData.containsKey('username')) {
//                 _nameController.text = userData['username'];
//               }
//               // if (userData.containsKey('notificationsEnabled')) {
//               //   _notificationEnabled = userData['notificationsEnabled'] ?? true;
//               // }
//
//               return Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   children: [
//                     GestureDetector(
//                       onTap: () async {
//                         showModalBottomSheet(
//                           context: context,
//                           builder: (context) => Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               ListTile(
//                                 leading: Icon(Icons.photo_library),
//                                 title: Text('Pick from gallery'),
//                                 onTap: () {
//                                   Navigator.pop(context);
//                                   _pickImage(ImageSource.gallery);
//                                 },
//                               ),
//                               ListTile(
//                                 leading: Icon(Icons.camera_alt),
//                                 title: Text('Take a photo'),
//                                 onTap: () {
//                                   Navigator.pop(context);
//                                   _pickImage(ImageSource.camera);
//                                 },
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                       child: CircleAvatar(
//                         radius: 50,
//                         backgroundImage: _profileImagePath != null
//                             ? FileImage(File(_profileImagePath!))
//                             : AssetImage('lib/images/cute-sloth-profile 2.jpg')
//                                 as ImageProvider,
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       'Click profile pic to change the photo',
//                       style: TextStyle(color: Colors.white, fontSize: 15),
//                     ),
//                     SizedBox(height: 20),
//                     TextField(
//                       controller: _nameController,
//                       decoration: InputDecoration(
//                         labelText: 'Username',
//                         labelStyle: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     // SwitchListTile(
//                     //   title: Text('Notifications'),
//                     //   value: _notificationEnabled,
//                     //   onChanged: (value) {
//                     //     setState(() {
//                     //       _notificationEnabled = value;
//                     //     });
//                     //   },
//                     // ),
//                     SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: _saveChanges,
//                       child: Text('Save Changes',
//                           style: TextStyle(color: Colors.white)),
//                       style: ButtonStyle(
//                         backgroundColor: MaterialStateProperty.all(Colors.blue),
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             } else if (snapshot.hasError) {
//               return Center(
//                 child: Text('Error: ${snapshot.error}'),
//               );
//             }
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }),
//     );
//   }
// }

// import 'dart:io';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// class EditProfilePage extends StatefulWidget {
//   @override
//   _EditProfilePageState createState() => _EditProfilePageState();
// }
//
// class _EditProfilePageState extends State<EditProfilePage> {
//   final currentUser = FirebaseAuth.instance.currentUser;
//
//   final TextEditingController _nameController = TextEditingController();
//   String? _profileImagePath;
//
//   @override
//   void dispose() {
//     _nameController.dispose();
//     super.dispose();
//   }
//
//   Future<void> _pickImage(ImageSource source) async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: source);
//     if (pickedFile != null) {
//       setState(() {
//         _profileImagePath = pickedFile.path;
//       });
//     }
//   }
//
//   Future<void> _saveChanges() async {
//     if (currentUser != null) {
//       final userDoc = FirebaseFirestore.instance
//           .collection('users')
//           .doc(currentUser!.email);
//
//       await userDoc.update({
//         'username': _nameController.text,
//         // Assuming you have a way to upload the image and get the URL
//         'profileImageUrl': _profileImagePath,
//       });
//
//       Navigator.pop(context);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit Profile'),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: StreamBuilder<DocumentSnapshot>(
//           stream: FirebaseFirestore.instance.collection('users').doc(currentUser!.email).snapshots(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               final userData = snapshot.data!.data() as Map<String, dynamic>;
//
//               // Initialize fields with data from Firestore
//               if (userData.containsKey('username')) {
//                 _nameController.text = userData['username'];
//               }
//
//               return Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   children: [
//                     GestureDetector(
//                       onTap: () async {
//                         showModalBottomSheet(
//                           context: context,
//                           builder: (context) => Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               ListTile(
//                                 leading: Icon(Icons.photo_library),
//                                 title: Text('Pick from gallery'),
//                                 onTap: () {
//                                   Navigator.pop(context);
//                                   _pickImage(ImageSource.gallery);
//                                 },
//                               ),
//                               ListTile(
//                                 leading: Icon(Icons.camera_alt),
//                                 title: Text('Take a photo'),
//                                 onTap: () {
//                                   Navigator.pop(context);
//                                   _pickImage(ImageSource.camera);
//                                 },
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                       child: CircleAvatar(
//                         radius: 50,
//                         backgroundImage: _profileImagePath != null
//                             ? FileImage(File(_profileImagePath!))
//                             : AssetImage('lib/images/cute-sloth-profile 2.jpg')
//                                 as ImageProvider,
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       'Click profile pic to change the photo',
//                       style: TextStyle(color: Colors.white, fontSize: 15),
//                     ),
//                     SizedBox(height: 20),
//                     TextField(
//                       controller: _nameController,
//                       decoration: InputDecoration(
//                         labelText: 'Username',
//                         labelStyle: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: _saveChanges,
//                       child: Text('Save Changes',
//                           style: TextStyle(color: Colors.white)),
//                       style: ButtonStyle(
//                         backgroundColor: MaterialStateProperty.all(Colors.blue),
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             } else if (snapshot.hasError) {
//               return Center(
//                 child: Text('Error: ${snapshot.error}'),
//               );
//             }
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }),
//     );
//   }
// }


import 'dart:io';
import 'package:path/path.dart' as Path;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final currentUser = FirebaseAuth.instance.currentUser;
  final TextEditingController _nameController = TextEditingController();
  String? _profileImagePath;
  final storage = FirebaseStorage.instance;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _profileImagePath = pickedFile.path;
      });
    }
  }

  Future<void> _saveChanges() async {
    if (currentUser != null) {
      final userDoc = FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser!.email);

      String? profileImageUrl;
      if (_profileImagePath != null) {
        final ref = storage.ref().child('profile_pics/${Path.basename(_profileImagePath!)}');
        final uploadTask = ref.putFile(File(_profileImagePath!));

        await uploadTask.whenComplete(() => null);
        profileImageUrl = await ref.getDownloadURL();
      }

      await userDoc.update({
        'username': _nameController.text,
        'profileImageUrl': profileImageUrl,
      });

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance.collection('users').doc(currentUser!.email).snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final userData = snapshot.data!.data() as Map<String, dynamic>;

              // Initialize fields with data from Firestore
              if (userData.containsKey('username')) {
                _nameController.text = userData['username'];
              }

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                leading: Icon(Icons.photo_library),
                                title: Text('Pick from gallery'),
                                onTap: () {
                                  Navigator.pop(context);
                                  _pickImage(ImageSource.gallery);
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.camera_alt),
                                title: Text('Take a photo'),
                                onTap: () {
                                  Navigator.pop(context);
                                  _pickImage(ImageSource.camera);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: _profileImagePath != null
                            ? FileImage(File(_profileImagePath!))
                            : AssetImage('lib/images/cute-sloth-profile 2.jpg')
                                as ImageProvider,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Click profile pic to change the photo',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _saveChanges,
                      child: Text('Save Changes',
                          style: TextStyle(color: Colors.white)),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                      ),
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}