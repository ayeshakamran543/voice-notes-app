part of 'edit_profile.dart';

class _ScreenState extends ChangeNotifier {
  static _ScreenState s(BuildContext context, [listen = false]) =>
      Provider.of<_ScreenState>(context, listen: listen);

  final formKey = GlobalKey<FormBuilderState>();

  bool _isUploadingImage = false;

  bool get isUploadingImage => _isUploadingImage;

  void setUploadingImage(bool value) {
    _isUploadingImage = value;
    notifyListeners();
  }
}
