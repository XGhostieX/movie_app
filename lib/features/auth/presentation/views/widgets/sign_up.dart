import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:reactive_button/reactive_button.dart';

// import '../../../../../core/models/auth.dart';
import '../../../../../core/theme/app_colors.dart';
// import '../../../../../core/usecases/signup_usecase.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../core/utils/functions/display_message.dart';
// import '../../../../../core/utils/service_locator.dart';
import '../../../../home/presentation/views/home_view.dart';
import 'sign_in.dart';

class SignUp extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 200, right: 16, left: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Sign Up',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(hintText: 'Email'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(hintText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 60),
            ReactiveButton(
              title: 'Sign Up',
              activeColor: AppColors.primary,
              // onPressed: () async => await getIt<SignupUsecase>().call(
              //   params: Auth(
              //     email: _emailController.text,
              //     password: _passwordController.text,
              //   ),
              // ),
              onPressed: () async =>
                  AppNavigator.pushAndRemove(context, const HomeView()),
              onSuccess: () =>
                  AppNavigator.pushAndRemove(context, const HomeView()),
              onFailure: (error) => displayMessage(error, context),
            ),
            const SizedBox(height: 20),
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(text: 'Already Have An Account ?'),
                  TextSpan(
                    text: '  Sign In',
                    style: const TextStyle(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => AppNavigator.push(context, SignIn()),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
