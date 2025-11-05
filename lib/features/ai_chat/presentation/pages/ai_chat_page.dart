import 'package:flutter/widgets.dart';
import 'package:movies_app/features/ai_chat/presentation/widgets/ai_chat_page_body.dart';

class AiChatPage extends StatelessWidget {
  const AiChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: AiChatPageBody());
  }
}
