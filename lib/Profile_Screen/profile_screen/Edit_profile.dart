
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_coder/Profile_Screen/profile_screen.dart';

class EditProfile extends StatefulWidget {
  static const String routeName = 'edit profile';

  const EditProfile({super.key});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _ageController.dispose();
    super.dispose();
  }
  Future<void> _loadUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc =
      await FirebaseFirestore.instance.collection('users').doc(user.uid).get();

      if (userDoc.exists) {
        Map<String, dynamic>? data = userDoc.data() as Map<String, dynamic>?;

        setState(() {
          _fullNameController.text = data?['FullName'] ?? user.displayName ?? '';
          _emailController.text = user.email ?? '';
          _ageController.text = data?['Age']?.toString() ?? '';
        });
      } else {
        debugPrint("User document does not exist.");
      }
    }
  }

/*
  Future<void> _loadUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc =
      await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
      setState(() {
        _fullNameController.text = userDoc['FullName'] ?? user.displayName ?? '';
        _emailController.text = user.email ?? '';
        _ageController.text = userDoc['Age']?.toString() ?? '';
      });
    }
  }

 */

  Future<void> _updateProfile() async {
    if (_formKey.currentState!.validate()) {
      try {
        User? user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          await user.updateDisplayName(_fullNameController.text);
          await user.updateEmail(_emailController.text);
          if (_passwordController.text.isNotEmpty) {
            await user.updatePassword(_passwordController.text);
          }

          await FirebaseFirestore.instance.collection('users').doc(user.uid).update({
            'FullName': _fullNameController.text,
            'Email': _emailController.text,
            'Age': int.tryParse(_ageController.text) ?? 0,
            'updatedAt': FieldValue.serverTimestamp(),
          });

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Profile updated successfully!')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2AAA8A),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 40,
            left: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 25,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 3.1),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40.0),
                      topLeft: Radius.circular(40.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 80),
                          Center(
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  const SizedBox(height: 20),
                                  TextFormField(
                                    controller: _fullNameController,
                                    decoration: const InputDecoration(labelText: 'Name'),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Enter your name';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 10),
                                  TextFormField(
                                    controller: _emailController,
                                    decoration: const InputDecoration(labelText: 'Email'),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Enter your email';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 10),
                                  TextFormField(
                                    controller: _ageController,
                                    decoration: const InputDecoration(labelText: 'Age'),
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Enter your age';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 10),
                                  TextFormField(
                                    controller: _passwordController,
                                    decoration: const InputDecoration(labelText: 'New Password'),
                                    obscureText: true,
                                    validator: (value) {
                                      if (value != null && value.isNotEmpty && value.length < 10) {
                                        return 'Password must be at least 10 characters long';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 30),
                                  ElevatedButton(
                                    onPressed: _updateProfile,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF2AAA8A), // Button background color
                                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),

                                    child: const Text(
                                      'Save Changes',
                                      style: TextStyle(
                                        color: Colors.white, // Text color
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 3 - 70,
            left: MediaQuery.of(context).size.width / 2 - 65,
            child: const CircleAvatar(
              radius: 65,
              backgroundImage: AssetImage('assets/images/Vector (2).png'),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 3 + 20,
            left: MediaQuery.of(context).size.width / 2 + 20,
            child: const CircleAvatar(
              radius: 15,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 10,
                backgroundImage: AssetImage('assets/images/Ellipse 7.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}






