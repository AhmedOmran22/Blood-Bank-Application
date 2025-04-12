import 'package:blood_bank/features/awarness/presentation/views/awarness_view.dart';
import 'package:blood_bank/features/chat_bot/presentation/views/chat_bot_view.dart';
import 'package:blood_bank/features/home/presentation/views/home_view.dart';
import 'package:blood_bank/features/more/presentation/views/more_view.dart';
import 'package:easy_localization/easy_localization.dart';
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
    return PopScope(
      canPop: currentIndex ==0,
      onPopInvokedWithResult: (didPop, result) => setState(() {
        currentIndex = 0;
      }),
      child: Scaffold(
        key: ValueKey(EasyLocalization.of(context)!.locale),
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
          items: [
            BottomNavigationBarItem(
              icon: const Icon(FontAwesomeIcons.house, size: 20),
              label: 'Home'.tr(),
            ),
            BottomNavigationBarItem(
              icon: const Icon(FontAwesomeIcons.lightbulb, size: 20),
              label: 'Awareness'.tr(),
            ),
            BottomNavigationBarItem(
              icon: const Icon(FontAwesomeIcons.robot, size: 20),
              label: 'chat bot'.tr(),
            ),
            BottomNavigationBarItem(
              icon: const Icon(FontAwesomeIcons.gear, size: 20),
              label: 'More'.tr(),
            ),
          ],
        ),
      ),
    );
  }
}
