import 'package:bookly_clean_arch/core/utils/app_router.dart';
import 'package:bookly_clean_arch/core/utils/asset_data.dart';
import 'package:bookly_clean_arch/features/splash/presentation/views/widgets/slide_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slideAnimation;
  @override
  void initState() {
    super.initState();
    initslideanimation();
    navigateToHome();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetData.logo),
        SlideText(slideAnimation: slideAnimation),
      ],
    );
  }

  void initslideanimation() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    slideAnimation = Tween<Offset>(
      begin: Offset(0, 14),
      end: Offset(0, 0),
    ).animate(animationController);
    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(Duration(seconds: 2), () {
      GoRouter.of(context).push(AppRouter.kHomeView);
    });
  }
}
