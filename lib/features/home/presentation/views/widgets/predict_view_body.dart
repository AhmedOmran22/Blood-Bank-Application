import 'package:blood_bank/core/utils/app_colors.dart';
import 'package:blood_bank/core/widgets/custom_text_form_field.dart';
import 'package:blood_bank/core/widgets/general_button.dart';
import 'package:flutter/material.dart';

class PredictViewBody extends StatefulWidget {
  const PredictViewBody({super.key});

  @override
  State<PredictViewBody> createState() => _PredictViewBodyState();
}

class _PredictViewBodyState extends State<PredictViewBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 16,
        children: [
          const CustomTextFormField(
            hitnText: "Hepatitis B ",
            textInputType: TextInputType.number,
            validator: null,
          ),
          const CustomTextFormField(
            hitnText: "Thalassemia",
            textInputType: TextInputType.number,
            validator: null,
          ),
          const CustomTextFormField(
            hitnText: "Celiac Disease",
            textInputType: TextInputType.number,
            validator: null,
          ),
          const CustomTextFormField(
            hitnText: "Rheumatoid Arthritis",
            textInputType: TextInputType.number,
            validator: null,
          ),
          const CustomTextFormField(
            hitnText: "Thalassemia",
            textInputType: TextInputType.number,
            validator: null,
          ),
          const CustomTextFormField(
            hitnText: "Type 1 Diabetes",
            textInputType: TextInputType.number,
            validator: null,
          ),
          const CustomTextFormField(
            hitnText: "Rheumatoid Arthritis",
            textInputType: TextInputType.number,
            validator: null,
          ),
          const CustomTextFormField(
            hitnText: "Multiple Sclerosis",
            textInputType: TextInputType.number,
            validator: null,
          ),
          const CustomTextFormField(
            hitnText: "HIV",
            textInputType: TextInputType.number,
            validator: null,
          ),
          const CustomTextFormField(
            hitnText: "Cancer",
            textInputType: TextInputType.number,
            validator: null,
          ),
          GeneralButton(
            onPressed: () {},
            text: "can donate ?",
            backgroundColor: AppColors.greyColor,
            textColor: Colors.white,
          )
        ],
      ),
    );
  }
}
