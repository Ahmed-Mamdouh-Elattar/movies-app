import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:movies_app/core/config/app_color.dart';
import 'package:movies_app/core/utils/app_toast.dart';
import 'package:movies_app/features/auth/presentation/managers/phone_auth_cubit/phone_auth_cubit.dart';
import 'package:pinput/pinput.dart';

class OtpInput extends HookWidget {
  const OtpInput({super.key});

  @override
  Widget build(BuildContext context) {
    final otpFormKey = useMemoized(() => GlobalKey<FormState>());
    final otpFieldController = useTextEditingController();

    final verifyOtp = useCallback(() async {
      if (otpFormKey.currentState!.validate() &&
          otpFieldController.text.length == 6) {
        await context.read<PhoneAuthCubit>().verifyCode(
          otpFieldController.text,
          context.read<PhoneAuthCubit>().verificationId,
        );
      } else {
        showAppToast(context, "Enter valid OTP");
      }
    }, [otpFormKey, otpFieldController]);

    final defaultPinTheme = useMemoized(
      () => PinTheme(
        width: 56,
        height: 56,
        textStyle: const TextStyle(
          fontSize: 20,
          color: AppColor.goldOrange,
          fontWeight: FontWeight.w600,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );

    return Form(
      key: otpFormKey,
      child: Column(
        children: [
          Pinput(
            length: 6,
            controller: otpFieldController,
            defaultPinTheme: defaultPinTheme,
            showCursor: true,
          ),
          const SizedBox(height: 32),
          ElevatedButton(onPressed: verifyOtp, child: const Text('Verify OTP')),
        ],
      ),
    );
  }
}
