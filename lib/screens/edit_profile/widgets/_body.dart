part of '../edit_profile.dart';

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  AppUser? currentUser;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final doc =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    setState(() {
      currentUser = AppUser.fromMap(doc.data()!);
    });
  }

  Future<void> _saveChanges() async {
    final form = _ScreenState.s(context).formKey.currentState!;
    if (form.saveAndValidate()) {
      final values = form.value;
      final uid = FirebaseAuth.instance.currentUser!.uid;

      final updatedUser = AppUser(
        uid: uid,
        name: values[_FormKeys.fullName],
        email: values[_FormKeys.email],
        photoUrl: currentUser?.photoUrl,
        password: null,
      );

      try {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(uid)
            .update(updatedUser.toMap());

        ScaffoldMessenger.of(
          // ignore: use_build_context_synchronously
          context,
        ).showSnackBar(SnackBar(content: Text('Profile updated')));

        // ignore: use_build_context_synchronously
        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(
          // ignore: use_build_context_synchronously
          context,
        ).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    }
  }

  Future<void> pickAndUploadImage() async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      // ignore: use_build_context_synchronously
      final screenState = _ScreenState.s(context);
      screenState.setUploadingImage(true);

      try {
        final bytes = await File(image.path).readAsBytes();
        final base64Image = base64Encode(bytes);

        final uid = FirebaseAuth.instance.currentUser!.uid;

        await FirebaseFirestore.instance.collection('users').doc(uid).update({
          'photoUrl': base64Image,
        });

        setState(() {
          currentUser = currentUser?.copyWith(photoUrl: base64Image);
        });

        if (kDebugMode) {
          print("Image uploaded and user state updated.");
        }
      } catch (e) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(
          // ignore: use_build_context_synchronously
          context,
        ).showSnackBar(SnackBar(content: Text('Error uploading image: $e')));
      } finally {
        screenState.setUploadingImage(false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenState = _ScreenState.s(context, true);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
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
              child:
                  currentUser == null
                      ? const Center(child: CircularProgressIndicator())
                      : SingleChildScrollView(
                        child: Padding(
                          padding: Space.hf(16),
                          child: FormBuilder(
                            key: screenState.formKey,
                            child: Column(
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 60.r,
                                      backgroundColor: AppTheme.c.primaryLight,
                                      backgroundImage:
                                          currentUser?.photoUrl?.isNotEmpty ==
                                                  true
                                              ? MemoryImage(
                                                base64Decode(
                                                  currentUser!.photoUrl!,
                                                ),
                                              )
                                              : null,

                                      child:
                                          currentUser?.photoUrl?.isEmpty ==
                                                      true ||
                                                  currentUser?.photoUrl == null
                                              ? Icon(
                                                Icons.person,
                                                size: 60.r,
                                                color: AppTheme.c.neutralWhite,
                                              )
                                              : null,
                                    ),
                                    if (screenState.isUploadingImage)
                                      Positioned.fill(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.black.withValues(
                                              alpha: 0.4,
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: CircularProgressIndicator(
                                              color: AppTheme.c.primaryBase,
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),

                                Space.yf(16),

                                GestureDetector(
                                  onTap: pickAndUploadImage,
                                  child: Container(
                                    padding: Space.all(16, 9),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40.r),
                                      border: Border.all(
                                        color: AppTheme.c.primaryBase!,
                                        width: 1,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
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
                                ),

                                Space.yf(24),

                                Divider(color: AppTheme.c.neutralLightGrey),

                                Space.yf(24),

                                AppTextField(
                                  name: _FormKeys.fullName,
                                  label: 'Full Name',
                                  initialValue: currentUser!.name,
                                  textInputType: TextInputType.name,
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(),
                                    FormBuilderValidators.minLength(3),
                                  ]),
                                ),

                                Space.yf(32),

                                AppTextField(
                                  name: _FormKeys.email,
                                  label: 'Email Address',
                                  initialValue: currentUser!.email,
                                  textInputType: TextInputType.emailAddress,
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(),
                                    FormBuilderValidators.email(),
                                  ]),
                                  helperText:
                                      'Changing email means you need to re-login to the app.',
                                ),

                                Space.yf(80),

                                AppButton(
                                  label: 'Save Changes',
                                  onPressed: _saveChanges,
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
