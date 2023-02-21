import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/edit_product_screen.dart';
import '../providers/product_provider.dart';

class UserProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  UserProductItem(this.id, this.title, this.imageUrl);

  Future<void> _refreshProd(BuildContext context) async {
    await Provider.of<Products>(context, listen: false).fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(EditProductScreen.routeName, arguments: id);
              },
              color: Theme.of(context).primaryColor,
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text('Are you sure ?'),
                    content: Text(
                      'Do you want to remove this item from the shop ?',
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
                          try {
                            await Provider.of<Products>(context, listen: false)
                                .deleteProduct(id)
                                .then((_) {
                              scaffold.showSnackBar(SnackBar(
                                content: Text('${title} deleted succesfully'),
                              ));
                            });
                          } catch (error) {
                            scaffold.showSnackBar(const SnackBar(
                              content: Text('Deleting failed !'),
                            ));
                          }
                        },
                      ),
                    ],
                  ),
                );
              },
              color: Theme.of(context).errorColor,
            ),
          ],
        ),
      ),
    );
  }
}
