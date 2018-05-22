void resetAttack() {
  for ( int i = 0; i < deckJ1.size(); i++) {
    deckJ1.get(i).alreadyAtt = false;
  }
  for ( int i = 0; i < deckJ2.size(); i++) {
    deckJ2.get(i).alreadyAtt = false;
  }
}