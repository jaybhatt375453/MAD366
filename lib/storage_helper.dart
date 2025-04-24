import 'dart:io';
import 'package:path_provider/path_provider.dart';

class StorageHelper {
  static Future<void> saveLogin(String email, String password) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final path = '${directory.path}/logins.csv';
      final file = File(path);

      // If the file doesn't exist, write headers
      if (!await file.exists()) {
        await file.writeAsString('Email,Password\n');
      }

      // Append the email and password
      await file.writeAsString('$email,$password\n', mode: FileMode.append);

      print('Saved login to $path');
    } catch (e) {
      print('Error saving login: $e');
    }
  }
}
