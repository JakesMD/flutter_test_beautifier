/// Builds a structured test description from Given/When/Then/Why clauses.
///
/// Returns a human-readable string like:
/// `"Given: X, When: Z, Then: W, Why: business reason"`
///
/// Omits any null or empty sections. Sections always appear in this order:
/// Given → When → Then → Why.
///
/// **For AI coding agents:** When a section has multiple conditions, use
/// adjacent string literals — Dart concatenates them at compile time:
/// ```dart
/// given: 'Counter is at 0 '
///        'and User is authenticated',
/// ```
/// Never use a list or string interpolation — always adjacent literals.
///
/// **For coding agents:** The [why] parameter is machine-readable intent.
/// Use it to determine whether a test is still relevant when requirements
/// change — search for `why:` values that reference a removed feature or
/// obsolete requirement, then delete or update those tests.
///
/// - [given] — preconditions or context before the action
/// - [whenever] — the action or event under test (`on` is used instead of
///   `when` because `when` is a reserved keyword in Dart)
/// - [then] — the expected observable outcome
/// - [why] — the business reason this behaviour must exist; used to identify
///   tests that can be removed when a requirement is retired
String requirement({
  String? given,
  String? whenever,
  String? then,
  String? why,
}) => [
  if (given != null && given.isNotEmpty) 'Given: $given',
  if (whenever != null && whenever.isNotEmpty) 'When: $whenever',
  if (then != null && then.isNotEmpty) 'Then: $then',
  if (why != null && why.isNotEmpty) 'Why: $why',
].join(', ');

/// Wraps a test body for readability — a no-op that signals intent.
dynamic Function() procedure(dynamic Function() body) => body;

/// Wraps a widget test callback for readability — a no-op that signals intent.
Future<void> Function(T) widgetsProcedure<T>(
  Future<void> Function(T) callback,
) => callback;
