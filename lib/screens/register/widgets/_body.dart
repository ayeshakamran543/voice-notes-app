part of '../register.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final screenState = _ScreenState.s(context, true);

    Future<void> register() async {
      if (screenState.formKey.currentState?.saveAndValidate() ?? false) {
        final values = screenState.formKey.currentState!.value;
        final fullName = values[_FormKeys.fullName];
        final email = values[_FormKeys.email];
        final password = values[_FormKeys.password];
        final confirmPassword = values[_FormKeys.confirmPassword];

        if (password != confirmPassword) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Passwords do not match.')),
          );
          return;
        }

        try {
          await AuthService().registerWithEmail(email, password, fullName);

          // Set display name after registration
          final user = FirebaseAuth.instance.currentUser;
          if (user != null) {
            await user.updateDisplayName(fullName);
          }

          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Registration successful!')),
          );

          // ignore: use_build_context_synchronously
          Navigator.pushNamed(context, '/login');
        } catch (e) {
          ScaffoldMessenger.of(
            // ignore: use_build_context_synchronously
            context,
          ).showSnackBar(SnackBar(content: Text(e.toString())));
        }
      }
    }

    Future<void> googleRegister() async {
      try {
        await AuthService().signInWithGoogle();
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
                  Space.yf(60),
                  Text('Register', style: AppText.h1b),
                  Space.yf(16),
                  Text(
                    'And start taking notes',
                    style: AppText.b2!.cl(AppTheme.c.neutralBaseGrey!),
                  ),
                  Space.yf(32),
                  AppTextField(
                    name: _FormKeys.fullName,
                    label: 'Full Name',
                    hint: 'Example: John Doe',
                    isPass: false,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(3),
                    ]),
                  ),
                  Space.yf(16),
                  AppTextField(
                    name: _FormKeys.email,
                    label: 'Email Address',
                    hint: 'Example: johndoe@gmail.com',
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email(),
                    ]),
                    isPass: false,
                  ),
                  Space.yf(16),
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
                  Space.yf(16),
                  AppTextField(
                    name: _FormKeys.confirmPassword,
                    label: 'Confirm Password',
                    hint: '**********',
                    isPass: true,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(6),
                    ]),
                  ),
                  Space.yf(32),
                  AppButton(label: 'Register', onPressed: register),
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
                    onPressed: googleRegister,
                    buttonType: ButtonType.outlineIcon,
                    iconPath: 'assets/svgs/google.svg',
                  ),
                  Space.yf(32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: AppText.b2!.cl(AppTheme.c.neutralDarkGrey!),
                      ),
                      SizedBox(width: 8),
                      GestureDetector(
                        onTap: () => {Navigator.pushNamed(context, '/login')},
                        child: Text(
                          'Login',
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
