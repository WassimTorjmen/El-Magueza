import 'package:first_app/pages/products_overview_screen.dart';
import 'package:first_app/pages/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/auth_services.dart';
import 'user_product_screen.dart';
//flutter inserts top to bottom left to right
// point d origine 0.0 =  top letft
// text heya widget te5ou string w mdifier (style)
// scafold yest7a9 body fe 3oudh child mot Clee
//el statefull lezmou deux block we7ed mt3 constructeur w le5er mt3 les composantes
// t7ot ta7tha kol chy kif fab w kol chy interface
//safearea widget  tfodhlk fazet el zizing tb3d 3la kol chy 3la n9ob 3la eli T7eb 3la barre de nav kol chy
// container ye5ou espace eli gad child mt3ou
// maxfinite te5ou espace kol disponible
//column te5ou children  eli houma widgets (list of widgets) n espaci binethom b ,
//e style te5ou widget eli heya textstlye
// bech nest3ml margin w padding lewmni container 3mlna encapsulation
// margin and pading  te5ou widges mech kif lo5rin esmha Edgeinsetes
//mafemch child fe text filed
//text buttom text yetnzel
// row t inseri left to right w te5ou chldren
// bechnnavigi lezm widget te5dem b notion pile et file
// navigation filo nest3mlou widgets navigator.haja
//push replacment t3ml layer jdid fe pile w mt5alikech trj3 l teli ywali heka tete
//navigator.push empiler  te5ou context(positin actuelle) w Route eli hya direction
//navigator.pop bech ydepili
// fe 3oudh textbottom fama icnbottom te5ou onpressed w icon
//bech nst3mlou materil icnos n3mlou Icon eli heya widget w n7ot feha icons eli heya bib

TextEditingController _emailController = TextEditingController();
TextEditingController _passcontroller = TextEditingController();
bool _isPassVisible = true;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

AuthService _authServices = new AuthService();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              TextField(
                controller: _emailController,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                    // icon: Icon(Icons.mail),
                    prefixIcon: Icon(Icons.mail),
                    suffixIcon: _emailController.text.isEmpty
                        ? Text('')
                        : GestureDetector(
                            onTap: () {
                              _emailController.clear();
                            },
                            child: Icon(Icons.close)),
                    hintText: 'example@mail.com',
                    labelText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.red, width: 1))),
              ),
              SizedBox(
                height: 16,
              ),
              TextField(
                obscureText: _isPassVisible,
                controller: _passcontroller,
                onChanged: (value) {
                  print(value);
                },
                //
                decoration: InputDecoration(
                    // icon: Icon(Icons.mail),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: GestureDetector(
                        onTap: () {
                          _isPassVisible = !_isPassVisible;
                          setState(() {});
                        },
                        child: Icon(_isPassVisible
                            ? Icons.visibility
                            : Icons.visibility_off)),
                    hintText: 'type your password',
                    labelText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.red, width: 1))),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 90),
                child: Row(
                  children: [
                    Expanded(
                        child: CupertinoButton(
                      child: Text('login'),
                      color: Colors.purple,
                      onPressed: () async {
                        if (_emailController.text.trim().isEmpty ||
                            _passcontroller.text.trim().isEmpty) {
                          const snackBar = SnackBar(
                            content: Text('Email/Password can\'t be empty'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else {
                          dynamic credentials = await _authServices.loginUser(
                              _emailController.text.trim(),
                              _passcontroller.text.trim());

                          print('credentials are: ' + credentials.toString());
                          if (credentials == null) {
                            const snackBar = SnackBar(
                              content: Text('Email/Password are not valid'),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            if (_emailController.text.trim() ==
                                    'admin@gmail.com' ||
                                _passcontroller.text.trim() == 'admin123') {
                              Navigator.pushReplacement(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) =>
                                          UserProductScreen()));
                            } else {
                              Navigator.pushReplacement(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) =>
                                          ProductsOverviewScreen()));
                            }
                          }
                        }
                      },
                    ))
                  ],
                ),
              ),
              SizedBox(
                width: 12,
              ),
              CupertinoButton(
                  child: Text('Create a new account',
                      style: TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: ((context) =>
                                SignUpPage()))); //bulider ye5ou arrow function w n3tih esm widget
                  },
                  color: Colors.white)
            ],
          ),
        ));
  }
}
