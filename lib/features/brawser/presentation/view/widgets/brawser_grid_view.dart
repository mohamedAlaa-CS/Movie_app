import 'package:flutter/material.dart';

class BrawserGrideView extends StatelessWidget {
  const BrawserGrideView({super.key});

 @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return GridView.builder(
    
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
          
          ),
      itemBuilder: (context, index) =>
          const Center(child: SizedBox(height: 100, child: Text('hello'))),
    );
  }
}