import 'package:firebase_ai/firebase_ai.dart';

abstract class AiChatSource {
  Future<String> getAIChatResponse(String query);
}

class AiChatSourceImpl implements AiChatSource {
  GenerativeModel? _model;
  ChatSession? _chat;

  Future<void> initializeModel() async {
    _model = FirebaseAI.googleAI().generativeModel(model: 'gemini-2.5-flash');
    _chat = _model!.startChat();
    await _chat!.sendMessage(
      Content.text(
        "You are a helpful AI assistant who is an expert in movies.",
      ),
    );
  }

  @override
  Future<String> getAIChatResponse(String query) async {
    if (_chat == null) {
      await initializeModel();
    }
    final prompt = Content.text(query);
    final response = await _chat!.sendMessage(prompt);
    return response.text ??
        "Sorry I can't answer that right now. Please try again later.";
  }
}
