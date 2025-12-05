import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:movies_app/core/config/app_color.dart';
import 'package:movies_app/features/auth/presentation/managers/phone_auth_cubit/phone_auth_cubit.dart';

class PhoneNumberInput extends HookWidget {
  const PhoneNumberInput({super.key});

  @override
  Widget build(BuildContext context) {
    final phoneFormKey = useMemoized(() => GlobalKey<FormState>());
    final phoneNumber = useRef<PhoneNumber?>(null);
    final sendSms = useCallback(() async {
      if (phoneFormKey.currentState!.validate()) {
        phoneFormKey.currentState!.save();
        if (phoneNumber.value != null) {
          await context.read<PhoneAuthCubit>().sendCode(
            phoneNumber.value!.phoneNumber!,
          );
        }
      }
    }, [phoneFormKey]);

    return Form(
      key: phoneFormKey,
      child: Column(
        children: [
          InternationalPhoneNumberInput(
            onSaved: (value) {
              phoneNumber.value = value;
            },
            onInputChanged: (value) {},
            selectorTextStyle: const TextStyle(color: AppColor.goldOrange),
            textStyle: const TextStyle(color: Colors.white),
            autoValidateMode: AutovalidateMode.onUserInteraction,
            initialValue: PhoneNumber(dialCode: "+20", isoCode: "EG"),
            selectorConfig: const SelectorConfig(
              selectorType: PhoneInputSelectorType.DIALOG,
              useEmoji: true,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(onPressed: sendSms, child: const Text('Send SMS')),
        ],
      ),
    );
  }
}
