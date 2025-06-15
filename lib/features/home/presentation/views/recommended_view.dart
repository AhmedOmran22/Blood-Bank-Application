import 'package:blood_bank/core/services/service_locator.dart';
import 'package:blood_bank/features/home/data/repos/recommended_repo.dart';
import 'package:blood_bank/features/home/presentation/cubits/recommended/recommended_cubit.dart';
import 'package:blood_bank/features/home/presentation/views/widgets/recommended_View_Body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommendedView extends StatelessWidget {
  const RecommendedView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          RecommendedCubit(recommendedRepo: getIt<RecommendedRepo>()),
      child: const  RecommendedViewBody(),
    );
  }
}
