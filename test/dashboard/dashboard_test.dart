import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:recipe_app/feature/auth/presentation/view_model/profile/bloc/profile_bloc.dart';
import 'package:recipe_app/screens/dashboard_page.dart';

class MockProfileBloc extends MockBloc<ProfileState> implements ProfileBloc {}

void main() {
  late MockProfileBloc mockProfileBloc;

  setUp(() {
    mockProfileBloc = MockProfileBloc();
  });

  Widget createTestWidget() {
    return MaterialApp(
      home: BlocProvider<ProfileBloc>.value(
        value: mockProfileBloc,
        child: const DashboardPage(),
      ),
    );
  }

  testWidgets(
    'DashboardPage displays loading indicator when state is loading',
    (WidgetTester tester) async {
      when(
        mockProfileBloc.state,
      ).thenReturn(ProfileState(isLoading: true, user: null));

      await tester.pumpWidget(createTestWidget());

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    },
  );

  testWidgets('DashboardPage displays user info when user is available', (
    WidgetTester tester,
  ) async {
    when(mockProfileBloc.state).thenReturn(
      ProfileState(
        isLoading: false,
        user: User(
          username: 'TestUser',
          email: 'test@example.com',
          image: 'test.jpg',
        ),
      ),
    );

    await tester.pumpWidget(createTestWidget());

    expect(find.text('TestUser'), findsOneWidget);
    expect(find.text('test@example.com'), findsOneWidget);
  });

  testWidgets('DashboardPage displays recipe list', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(createTestWidget());

    expect(find.text('Yomari'), findsOneWidget);
    expect(find.text('Kimchi'), findsOneWidget);
    expect(find.text('Salad'), findsOneWidget);
    expect(find.text('Butter Chicken'), findsOneWidget);
  });

  testWidgets('Tapping on See More navigates to RecipeDetailsPage', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(createTestWidget());

    await tester.tap(find.text('See More').first);
    await tester.pumpAndSettle();

    expect(find.byType(RecipeDetailsPage), findsOneWidget);
  });
}
