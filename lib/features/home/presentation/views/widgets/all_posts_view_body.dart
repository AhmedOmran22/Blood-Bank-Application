import 'package:blood_bank/features/home/presentation/cubits/posts_cubit.dart';
import 'package:blood_bank/features/home/presentation/cubits/posts_cubit_state.dart';
import 'package:blood_bank/features/home/presentation/views/widgets/post_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllPostsViewBody extends StatelessWidget {
  const AllPostsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsCubit, PostsCubitState>(
      builder: (context, state) {
        if (state is PostsLoadedState) {
          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: state.posts.length,
                  (context, index) {
                    return PostItem(postModel: state.posts[index]);
                  },
                ),
              )
            ],
          );
        } else if (state is PostsErrorState) {
          return Center(child: Text(state.errMessage));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
