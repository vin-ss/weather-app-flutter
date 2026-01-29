import 'package:flutter/material.dart';
import 'package:weather_app/core/const/app_const.dart';
import 'package:weather_app/core/func/app_routing.dart';
import 'package:weather_app/core/theme/colors.dart';
import 'package:weather_app/features/auth/presentation/pages/login_screen.dart';
import 'package:weather_app/features/auth/presentation/pages/signup_screen.dart';

class StartOrLoginScreen extends StatefulWidget {
  const StartOrLoginScreen({super.key});

  @override
  State<StartOrLoginScreen> createState() => _StartOrLoginScreenState();
}

class _StartOrLoginScreenState extends State<StartOrLoginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 16.0,
            ),
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 80),
                    Image.asset(AppConst.logo),
                    const SizedBox(height: 50.0),
                    Image.asset(AppConst.weather),
                    const SizedBox(height: 20.0),
                    Text(
                      'Know your weather',
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium!.copyWith(color: AppColors.white),
                    ),
                    const SizedBox(height: 40.0),
                    ElevatedButton(
                      onPressed: () {
                        AppRouting.pushAndRemoveUntilWithFadeTransition(
                          context,
                          const LoginScreen(),
                        );
                      },
                      child: const Text('Get Started'),
                    ),
                    const SizedBox(height: 30.0),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          AppRouting.pushAndRemoveUntilWithFadeTransition(
                            context,
                            const SignupScreen(),
                          );
                        },
                        child: Text(
                          'Create an account',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
