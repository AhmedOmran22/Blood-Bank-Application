import 'package:blood_bank/features/home/data/models/activity_option_item_model.dart';
import 'package:blood_bank/features/home/presentation/cubits/cummuniy_cubit.dart';
import 'package:blood_bank/features/home/presentation/views/widgets/activity_option_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/routes/app_routes.dart';

class ActivityOptions extends StatelessWidget {
  const ActivityOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        spacing: 16,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ActivityOptionItem(
                activityOptionItemModel: activityOptionItems[0],
              ),
              const SizedBox(width: 16),
              ActivityOptionItem(
                activityOptionItemModel: activityOptionItems[1],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ActivityOptionItem(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.sendPost,
                    arguments: BlocProvider.of<CommunityCubit>(context),
                  );
                },
                activityOptionItemModel: activityOptionItems[2],
              ),
              const SizedBox(width: 16),
              ActivityOptionItem(
                activityOptionItemModel: activityOptionItems[3],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
