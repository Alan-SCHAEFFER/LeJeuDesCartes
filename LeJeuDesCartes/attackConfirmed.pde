void attackConfirmed() {
  if (turn%2 == 1) {        
    deckJ1.get(attack).target.set(deckJ2.get(defense).position);
    deckJ1.get(attack).alreadyAtt = true;

    if (dist(deckJ1.get(attack).position.x, deckJ1.get(attack).position.y, deckJ2.get(defense).position.x, deckJ2.get(defense).position.y) < 1) {
      deckJ1.get(attack).def -= deckJ2.get(defense).att;
      deckJ2.get(defense).def -= deckJ1.get(attack).att;
      attack = -1;
      defense = -1;
    }
  } else {
    deckJ2.get(attack).target.set(deckJ1.get(defense).position);
    deckJ2.get(attack).alreadyAtt = true;

    if (dist(deckJ2.get(attack).position.x, deckJ2.get(attack).position.y, deckJ1.get(defense).position.x, deckJ1.get(defense).position.y) < 1) {
      deckJ1.get(defense).def -= deckJ2.get(attack).att;
      deckJ2.get(attack).def -= deckJ1.get(defense).att;
      attack = -1;
      defense = -1;
    }
  }
}