import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:movies_app/core/config/app_text_style.dart';
import 'package:movies_app/core/helper/assets.dart';
import 'package:movies_app/features/splash_screen/managers/cubit/splash_cubit.dart';

class SplashPageBodyContent extends HookWidget {
  const SplashPageBodyContent({super.key});

  @override
  Widget build(BuildContext context) {
    final imageAnimationController = useAnimationController(
      duration: const Duration(seconds: 2),
    );

    final textAnimationController = useAnimationController(
      duration: const Duration(milliseconds: 500),
    );

    final imageAnimation = useMemoized(
      () => Tween<Offset>(begin: const Offset(0, -5), end: Offset.zero).animate(
        CurvedAnimation(
          parent: imageAnimationController,
          curve: Curves.bounceOut,
        ),
      ),
      [imageAnimationController],
    );

    final fadeAnimation = useMemoized(
      () =>
          Tween<double>(begin: 0.0, end: 1.0).animate(textAnimationController),
      [textAnimationController],
    );

    useEffect(() {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

      imageAnimationController.forward().whenComplete(() {
        textAnimationController.forward().whenComplete(() {
          Future.delayed(const Duration(milliseconds: 800), () {
            if (context.mounted) {
              context.read<SplashCubit>().splashFinished();
            }
          });
        });
      });

      return () {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      };
    }, []);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SlideTransition(
            position: imageAnimation,
            child: Image.asset(Assets.iconsPopcorn),
          ),
          const SizedBox(height: 10),
          FadeTransition(
            opacity: fadeAnimation,
            child: Text(
              "Movies App",
              style: AppTextStyle.semiBold28(
                context,
              ).copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
