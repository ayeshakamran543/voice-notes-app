part of '../change_password.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final screenState = _ScreenState.s(context, true);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: Space.all(16),
              decoration: BoxDecoration(
                color: AppTheme.c.primaryBackground,

                border: Border(
                  bottom: BorderSide(
                    color: AppTheme.c.neutralLightGrey!,
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: AppTheme.c.primaryBase,
                          size: 16,
                        ),
                        Space.xf(8),
                        Text(
                          'Back',
                          style: AppText.b2!.cl(AppTheme.c.primaryBase!),
                        ),
                      ],
                    ),
                  ),
                  Space.xf(40),
                  Text('Change Password', style: AppText.b1bm),
                ],
              ),
            ),
            Space.yf(24),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: Space.hf(16),
                  child: FormBuilder(
                    key: screenState.formKey,
                    // initialValue: _FormData.initialValues(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Please input your current password first',
                          style: AppText.l1bm!.cl(AppTheme.c.primaryBase!),
                        ),
                        Space.yf(16),

                        AppTextField(
                          name: '_FormKeys.currentPassword',
                          label: 'Current Password',
                          hint: 'Enter your current password',
                          isPass: true,
                        ),
                        Space.yf(24),
                        Container(
                          height: 1.h,
                          width: double.infinity,
                          color: AppTheme.c.neutralLightGrey,
                        ),
                        Space.yf(24),
                        Text(
                          'Now, create your new password',
                          style: AppText.l1bm!.cl(AppTheme.c.primaryBase!),
                        ),
                        Space.yf(16),
                        AppTextField(
                          name: '_FormKeys.newPassword',
                          label: 'New Password',
                          hint: 'Enter your new password',
                          isPass: true,
                          helperText: 'Password should contain a-z, A-Z, 0-9',
                        ),
                        Space.yf(32),
                        AppTextField(
                          name: '_FormKeys.confirmNewPassword',
                          label: 'Confirm New Password',
                          hint: 'Re-enter your new password',
                          isPass: true,
                        ),
                        Space.yf(80),
                        AppButton(
                          label: 'Change Password',
                          onPressed: () {
                            // Handle change password logic
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
