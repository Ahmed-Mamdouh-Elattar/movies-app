import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/config/app_color.dart';
import 'package:movies_app/features/ai_chat/domain/entities/chat_entity.dart';
import 'package:movies_app/features/ai_chat/presentation/managers/cubit/ai_chat_cubit.dart';

class SendMessageTextField extends StatefulWidget {
  const SendMessageTextField({super.key});

  @override
  State<SendMessageTextField> createState() => _SendMessageTextFieldState();
}

class _SendMessageTextFieldState extends State<SendMessageTextField> {
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 8),
        Expanded(
          child: TextField(
            controller: _messageController,
            onSubmitted: (value) {
              context.read<AiChatCubit>().getAIChatResponse(
                ChatEntity(message: value, isUser: true),
              );
              FocusScope.of(context).unfocus();

              _messageController.clear();
            },
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
          onPressed: () {
            context.read<AiChatCubit>().getAIChatResponse(
              ChatEntity(message: _messageController.text, isUser: true),
            );
            FocusScope.of(context).unfocus();

            _messageController.clear();
          },
          icon: const Icon(Icons.send, color: AppColor.blue),
        ),
      ],
    );
  }
}
