import 'package:blood_bank/core/routes/app_routes.dart';
import 'package:blood_bank/features/more/presentation/views/widgets/more_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'user_information_header.dart';

class MoreViewBody extends StatelessWidget {
  const MoreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      clipBehavior: Clip.none,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 8,
          children: [
            const UserInformationHeader(),
            MoreItem(
              text: "Create Request Blood",
              icon: FontAwesomeIcons.lightbulb,
              onTap: () => Navigator.pushNamed(context, AppRoutes.sendPost),
            ),
            const MoreItem(
              text: "Create donate blood",
              icon: FontAwesomeIcons.lightbulb,
            ),
            const MoreItem(
              text: "Blogs",
              icon: FontAwesomeIcons.lightbulb,
            ),
            MoreItem(
              onTap: () => Navigator.pushNamed(context, AppRoutes.settings),
              text: "Settings",
              icon: Icons.settings,
            ),
            const MoreItem(
              text: "Compatibility",
              icon: FontAwesomeIcons.lightbulb,
            ),
            const MoreItem(
              text: "Donate us",
              icon: FontAwesomeIcons.lightbulb,
            ),
          ],
        ),
      ),
    );
  }
}
