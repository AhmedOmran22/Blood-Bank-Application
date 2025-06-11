import 'package:blood_bank/core/utils/app_colors.dart';
import 'package:blood_bank/core/widgets/custom_text_form_field.dart';
import 'package:blood_bank/core/widgets/general_button.dart';
import 'package:flutter/material.dart';

class PredictViewBody extends StatelessWidget {
  const PredictViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        spacing: 16,
        children: [
          CustomTextFormField(
            hitnText: "Hepatitis B ",
            textInputType: TextInputType.number,
            validator: null,
          ),
          CustomTextFormField(
            hitnText: "Thalassemia",
            textInputType: TextInputType.number,
            validator: null,
          ),
          CustomTextFormField(
            hitnText: "Celiac Disease",
            textInputType: TextInputType.number,
            validator: null,
          ),
          CustomTextFormField(
            hitnText: "Rheumatoid Arthritis",
            textInputType: TextInputType.number,
            validator: null,
          ),
          CustomTextFormField(
            hitnText: "Thalassemia",
            textInputType: TextInputType.number,
            validator: null,
          ),
          CustomTextFormField(
            hitnText: "Type 1 Diabetes",
            textInputType: TextInputType.number,
            validator: null,
          ),
          CustomTextFormField(
            hitnText: "Rheumatoid Arthritis",
            textInputType: TextInputType.number,
            validator: null,
          ),
          CustomTextFormField(
            hitnText: "Multiple Sclerosis",
            textInputType: TextInputType.number,
            validator: null,
          ),
          CustomTextFormField(
            hitnText: "HIV",
            textInputType: TextInputType.number,
            validator: null,
          ),
          CustomTextFormField(
            hitnText: "Cancer",
            textInputType: TextInputType.number,
            validator: null,
          ),
          GeneralButton(
            text: "can donate ?",
            backgroundColor: AppColors.primaryColor,
            textColor: Colors.white,
          )
        ],
      ),
    );
  }
}
