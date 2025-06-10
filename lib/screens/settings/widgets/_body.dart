part of '../settings.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
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
                  Text('Settings', style: AppText.b1bm),
                ],
              ),
            ),
            Space.yf(24),
            Padding(
              padding: Space.hf(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 32.r,
                        backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1501196354995-cbb51c65aaea?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        ),
                      ),
                      Space.xf(16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Michael Antonio', style: AppText.h3b),
                          Space.yf(4),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/svgs/mail.svg',
                                width: 16.w,
                                height: 16.h,
                              ),
                              Space.xf(8),
                              Text(
                                "anto_michael@gmail.com",
                                style: AppText.l1!.cl(
                                  AppTheme.c.neutralDarkGrey!,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Space.yf(32),
                  AppButton(
                    label: 'Edit Profile',
                    onPressed: () {
                      Navigator.pushNamed(context, '/edit-profile');
                    },
                    buttonType: ButtonType.outlineIcon,
                    iconPath: 'assets/svgs/pencil-alt.svg',
                    backgroundColor: AppTheme.c.primaryBackground,
                    borderColor: AppTheme.c.primaryBase,
                    textColor: AppTheme.c.primaryBase,
                  ),
                  Space.yf(24),
                  Container(
                    height: 1.h,
                    width: double.infinity,
                    color: AppTheme.c.neutralLightGrey,
                  ),
                  Space.yf(24),
                  Text(
                    'App Settings'.toUpperCase(),
                    style: AppText.l2!.cl(AppTheme.c.neutralDarkGrey!),
                  ),
                  Space.yf(8),
                  SettingRow(
                    title: 'Change Password',
                    type: RowType.navigation,
                    iconPath: 'assets/svgs/lock-closed.svg',
                    onTap:
                        () => Navigator.pushNamed(context, '/change-password'),
                  ),
                  SettingRow(
                    title: 'Text Size',
                    type: RowType.action,
                    iconPath: 'assets/svgs/text-size.svg',
                    trailingText: 'Medium',
                  ),
                  SettingRow(
                    title: 'Notifications',
                    type: RowType.action,
                    iconPath: 'assets/svgs/bell.svg',
                    trailingText: 'Active',
                  ),
                  Space.yf(8),
                  Container(
                    height: 1.h,
                    width: double.infinity,
                    color: AppTheme.c.neutralLightGrey,
                  ),
                  Space.yf(24),
                  Row(
                    children: [
                      Space.xf(8),
                      SvgPicture.asset(
                        'assets/svgs/logout.svg',
                        width: 24.w,
                        height: 24.h,
                      ),
                      Space.xf(12),
                      Text(
                        'Logout',
                        style: AppText.b1bm!.cl(AppTheme.c.errorBase!),
                      ),
                    ],
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
