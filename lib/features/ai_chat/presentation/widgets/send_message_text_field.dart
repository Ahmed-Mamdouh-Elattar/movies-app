import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:movies_app/core/config/app_color.dart';
import 'package:movies_app/features/ai_chat/domain/entities/chat_entity.dart';
import 'package:movies_app/features/ai_chat/presentation/managers/cubit/ai_chat_cubit.dart';

class SendMessageTextField extends HookWidget {
  const SendMessageTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final messageController = useTextEditingController();

    final sendMessage = useCallback(() {
      if (messageController.text.isNotEmpty) {
        context.read<AiChatCubit>().getAIChatResponse(
          ChatEntity(message: messageController.text, isUser: true),
        );
        FocusScope.of(context).unfocus();
        messageController.clear();
      }
    }, [messageController]);

    return Row(
      children: [
        const SizedBox(width: 8),
        Expanded(
          child: TextField(
            controller: messageController,
            onSubmitted: (_) => sendMessage(),
            decoration: InputDecoration(
              hintText: "Talk To AI Chat Bot",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
          onPressed: sendMessage,
          icon: const Icon(Icons.send, color: AppColor.blue),
        ),
      ],
    );
  }
}
