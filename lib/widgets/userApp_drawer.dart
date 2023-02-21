import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/products_overview_screen.dart';
import '../services/auth_services.dart';

class UserAppDrawer extends StatelessWidget {
  const UserAppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Tool Bar'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Shop'),
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: ((context) => ProductsOverviewScreen()),
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Log Out'),
            onTap: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text('Are you sure ?'),
                  content: Text(
                    'Do you want to log out ?',
                  ),
                  actions: <Widget>[
                    FloatingActionButton(
                      backgroundColor: Colors.red,
                      child: Text('No'),
                      onPressed: () {
                        Navigator.of(ctx).pop(false);
                      },
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.green,
                      child: Text('Yes'),
                      onPressed: () async {
                        Navigator.of(ctx).pop(true);
                        Provider.of<AuthService>(context, listen: false)
                            .logout();
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
