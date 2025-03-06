import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:recipe_app/feature/auth/presentation/view/loginscreen_view.dart';
import 'package:recipe_app/feature/auth/presentation/view_model/login/bloc/login_bloc.dart';

// Mock LoginBloc
class MockLoginBloc extends Mock implements LoginBloc {}

void main() {
  late MockLoginBloc mockLoginBloc;

  setUp(() {
    mockLoginBloc = MockLoginBloc();
  });

  Widget createTestableWidget(Widget child) {
    return BlocProvider<LoginBloc>.value(
      value: mockLoginBloc,
      child: MaterialApp(home: child),
    );
  }

  testWidgets("Login screen UI renders correctly", (WidgetTester tester) async {
    await tester.pumpWidget(createTestableWidget(const LoginscreenView()));

    // Verify UI elements
    expect(find.text("RecipeMaster"), findsOneWidget);
    expect(find.text("Username"), findsOneWidget);
    expect(find.text("Password"), findsOneWidget);
    expect(find.text("LOGIN"), findsOneWidget);
    expect(find.text("Don't have an account?"), findsOneWidget);
  });

  testWidgets("Validation error when fields are empty", (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(createTestableWidget(const LoginscreenView()));

    await tester.tap(find.text("LOGIN"));
    await tester.pump();

    expect(find.text("Please enter username"), findsOneWidget);
    expect(find.text("Please enter password"), findsOneWidget);
  });

  testWidgets("Entering credentials enables login button", (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(createTestableWidget(const LoginscreenView()));

    await tester.enterText(find.byKey(const ValueKey('username')), "testUser");
    await tester.enterText(
      find.byKey(const ValueKey('password')),
      "password123",
    );

    await tester.tap(find.text("LOGIN"));
    await tester.pump();

    // No validation error messages should appear
    expect(find.text("Please enter username"), findsNothing);
    expect(find.text("Please enter password"), findsNothing);
  });

  testWidgets(
    "Clicking 'Don't have an account?' navigates to registration screen",
    (WidgetTester tester) async {
      await tester.pumpWidget(createTestableWidget(const LoginscreenView()));

      await tester.tap(find.text("Don't have an account?"));
      await tester.pumpAndSettle();

      expect(
        find.text("Registration"),
        findsOneWidget,
      ); // Verify navigation to registration screen
    },
  );
}
