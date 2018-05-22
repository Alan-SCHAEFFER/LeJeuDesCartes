class Composant {
  int scl;
  PVector position;
  
  int capture;
  String campCapture;
  
  int time;


  Composant(int n) {
    scl = 50;
    position = new PVector( 0.166666*width + 0.166666*width*n - scl/2, height/2 - scl/2);
    
    capture = -1;
    time =0;
  }
  
  void display(int n) {
    if (n == priseCompo){
      stroke(0, 0, 255);
      strokeWeight(2);
    } else {
      noStroke();
    }
    fill(255);
    rect(position.x, position.y, scl, scl);
  }
  
  void selectionCompo(int n) {
    if (capture == -1 && mouseX > position.x && mouseX < position.x + scl && mouseY > position.y && mouseY < position.y + scl) {
      if (priseCompo == n) {
        priseCompo = -1;
      } else {
        priseCompo = n;
      }
    }
  }
}