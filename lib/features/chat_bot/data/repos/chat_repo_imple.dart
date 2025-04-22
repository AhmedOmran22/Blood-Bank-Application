import 'dart:async';
import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatRepository {
  final _messageController = StreamController<String>.broadcast();
  late WebSocketChannel _channel;
  bool _isConnected = false;

  Stream<String> get messagesStream => _messageController.stream;
  bool get isConnected => _isConnected;

  void connect() {
    _channel = WebSocketChannel.connect(
      Uri.parse('ws://bloodhelperapi.runasp.net/chatHub'),
    );

    // Send SignalR handshake
    _channel.sink.add('{"protocol":"json","version":1}\u001e');

    _channel.stream.listen(
      (data) {
        final jsonParts = data.split('\u001e');

        for (var part in jsonParts) {
          if (part.trim().isEmpty) continue;

          try {
            final msg = json.decode(part);

            if (msg['type'] == 1 && msg['target'] == 'ReceiveMessage') {
              final args = msg['arguments'];
              if (args != null && args.isNotEmpty) {
                _messageController.add(args[0]);
              }
            }
          } catch (e) {
            print("Error decoding message: $e");
          }
        }

        if (!_isConnected) {
          _isConnected = true;
        }
      },
      onError: (error) {
        print("WebSocket error: $error");
        _messageController.add("Error: Connection failed");
        _isConnected = false;
      },
      onDone: () {
        print("WebSocket closed");
        _messageController.add("Closed: Connection closed");
        _isConnected = false;
      },
    );
  }

  void sendMessage(String message) {
    if (!_isConnected) return;

    final payload = {
      "arguments": [message],
      "target": "SendMessage",
      "type": 1,
    };

    _channel.sink.add('${jsonEncode(payload)}\u001e');
    _messageController.add("You: $message");
  }

  void dispose() {
    _channel.sink.close();
    _messageController.close();
  }
}
