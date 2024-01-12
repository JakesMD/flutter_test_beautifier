// ignore_for_file: non_constant_identifier_names

import 'package:flutter_test/flutter_test.dart';

/// A test description template for better formatting and readability.
///
/// Given: The setup or context of the test case.
/// When: The action or procedure under test.
/// Then: The expected result or outcome of the test.
///
/// Organizes and reformats the description of a test case. Parameter names are
/// kept capitalized to avoid issues with the keyword 'when'.
String requirement({
  String? Given,
  String? When,
  String? Then,
}) {
  return 'Given: $Given, When: $When, Then: $Then';
}

/// A test body template for better formatting and readability.
dynamic Function() procedure(dynamic Function() body) => body;

/// A widget test callback template for better formatting and readability.
Future<void> Function(WidgetTester) widgetsProcedure(
  Future<void> Function(WidgetTester) callback,
) {
  return callback;
}
