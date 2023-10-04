import 'dart:io';

void main() {
  print('Bitte geben Sie eine Buchstabenreihe ein');
  var input = stdin.readLineSync() ?? '';

  if (validateInput(input)) {
    String decompressedString = decompress(input);
    print('Dekomprimierter String: $decompressedString');
  } else {
    print('Ungültige Eingabe. Der String darf nur aus Buchstaben bestehen.');
  }
}

bool validateInput(String input) {
  //Überprüfen, ob der String nur Buchstaben und Zahlen enthält
  //Buchstaben und Zahlen werden durch Leerzeichen ersetzt, sind alle Zeichen Buchstaben oder Zahlen,
  //wird ein leerer String mit einem leeren String verglichen, bool ist true
  return input.replaceAll(RegExp(r'[a-zA-Z0-9]'), '') == '';
}

String decompress(String input) {
  //Leerer String der nach und nach befüllt wird
  String decompressed = '';

  for (int i = 0; i < input.length; i++) {
    if (i < input.length - 1 && int.tryParse(input[i + 1]) != null) {
      // < input.length -1 da er mit dem folgenden Zeichen vergleicht, und das allerletzte Zeichen nicht vergleichen kann
      // wenn das folgende Zeichen eine Zahl ist wird das aktuelle Zeichen so oft im Teilstring dargestellt
      // und dem zu befüllenden String zugefügt wie die Zahl hoch ist
      decompressed += input[i] * int.parse(input[i + 1]);
    } else if (int.tryParse(input[i]) != null) {
      //Wenn das Zeichen eine Zahl ist wird ein leerer Teilstring hinzugefügt
      decompressed += "";
    } else {
      //ansonsten wird das Zeichen (ein Buchstabe) als Teilstring hinzugefügt
      decompressed += input[i];
    }
  }
  return decompressed;
}
