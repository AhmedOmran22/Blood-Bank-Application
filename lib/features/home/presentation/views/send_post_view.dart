import 'package:blood_bank/core/services/service_locator.dart';
import 'package:blood_bank/features/home/data/repos/community_repo.dart';
import 'package:blood_bank/features/home/presentation/cubits/community_cubit/cummuniy_cubit.dart';
import 'package:blood_bank/features/home/presentation/views/widgets/send_post_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'widgets/send_post_view_body.dart';

class SendPostView extends StatelessWidget {
  const SendPostView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommunityCubit(getIt.get<CommunityRepo>()),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Send Post",
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
        body: const SendPostViewBody(),
      ),
    );
  }
}
