// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:first_app/pages/profile.dart';
import 'package:first_app/widgets/category_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

bool _isTextFieldVisible = true;
TextEditingController _serachController = TextEditingController();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      left: 200,
                      top: 10,
                      bottom: 10,
                    ),
                    child: Icon(
                      CupertinoIcons.profile_circled,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
