//import 'package:kompri/dekompri.dart';
import 'package:test/test.dart';

import '../bin/dekompri.dart';

void main() {
  test('calculate', () {
    expect(decompress("a3b5c7"), 'aaabbbbbccccccc');
  });
  test('calculate2', () {
    expect(decompress("a7bc3"), 'aaaaaaabccc');
  });
  test('calculate3', () {
    expect(decompress("aab3c3"), 'aabbbccc');
  });
  test('calculate4', () {
    expect(decompress("a7b10c5"), 'aaaaaaabbbbbbbbbbccccc');
  });
  test('calculate5', () {
    expect(decompress("a21bc6"), 'aaaaaaaaaaaaaaaaaaaaabcccccc');
  });
  test('calculate6', () {
    expect(decompress("a4b11c13d"), 'aaaabbbbbbbbbbbcccccccccccccd');
  });
}
