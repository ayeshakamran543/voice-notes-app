part of '../home.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Home"),
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.logout),
      //       onPressed: () async {
      //         await AuthService().signOut();
      //         Navigator.pushNamedAndRemoveUntil(
      //           // ignore: use_build_context_synchronously
      //           context,
      //           '/login',
      //           (route) => false,
      //         );
      //       },
      //     ),
      //   ],
      // ),
      floatingActionButton: Transform.scale(
        scale: 1.2,
        child: Container(
          margin: EdgeInsets.only(bottom: 10.h, right: 10.w),
          child: FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.r),
            ),
            backgroundColor: AppTheme.c.primaryBase,
            onPressed: () {
              Navigator.pushNamed(context, '/create-note');
            },
            child: SvgPicture.asset(
              'assets/svgs/add_note.svg',
              width: 24.w,
              height: 24.h,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      body: SafeArea(
        child: Padding(
          padding: Space.all(16, 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    'assets/svgs/logo.svg',
                    width: 85.w,
                    height: 30.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/setting');
                    },
                    child: SvgPicture.asset(
                      'assets/svgs/settings.svg',
                      width: 30.w,
                      height: 30.h,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
