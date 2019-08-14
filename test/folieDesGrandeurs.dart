import "package:test/test.dart";

import 'package:kingdomino_score_count/kingdom.dart';
import 'package:kingdomino_score_count/folieDesGrandeurs.dart';

/// Test crown configuration on multiple kingdoms
/// We add crowns on lands of type 'none', which never happen in the actual
/// game but do not matter for tests has folieDesGrandeurs score is only
/// affected by crowns and not land types.

_setCrowns(Kingdom kingdom, List<List<int>> crowns){
  for (var x = 0; x < kingdom.size; x++) {
    for (var y = 0; y < kingdom.size; y++) {
      kingdom.getLand(y, x).crowns = crowns[y][x];
    }
  }
}

void main() {
  test("square 3x3", () {
    var kingdom = Kingdom(5);

    List<List<int>> crowns = [
      [1, 1, 1, 0, 0],
      [1, 1, 1, 0, 0],
      [1, 1, 1, 0, 0],
      [0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0]
    ];

    _setCrowns(kingdom, crowns);

    var folieDesGrandeurs = FolieDesGrandeurs();
    expect(30, folieDesGrandeurs.getPoints(kingdom));
  });
}
