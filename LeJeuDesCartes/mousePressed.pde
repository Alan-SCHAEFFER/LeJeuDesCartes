void mousePressed() {
  if (attack == -1 || defense == -1) { 
    if (turn%2 == 1) {
      for (int i = 0; i < deckJ1.size(); i++) {
        deckJ1.get(i).selectionAttack(i);
      }
      for (int i = 0; i < deckJ2.size(); i++) {
        deckJ2.get(i).selectionDefense(i);
      }
    } else {      
      for (int i = 0; i < deckJ1.size(); i++) {
        deckJ1.get(i).selectionDefense(i);
      }
      for (int i = 0; i < deckJ2.size(); i++) {
        deckJ2.get(i).selectionAttack(i);
      }
    }
    for (int i = 0; i < compo.size(); i++) {
      compo.get(i).selectionCompo(i);
    }
  }
}