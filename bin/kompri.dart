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
  //Überprüfen, ob der String nur Buchstaben enthält
  //Buchstaben werden durch Leerzeichen ersetzt, sind alle Zeichen Buchstaben,
  //wird ein leerer String mit einem leeren String verglichen, bool ist true
  return input.replaceAll(RegExp(r'[a-zA-Z]'), '') == '';
}

String compress(String input) {
  String compressed = '';
  int count = 1;

  for (int i = 0; i < input.length; i++) {
    if (i < input.length - 1 && input[i] == input[i + 1]) {
      // < input.length -1 da er mit dem folgenden Zeichen vergleicht, und das allerletzte Zeichen nicht vergleichen kann
      // Wenn das aktuelle Zeichen dem nächsten Zeichen entspricht, erhöhen wir den Zähler
      count++;
    } else {
      if (count >= 3) {
        //Wenn der counter 3 oder größer ist, wird das Zeichen mit dem Counter-Wert zusammengefügt
        //anderenfalls wird das Zeichen so oft dargestellt wie der Counter-Wert hoch ist
        compressed += input[i] + count.toString();
      } else {
        compressed += input[i] * count;
      }
      count = 1; // Reset des Zählers nach der Schleife
    }
  }
  return compressed;
}
