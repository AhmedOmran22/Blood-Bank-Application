import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavigationBarView extends StatefulWidget {
  const BottomNavigationBarView({super.key});

  @override
  State<BottomNavigationBarView> createState() =>
      _BottomNavigationBarViewState();
}

class _BottomNavigationBarViewState extends State<BottomNavigationBarView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: const [
          Center(
            child: Text('Home'),
          ),
          Center(
            child: Text('Awareness'),
          ),
          Center(
            child: Text('chat bot'),
          ),
          Center(
            child: Text('More'),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.house,
              size: 20,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.lightbulb,
              size: 20,
            ),
            label: 'Awareness',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.robot,
              size: 20,
            ),
            label: 'chat bot',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.ellipsis,
              size: 20,
            ),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
