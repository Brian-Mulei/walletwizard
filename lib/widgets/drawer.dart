import 'package:flutter/material.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    ColorScheme theme =Theme.of(context).colorScheme;
  return  Drawer(

      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
            DrawerHeader(
            decoration: BoxDecoration(

              color: theme.primary,
            ),
            child: Center(child: Text('Wallet Wizard')),

          ),

          ListTile(
            title: const Text('Home'),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.of(context).pushNamed("/");
            },
          ),  ListTile(
            title: const Text('Categories'),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.of(context).pushNamed("Category");
            },
          ),
          ListTile(
            title: const Text('Statistics'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: const Text('Settings'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }
}
