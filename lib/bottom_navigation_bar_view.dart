import 'package:blood_bank/features/awarness/presentation/views/awarness_view.dart';
import 'package:blood_bank/features/chat_bot/presentation/views/chat_bot_view.dart';
import 'package:blood_bank/features/home/presentation/views/home_view.dart';
import 'package:blood_bank/features/more/presentation/views/more_view.dart';
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
        children: [
          const HomeView(),
          const AwarnessView(),
          const ChatBotView(),
          const MoreView(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.house, size: 20),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.lightbulb, size: 20),
            label: 'Awareness',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.robot, size: 20),
            label: 'chat bot',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.gear, size: 20),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
