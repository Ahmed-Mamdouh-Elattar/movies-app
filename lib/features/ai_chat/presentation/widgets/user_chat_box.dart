import 'package:flutter/material.dart';
import 'package:movies_app/core/config/app_color.dart';

class UserChatBox extends StatelessWidget {
  const UserChatBox({required this.message, super.key});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(left: 36, right: 16),

        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          color: AppColor.blue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),

            bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
        ),
        child: Text(message),
      ),
    );
  }
}
