import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeLayoutView extends StatefulWidget {
  static const String routeName = '/home_layout';

  const HomeLayoutView({super.key});

  @override
  State<HomeLayoutView> createState() => _HomeLayoutViewState();
}

class _HomeLayoutViewState extends State<HomeLayoutView> {
  int select = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: select,
        onTap: (value) {
          setState(() {
            select = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.houseChimney), label: 'HOME'),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.magnifyingGlass), label: 'SEARCH'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/browser_icon.png')),
              label: 'Browse'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/watch_icon.png')),
              label: 'Watchlist'),
        ],
      ),
    );
  }
}
