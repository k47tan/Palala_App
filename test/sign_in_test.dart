import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:palala/firebase_options.dart';
import 'package:palala/views/view_sign_in.dart';

void main() {
  setUpAll(
    () async {
      // Load environment variables
      await dotenv.load(fileName: "lib/.env");

      // Initialize Firebase before tests start
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    },
  );

  testWidgets(
    "Sign In View Test",
    (WidgetTester tester) async {
      await tester.pumpWidget(
        SignInView(),
      );

      // Your test assertions...
      expect(find.text('Sign In'), findsOneWidget);
      expect(find.text('Sign in with'), findsOneWidget);
      expect(find.text('Don\'t have an account?'), findsOneWidget);
      expect(find.text('Sign up now'), findsOneWidget);

      expect(find.byType(IconButton), findsOneWidget);
      expect(find.byType(GestureDetector), findsOneWidget);

      await tester.tap(find.byType(GestureDetector));
      await tester.pump();

      expect(find.text('Sign up now'), findsOneWidget);

      await tester.tap(find.byType(IconButton));
      await tester.pump();
    },
  );
}
