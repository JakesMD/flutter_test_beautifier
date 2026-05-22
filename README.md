# Test Beautifier

[![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg)](https://pub.dev/packages/very_good_analysis)

Transforms test descriptions into structured, readable Given/When/Then/Why
format — for humans and coding agents alike.

## Getting started

Install as a dev dependency:

```
dart pub add dev:test_beautifier
```

Import in your test files:

```dart
import 'package:test_beautifier/test_beautifier.dart';
```

## Usage

### `requirement()`

Builds a structured test description string. Sections appear in order: **Given →
When → Then → Why**. Null or empty sections are omitted.

```dart
test(
  requirement(
    given: 'User is not logged in',
    whenever: 'User submits valid credentials',
    then: 'session token is returned',
  ),
  procedure(() {
    final auth = AuthService();
    final result = auth.login('user@example.com', 'correct-password');
    expect(result.token, isNotEmpty);
  }),
);
// → "Given: User is not logged in, When: User submits valid credentials, Then: session token is returned"
```

Use adjacent string literals to split long conditions across lines:

```dart
requirement(
  given: 'Cart contains 3 items '
         'and user has a 10% discount code',
  whenever: 'User proceeds to checkout',
  then: 'total reflects the discount',
);
// → "Given: Cart contains 3 items and user has a 10% discount code, When: User proceeds to checkout, Then: total reflects the discount"
```

Omit `given` when there is no meaningful precondition:

```dart
test(
  requirement(
    whenever: 'Email address contains no @ symbol',
    then: 'validation returns false',
  ),
  procedure(() {
    expect(validateEmail('not-an-email'), isFalse);
  }),
);
// → "When: Email address contains no @ symbol, Then: validation returns false"
```

### `why` — intent for agents and humans

The `why` parameter records the business reason the behaviour must exist. It
appears at the end of the description string and acts as a machine-readable tag:

```dart
test(
  requirement(
    given: 'User has 3 failed login attempts',
    whenever: 'User submits credentials again',
    then: 'account is temporarily locked',
    why: 'brute-force protection requirement REQ-AUTH-04',
  ),
  procedure(() { ... }),
);
// → "Given: User has 3 failed login attempts, When: User submits credentials again, Then: account is temporarily locked, Why: brute-force protection requirement REQ-AUTH-04"
```

**For coding agents:** search `why:` values across your test files to find tests
tied to a removed or changed requirement, then delete or update them. This keeps
your test suite clean as the codebase evolves.

### Widget tests

```dart
testWidgets(
  requirement(
    given: 'Login form is displayed',
    whenever: 'User submits empty password',
    then: 'validation error is shown inline',
  ),
  widgetsProcedure((tester) async {
    await tester.pumpWidget(const LoginScreen());
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();
    expect(find.text('Password is required'), findsOneWidget);
  }),
);
```
