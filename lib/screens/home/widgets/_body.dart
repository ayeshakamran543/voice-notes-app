part of '../home.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.c.primaryBase,
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await AuthService().signOut();
              Navigator.pushNamedAndRemoveUntil(
                // ignore: use_build_context_synchronously
                context,
                '/login',
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: Space.hf(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Space.xm!,

              Text(
                'Welcome to Noteee',
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
