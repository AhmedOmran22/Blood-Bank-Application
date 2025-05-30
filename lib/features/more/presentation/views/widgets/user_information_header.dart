import 'package:blood_bank/core/functions/get_current_user_function.dart';
import 'package:flutter/material.dart';

// import '../../../../../core/functions/get_current_user_function.dart';
import '../../../../../core/utils/app_colors.dart';

class UserInformationHeader extends StatelessWidget {
  const UserInformationHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 16),
          padding: const EdgeInsets.only(bottom: 16),
          alignment: Alignment.bottomCenter,
          height: MediaQuery.of(context).size.height * .12,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                getCurrentUserFromBackEndFunction().name,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.white,
                      fontSize: 20,
                    ),
              ),
              Text(
                "blood Group :" +
                    getCurrentUserFromBackEndFunction().bloodType!,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
              ),
            ],
          ),
        ),
        const Positioned(
          top: 0,
          right: 0,
          left: 0,
          child: CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 25,
            child: Icon(
              Icons.person,
              size: 25,
            ),
          ),
        )
      ],
    );
  }
}
