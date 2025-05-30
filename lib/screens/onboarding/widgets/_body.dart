part of '../onboarding.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.c.primaryBase,
      body: SafeArea(
        child: Padding(
          padding: Space.hf(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Space.xm!,
              Image.asset(
                'assets/svgs/onboarding.png',
                width: 280.w,
                height: 280.h,
              ),
              Space.yf(24),
              Text(
                'Jot Down anything you want to achieve, today or in the future',
                style: AppText.h3b!.cl(AppTheme.c.neutralWhite!),
                textAlign: TextAlign.center,
              ),
              Space.xm!,
              AppButton(
                label: 'Let’s Get Started',
                buttonType: ButtonType.secondary,
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
              ),
              Space.yf(84),
            ],
          ),
        ),
      ),
    );
  }
}
