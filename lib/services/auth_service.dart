import 'package:gelir_gider_app/model/app_user.dart';
import 'package:gelir_gider_app/services/api_service.dart';
import 'package:gelir_gider_app/services/storage_service.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService extends GetxService {
  late final StorageService _storageService;
  late final ApiService _apiService;
  late final GoogleSignIn _googleSignIn;

  final Rx<AppUser?> currentUser = Rx<AppUser?>(null);

  Future<AuthService> init() async {
    _storageService = Get.find<StorageService>();
    _apiService = Get.find<ApiService>();
    _googleSignIn = GoogleSignIn.instance;
    await _googleSignIn.initialize(serverClientId: ApiConstants.serverClientId);
    return this;
  }

  Future<GoogleSignInAccount?> signInWithGoogle() async {
    try {
      await _googleSignIn.signOut();

      final GoogleSignInAccount googleUser = await _googleSignIn.authenticate();
      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      print("google user: $googleUser");
      // print("google id token: ${googleAuth.idToken}");

      final response = await _apiService.post(
        ApiConstants.login,
        data: {"idToken": googleAuth.idToken},
      );
      if(googleAuth.idToken ==null) {
        print("id token alınamdı");
        return null ;
      }

      if (response.statusCode == 200) {
        await _storageService.setValue<String>(
          StorageKeys.userToken,
          response.data["token"],
        );
        print("JWT TOKEN ");
        print(response.data["token"]);
        print("JWT TOKEN");

        currentUser.value = AppUser.fromJson(response.data["user"]);
      }else{
        return null;
      }
      return googleUser;
    } on GoogleSignInException catch (e) {
      print("Google giriş hatası: ${e.code} - ${e.description}");
      return null;
    } catch (e) {
      currentUser.value= null;
      print("Beklenmeyen hata: $e");
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      await _storageService.remove(StorageKeys.userToken);
    } catch (e) {
      print("çıkış yapılırken hata çıktı $e");
    }
  }

  Future<AppUser?> getProfile() async {
    try {
      final response = await _apiService.get(ApiConstants.profile);
      if (response.statusCode == 200) {
        currentUser.value = AppUser.fromJson(response.data["user"]);
        return AppUser.fromJson(response.data);
      }
      return null;
    } catch (e) {
      print("get profile error $e");
      return null;
    }
  }

  Future<bool> isAuthenticated() async {
    try {
      final token = _storageService.getValue<String>(StorageKeys.userToken);
      if (token == null) {
        currentUser.value = null;
        return false;
      }
      final response = await getProfile();
      if (response != null) {
        currentUser.value = response;
        return true;
      }
      return false;
    } catch (e) {
      await _storageService.remove(StorageKeys.userToken);
      currentUser.value = null;
      return false;
    }
  }
}
