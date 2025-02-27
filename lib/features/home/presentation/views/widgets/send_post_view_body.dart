import 'package:blood_bank/core/utils/app_colors.dart';
import 'package:blood_bank/core/widgets/custom_text_form_field.dart';
import 'package:blood_bank/core/widgets/custom_drop_down_buttom_field.dart';
import 'package:blood_bank/core/widgets/general_button.dart';
import 'package:blood_bank/features/home/data/models/post_model.dart';
import 'package:flutter/material.dart';

class SendPostViewBody extends StatefulWidget {
  const SendPostViewBody({super.key});

  @override
  State<SendPostViewBody> createState() => _SendPostViewBodyState();
}

class _SendPostViewBodyState extends State<SendPostViewBody> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  late TextEditingController postTitleController,
      howManyUnitsController,
      descriptionController,
      phoneNumberController,
      hospitalNameController,
      whyDoYouNeedBloodController;
  late String? date, bloodType;
  @override
  void initState() {
    postTitleController = TextEditingController();
    howManyUnitsController = TextEditingController();
    phoneNumberController = TextEditingController();
    hospitalNameController = TextEditingController();
    descriptionController = TextEditingController();
    whyDoYouNeedBloodController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: autoValidateMode,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 16,
          children: [
            const SizedBox(height: 16),
            const CustomTextFormField(
              controller: null,
              hitnText: "Post Title",
            ),
            CustomDropdownButtonFormField(
              onChanged: (value) {
                bloodType = value!;
              },
            ),
            const CustomTextFormField(
              controller: null,
              hitnText: "Amount you need",
            ),
            const CustomTextFormField(
              hitnText: "Date",
            ),
            const CustomTextFormField(
              controller: null,
              hitnText: "Hopsital Name",
            ),
            const CustomTextFormField(
              controller: null,
              maxLines: 4,
              hitnText: "Why Do You Need Blood",
            ),
            const CustomTextFormField(
              controller: null,
              hitnText: "Contact Person Name",
            ),
            const CustomTextFormField(
              controller: null,
              hitnText: "Phone Number",
            ),
            GeneralButton(
              text: "Send",
              backgroundColor: AppColors.primaryColor,
              textColor: AppColors.whiteColor,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }

}

// final String userName;
//   final String mobileNumber;
//   final String title;
//   final int howManyBagsNeeeded;
//   final String bloodType;
//   final String hospitalName;
//   final String whyDoYouNeedBlood;
//   final String dateOfPost;
//   final String cityName;