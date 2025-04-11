import 'package:blood_bank/features/home/presentation/cubits/posts_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsCubit extends Cubit<PostsCubitState> {
  PostsCubit() : super(PostsCubitInitial());
}