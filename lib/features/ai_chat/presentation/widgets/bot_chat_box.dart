import 'package:flutter/material.dart';

class BotChatBox extends StatelessWidget {
  const BotChatBox({required this.messsage, super.key});
  final String messsage;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(left: 16, right: 36),
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(24),

            bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
        ),
        child: Text(messsage),
      ),
    );
  }
}
