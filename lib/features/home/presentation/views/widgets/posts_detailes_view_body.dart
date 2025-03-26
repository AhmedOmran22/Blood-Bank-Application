import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../data/models/post_model.dart';
import 'post_detailes_item.dart';

class PostDetailesViewBody extends StatelessWidget {
  const PostDetailesViewBody({super.key, required this.postModel});
  final PostModel postModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        spacing: 12,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .02,
          ),
          CircleAvatar(
            radius: 32,
            child: Text(
              postModel.bloodType,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 20,
                    letterSpacing: 1,
                    color: Colors.white,
                  ),
            ),
          ),
          Text(
            postModel.title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 18,
                ),
          ),
          Divider(color: Colors.grey.shade600, thickness: .2),
          PostDetailesItem(
            label: 'Contact Person'.tr(),
            details: postModel.userName,
            icon: Icons.person,
          ),
          Divider(color: Colors.grey.shade600, thickness: .2),
          PostDetailesItem(
            label: 'Mobile Number'.tr(),
            details: postModel.mobileNumber,
            icon: FontAwesomeIcons.phoneVolume,
          ),
          Divider(color: Colors.grey.shade600, thickness: .2),
          PostDetailesItem(
            label: 'How many bags needed'.tr(),
            details: postModel.howManyBagsNeeeded.toString(),
            icon: FontAwesomeIcons.bagShopping,
          ),
          Divider(color: Colors.grey.shade600, thickness: .2),
          PostDetailesItem(
            label: 'City Name'.tr(),
            details: postModel.cityName,
            icon: FontAwesomeIcons.city,
          ),
          Divider(color: Colors.grey.shade600, thickness: .2),
          PostDetailesItem(
            label: 'Hospital Name'.tr(),
            details: postModel.hospitalName,
            icon: FontAwesomeIcons.hospital,
          ),
          Divider(color: Colors.grey.shade600, thickness: .2),
          Row(
            children: [
              Text(
                "Why do you need blood ? ".tr(),
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 18,
                    ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              postModel.whyDoYouNeedBlood,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w100,
                  ),
            ),
          )
        ],
      ),
    );
  }
}
