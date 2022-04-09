// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import './favorite_screen.dart';
import './categories_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Meals"),
        ),
        bottomNavigationBar: TabBar(
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.category),
              text: "Category",
            ),
            Tab(
              icon: Icon(Icons.star_border_purple500),
              text: "Favorite",
            )
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            CategoriesScreen(),
            FavoriteScreen(),
          ],
        ),
      ),
    );
  }
}
