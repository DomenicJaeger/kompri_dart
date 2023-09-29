//import 'package:kompri/kompri.dart';
import 'package:test/test.dart';

import '../bin/kompri.dart';

void main() {
  test('calculate', () {
    expect(compress("aaabbccc"), 'a3bbc3');
  });
  test('calculate2', () {
    expect(compress("aaaaabhhaaa"), 'a5bhha3');
  });
  test('calculate3', () {
    expect(compress("aaaaaaaaaaaaa"), 'a13');
  });
  test('calculate4', () {
    expect(compress("ttttttttttjjjlllll"), 't10j3l5');
  });
}
