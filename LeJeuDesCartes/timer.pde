void timer() {
  for (int i = 0; i < compo.size(); i++) {
    if (compo.get(i).capture != -1) {
      if (compo.get(i).time < 2) {
        compo.get(i).time++;
      } else {
        if (compo.get(i).campCapture == "J1") {
          scoreJ1++;
          for (int j = 0; j < deckJ1.size(); j++) {
            if  ( deckJ1.get(j).capture > i) {
              deckJ1.get(j).capture--;
            }
            deckJ1.get(compo.get(i).capture).capture = -1;
          }
        } else if (compo.get(i).campCapture == "J2") {
          scoreJ2++;

          for (int j = 0; j < deckJ2.size(); j++) {
            if  ( deckJ2.get(j).capture > i) {
              deckJ2.get(j).capture--;
            }
            deckJ2.get(compo.get(i).capture).capture = -1;
          }
        }
        compo.remove(i);
      }
    }
  }
}