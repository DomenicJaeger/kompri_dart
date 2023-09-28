import 'dart:io';

void main() {
  print('Bitte geben Sie eine Buchstabenreihe ein');
  var input = stdin.readLineSync() ?? '';

  if (validateInput(input)) {
    String compressedString = compress(input);
    print('Komprimierter String: $compressedString');
  } else {
    print(
        'Ungültiger Eingabestring. Der String darf nur aus Buchstaben bestehen.');
  }
}

bool validateInput(String input) {
  // Überprüfen, ob der String nur Buchstaben enthält
  return input.replaceAll(RegExp(r'[a-zA-Z]'), '') == '';
}

String compress(String input) {
  String compressed = '';
  int count = 1;

  for (int i = 0; i < input.length; i++) {
    if (i < input.length - 1 && input[i] == input[i + 1]) {
      // Wenn das aktuelle Zeichen dem nächsten Zeichen entspricht, erhöhen wir den Zähler
      count++;
    } else {
      if (count >= 3) {
        compressed += input[i] + count.toString();
      } else {
        compressed += input[i] * count;
      }
      count = 1; // Reset des Zählers
    }
  }
  return compressed;
}
