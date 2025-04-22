
abstract class ChatCubitState {
  final List<String> messages;
  const ChatCubitState(this.messages);
}

class ChatInitial extends ChatCubitState {
  ChatInitial() : super([]);
}

class ChatLoaded extends ChatCubitState {
  ChatLoaded(List<String> messages) : super(messages);
}

class ChatError extends ChatCubitState {
  final String error;
  ChatError(this.error) : super([]);
}
