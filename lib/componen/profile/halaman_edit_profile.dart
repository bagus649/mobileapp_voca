// ignore_for_file: unused_local_variable, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:mobile/componen/custom_text_field/custom_text_field.dart';

// import '../../componen/custom_text_field/custom_phone_field.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff17C82A),
        elevation: 0,
        title: Center(
          child: Container(
            padding: EdgeInsets.only(right: 60),
            child: Text(
              'Edit Profile',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        color: Color(0xff17C82A),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 16,
              ),
              Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/P.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      alignment: Alignment.center,
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Color(0xff17C82A),
                          width: 2.8,
                        ),
                      ),
                      child: IconButton(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(4),
                        icon: Icon(
                          Icons.camera_alt,
                          color: Color(0xff17C82A),
                          size: 20,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 36,
              ),
              Container(
                padding: EdgeInsets.only(bottom: 132),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      CustomTextField(
                        title: 'Username',
                        hintText: 'VocaGame',
                        svgIcon: 'assets/icons/usersquare.png',
                        controller: _usernameController,
                      ),
                      SizedBox(height: 16),
                      CustomTextField(
                        title: 'Nomor Handphone',
                        hintText: '082123923181',
                        svgIcon: 'assets/icons/call.png',
                        controller: _phoneController,
                      ),
                      SizedBox(height: 16),
                      CustomTextField(
                        title: 'Email',
                        hintText: 'Vocagame@gmail.com',
                        svgIcon: 'assets/icons/email.png',
                        controller: _emailController,
                      ),
                      SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: _handleSaveChanges,
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff17C82A),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text('Save Changes'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleSaveChanges() {
    String username = _usernameController.text;
    String phoneNumber = _phoneController.text;
    String emailAddress = _emailController.text;
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}
