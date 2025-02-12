import 'package:blood_bank/core/theme_cubit/theme_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cache/prefs.dart';

class ThemeCubit extends Cubit<ThemeCubitState> {
  ThemeCubit() : super(ThemeCubitInitial());

  void getCurrentTheme() {
    bool isDark = Prefs.getBool("isDark");
    if (isDark) {
      emit(DarkThemeState());
    } else {
      emit(LightThemeState());
    }
  }

  void toggleTheme() {
    Prefs.setBool("isDark", !Prefs.getBool("isDark"));
    getCurrentTheme();
  }
}
