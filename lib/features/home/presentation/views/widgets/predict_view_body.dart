import 'package:blood_bank/core/utils/app_colors.dart';
import 'package:blood_bank/core/widgets/custom_text_form_field.dart';
import 'package:blood_bank/core/widgets/general_button.dart';
import 'package:blood_bank/features/home/data/models/predict_result_model.dart';
import 'package:blood_bank/features/home/presentation/cubits/predict_cubit/predict_cubit.dart';
import 'package:blood_bank/features/home/presentation/cubits/predict_cubit/predict_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PredictViewBody extends StatefulWidget {
  const PredictViewBody({super.key});

  @override
  State<PredictViewBody> createState() => _PredictViewBodyState();
}

class _PredictViewBodyState extends State<PredictViewBody> {
  final _formKey = GlobalKey<FormState>();
  final List<TextEditingController> controllers =
      List.generate(10, (_) => TextEditingController());

  final List<String> diseases = [
    "Hepatitis B",
    "Thalassemia",
    "Celiac Disease",
    "Rheumatoid Arthritis",
    "Thalassemia",
    "Type 1 Diabetes",
    "Rheumatoid Arthritis",
    "Multiple Sclerosis",
    "HIV",
    "Cancer",
  ];

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PredictCubit, PredictState>(
      listener: (context, state) {
        if (state is PredictLoaded) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Prediction Result"),
              content: SizedBox(
                height: 300,
                width: 300,
                child: ListView.builder(
                  itemCount: state.results.length,
                  itemBuilder: (context, index) {
                    final item = state.results[index];
                    return ListTile(
                      title: Text(item.disease),
                      subtitle: Text("Status: ${item.donationStatus}"),
                      trailing: Text("Prevalence: ${item.prevalence ?? "N/A"}"),
                    );
                  },
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    "OK",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
              ],
            ),
          );
        } else if (state is PredictError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 16),
                for (int i = 0; i < diseases.length; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: CustomTextFormField(
                      controller: controllers[i],
                      hitnText: diseases[i],
                      textInputType: TextInputType.number,
                      validator: (value) => value == null || value.isEmpty
                          ? "Please enter value"
                          : null,
                    ),
                  ),
                const SizedBox(height: 16),
                GeneralButton(
                  text: state is PredictLoading ? "Loading..." : "Can donate?",
                  backgroundColor: AppColors.primaryColor,
                  textColor: Colors.white,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final values = controllers
                          .map((e) => double.tryParse(e.text) ?? 0.0)
                          .toList();
                      final requestModel = PredictRequestModel(inputs: values);
                      context.read<PredictCubit>().predict(requestModel);
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
