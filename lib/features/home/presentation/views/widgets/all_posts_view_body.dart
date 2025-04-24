import 'package:blood_bank/features/home/presentation/cubits/community_cubit/cummuniy_cubit.dart';
import 'package:blood_bank/features/home/presentation/cubits/community_cubit/community_cubit_state.dart';
import 'package:blood_bank/features/home/presentation/views/widgets/mini_post_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllPostsViewBody extends StatelessWidget {
  const AllPostsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommunityCubit, CommunityCubitState>(
      builder: (context, state) {
        if (state is MiniPostsLoadedState) {
          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: state.miniPosts.length,
                  (context, index) {
                    return MiniPostItem(miniPostModel: state.miniPosts[index]);
                  },
                ),
              )
            ],
          );
        } else if (state is ErrorState) {
          return Center(child: Text(state.errMessage));
        } else if (state is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Center(child: Text("I don't have any posts"));
        }
      },
    );
  }
}
