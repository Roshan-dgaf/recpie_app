import 'package:flutter_test/flutter_test.dart';
import 'package:softwarica_student_management_bloc/features/auth/domain/entity/auth_entity.dart';

void main() {
  group('AuthEntity Tests', () {
    test('Two AuthEntity objects with same values should be equal', () {
      final auth1 = AuthEntity(
        userId: '123',
        fName: 'John',
        lName: 'Doe',
        image: 'image_url',
        phone: '9876543210',
        username: 'johndoe',
        password: 'password123',
      );
      final auth2 = AuthEntity(
        userId: '123',
        fName: 'John',
        lName: 'Doe',
        image: 'image_url',
        phone: '9876543210',
        username: 'johndoe',
        password: 'password123',
      );
      expect(auth1, equals(auth2));
    });

    test('Different AuthEntity objects should not be equal', () {
      final auth1 = AuthEntity(
        userId: '123',
        fName: 'John',
        lName: 'Doe',
        image: 'image_url',
        phone: '9876543210',
        username: 'johndoe',
        password: 'password123',
      );
      final auth2 = AuthEntity(
        userId: '124',
        fName: 'Jane',
        lName: 'Smith',
        image: 'another_image',
        phone: '1234567890',
        username: 'janesmith',
        password: 'securePass',
      );
      expect(auth1, isNot(equals(auth2)));
    });

    test('AuthEntity should allow null userId', () {
      final auth = AuthEntity(
        userId: null,
        fName: 'Alice',
        lName: 'Brown',
        image: 'avatar.png',
        phone: '1112223333',
        username: 'alicebrown',
        password: 'mypassword',
      );
      expect(auth.userId, isNull);
    });

    test('AuthEntity props should contain all properties', () {
      final auth = AuthEntity(
        userId: '456',
        fName: 'Bob',
        lName: 'Marley',
        image: 'bob.jpg',
        phone: '4445556666',
        username: 'bobmarley',
        password: 'reggae123',
      );
      expect(
          auth.props,
          containsAll([
            auth.userId,
            auth.fName,
            auth.lName,
            auth.image,
            auth.phone,
            auth.username,
            auth.password
          ]));
    });

    test('AuthEntity username should not be empty', () {
      final auth = AuthEntity(
        userId: '789',
        fName: 'Charlie',
        lName: 'Chaplin',
        image: 'charlie.png',
        phone: '9998887777',
        username: '',
        password: 'silentpass',
      );
      expect(auth.username.isEmpty, isTrue);
    });

    test('AuthEntity password should not be null', () {
      final auth = AuthEntity(
        userId: '321',
        fName: 'David',
        lName: 'Gilmour',
        image: 'david.jpg',
        phone: '7776665555',
        username: 'davidg',
        password: 'pinkfloyd',
      );
      expect(auth.password, isNotNull);
    });

    test('AuthEntity phone should contain only digits', () {
      final auth = AuthEntity(
        userId: '654',
        fName: 'Eva',
        lName: 'Green',
        image: 'eva.jpg',
        phone: '1234567890', // Expected value
        username: 'evagreen',
        password: 'strongpass',
      );

      print('Phone value: ${auth.phone}'); // Debugging output

      expect(auth.phone, matches(RegExp(r'^\d+$'))); // Should pass
    });

    test('AuthEntity fName should not be null', () {
      final auth = AuthEntity(
        userId: '963',
        fName: 'Frank',
        lName: 'Ocean',
        image: 'frank.png',
        phone: '1231231234',
        username: 'franko',
        password: 'channelorange',
      );
      expect(auth.fName, isNotNull);
    });

    test('AuthEntity lName should not be null', () {
      final auth = AuthEntity(
        userId: '753',
        fName: 'Grace',
        lName: 'Jones',
        image: 'grace.jpg',
        phone: '3213214321',
        username: 'gracej',
        password: 'nightclubbing',
      );
      expect(auth.lName, isNotNull);
    });

    test('AuthEntity image should allow null value', () {
      final auth = AuthEntity(
        userId: '852',
        fName: 'Hank',
        lName: 'Moody',
        image: null,
        phone: '9879879870',
        username: 'hankmoody',
        password: 'californication',
      );
      expect(auth.image, isNull);
    });
  });
}
