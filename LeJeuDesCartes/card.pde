class Card {

  int sclX;
  int sclY;

  int att;
  int def;

  PVector position;
  PVector vitesse;
  PVector source;
  PVector target;

  boolean alreadyAtt;
  int capture;

  //--------------------------------------------------------------------------------------------------------------------------------

  Card(float drawX, float drawY) {
    sclX = 75;
    sclY = 107;

    att = int(random(0, 10));
    def = int(random(1, 10));

    position = new PVector(drawX - sclX/2, drawY - sclY/2);
    vitesse = new PVector(0, 0);
    source = new PVector(0, 0);
    target = new PVector(0, 0);

    alreadyAtt = true;
    capture = -1;
  }

  //--------------------------------------------------------------------------------------------------------------------------------

  void display(int n, int J) {
    if (n == attack && turn%2 == J) {
      stroke(255, 0, 0);
      strokeWeight(2);
    } else if (n == defense && turn%2 != J) {
      stroke(0, 255, 0);
      strokeWeight(2);
    } else {
      noStroke();
    }
    fill(255);
    rect(position.x, position.y, sclX, sclY);

    noStroke();
    fill(255, 0, 0);
    text(att, position.x + 3, position.y + sclY - 3); 
    text(def, position.x + sclX - 16, position.y + sclY - 3);
  }

  //--------------------------------------------------------------------------------------------------------------------------------

  void update() {
    if (dist(position.x, position.y, target.x, target.y) > 1) {
      vitesse.set(target);
      vitesse.sub(position);
      vitesse.mult(0.1);
      position.add(vitesse);
    } else {
      target.set(source);
    }
  }

  //--------------------------------------------------------------------------------------------------------------------------------

  void replace(int deckSize, int n, float deck) {
    if (deckSize%2 == 0) {
      for (int i = 0; i < deckSize; i++) {
        source.set(width/2 - (deckSize/2 - 0.5)*1.25*sclX + 1.25*sclX*n - sclX*0.5, deck - sclY/2);
        target.set(source);
      }
    } else if (deckSize%2 == 1) {
      for (int i = 0; i < deckSize; i++) {
        source.set(width/2 - (deckSize/2)*1.25*sclX + 1.25*sclX*n - sclX*0.5, deck - sclY/2);
        target.set(source);
      }
    }
  }

  //--------------------------------------------------------------------------------------------------------------------------------

  void selectionAttack(int n) {
    if (!alreadyAtt && capture == -1 && mouseX > position.x && mouseX < position.x + sclX && mouseY > position.y && mouseY < position.y + sclY) {
      if (attack == n) {
        attack = -1;
      } else {
        attack = n;
      }
    }
  }

  //--------------------------------------------------------------------------------------------------------------------------------

  void selectionDefense(int n) {
    if (mouseX > position.x && mouseX < position.x + sclX && mouseY > position.y && mouseY < position.y + sclY) {
      if (defense == n) {
        defense = -1;
      } else {
        defense = n;
      }
    }
  }

  //--------------------------------------------------------------------------------------------------------------------------------

  void link() {
    if (capture != -1) {
      stroke(255);
      strokeWeight(compo.get(capture).time*3 + 1);
      line(position.x + sclX/2, position.y + sclY/2, compo.get(capture).position.x + compo.get(capture).scl/2, compo.get(capture).position.y + compo.get(capture).scl/2);
    }
  }

  //--------------------------------------------------------------------------------------------------------------------------------

  void debug() {
    println(position);
    println(vitesse);
    println(target);
    println();
  }
}