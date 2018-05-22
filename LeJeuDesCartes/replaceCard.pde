void replaceCard() {
  for ( int i = 0; i < deckJ1.size(); i++) {
    deckJ1.get(i).replace(deckJ1.size(), i, positionDeck[0]);
  }
  for ( int i = 0; i < deckJ2.size(); i++) {
    deckJ2.get(i).replace(deckJ2.size(), i, positionDeck[1]);
  }
}