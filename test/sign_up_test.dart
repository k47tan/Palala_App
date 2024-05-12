// // signu test
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:palala/views/view_sign_up.dart';

// void main() {
//   testWidgets(
//     "Sign Up View Test",
//     (widgetTester) async {
//       await widgetTester.pumpWidget(
//         MaterialApp(
//           home: SignUpView(),
//         ),
//       );

//       final signUpText = find.text('Sign Up');
//       final signUpWithText = find.text('Sign up with');
//       final signInText = find.text('Already have an account?');
//       final signInNowText = find.text('Sign in now');

//       expect(signUpText, findsOneWidget);
//       expect(signUpWithText, findsOneWidget);
//       expect(signInText, findsOneWidget);
//       expect(signInNowText, findsOneWidget);
//     },
//   );
// }
