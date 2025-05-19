import 'package:blood_bank/core/functions/formate_date_function.dart';
import 'package:blood_bank/core/routes/app_routes.dart';
import 'package:blood_bank/features/home/data/models/mini_post_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/app_colors.dart';

class MiniPostItem extends StatelessWidget {
  const MiniPostItem({super.key, required this.miniPostModel});

  final MiniPostModel miniPostModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            AppRoutes.postDetails,
            arguments: miniPostModel.id,
          );
        },
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.grey,
              width: .5,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              spacing: 16,
              children: [
                CircleAvatar(
                  child: Text(miniPostModel.bloodTypeName),
                ),
                Expanded(
                  child: Column(
                    spacing: 12,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        miniPostModel.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize: 16,
                            ),
                      ),
                      Row(
                        spacing: 8,
                        children: [
                          const Icon(
                            Icons.home_repair_service_outlined,
                            color: AppColors.primaryColor,
                          ),
                          Expanded(
                            child: Text(
                              miniPostModel.hospitalName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        spacing: 8,
                        children: [
                          const Icon(
                            FontAwesomeIcons.calendarCheck,
                            size: 22,
                            color: AppColors.primaryColor,
                          ),
                          Expanded(
                            child: Text(
                              formatDateYMD(miniPostModel.dateOfPublish),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
