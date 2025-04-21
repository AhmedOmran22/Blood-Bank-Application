abstract class BackendEndpoints {
  static const String kUsers = 'users';
  static const String kPosts = 'posts';
  static const String login = "/Auth";
  static const String register = "/Auth/register";
  static const String confirmPassword = "/auth/confirm-email";
  static const String resendConfirmPassword = "/Auth/resend-confirm-email";
  static const String forgotPassword = "/Auth/forgot-password";
  static const String resetPassword = "/Auth/reset-password";
  static const String getUserProfile = "/me";
  static const String updateUserProfile = "/me/info";
  static const String changePassword = "/me/change-password";
}
