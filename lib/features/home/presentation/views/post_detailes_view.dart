import 'package:blood_bank/features/home/presentation/cubits/get_post_detailes_cubit/get_post_detaile_cubit.dart';
import 'package:blood_bank/features/home/presentation/cubits/get_post_detailes_cubit/get_post_detailes_cubit_state.dart';
import 'package:blood_bank/features/home/presentation/views/widgets/posts_detailes_view_body.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostDetailesView extends StatefulWidget {
  const PostDetailesView({
    super.key,
    required this.postId,
  });
  final int postId;

  @override
  State<PostDetailesView> createState() => _PostDetailesViewState();
}

class _PostDetailesViewState extends State<PostDetailesView> {
  @override
  void initState() {
    context.read<GetPostDetailesCubit>().getPostDetails(
          widget.postId.toString(),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Post Detailes".tr(),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocBuilder<GetPostDetailesCubit, GetPostDetailesCubitState>(
          builder: (context, state) {
            if (state is GetPostDetailesCubitLoaded) {
              return PostDetailesViewBody(
                postModel: state.postModel,
              );
            } else if (state is GetPostDetailesCubitError) {
              return Center(child: Text(state.errMessage));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
