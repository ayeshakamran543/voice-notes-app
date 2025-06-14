part of '../settings.dart';

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  AppUser? _appUser;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final user = await AuthService().getCurrentAppUser();
    setState(() {
      _appUser = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
            _appUser == null
                ? const Center(child: CircularProgressIndicator())
                : Column(
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
                                  style: AppText.b2!.cl(
                                    AppTheme.c.primaryBase!,
                                  ),
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
                              _appUser!.photoUrl != null
                                  ? CircleAvatar(
                                    radius: 32,
                                    backgroundImage: NetworkImage(
                                      _appUser!.photoUrl!,
                                    ),
                                  )
                                  : const CircleAvatar(
                                    radius: 32,
                                    child: Icon(Icons.person),
                                  ),
                              Space.xf(16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(_appUser!.name, style: AppText.h3b),
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
                                        _appUser!.email,
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
                                () => Navigator.pushNamed(
                                  context,
                                  '/change-password',
                                ),
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
                          GestureDetector(
                            onTap: () async {
                              await AuthService().signOut();
                              Navigator.pushNamedAndRemoveUntil(
                                // ignore: use_build_context_synchronously
                                context,
                                '/login',
                                (route) => false,
                              );
                            },
                            child: Row(
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
                                  style: AppText.b1bm!.cl(
                                    AppTheme.c.errorBase!,
                                  ),
                                ),
                              ],
                            ),
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
