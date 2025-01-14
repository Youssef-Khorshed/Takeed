import 'package:takeed/core/Strings/appStrings.dart';
import 'package:takeed/core/utils/secure_storage_helper.dart';

abstract class SecureToken {
  static SecureStorageHelper secureStorageHelper = SecureStorageHelper();
  static addToken(String token) async {
    await secureStorageHelper.writeValue(Appstrings.kToken, token);
  }

  static Future<String?> getToken() async {
    return await secureStorageHelper.readValue(Appstrings.kToken);
  }

  static deleteToken() async {
    await secureStorageHelper.deleteValue(Appstrings.kToken);
  }
}
