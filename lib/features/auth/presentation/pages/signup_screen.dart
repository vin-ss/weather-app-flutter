import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/const/app_const.dart';
import 'package:weather_app/core/func/app_routing.dart';
import 'package:weather_app/core/theme/colors.dart';
import 'package:weather_app/core/utils/validators.dart';
import 'package:weather_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:weather_app/features/auth/presentation/pages/login_screen.dart';
import 'package:weather_app/features/location/domain/entity/user_location.dart';
import 'package:weather_app/features/location/domain/usecases/save_location_use_case.dart';
import 'package:weather_app/service_locator.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    countryController.dispose();
    cityController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) async {
          if (state is AuthError) {
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.redAccent,
                ),
              );
            }
          }
          if (state is AuthSuccess) {
            await sl<SaveLocationUseCase>()(
              UserLocation(
                city: cityController.text,
                country: countryController.text,
              ),
            );
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.greenAccent,
                ),
              );
              AppRouting.pushAndRemoveUntilWithFadeTransition(
                context,
                LoginScreen(),
              );
            }
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(AppConst.logo),
                    const SizedBox(height: 50.0),
                    Text(
                      'Sign up now',
                      style: Theme.of(context).textTheme.headlineLarge!
                          .copyWith(color: AppColors.white),
                    ),
                    const SizedBox(height: 40.0),
                    Form(
                      key: formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(hintText: 'Email'),
                              validator: Validators.validateEmail,
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              controller: countryController,
                              decoration: InputDecoration(hintText: 'Country'),
                              validator: Validators.validateCountry,
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              controller: cityController,
                              decoration: InputDecoration(hintText: 'City'),
                              validator: Validators.validateCity,
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              obscureText: true,
                              controller: passwordController,
                              decoration: InputDecoration(hintText: 'Password'),
                              validator: Validators.validateSimplePassword,
                            ),
                            const SizedBox(height: 20.0),
                            ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  log('Form is valid');
                                  context.read<AuthBloc>().add(
                                    AuthEventRegister(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    ),
                                  );
                                }
                              },
                              child: Text(
                                'Sign up',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(color: AppColors.white),
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            TextButton(
                              onPressed: () {
                                AppRouting.pushAndRemoveUntilWithFadeTransition(
                                  context,
                                  LoginScreen(),
                                );
                              },
                              child: Text(
                                'Login',
                                style: Theme.of(context).textTheme.labelMedium!
                                    .copyWith(fontWeight: .bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
