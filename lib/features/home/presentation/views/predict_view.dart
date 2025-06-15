import 'package:blood_bank/core/services/service_locator.dart';
import 'package:blood_bank/features/home/data/repos/predict_repo.dart';
import 'package:blood_bank/features/home/presentation/cubits/predict_cubit/predict_cubit.dart';
import 'package:blood_bank/features/home/presentation/views/widgets/predict_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PredictView extends StatelessWidget {
  const PredictView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Can Donate ?",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocProvider(
        create: (context) => PredictCubit(getIt<PredictRepo>()),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: PredictViewBody(),
        ),
      ),
    );
  }
}
