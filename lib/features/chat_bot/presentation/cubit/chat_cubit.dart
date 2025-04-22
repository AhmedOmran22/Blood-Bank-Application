import 'package:blood_bank/features/chat_bot/data/repos/chat_repo_imple.dart';
import 'package:blood_bank/features/chat_bot/presentation/cubit/chat_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatCubitState> {
  final ChatRepository _repository;
  final List<String> _messages = [];

  ChatCubit(this._repository) : super(ChatInitial()) {
    _repository.connect();

    _repository.messagesStream.listen((msg) {
      _messages.add(msg);
      emit(ChatLoaded(List.from(_messages)));
    });
  }

  void sendMessage(String text) {
    if (text.trim().isEmpty) return;
    _repository.sendMessage(text);
  }

  @override
  Future<void> close() {
    _repository.dispose();
    return super.close();
  }
}
