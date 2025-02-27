class MessageModel {
  final String message;
  final String id;

  MessageModel({required this.message, required this.id});
}

List<MessageModel> messages = [
  MessageModel(message: "Hey! How's your day going?", id: "1"),
  MessageModel(
      message: "Hey! It's been good. Just a bit busy with work.", id: "2"),
  MessageModel(message: "I get that. Anything interesting happening?", id: "1"),
  MessageModel(
      message: "Not really, just the usual tasks. What about you?", id: "2"),
  MessageModel(
      message: "Same here. Thinking about going for a walk later.", id: "1"),
  MessageModel(message: "That sounds nice! Fresh air always helps.", id: "2"),
  MessageModel(message: "Yeah, especially after sitting all day.", id: "1"),
  MessageModel(
      message: "True! By the way, did you watch the new episode?", id: "2"),
  MessageModel(message: "Not yet! No spoilers, please.", id: "1"),
  MessageModel(
      message: "Haha, don’t worry. Just saying, it was really good!", id: "2"),
  MessageModel(message: "Now I'm even more excited to watch it!", id: "1"),
  MessageModel(
      message: "You should! Let me know what you think after.", id: "2"),
  MessageModel(
      message: "Of course! Maybe we can discuss it tomorrow.", id: "1"),
  MessageModel(message: "Sounds like a plan! Looking forward to it.", id: "2"),
  MessageModel(message: "Alright, talk to you later then!", id: "1"),
];
