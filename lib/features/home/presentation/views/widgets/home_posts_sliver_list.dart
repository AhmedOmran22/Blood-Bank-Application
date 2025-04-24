import 'package:blood_bank/features/home/presentation/cubits/community_cubit/community_cubit_state.dart';
import 'package:blood_bank/features/home/presentation/cubits/community_cubit/cummuniy_cubit.dart';
import 'package:blood_bank/features/home/presentation/views/widgets/mini_post_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePostsSliverList extends StatefulWidget {
  const HomePostsSliverList({
    super.key,
    required this.childCount,
  });
  final int childCount;

  @override
  State<HomePostsSliverList> createState() => _HomePostsSliverListState();
}

class _HomePostsSliverListState extends State<HomePostsSliverList> {
  @override
  void initState() {
    context.read<CommunityCubit>().fetchAllPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommunityCubit, CommunityCubitState>(
      builder: (context, state) {
        if (state is MiniPostsLoadedState) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: widget.childCount,
              (context, index) {
                return MiniPostItem(
                  miniPostModel: state.miniPosts[index],
                );
              },
            ),
          );
        } else if (state is ErrorState) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(state.errMessage),
            ),
          );
        } else if (state is LoadingState) {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}
