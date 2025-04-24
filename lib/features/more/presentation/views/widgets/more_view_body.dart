import 'package:blood_bank/core/routes/app_routes.dart';
import 'package:blood_bank/features/more/presentation/views/widgets/more_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../home/presentation/cubits/cummuniy_cubit.dart';
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
            const SizedBox(height: 8),
            MoreItem(
              text: "Create Request Blood",
              icon: Icons.add,
              onTap: () => Navigator.pushNamed(
                context,
                AppRoutes.sendPost,
                arguments: BlocProvider.of<CommunityCubit>(context),
              ),
            ),
            const MoreItem(
              text: "Be a Donor",
              icon: Icons.bloodtype_rounded,
            ),
            // const MoreItem(
            //   text: "Blogs",
            //   icon: FontAwesomeIcons.lightbulb,
            // ),
            MoreItem(
              onTap: () => Navigator.pushNamed(context, AppRoutes.settings),
              text: "Settings",
              icon: Icons.settings,
            ),
            const MoreItem(
              text: "Compatibility",
              icon: FontAwesomeIcons.thinkPeaks,
            ),
            const MoreItem(
              text: "Donate us",
              icon: Icons.contact_emergency,
            ),
          ],
        ),
      ),
    );
  }
}
