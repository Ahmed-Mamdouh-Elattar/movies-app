import 'package:flutter/material.dart';

import 'package:movies_app/features/ai_chat/presentation/widgets/chat_list_builder.dart';
import 'package:movies_app/features/ai_chat/presentation/widgets/send_message_text_field.dart';

class AiChatPageBody extends StatelessWidget {
  const AiChatPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(title: const Text("Movies Chat Bot")),
        const SizedBox(height: 16),
        const Expanded(child: ChatListBuilder()),
        const SizedBox(height: 16),
        const SendMessageTextField(),
        const SizedBox(height: 16),
      ],
    );
  }
}
