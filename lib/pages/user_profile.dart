import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/models/end_user.dart';
import 'package:first_app/models/user.dart';
import 'package:first_app/services/auth_services.dart';
import 'package:first_app/services/user_preferences.dart';
import 'package:first_app/widgets/ProfileWidget.dart';
import 'package:first_app/widgets/app_bar.dart';
import 'package:flutter/material.dart';

AuthService _authServices = new AuthService();
FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

/*class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = new EndUser();
    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          //ProfileWidget(
          //avatarUrl: user.avatarUrl,
          //  onClicked: () {},
          //  ),
          const SizedBox(height: 24),
          //buildName(user),
        ],
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.username,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );
}*/
