part of '../edit_profile.dart';

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
                  Space.xf(70),
                  Text('Edit Profile', style: AppText.b1bm),
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
                      children: [
                        CircleAvatar(
                          radius: 60.r,
                          backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1501196354995-cbb51c65aaea?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                          ),
                        ),

                        Space.yf(16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: Space.all(16, 9),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.r),
                                border: Border.all(
                                  color: AppTheme.c.primaryBase!,
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/svgs/pencil-alt.svg',
                                    width: 20.w,
                                    height: 20.h,
                                  ),

                                  Space.xf(8),
                                  Text(
                                    'Change Image',
                                    style: AppText.b2b!.cl(
                                      AppTheme.c.primaryBase!,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Space.yf(24),
                        Container(
                          height: 1.h,
                          width: double.infinity,
                          color: AppTheme.c.neutralLightGrey,
                        ),
                        Space.yf(24),
                        AppTextField(
                          label: 'Full Name',

                          initialValue: 'Michael Antonio',
                          textInputType: TextInputType.name,
                          name: '',
                        ),
                        Space.yf(32),
                        AppTextField(
                          label: 'Email Address',
                          initialValue: 'anto_michael@gmail.com',
                          textInputType: TextInputType.emailAddress,
                          name: '',
                          helperText:
                              'Changing email address information means you need to re-login to the app.',
                        ),
                        Space.yf(80),
                        AppButton(
                          label: 'Save Changes',
                          onPressed: () {
                            // Handle save changes
                          },
                          width: double.infinity,
                          height: 56.h,
                          buttonType: ButtonType.primary,
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
