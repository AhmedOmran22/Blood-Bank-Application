import 'package:blood_bank/core/routes/app_routes.dart';
import 'package:blood_bank/core/services/service_locator.dart';
import 'package:blood_bank/features/auth/presentation/views/login_view.dart';
import 'package:blood_bank/features/auth/presentation/views/register_view.dart';
import 'package:blood_bank/features/auth/presentation/views/reset_password_view.dart';
import 'package:blood_bank/features/home/data/repos/community_repo.dart';
import 'package:blood_bank/features/home/presentation/cubits/community_cubit/cummuniy_cubit.dart';
import 'package:blood_bank/features/home/presentation/cubits/get_post_detailes_cubit/get_post_detaile_cubit.dart';
import 'package:blood_bank/features/home/presentation/views/all_posts_view.dart';
import 'package:blood_bank/features/home/presentation/views/donors_view.dart';
import 'package:blood_bank/features/home/presentation/views/post_detailes_view.dart';
import 'package:blood_bank/features/home/presentation/views/send_post_view.dart';
import 'package:blood_bank/features/more/presentation/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bottom_navigation_bar_view.dart';
import '../../features/auth/presentation/views/forget_password_view.dart';
import '../../features/auth/presentation/views/confirm_email_view.dart';
import '../../features/chat_bot/presentation/views/chat_bot_view.dart';
import '../../features/on_boarding/presentation/views/language_and_theme_view.dart';
import '../../features/on_boarding/presentation/views/on_boarding_view.dart';
import '../../features/on_boarding/presentation/views/register_or_login_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.languageAndTheme:
      return MaterialPageRoute(
        builder: (BuildContext context) {
          return const LanguageAndThemeView();
        },
      );
    case AppRoutes.onBoarding:
      return MaterialPageRoute(
        builder: (BuildContext context) {
          return const OnBoardingView();
        },
      );
    case AppRoutes.registerOrLogin:
      return MaterialPageRoute(
        builder: (BuildContext context) {
          return const RegisterOrLoginView();
        },
      );
    case AppRoutes.forgetPassword:
      return MaterialPageRoute(
        builder: (BuildContext context) {
          return const ForgetPasswordView();
        },
      );
    case AppRoutes.login:
      return MaterialPageRoute(
        builder: (BuildContext context) {
          return const LoginView();
        },
      );
    case AppRoutes.register:
      return MaterialPageRoute(
        builder: (BuildContext context) {
          return const RegisterView();
        },
      );
    case AppRoutes.resetPassword:
      return MaterialPageRoute(
        builder: (BuildContext context) {
          return const ResetPasswordView();
        },
      );
    case AppRoutes.confirmEmail:
      return MaterialPageRoute(
        builder: (BuildContext context) {
          return const ConfirmEmailView();
        },
      );
    case AppRoutes.bottomNavigationBarView:
      return MaterialPageRoute(
        builder: (BuildContext context) {
          return const BottomNavigationBarView();
        },
      );
    case AppRoutes.allPostsView:
      return MaterialPageRoute(
        builder: (BuildContext context) {
          return BlocProvider(
            create: (context) => CommunityCubit(
              getIt.get<CommunityRepo>(),
            ),
            child: const AllPostsView(),
          );
        },
      );
    case AppRoutes.postDetails:
      return MaterialPageRoute(
        builder: (BuildContext context) {
          return BlocProvider(
            create: (context) => GetPostDetailesCubit(
              getIt.get<CommunityRepo>(),
            ),
            child: PostDetailesView(
              postId: settings.arguments as int,
            ),
          );
        },
      );
    case AppRoutes.sendPost:
      return MaterialPageRoute(
        builder: (BuildContext context) {
          return BlocProvider(
            create: (context) => CommunityCubit(
              getIt.get<CommunityRepo>(),
            ),
            child: const SendPostView(),
          );
        },
      );
    case AppRoutes.chatBot:
      return MaterialPageRoute(
        builder: (BuildContext context) {
          return const ChatBotView();
        },
      );

    case AppRoutes.settings:
      return MaterialPageRoute(
        builder: (BuildContext context) {
          return const SettingsView();
        },
      );
    case AppRoutes.bloodDonors:
      return MaterialPageRoute(
        builder: (BuildContext context) {
          return const DonorsView();
        },
      );
    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}
