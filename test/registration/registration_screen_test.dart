import 'package:flutter_test/flutter_test.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:recipe_app/feature/auth/presentation/view/registration_screen.dart';

void main() {
  group('Permission Handling', () {
    test('Should request camera permission when called', () async {
      final status = await Permission.camera.request();
      expect(status.isGranted || status.isDenied || status.isRestricted, true);
    });
  });
}
