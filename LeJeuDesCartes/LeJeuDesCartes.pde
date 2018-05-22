//LeJeuDesCartes 
//v3.0 Omega
//By Alan & Baptiste
//
//1 pour ajouter une cartes
//2 pour l'enlever
//enter pour passer un tour

void setup() {
  size(1280, 720);
  frameRate(60);
  textSize(25);
  
  for (int i = 0; i < 5; i++) {
    Composant temp = new Composant(i);
    compo.add(compo.size(), temp);
  }
}


void draw() {
  display();
  
  if (defense != -1 && priseCompo != -1) {
    defense = -1;
    priseCompo = -1;
    println("Tu ne peux pas faire deux choses en même temps");
  }
  
  for (int i = 0; i < deckJ1.size(); i++) {
    if (deckJ1.get(i).def < 1) {
      deckJ1.remove(i);
      replaceCard();
      break;
    }
    deckJ1.get(i).update();
    deckJ1.get(i).link();
    deckJ1.get(i).display(i, 1);
    //deckJ1.get(i).debug();
  }
  for (int i = 0; i < deckJ2.size(); i++) {
    if (deckJ2.get(i).def < 1) {
      deckJ2.remove(i);
      replaceCard();
      break;
    }
    deckJ2.get(i).update();
    deckJ2.get(i).link();
    deckJ2.get(i).display(i, 0);
    //deckJ2.get(i).debug();
  }
  

  if (attack != -1 && defense != -1) {
    attackConfirmed();
  }
  
   if (attack != -1 && priseCompo != -1) {
    compoConfirmed();
  }
  
  for (int i = 0; i < compo.size(); i++) {
    compo.get(i).display(i);
    
  }
  
  

  println(scoreJ1);
  println(scoreJ2);
  println();
}