import 'package:blood_bank/core/utils/app_colors.dart';
import 'package:blood_bank/core/widgets/city_drop_down_field.dart';
import 'package:blood_bank/core/widgets/custom_drop_down_buttom_field.dart';
import 'package:blood_bank/core/widgets/general_button.dart';
import 'package:blood_bank/features/home/data/models/recommended_result_model.dart';
import 'package:blood_bank/features/home/presentation/cubits/recommended/recommended_cubit.dart';
import 'package:blood_bank/features/home/presentation/cubits/recommended/recommended_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommendedViewBody extends StatefulWidget {
  const RecommendedViewBody({super.key});

  @override
  State<RecommendedViewBody> createState() => _RecommendedViewBodyState();
}

class _RecommendedViewBodyState extends State<RecommendedViewBody> {
  final _formKey = GlobalKey<FormState>();
  String? selectedCityName;
  String? selectedBloodType;
  final TextEditingController _quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recommended Blood Banks'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CityDropDownField(
                    onChanged: (id) {
                      setState(() {
                        selectedCityName = CityDropDownField.cities
                            .firstWhere((city) => city['id'] == id)['name'];
                      });
                    },
                  ),
                  const SizedBox(height: 12),
                  BloodTypeDropDownField(
                    onChanged: (index) {
                      setState(() {
                        selectedBloodType =
                            BloodTypeDropDownField.bloodTypes[index! - 1];
                      });
                    },
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _quantityController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Quantity',
                      labelStyle: TextStyle(fontSize: 15),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a quantity';
                      }
                      if (int.tryParse(value) == null) {
                        return 'Enter a valid number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  GeneralButton(
                    text: "Search",
                    backgroundColor: AppColors.primaryColor,
                    textColor: Colors.white,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context
                            .read<RecommendedCubit>()
                            .getRecommendedBloodBanks(
                              RecommendedRequestModel(
                                governorate: selectedCityName!,
                                bloodType: selectedBloodType!,
                                quantity: int.parse(_quantityController.text),
                              ),
                            );
                      }
                    },
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<RecommendedCubit, RecommendedState>(
                builder: (context, state) {
                  if (state is RecommendedLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is RecommendedLoaded) {
                    return ListView.builder(
                      itemCount: state.recommendations.length,
                      itemBuilder: (context, index) {
                        final recommendation = state.recommendations[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            title: Text(recommendation.bloodBankName),
                            subtitle: Text(
                                '${recommendation.governorate} - ${recommendation.bloodType}'),
                          ),
                        );
                      },
                    );
                  } else if (state is RecommendedError) {
                    return Center(
                      child: Text(state.errMessage),
                    );
                  }
                  return const SizedBox();
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }
}
