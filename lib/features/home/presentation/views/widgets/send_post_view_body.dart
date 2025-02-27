import 'package:blood_bank/core/functions/formate_date_function.dart';
import 'package:blood_bank/core/functions/show_date_picker_function.dart';
import 'package:blood_bank/core/utils/app_colors.dart';
import 'package:blood_bank/core/widgets/custom_text_form_field.dart';
import 'package:blood_bank/core/widgets/custom_drop_down_buttom_field.dart';
import 'package:blood_bank/core/widgets/general_button.dart';
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
      hospitalNameController,
      contactPersonNameController,
      cityController,
      phoneNumberController,
      dateController,
      whyDoYouNeedBloodController;
  late String bloodType;

  @override
  void initState() {
    postTitleController = TextEditingController();
    howManyUnitsController = TextEditingController();
    hospitalNameController = TextEditingController();
    contactPersonNameController = TextEditingController();
    dateController = TextEditingController();
    cityController = TextEditingController();
    phoneNumberController = TextEditingController();
    whyDoYouNeedBloodController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    postTitleController.dispose();
    howManyUnitsController.dispose();
    hospitalNameController.dispose();
    dateController.dispose();
    contactPersonNameController.dispose();
    cityController.dispose();
    phoneNumberController.dispose();
    whyDoYouNeedBloodController.dispose();
    super.dispose();
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
            CustomTextFormField(
              controller: postTitleController,
              hitnText: "Post Title",
            ),
            CustomDropdownButtonFormField(
              onChanged: (value) {
                bloodType = value!;
              },
              items: [
                "A+",
                "A-",
                "B+",
                "B-",
                "O+",
                "O-",
                "AB+",
                "AB-",
              ]
                  .map(
                    (type) => DropdownMenuItem(
                      value: type,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: Text(type),
                      ),
                    ),
                  )
                  .toList(),
            ),
            CustomTextFormField(
              controller: howManyUnitsController,
              textInputType: TextInputType.number,
              hitnText: "Amount you need ? ",
            ),
            GestureDetector(
              onTap: () async {
                DateTime? myDate = await ShowDatePickerFunction(context);
                setState(
                  () {
                    dateController.text = formatDateFunction(myDate) ?? "";
                  },
                );
              },
              child: CustomTextFormField(
                controller: dateController,
                enabled: false,
                hitnText: "Date",
              ),
            ),
            CustomTextFormField(
              controller: cityController,
              hitnText: "City Name",
            ),
            CustomTextFormField(
              controller: hospitalNameController,
              hitnText: "Hopsital Name",
            ),
            CustomTextFormField(
              controller: whyDoYouNeedBloodController,
              maxLines: 4,
              hitnText: "Why Do You Need Blood ?",
            ),
            CustomTextFormField(
              controller: contactPersonNameController,
              hitnText: "Contact Person Name",
            ),
            CustomTextFormField(
              controller: phoneNumberController,
              hitnText: "Phone Number",
              textInputType: TextInputType.phone,
              validator: (data) {
                if (data == null || data.isEmpty) {
                  return "Enter your phone number";
                }
                final regex = RegExp(r'^(010|011|012|015)\d{8}$');
                if (!regex.hasMatch(data)) {
                  return "Invalid phone number";
                }
                return null;
              },
            ),
            GeneralButton(
              text: "Send",
              backgroundColor: AppColors.primaryColor,
              textColor: AppColors.whiteColor,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                } else {
                  autoValidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
