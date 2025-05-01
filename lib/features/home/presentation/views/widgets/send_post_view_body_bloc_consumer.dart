import 'package:blood_bank/core/functions/show_snack_bar_function.dart';
import 'package:blood_bank/features/home/presentation/cubits/community_cubit/community_cubit_state.dart';
import 'package:blood_bank/features/home/presentation/cubits/community_cubit/cummuniy_cubit.dart';
import 'package:blood_bank/features/home/presentation/views/widgets/send_post_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SendPostViewBodyBlocConsumer extends StatelessWidget {
  const SendPostViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CommunityCubit, CommunityCubitState>(
      listener: (context, state) {
        if (state is PostAddedSuccessState) {
          showSnackBarFuction(context, "Your Post Added Successfully");
          Navigator.pop(context);
        }
        if (state is ErrorState) {
          showSnackBarFuction(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LoadingState,
          child: const SendPostViewBody(),
        );
      },
    );
  }
}
