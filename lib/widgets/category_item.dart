import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CategoryItem extends StatefulWidget {
  final String title;
  final IconData icon;
  final bool isActive;

  const CategoryItem({super.key, required this.title, required this.icon, required this.isActive});
  @override
  _CategoryItemState createState()  => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12) ,
      child: Column(
        children: [
          Icon(widget.icon,color: widget.isActive ? Colors.black87 : Colors.grey ,),// meme pour l'icon
          //Text(widget.title,style: TextStyle(widget.isActive ? Colors.black87 : Colors.grey),),//besh naccediw ll title eli houwa list of string nzidou widget miniscule
          SizedBox(height: 16,),
          Container(
            width: 64,
            height: 3,
            color: widget.isActive ? Colors.black87 : Colors.transparent,
          )
        ],
    )
    );
  }
}