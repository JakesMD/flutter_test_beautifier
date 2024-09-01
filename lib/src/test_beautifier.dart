// ignore_for_file: non_constant_identifier_names

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
  var given = Given != null ? 'Given: $Given' : '';
  if (given.isNotEmpty && (When != null || Then != null)) given += ', ';

  var when = When != null ? 'When: $When' : '';
  if (when.isNotEmpty && Then != null) when += ', ';

  final then = Then != null ? 'Then: $Then' : '';

  return '$given$when$then';
}

/// A test body template for better formatting and readability.
dynamic Function() procedure(dynamic Function() body) => body;

/// A widget test callback template for better formatting and readability.
Future<void> Function(T) widgetsProcedure<T>(
  Future<void> Function(T) callback,
) =>
    callback;
