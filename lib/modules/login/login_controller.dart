import 'package:gelir_gider_app/routes/app_pages.dart';
import 'package:gelir_gider_app/services/auth_service.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late final AuthService _authService;

  @override
  void onInit() {
    super.onInit();
    _authService = Get.find<AuthService>();
  }

  Future<void> googleIleGirisYap() async {
    final account = await _authService.signInWithGoogle();
    if (account != null) {
      print("Giriş başarılı: ${account.email}");
      Get.offAllNamed(AppRoutes.HOME);
      // backend'e idToken gönderme vs. burada yapılabilir
    } else {
      print("Giriş yapılamadı veya iptal edildi");
    }
  }
}