import 'package:first_app/providers/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product_provider.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({Key? key}) : super(key: key);
  static const routeName = '/edit-product';
  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  bool _hasImage = true;
  var _isInit = true;
  var _initValues = {
    'title': '',
    'description': '',
    'price': '',
    'imageUrl': '',
  };

  var _editProduct = Product(
    id: null,
    title: '',
    description: '',
    price: 0,
    imageUrl: '',
  );
  var _isLoading = false;

  @override
  //ecouter le changement de l'url
  void initState() {
    _imageUrlFocusNode.addListener(() => _updateImageUrl);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final productId = ModalRoute.of(context)!.settings.arguments;
      if (productId != null) {
        _editProduct = Provider.of<Products>(context, listen: false)
            .findById(productId as String);
        _initValues = {
          'title': _editProduct.title,
          'description': _editProduct.description,
          'price': _editProduct.price.toString(),
          'imageUrl': ''
        };
        _imageUrlController.text = _editProduct.imageUrl;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  //vider la memoire
  void dispose() {
    _imageUrlFocusNode.removeListener(_updateImageUrl);
    _priceFocusNode.dispose();
    _imageUrlFocusNode.dispose();
    _imageUrlController.dispose();
    _descriptionFocusNode.dispose();
    super.dispose();
  }

  void _updateImageUrl() {
    if (!_imageUrlFocusNode.hasFocus) {
      setState(() {});
    }
  }

  Future<void> _saveForm() async {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState?.save();
    setState(() {
      _isLoading = true;
    });
    if (_editProduct.id != null) {
      try {
        await Provider.of<Products>(context, listen: false)
            .updateProduct(_editProduct.id!, _editProduct);
      } catch (error) {
        await showDialog<Null>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text(
              'An error occured!',
            ),
            content: Text('Something went wrong'),
            actions: <Widget>[
              FloatingActionButton(
                  child: Text('Okay'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ],
          ),
        );
      }
    } else {
      try {
        await Provider.of<Products>(context, listen: false)
            .addProduct(_editProduct);
      } catch (error) {
        await showDialog<Null>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text(
              'An error occured!',
            ),
            content: Text('Something went wrong'),
            actions: <Widget>[
              FloatingActionButton(
                  child: Text('Okay'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ],
          ),
        );
      }
    }
    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    _imageUrlController.addListener(() {
      setState(() {
        _hasImage = _imageUrlController.text.isEmpty;
      });
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
        actions: <Widget>[
          IconButton(
            onPressed: _saveForm,
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _form,
                child: ListView(
                  children: <Widget>[
                    TextFormField(
                      initialValue: _initValues['title'],
                      decoration: const InputDecoration(
                          helperText: 'insert the article title',
                          prefixIcon: Icon(
                            Icons.title_outlined,
                            color: Colors.purple,
                          ),
                          labelText: 'Title',
                          border: OutlineInputBorder()),
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter a valid article title';
                        }
                        return null;
                      },
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_priceFocusNode);
                      },
                      onSaved: (value) {
                        _editProduct = _editProduct.copyWith(title: value);
                      },
                    ),
                    Divider(color: Colors.black),
                    TextFormField(
                      initialValue: _initValues['price'],
                      decoration: const InputDecoration(
                        helperText: 'insert the article price',
                        prefixIcon: Icon(
                          Icons.attach_money_sharp,
                          color: Colors.purple,
                        ),
                        labelText: 'Price',
                        border: OutlineInputBorder(),
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      focusNode: _priceFocusNode,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter an article price';
                        }
                        if (double.tryParse(value) == null ||
                            double.parse(value) <= 0) {
                          return 'please enter a valid price';
                        }
                        return null;
                      },
                      onFieldSubmitted: (_) {
                        FocusScope.of(context)
                            .requestFocus(_descriptionFocusNode);
                      },
                      onSaved: (value) {
                        _editProduct =
                            _editProduct.copyWith(price: double.parse(value!));
                      },
                    ),
                    Divider(color: Colors.black),
                    TextFormField(
                      initialValue: _initValues['description'],
                      decoration: const InputDecoration(
                        helperText: 'insert the article description',
                        prefixIcon: Icon(
                          Icons.description,
                          color: Colors.purple,
                        ),
                        labelText: 'Description',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter a description for the article';
                        }
                        return null;
                      },
                      maxLines: 3,
                      keyboardType: TextInputType.multiline,
                      focusNode: _descriptionFocusNode,
                      onSaved: (value) {
                        _editProduct =
                            _editProduct.copyWith(description: value);
                      },
                    ),
                    Divider(color: Colors.black),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 100,
                          margin: EdgeInsets.only(
                            top: 8,
                            right: 10,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                            ),
                          ),
                          child: _hasImage
                              ? Text("Add a image")
                              : FittedBox(
                                  child: Image.network(
                                    _imageUrlController.text,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              helperText: "insert the article image's URL",
                              prefixIcon: Icon(
                                Icons.link,
                                color: Colors.purple,
                              ),
                              labelText: 'image URL',
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.url,
                            textInputAction: TextInputAction.done,
                            controller: _imageUrlController,
                            focusNode: _imageUrlFocusNode,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please insert an image url';
                              }
                              if (!value.startsWith('http') ||
                                  !value.startsWith('https')) {
                                return 'please enter a valid url';
                              }
                              if ((!value.endsWith('.png')) &&
                                  (!value.endsWith('.jpg')) &&
                                  (value.endsWith('jpeg'))) {
                                return 'please choose an image with a valid format';
                              }
                              return null;
                            },
                            onFieldSubmitted: (_) {
                              _saveForm();
                            },
                            onSaved: (value) {
                              _editProduct =
                                  _editProduct.copyWith(imageUrl: value);
                            },
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
