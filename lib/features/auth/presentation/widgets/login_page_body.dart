import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';
import 'package:movies_app/core/config/app_text_style.dart';
import 'package:movies_app/core/helper/assets.dart';
import 'package:movies_app/core/routing/page_name.dart';
import 'package:movies_app/core/utils/app_toast.dart';
import 'package:movies_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:movies_app/features/auth/presentation/widgets/custom_elevated_button.dart';

class LoginPageBody extends StatelessWidget {
  const LoginPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        switch (state) {
          case Failure(:final message):
            showAppToast(context, message);
            break;
          case Loading():
            break;
          case Success():
            context.push(PageName.home);

            break;
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomElevatedButton(
              onPressed: () async {
                await context.read<AuthCubit>().signInOrUpWithFacebook();
              },
              isSvg: true,
              icon: Assets.iconsFacebook,
              label: 'Login with Facebook',
            ),
            const SizedBox(height: 16),
            CustomElevatedButton(
              onPressed: () async {
                await context.read<AuthCubit>().signInOrUpWithGoogle();
              },
              isSvg: true,
              icon: Assets.iconsGoogle,
              label: 'Login with Google',
            ),
            const SizedBox(height: 16),
            CustomElevatedButton(
              onPressed: () {},
              icon: Icons.phone,
              label: 'Login with Phone Number',
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: AppTextStyle.regular16(
                    context,
                  ).copyWith(color: Colors.white),
                ),
                TextButton(
                  onPressed: () {
                    context.push(PageName.register);
                  },
                  child: Text(
                    'Sign up',
                    style: AppTextStyle.semiBold16(context),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
