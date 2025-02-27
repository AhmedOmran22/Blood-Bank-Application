import 'package:blood_bank/core/widgets/custom_text_form_field.dart';
import 'package:blood_bank/core/widgets/custom_drop_down_buttom_field.dart';
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
            CustomTextFormField(
              controller: postTitleController,
              hitnText: "Post Title",
            ),
            CustomDropdownButtonFormField(
              onChanged: (value) {
                bloodType = value!;
              },
            ),
          ],
        ),
      ),
    );
  }
}
