# Test Beautifier

[![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg)](https://pub.dev/packages/very_good_analysis)

A very simple package that transforms your intricate test cases into a clean, readable format, making your test-driven development process more efficient and maintainable.

## 🚀 Getting started 
Install it as a dev dependency:
```
flutter pub add dev:test_beautifier
```

Import it in your test files:
```
import 'package:test_beautifier/test_beautifier.dart';
```


## 🕹 Usage
To avoid long, misleading or unintelligible test descriptions, we use the Given-When-Then method:
- Given: The setup or context of the test case
- When: The action or procedure under test
- Then: The expected result or outcome of the test

Now test descriptions read like a book:
> Test Requirement: When Counter is incremented, then value increases by 1.

We can improve the formatting further by wrapping the body in a `procedure` function:
> Test Procedure:
>   1. initialize Counter with value 0
>   2. increment Counter
>   3. expect value to be 1.

In practice it looks like this:
``` dart
test(
  requirement(
    When: 'Counter is incremented',
    Then: 'value increases by 1',
  ),
  procedure(() {
    final counter = Counter(0);

    counter.increment();

    expect(counter.value, 1);
  }),
);
```

The same applies for widget tests:
``` dart
testWidgets(
  requirement(
    Given: 'Text is 0',
    When: 'Button is pressed',
    Then: 'Text is 1',
  ),
  widgetsProcedure((tester) {
    // whatever
  }),
);
```

This may seem trivial but can make a huge difference in long and complicated test files.


## ⌨️ VSCode Snippets
To improve your workflow you can add this to your snippets:
``` json
// .vscode/btest.code-snippets

{
  "Beautiful test": {
    "prefix": "btest",
    "body": [
      "test(",
      "  requirement(",
      "    Given: '${1:context}',",
      "    When: '${2:action}',",
      "    Then: '${3:outcome}',",
      "  ),",
      "  procedure(() {",
      "    ${4:// TODO: Implement procedure}",
      "  }),",
      ");"
    ],
    "description": "Creates a beautiful test"
  },

  "Beautiful widget test": {
    "prefix": "bwtest",
    "body": [
      "testWidgets(",
      "  requirement(",
      "    Given: '${1:context}',",
      "    When: '${2:action}',",
      "    Then: '${3:outcome}',",
      "  ),",
      "  widgetsProcedure((tester) async {",
      "    ${4:// TODO: Implement prodecure}",
      "  }),",
      ");"
    ],
    "description": "Creates a beautiful widget test"
  }
}
```

Then type:
- `btest` to create a beautiful test template
- `bwtest` to create a beautiful widget test template