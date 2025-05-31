part of '../login.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final screenState = _ScreenState.s(context, true);

    Future<void> login() async {
      if (screenState.formKey.currentState?.saveAndValidate() ?? false) {
        final values = screenState.formKey.currentState!.value;
        final email = values[_FormKeys.email];
        final password = values[_FormKeys.password];

        try {
          await AuthService().signInWithEmail(email, password);
          // Navigate to home screen after successful login
          // ignore: use_build_context_synchronously
          Navigator.pushReplacementNamed(context, '/home');
        } catch (e) {
          ScaffoldMessenger.of(
            // ignore: use_build_context_synchronously
            context,
          ).showSnackBar(SnackBar(content: Text(e.toString())));
        }
      }
    }

    Future<void> googleLogin() async {
      try {
        await AuthService().signInWithGoogle();
        // Navigate to home screen after successful Google login
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, '/home');
      } catch (e) {
        ScaffoldMessenger.of(
          // ignore: use_build_context_synchronously
          context,
        ).showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }

    return Scaffold(
      backgroundColor: AppTheme.c.neutralWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: Space.hf(16),
            child: FormBuilder(
              key: screenState.formKey,
              initialValue: _FormData.initialValues(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Space.yf(91),
                  Text('Let’s Login', style: AppText.h1b),
                  Space.yf(16),
                  Text(
                    'And notes your idea',
                    style: AppText.b2!.cl(AppTheme.c.neutralBaseGrey!),
                  ),
                  Space.yf(32),
                  AppTextField(
                    name: _FormKeys.email,
                    label: 'Email Address',
                    hint: 'Example: johndoe@gmail.com',
                    isPass: false,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email(),
                    ]),
                  ),
                  Space.yf(32),
                  AppTextField(
                    name: _FormKeys.password,
                    label: 'Password',
                    hint: '**********',
                    isPass: true,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(6),
                    ]),
                  ),
                  Space.yf(12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/forgot-password');
                        },
                        child: Text(
                          'Forgot Password',
                          style: AppText.b1bm!
                              .cl(AppTheme.c.primaryBase!)
                              .copyWith(decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                  Space.yf(32),
                  AppButton(label: 'Login', onPressed: login),
                  Space.yf(16),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(color: AppTheme.c.neutralLightGrey!),
                      ),
                      Space.xf(8),
                      Text(
                        'Or',
                        style: AppText.l1!.cl(AppTheme.c.neutralDarkGrey!),
                      ),
                      Space.xf(8),
                      Expanded(
                        child: Divider(color: AppTheme.c.neutralLightGrey!),
                      ),
                    ],
                  ),
                  Space.yf(16),
                  AppButton(
                    label: 'Login with Google',
                    onPressed: googleLogin,
                    buttonType: ButtonType.outlineIcon,
                    iconPath: 'assets/svgs/google.svg',
                  ),
                  Space.yf(32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have an account?',
                        style: AppText.b2!.cl(AppTheme.c.neutralDarkGrey!),
                      ),

                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/register'),
                        child: Text(
                          'Register Here',
                          style: AppText.b2b!.cl(AppTheme.c.primaryBase!),
                        ),
                      ),
                    ],
                  ),
                  Space.yf(24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
