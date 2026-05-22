import 'package:test/test.dart';
import 'package:test_beautifier/test_beautifier.dart';

void main() {
  group('requirement', () {
    test('all null returns empty string', () {
      expect(requirement(), equals(''));
    });

    group('single section', () {
      test('given only', () {
        expect(
          requirement(given: 'Counter is at 0'),
          equals('Given: Counter is at 0'),
        );
      });

      test('whenever only', () {
        expect(
          requirement(whenever: 'Counter is incremented'),
          equals('When: Counter is incremented'),
        );
      });

      test('then only', () {
        expect(
          requirement(then: 'value increases by 1'),
          equals('Then: value increases by 1'),
        );
      });

      test('why only', () {
        expect(
          requirement(why: 'ensure counter correctness'),
          equals('Why: ensure counter correctness'),
        );
      });
    });

    group('multiple conditions via adjacent string literals', () {
      test('given with two conditions', () {
        expect(
          requirement(
            given: 'Counter is at 0 '
                'and User is logged in',
          ),
          equals('Given: Counter is at 0 and User is logged in'),
        );
      });

      test('given with three conditions', () {
        expect(
          requirement(
            given: 'Counter is at 0, '
                'User is logged in '
                'and App is running',
          ),
          equals(
            'Given: Counter is at 0, User is logged in and App is running',
          ),
        );
      });
    });

    group('multiple sections', () {
      test('given + whenever', () {
        expect(
          requirement(
            given: 'Counter is at 0',
            whenever: 'Counter is incremented',
          ),
          equals('Given: Counter is at 0, When: Counter is incremented'),
        );
      });

      test('whenever + then', () {
        expect(
          requirement(
            whenever: 'Counter is incremented',
            then: 'value increases by 1',
          ),
          equals('When: Counter is incremented, Then: value increases by 1'),
        );
      });

      test('given + whenever + then', () {
        expect(
          requirement(
            given: 'Counter is at 0',
            whenever: 'Counter is incremented',
            then: 'value increases by 1',
          ),
          equals(
            'Given: Counter is at 0, When: Counter is incremented, '
            'Then: value increases by 1',
          ),
        );
      });

      test('all four sections', () {
        expect(
          requirement(
            given: 'Counter is at 0',
            whenever: 'Counter is incremented',
            then: 'value increases by 1',
            why: 'ensure counter correctness',
          ),
          equals(
            'Given: Counter is at 0, When: Counter is incremented, '
            'Then: value increases by 1, Why: ensure counter correctness',
          ),
        );
      });

      test('why appears after then', () {
        expect(
          requirement(
            then: 'value increases by 1',
            why: 'ensure counter correctness',
          ),
          equals(
            'Then: value increases by 1, Why: ensure counter correctness',
          ),
        );
      });
    });

    group('empty string treated as absent', () {
      test('empty given omitted', () {
        expect(
          requirement(given: '', whenever: 'Counter is incremented'),
          equals('When: Counter is incremented'),
        );
      });

      test('all empty strings returns empty string', () {
        expect(
          requirement(given: '', whenever: '', then: '', why: ''),
          equals(''),
        );
      });
    });
  });
}
