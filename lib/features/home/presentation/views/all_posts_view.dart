import 'package:blood_bank/core/services/service_locator.dart';
import 'package:blood_bank/features/home/data/repos/posts_repo.dart';
import 'package:blood_bank/features/home/presentation/cubits/posts_cubit.dart';
import 'package:blood_bank/features/home/presentation/views/widgets/all_posts_view_body.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllPostsView extends StatelessWidget {
  const AllPostsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostsCubit(
        getIt.get<PostsRepo>()..fetchAllPosts(),
      ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "All Posts".tr(),
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
        body: const AllPostsViewBody(),
      ),
    );
  }
}
