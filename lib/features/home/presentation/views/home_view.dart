import 'package:blood_bank/core/services/service_locator.dart';
import 'package:blood_bank/features/home/data/repos/posts_repo.dart';
import 'package:blood_bank/features/home/presentation/cubits/posts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostsCubit(getIt.get<PostsRepo>()),
      child: const Scaffold(
        body: HomeViewBody(),
      ),
    );
  }
}
