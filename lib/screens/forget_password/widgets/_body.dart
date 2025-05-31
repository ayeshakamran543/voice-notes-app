part of '../forget_password.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final screenState = _ScreenState.s(context, true);
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
                  Space.yf(15),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: AppTheme.c.primaryBase,
                          size: 16,
                        ),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pushNamed(context, '/login'),
                        child: Text(
                          'Back to Login',
                          style: AppText.b2!.cl(AppTheme.c.primaryBase!),
                        ),
                      ),
                    ],
                  ),
                  Space.yf(32),
                  Text('Forgot Password', style: AppText.h1b),
                  Space.yf(16),
                  Text(
                    'Insert your email address to receive a code for creating a new password',
                    style: AppText.b2!.cl(AppTheme.c.neutralBaseGrey!),
                  ),
                  Space.yf(32),
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

                  Space.yf(64),
                  AppButton(
                    label: 'Send Email',
                    onPressed: () async {
                      if (screenState.formKey.currentState?.saveAndValidate() ??
                          false) {
                        final email =
                            screenState.formKey.currentState?.value[_FormKeys
                                .email];
                        try {
                          await AuthService().sendPasswordResetEmail(email);
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Password reset email sent to $email',
                              ),
                            ),
                          );
                          // ignore: use_build_context_synchronously
                          Navigator.pushNamed(context, '/login');
                        } catch (e) {
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Failed to send reset email: $e'),
                            ),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please enter a valid email'),
                          ),
                        );
                      }
                    },
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
