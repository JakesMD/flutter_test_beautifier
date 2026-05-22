import 'package:test/test.dart';
import 'package:test_beautifier/test_beautifier.dart';

/// A counter that can be incremented and decremented.
class Counter {
  /// Creates a new counter with the given [startValue].
  Counter(int startValue) {
    _value = startValue;
  }

  int _value = 0;

  /// The current value of the counter.
  int get value => _value;

  /// Increases the value by 1.
  void increment() => _value++;

  /// Decreases the value by 1.
  void decrement() => _value--;
}

void main() {
  group('Counter Tests', () {
    test(
      requirement(
        whenever: 'Counter is incremented',
        then: 'value increases by 1',
      ),
      procedure(() {
        final counter = Counter(0)..increment();
        expect(counter.value, 1);
      }),
    );

    test(
      requirement(
        whenever: 'Counter is decremented',
        then: 'value decreases by 1',
      ),
      procedure(() {
        final counter = Counter(0)..decrement();
        expect(counter.value, -1);
      }),
    );
  });
}
