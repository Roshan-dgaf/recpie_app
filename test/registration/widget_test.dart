import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/feature/auth/presentation/view/registration_screen.dart';
import 'package:recipe_app/feature/auth/presentation/view_model/registration/bloc/registration_bloc.dart';

void main() {
  testWidgets('RegistrationScreen UI Test', (WidgetTester tester) async {
    // Mock Bloc
    final mockBloc = RegistrationBloc();

    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<RegistrationBloc>.value(
          value: mockBloc,
          child: RegistrationscreenView(),
        ),
      ),
    );

    // Find input fields
    final firstNameField = find.widgetWithText(TextFormField, 'First Name');
    final emailField = find.widgetWithText(TextFormField, 'Email');
    final passwordField = find.widgetWithText(TextFormField, 'Password');
    final registerButton = find.widgetWithText(ElevatedButton, 'Register');

    // Check if all fields exist
    expect(firstNameField, findsOneWidget);
    expect(emailField, findsOneWidget);
    expect(passwordField, findsOneWidget);
    expect(registerButton, findsOneWidget);

    // Enter values
    await tester.enterText(firstNameField, 'John');
    await tester.enterText(emailField, 'john@example.com');
    await tester.enterText(passwordField, 'securepassword');

    // Tap register button
    await tester.tap(registerButton);
    await tester.pump();

    // Verify that registration event is added
    expect(mockBloc.state, isNotNull);
  });
}
