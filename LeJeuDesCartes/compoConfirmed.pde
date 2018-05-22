void compoConfirmed() {
  if (turn%2 == 1) {
    deckJ1.get(attack).target.set(compo.get(priseCompo).position);
    
    if (dist(deckJ1.get(attack).position.x, deckJ1.get(attack).position.y, compo.get(priseCompo).position.x, compo.get(priseCompo).position.y) < 1) {
      deckJ1.get(attack).capture = priseCompo;
      compo.get(priseCompo).capture = attack;
      compo.get(priseCompo).campCapture = "J1";
      attack = -1;
      priseCompo = -1;
    }
  } else {
    deckJ2.get(attack).target.set(compo.get(priseCompo).position);
    
    if (dist(deckJ2.get(attack).position.x, deckJ2.get(attack).position.y, compo.get(priseCompo).position.x, compo.get(priseCompo).position.y) < 1) {
      deckJ2.get(attack).capture = priseCompo;
      compo.get(priseCompo).capture = attack;
       compo.get(priseCompo).campCapture = "J2";
      attack = -1;
      priseCompo = -1;
    }
  }
}