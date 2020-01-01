import 'package:flutter/material.dart';

final BottomBar = new Container(
color: Colors.white,
height: 50.0,
alignment: Alignment.center,
  child: new BottomAppBar(
    child: new Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        new IconButton(
          icon: Icon(
            Icons.home,
          ),
          onPressed: () {},
        ),
        new IconButton(
          icon: Icon(
            Icons.search,
          ),
          onPressed: null,
        ),
        new IconButton(
          icon: Icon(
            Icons.add_box,
          ),
          onPressed: null,
        ),
        new IconButton(
          icon: Icon(
            Icons.favorite,
          ),
          onPressed: null,
        ),
        new IconButton(
          icon: Icon(
            Icons.account_box,
          ),
          onPressed: null,
        ),
      ],
    ),
  ),
);