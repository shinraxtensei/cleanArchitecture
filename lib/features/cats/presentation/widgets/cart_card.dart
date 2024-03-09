import 'package:flutter/material.dart';

class CatCard extends StatelessWidget {
  const CatCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.pets),
            title: Text('Cat'),
            subtitle: Text('This is a cat'),
          ),
        ],
      ),
    );
  }
}
