import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/config/app_color.dart';
import 'package:movies_app/core/utils/app_toast.dart';
import 'package:movies_app/features/auth/presentation/managers/phone_auth_cubit/phone_auth_cubit.dart';
import 'package:pinput/pinput.dart';

class OtpInput extends StatefulWidget {
  const OtpInput({super.key});

  @override
  State<OtpInput> createState() => _OtpInputState();
}

class _OtpInputState extends State<OtpInput> {
  final _otpFormKey = GlobalKey<FormState>();
  final _otpFieldController = TextEditingController();

  @override
  void dispose() {
    _otpFieldController.dispose();
    super.dispose();
  }

  void _verifyOtp() async {
    if (_otpFormKey.currentState!.validate() &&
        _otpFieldController.text.length == 6) {
      await context.read<PhoneAuthCubit>().verifyCode(_otpFieldController.text);
    } else {
      showAppToast(context, "Enter valid OTP");
    }
  }

  final defaultPinTheme = PinTheme(
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
  );

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _otpFormKey,
      child: Column(
        children: [
          Pinput(
            length: 6,
            controller: _otpFieldController,
            defaultPinTheme: defaultPinTheme,
            showCursor: true,
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: _verifyOtp,
            child: const Text('Verify OTP'),
          ),
        ],
      ),
    );
  }
}