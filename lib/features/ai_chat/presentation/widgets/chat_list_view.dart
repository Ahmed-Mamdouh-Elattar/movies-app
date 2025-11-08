import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/ai_chat/domain/entities/chat_entity.dart';
import 'package:movies_app/features/ai_chat/presentation/managers/cubit/ai_chat_cubit.dart';
import 'package:movies_app/features/ai_chat/presentation/widgets/bot_chat_box.dart';
import 'package:movies_app/features/ai_chat/presentation/widgets/chat_status_indicator__builder.dart';
import 'package:movies_app/features/ai_chat/presentation/widgets/user_chat_box.dart';

class ChatListView extends StatefulWidget {
  const ChatListView({required this.chatMessages, super.key});
  final List<ChatEntity> chatMessages;

  @override
  State<ChatListView> createState() => _ChatListViewState();
}

class _ChatListViewState extends State<ChatListView> {
  final ScrollController _scrollController = ScrollController();
  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AiChatCubit, AiChatState>(
      listener: (context, state) {
        _scrollToBottom();
      },
      child: ListView.separated(
        controller: _scrollController,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemCount: widget.chatMessages.length + 1,
        itemBuilder: (context, index) {
          if (index == widget.chatMessages.length) {
            return const ChatStatusIndicatorBuilder();
          }
          final chatMessage = widget.chatMessages[index];
          if (chatMessage.isUser) {
            return UserChatBox(message: chatMessage.message);
          } else {
            return BotChatBox(messsage: chatMessage.message);
          }
        },
      ),
    );
  }
}
