// *****************************************************************************************
//                     EN HAUT : J1, TOUR IMPAIR, CARTE IMPAIRE
//                     EN BAS  : J2, TOUR PAIR, CARTE PAIRE
// *****************************************************************************************



PImage carte_1;
PImage carte_2;
PImage carte_3;
PImage carte_4;
PImage carte_5;
PImage carte_6;
PImage carte_7;
PImage carte_8;
PImage board;
PImage bouton;
PImage compo_1;
PImage compo_2;
PImage compo_3;
PImage compo_4;
PImage compo_5;
PImage win;
PImage defaite;


int[] taille_carte_main = {100, 142};
int[] taille_carte_terrain = {100, 142};
int[] taille_compo = {30, 30};

int compo_possession_J1 = 0;
int compo_possession_J2 = 0;


float[][] source_carte = {{50, 165}, {50, 450}, {295, 165}, {295, 450}, {550, 165}, {550, 450}, {800, 165}, {800, 450}};
float[][] source_compo = {{158, 348}, {368, 355}, {651, 362}, {937, 373}, {1145, 355}};
float[][] position_carte = {{source_carte[0][0], source_carte[0][1]}, {source_carte[1][0], source_carte[1][1]}, {source_carte[2][0], source_carte[2][1]}, {source_carte[3][0], source_carte[3][1]}, {source_carte[4][0], source_carte[4][1]}, {source_carte[5][0], source_carte[5][1]}, {source_carte[6][0], source_carte[6][1]}, {source_carte[7][0], source_carte[7][1]}};
float[][] position_compo = {{source_compo[0][0], source_compo[0][1]}, {source_compo[1][0], source_compo[1][1]}, {source_compo[2][0], source_compo[2][1]}, {source_compo[3][0], source_compo[3][1]}, {source_compo[4][0], source_compo[4][1]}};
float cibleX;
float cibleY;

int[][] stat_carte = {{5, 7}, {2, 3}, {4, 6}, {1, 8}, {5, 2}, {8, 1}, {4, 4}, {5, 3}};

int vitesse = 8; //plus la vitesse est faible, plus c'est rapide
int vitesse_compo = 1;

int attaque = -1; //vaut -1 quand personne n'attaque
int defense = -1; //vaut -1 quand personne ne defend
int prise_compo_1_J1 = 0;
int prise_compo_1_J2 = 0;
int tour_prise_compo_1 = 0;
int prise_compo_2_J1 = 0;
int prise_compo_2_J2 = 0;
int tour_prise_compo_2 = 0;
int prise_compo_3_J1 = 0;
int prise_compo_3_J2 = 0;
int tour_prise_compo_3 = 0;
int prise_compo_4_J1 = 0;
int prise_compo_4_J2 = 0;
int tour_prise_compo_4 = 0;
int prise_compo_5_J1 = 0;
int prise_compo_5_J2 = 0;
int tour_prise_compo_5= 0;
int tour= 1;
int mana_J1 = 3;
int mana_J2 = 3;

boolean cadre = false;
boolean prise_1 = false;
boolean prise_2 = false;
boolean prise_3 = false;
boolean prise_4 = false;
boolean prise_5 = false;
color encadrement = color(255, 0, 0);
color emprise = color(0, 255, 170);
PFont zigBlack;


void setup(){
  frameRate(60);
  size(1280, 720);
  zigBlack = createFont("Ziggurat-Black", 24);
  board = loadImage("board2.png");
  win = loadImage("win.png");
  defaite = loadImage("defaite.png");
  board.resize(1280, 720);
  // for pour toutes les cartes
  carte_1 = loadImage("carte_1.png");
  carte_3 = loadImage("carte_1.png");
  carte_5 = loadImage("carte_1.png");
  carte_7 = loadImage("carte_1.png");
  carte_2 = loadImage("carte_2.png");
  carte_4 = loadImage("carte_2.png");
  carte_6 = loadImage("carte_2.png");
  carte_8 = loadImage("carte_2.png");
  bouton = loadImage ("bouton.png");
  // for pour tout les compos
  //for (int i = 1; i < 6; i ++) compo_%i = loadImage ("composant.png");
  compo_1 = loadImage("composant.png");
  compo_2 = loadImage("composant.png");
  compo_3 = loadImage("composant.png");
  compo_4 = loadImage("composant.png");
  compo_5 = loadImage("composant.png");
  bouton.resize(70, 30);
  blit();
}


void draw(){ 
  if(attaque == 0 && defense != -1)  deplacement_cible_carte1();
  else deplacement_source_carte1();
  if(attaque == 1 && defense != -1)  deplacement_cible_carte2();
  else deplacement_source_carte2();
  if(attaque == 2 && defense != -1)  deplacement_cible_carte3();
  else deplacement_source_carte3();
  if(attaque == 3 && defense != -1)  deplacement_cible_carte4();
  else deplacement_source_carte4();
  if(attaque == 4 && defense != -1)  deplacement_cible_carte5();
  else deplacement_source_carte5();
  if(attaque == 5 && defense != -1)  deplacement_cible_carte6();
  else deplacement_source_carte6();
  if(attaque == 6 && defense != -1)  deplacement_cible_carte7();
  else deplacement_source_carte7();
  if(attaque == 7 && defense != -1)  deplacement_cible_carte8();
  else deplacement_source_carte8();
  //*************************************************************************************
  //                           PRISE COMPOSANT 1 
  //*************************************************************************************
  if (prise_compo_1_J2 == 1){
       position_carte[1][0]  = position_compo[0][0] + taille_compo[0];
       position_carte [1][1] = position_compo[0][1] + taille_compo[1];
  }
  if (prise_compo_1_J1 == 1){
       position_carte[0][0] = position_compo[0][0] + taille_compo[0];
       position_carte [0][1] = position_compo[0][1] + taille_compo[1];
     }
  if((prise_compo_1_J1 == 1) && (tour == tour_prise_compo_1 + 3)) {
  prise_compo_1_J1 = 0;
  position_compo[0][0] = 1000;
  position_compo[0][1] = 75;
  compo_possession_J1+= 1;
  prise_1 = false;
  }
  if((prise_compo_1_J2 == 1) && (tour == tour_prise_compo_1 + 3)) {
  prise_compo_1_J2 = 0;
  position_compo[0][0] = 1000;
  position_compo[0][1] = 650;
  compo_possession_J2+= 1;
  prise_1 = false;
  }
  //*************************************************************************************
  //                           PRISE COMPOSANT 2
  //*************************************************************************************
  if (prise_compo_2_J2 == 1){
       position_carte[1][0]  = position_compo[1][0] + taille_compo[0];
       position_carte [1][1] = position_compo[1][1] + taille_compo[1];
     }
     if (prise_compo_2_J1 == 1){
       position_carte[0][0] = position_compo[1][0] + taille_compo[0];
       position_carte [0][1] = position_compo[1][1] + taille_compo[1];
     }
  if((prise_compo_2_J1 == 1) && (tour == tour_prise_compo_2 + 3)) {
  prise_compo_2_J1 = 0;
  position_compo[1][0] = 1050;
  position_compo[1][1] = 75;
  compo_possession_J1+= 1;
  prise_2 = false;
  }
  if((prise_compo_2_J2 == 1) && (tour == tour_prise_compo_2 + 3)) {
  prise_compo_2_J2 = 0;
  position_compo[1][0] = 1050;
  position_compo[1][1] = 650;
  compo_possession_J2+= 1;
  prise_2 = false;
  }
  //*************************************************************************************
  //                           PRISE COMPOSANT 3 
  //*************************************************************************************
  if (prise_compo_3_J2 == 1){
       position_carte[1][0]  = position_compo[2][0] + taille_compo[0];
       position_carte [1][1] = position_compo[2][1] + taille_compo[1];
     }
     if (prise_compo_3_J1 == 1){
       position_carte[0][0] = position_compo[2][0] + taille_compo[0];
       position_carte [0][1] = position_compo[2][1] + taille_compo[1];
     }
  if((prise_compo_3_J1 == 1) && (tour == tour_prise_compo_3 + 3)) {
  prise_compo_3_J1 = 0;
  position_compo[2][0] = 1100;
  position_compo[2][1] = 75;
  compo_possession_J1+= 1;
  prise_3 = false;
  }
  if((prise_compo_3_J2 == 1) && (tour == tour_prise_compo_3 + 3)) {
  prise_compo_3_J2 = 0;
  position_compo[2][0] = 1100;
  position_compo[2][1] = 650;
  compo_possession_J2+= 1;
  prise_3 = false;
  }
  //*************************************************************************************
  //                           PRISE COMPOSANT 4 
  //*************************************************************************************
  if (prise_compo_4_J2 == 1){
       position_carte[1][0]  = position_compo[3][0] + taille_compo[0];
       position_carte [1][1] = position_compo[3][1] + taille_compo[1];
     }
     if (prise_compo_4_J1 == 1){
       position_carte[0][0] = position_compo[3][0] + taille_compo[0];
       position_carte [0][1] = position_compo[3][1] + taille_compo[1];
     }
  if((prise_compo_4_J1 == 1) && (tour == tour_prise_compo_4 + 3)) {
  prise_compo_4_J1 = 0;
  position_compo[3][0] = 1150;
  position_compo[3][1] = 75;
  compo_possession_J1+= 1;
  prise_4 = false;
  }
  if((prise_compo_4_J2 == 1) && (tour == tour_prise_compo_4 + 3)) {
  prise_compo_4_J2 = 0;
  position_compo[3][0] = 1150;
  position_compo[3][1] = 650;
  compo_possession_J2+= 1;
  prise_4 = false;
  }
  //*************************************************************************************
  //                           PRISE COMPOSANT 5 
  //*************************************************************************************
  if (prise_compo_5_J2 == 1){
       position_carte[1][0]  = position_compo[4][0] + taille_compo[0];
       position_carte [1][1] = position_compo[4][1] + taille_compo[1];
     }
     if (prise_compo_5_J1 == 1){
       position_carte[0][0] = position_compo[4][0] + taille_compo[0];
       position_carte [0][1] = position_compo[4][1] + taille_compo[1];
     }
  if((prise_compo_5_J1 == 1) && (tour == tour_prise_compo_5 + 3)) {
  prise_compo_5_J1 = 0;
  position_compo[4][0] = 1200;
  position_compo[4][1] = 75;
  compo_possession_J1+= 1;
  prise_5 = false;
  }
  if((prise_compo_5_J2 == 1) && (tour == tour_prise_compo_5 + 3)) {
  prise_compo_5_J2 = 0;
  position_compo[4][0] = 1200;
  position_compo[4][1] = 650;
  compo_possession_J2+= 1;
  prise_5 = false;
  }
  //*************************************************************************************
  //                            VICTOIRE
  //*************************************************************************************
    blit();
}

//for pour toutes les cartes
void blit(){
  if ((compo_possession_J1 < 3) && (compo_possession_J2 < 3))  {
  background(board);
  image(bouton, 1200, 360);
  for (int i = 0; i<5; i++){
  image(compo_1, position_compo[i][0], position_compo[i][1], taille_compo[0], taille_compo[1]);
  }
  textSize(20);
  fill(0);
  text("TOUR " + tour, 530, 30);
  fill(20, 125, 200);
  text ("Mana : " + mana_J1 + "/3", 700, 30);
  fill(200, 20, 20);
  text ("Mana : " + mana_J2 + "/3", 300, 690);
  if(cadre){
    stroke (encadrement);
    noFill();
    rect(position_carte[attaque][0]-3, position_carte[attaque][1]-3, taille_carte_terrain[0]+6, taille_carte_terrain[1]+6);
  }
 /* if (prise_1){
    stroke(emprise);
    noFill();
    rect(position_compo[0][0]-12, position_compo[0][1]-12, taille_compo[0]+20, taille_compo[1]+20);
 }*/
  if (prise_2){
    stroke(emprise);
    noFill();
    rect(position_compo[1][0]-12, position_compo[1][1]-12, taille_compo[0]+20, taille_compo[1]+20);
  }
  if (prise_3){
    stroke(emprise);
    noFill();
    rect(position_compo[2][0]-12, position_compo[2][1]-12, taille_compo[0]+20, taille_compo[1]+20);
  }
  if (prise_4){
    stroke(emprise);
    noFill();
    rect(position_compo[3][0]-12, position_compo[3][1]-12, taille_compo[0]+20, taille_compo[1]+20);
  }
  if (prise_5){
    stroke(emprise);
    noFill();
    rect(position_compo[4][0]-12, position_compo[4][1]-12, taille_compo[0]+20, taille_compo[1]+20);
  }
  for (int i = 0; i<8; i+= 2){
  if(stat_carte[i][1] > 0){
    image(carte_1, position_carte[i][0], position_carte[i][1], taille_carte_terrain[0], taille_carte_terrain[1]);
    fill(255);
    text(stat_carte[i][0],position_carte[i][0]+10, position_carte[i][1]+110);
    text(stat_carte[i][1],position_carte[i][0]+80, position_carte[i][1]+110);
  }
  }
  for (int i = 1; i<8; i+= 2){
  if(stat_carte[i][1] > 0) {
    image(carte_2, position_carte[i][0], position_carte[i][1], taille_carte_terrain[0], taille_carte_terrain[1]);
    fill(255);
    text(stat_carte[i][0],position_carte[i][0]+10, position_carte[i][1]+110);
    text(stat_carte[i][1],position_carte[i][0]+80, position_carte[i][1]+110);
    }
  }
  
  if (stat_carte[0][1] <= 0){
    prise_compo_1_J1 = prise_compo_2_J1 = prise_compo_3_J1 = prise_compo_4_J1 = prise_compo_5_J1 = 0;
  }
  
    if (stat_carte[1][1] <= 0){
    prise_compo_1_J2 = prise_compo_2_J2 = prise_compo_3_J2 = prise_compo_4_J2 = prise_compo_5_J2 = 0;
  }
  
}else if (compo_possession_J1 == 3) {
  background(defaite);
}else if (compo_possession_J2 == 3) {
  background(win);
}
}

//for pour toute les cartes
void mouseClicked(){
  //*************************************************************************************
  //                            CLIC BOUTON FIN DE TOUR
  //************************************************************************************* 
  if ((mouseX> 1200 && mouseX < 1270) && (mouseY > 360 && mouseY < 400)) {
    tour+=1;
    cadre = false;
    attaque = defense = -1;
    if (tour % 2 == 0 ) mana_J1 = 3;
    if (tour % 2 == 1 ) mana_J2 = 3;
  }
  //*************************************************************************************
  //                            CLIC CARTE DU HAUT
  //*************************************************************************************
  for (int i = 0; i<8; i+= 2){
  if ((mouseX > position_carte[i][0] && mouseX < position_carte[i][0] + taille_carte_terrain[0]) && (mouseY > position_carte[i][1] && mouseY < position_carte[i][1] + taille_carte_terrain[1])){
    if( tour % 2 == 1){
    if(attaque == -1){
      attaque = i;
      cadre = true;
    }
    else if(attaque == i){
      attaque = -1;
      cadre = false;
    }
    }
    else if(attaque != -1 && attaque != i &&  defense == -1 && tour % 2 == 0) defense = i;
    else println(" Ce n'est pas votre tour");
  }
  }
  //*************************************************************************************
  //                            CLIC CARTE DU BAS
  //*************************************************************************************
  for (int i = 1; i<8; i+= 2){
  if ((mouseX > position_carte[i][0] && mouseX < position_carte[i][0] + taille_carte_terrain[0]) && (mouseY > position_carte[i][1] && mouseY < position_carte[i][1] + taille_carte_terrain[1])){
    if (tour % 2 == 0){
    if(attaque == -1){
       attaque = i;
       cadre = true;
     }
     else if(attaque == i){
       attaque = -1;
       cadre = false;
    }
    }
    else if(attaque != -1 && attaque != i && defense == -1  && tour % 2 == 1) defense = i;
    else println ("Ce n'est pas votre tour");
  }
  }
  //*************************************************************************************
  //                            LANCEMENT DE L'ATTAQUE
  //*************************************************************************************
  if(attaque != -1 && defense != -1){
    cadre = false;
    assignation();
  }
   //*************************************************************************************
   //                                  CLIC COMPOSANT 1 
   //*************************************************************************************
   if ((mouseX > position_compo[0][0] && mouseX < position_compo[0][0] + taille_compo[0]) && (mouseY > position_compo[0][1] && mouseY < position_compo[0][1] + taille_compo[1])){
      if ((prise_compo_1_J1 == 0) && (prise_compo_1_J2 == 0)){
      tour_prise_compo_1 = tour;
      if (tour % 2 == 1) prise_compo_1_J1 = 1;
      else if (tour % 2 == 0 ) prise_compo_1_J2 = 1;
    }
    else{
      prise_1 = false;
   }
   }
   //*************************************************************************************
   //                                  CLIC COMPOSANT 2
   //*************************************************************************************
   if ((mouseX > position_compo[1][0] && mouseX < position_compo[1][0] + taille_compo[0]) && (mouseY > position_compo[1][1] && mouseY < position_compo[1][1] + taille_compo[1])){
      if ((prise_compo_2_J1 == 0) && (prise_compo_2_J2 == 0)){
      tour_prise_compo_2 = tour;
     if (tour % 2 == 1) prise_compo_2_J1 = 1;
      else if (tour % 2 == 0 ) prise_compo_2_J2 = 1;
    }
    else {
    prise_2 = false;
   }
   }
   //*************************************************************************************
   //                                  CLIC COMPOSANT 3
   //*************************************************************************************
   if ((mouseX > position_compo[2][0] && mouseX < position_compo[2][0] + taille_compo[0]) && (mouseY > position_compo[2][1] && mouseY < position_compo[2][1] + taille_compo[1])){
      if ((prise_compo_3_J1 == 0) && (prise_compo_3_J2 == 0)){
      tour_prise_compo_3 = tour;
      
     if (tour % 2 == 1) prise_compo_3_J1 = 1;
      else if (tour % 2 == 0 ) prise_compo_3_J2 = 1;
    }
    else {
    prise_3 = false;
   }
   }
   //*************************************************************************************
   //                                 CLIC COMPOSANT 4                                       
   //*************************************************************************************
    if ((mouseX > position_compo[3][0] && mouseX < position_compo[3][0] + taille_compo[0]) && (mouseY > position_compo[3][1] && mouseY < position_compo[3][1] + taille_compo[1])){
      if ((prise_compo_4_J1 == 0) && (prise_compo_4_J2 == 0)){
      tour_prise_compo_4 = tour;
     if (tour % 2 == 1) prise_compo_4_J1 = 1;
      else if (tour % 2 == 0 ) prise_compo_4_J2 = 1;
    }
    else {
    prise_4 = false;
   }
    }
   //*************************************************************************************
   //                                  CLIC COMPOSANT 5
   //*************************************************************************************
    if ((mouseX > position_compo[4][0] && mouseX < position_compo[4][0] + taille_compo[0]) && (mouseY > position_compo[4][1] && mouseY < position_compo[4][1] + taille_compo[1])){
      if ((prise_compo_5_J1 == 0) && (prise_compo_5_J2 == 0)){
      tour_prise_compo_5 = tour;
     if (tour % 2 == 1) prise_compo_5_J1 = 1;
      else if (tour % 2 == 0 ) prise_compo_5_J2 = 1;
    }
    else {
    prise_5 = false;
   }
  }
}

//for pour toute les cartes
void mouseMoved(){
  if ((mouseX > position_carte[0][0] && mouseX < position_carte[0][0] + taille_carte_terrain[0]) && (mouseY > position_carte[0][1] && mouseY < position_carte[0][1] + taille_carte_terrain[1]))  cursor(HAND);
  else if ((mouseX > position_carte[1][0] && mouseX < position_carte[1][0] + taille_carte_terrain[0]) && (mouseY > position_carte[1][1] && mouseY < position_carte[1][1] + taille_carte_terrain[1]))  cursor(HAND);
  else if ((mouseX > position_carte[2][0] && mouseX < position_carte[2][0] + taille_carte_terrain[0]) && (mouseY > position_carte[2][1] && mouseY < position_carte[2][1] + taille_carte_terrain[1]))  cursor(HAND);
  else if ((mouseX > position_carte[3][0] && mouseX < position_carte[3][0] + taille_carte_terrain[0]) && (mouseY > position_carte[3][1] && mouseY < position_carte[3][1] + taille_carte_terrain[1]))  cursor(HAND);
  else if ((mouseX > position_carte[4][0] && mouseX < position_carte[4][0] + taille_carte_terrain[0]) && (mouseY > position_carte[4][1] && mouseY < position_carte[4][1] + taille_carte_terrain[1]))  cursor(HAND);
  else if ((mouseX > position_carte[5][0] && mouseX < position_carte[5][0] + taille_carte_terrain[0]) && (mouseY > position_carte[5][1] && mouseY < position_carte[5][1] + taille_carte_terrain[1]))  cursor(HAND);
  else if ((mouseX > position_carte[6][0] && mouseX < position_carte[6][0] + taille_carte_terrain[0]) && (mouseY > position_carte[6][1] && mouseY < position_carte[6][1] + taille_carte_terrain[1]))  cursor(HAND);
  else if ((mouseX > position_carte[7][0] && mouseX < position_carte[7][0] + taille_carte_terrain[0]) && (mouseY > position_carte[7][1] && mouseY < position_carte[7][1] + taille_carte_terrain[1]))  cursor(HAND);
  else if ((mouseX> 1200 && mouseX < 1270) && (mouseY > 360 && mouseY < 400)) cursor(HAND);
  else if ((mouseX > position_compo[0][0] && mouseX < position_compo[0][0] + taille_compo[0]) && (mouseY > position_compo[0][1] && mouseY < position_compo[0][1] + taille_compo[1]))  cursor(HAND);
  else if ((mouseX > position_compo[1][0] && mouseX < position_compo[1][0] + taille_compo[0]) && (mouseY > position_compo[1][1] && mouseY < position_compo[1][1] + taille_compo[1]))  cursor(HAND);
  else if ((mouseX > position_compo[2][0] && mouseX < position_compo[2][0] + taille_compo[0]) && (mouseY > position_compo[2][1] && mouseY < position_compo[2][1] + taille_compo[1]))  cursor(HAND);
  else if ((mouseX > position_compo[3][0] && mouseX < position_compo[3][0] + taille_compo[0]) && (mouseY > position_compo[3][1] && mouseY < position_compo[3][1] + taille_compo[1]))  cursor(HAND);
  else if ((mouseX > position_compo[4][0] && mouseX < position_compo[4][0] + taille_compo[0]) && (mouseY > position_compo[4][1] && mouseY < position_compo[4][1] + taille_compo[1]))  cursor(HAND);
  else cursor(ARROW);

}

void keyPressed(){
  if (key == CODED);
  if (keyCode == ENTER)  stat_carte[0][1] = 7;
  else if (keyCode == TAB)  stat_carte[1][1] = 3; 
  else if (keyCode == CONTROL){
    attaque = -1;
    defense = -1;
    cadre = false;
    blit();
  }
  else if (keyCode == 97) {
    if (tour % 2 == 0) {
      if (mana_J2 >= 1){ 
        mana_J2 -= 1;
        println ("Le mana du J2 est de "  + mana_J2);
        }
      else println ("Vous n'avez plus assez de mana");
    }
    else if (tour % 2 == 1){
      if (mana_J1 >= 1){
        mana_J1 -= 1;
        println( "Le mana du J1 est de " + mana_J1);
        }
      else println("Vous n'avez plus assez de mana");
    }
  }
  else if (keyCode == 98) {
    if (tour % 2 == 0) {
      if (mana_J2 >= 2){ 
        mana_J2 -= 2;
        println ("Le mana du J2 est de "  + mana_J2);
        }
      else println ("Vous n'avez plus assez de mana");
    }
    else if (tour % 2 == 1){
      if (mana_J1 >= 2){
        mana_J1 -= 2;
        println( "Le mana du J1 est de " + mana_J1);
        }
      else println("Vous n'avez plus assez de mana");
    }
  }
   else if (keyCode == 99) {
    if (tour % 2 == 0) {
      if (mana_J2 >= 3){ 
        mana_J2 -= 3;
        println ("Le mana du J2 est de "  + mana_J2);
        }
      else println ("Vous n'avez plus assez de mana");
    }
    else if (tour % 2 == 1){
      if (mana_J1 >= 3){
        mana_J1 -= 3;
        println( "Le mana du J1 est de " + mana_J1);
        }
      else println("Vous n'avez plus assez de mana");
    }
  }
}


void assignation(){
  cibleX = position_carte[defense][0];
  cibleY = position_carte[defense][1];
  stat_carte[defense][1] -= stat_carte[attaque][0];
  stat_carte[attaque][1] -= stat_carte[defense][0];  
  if (tour % 2 == 1)  prise_compo_1_J1 = prise_compo_2_J1 = prise_compo_3_J1 = prise_compo_4_J1 = prise_compo_5_J1 = 0;
  if (tour % 2 == 0)  prise_compo_1_J2 = prise_compo_2_J2 = prise_compo_3_J2 = prise_compo_4_J2 = prise_compo_5_J2 = 0;
}



//Faire une seul fonction pour toutes les cartes 
void deplacement_cible_carte1(){
  if(position_carte[0][0] != cibleX)  position_carte[0][0] += (cibleX - position_carte[0][0])/vitesse;
  if(position_carte[0][1] != cibleY)  position_carte[0][1] += (cibleY - position_carte[0][1])/vitesse;
  if((cibleX - position_carte[0][0] <= 1 && cibleX - position_carte[0][0] >= -1) && (cibleY - position_carte[0][1] <= 1 && cibleY - position_carte[0][1] >= -1))  attaque = defense = -1;
}
  
//Faire une seul fonction pour toutes les cartes  
void deplacement_source_carte1(){
  if(position_carte[0][0] != source_carte[0][0])  position_carte[0][0] += (source_carte[0][0] - position_carte[0][0])/vitesse;  
  if(position_carte[0][1] != source_carte[0][1])  position_carte[0][1] += (source_carte[0][1] - position_carte[0][1])/vitesse;
}


//Faire une seul fonction pour toutes les cartes 
void deplacement_cible_carte2(){
  if(position_carte[1][0] != cibleX)  position_carte[1][0] += (cibleX - position_carte[1][0])/vitesse;
  if(position_carte[1][1] != cibleY)  position_carte[1][1] += (cibleY - position_carte[1][1])/vitesse;
  if((cibleX - position_carte[1][0] <= 1 && cibleX - position_carte[1][0] >= -1) && (cibleY - position_carte[1][1] <= 1 && cibleY - position_carte[1][1] >= -1))  attaque = defense = -1;
}
  
//Faire une seul fonction pour toutes les cartes  
void deplacement_source_carte2(){
  if(position_carte[1][0] != source_carte[1][0])  position_carte[1][0] += (source_carte[1][0] - position_carte[1][0])/vitesse;  
  if(position_carte[1][1] != source_carte[1][1])  position_carte[1][1] += (source_carte[1][1] - position_carte[1][1])/vitesse;
}



void deplacement_cible_carte3(){
  if(position_carte[2][0] != cibleX)  position_carte[2][0] += (cibleX - position_carte[2][0])/vitesse;
  if(position_carte[2][1] != cibleY)  position_carte[2][1] += (cibleY - position_carte[2][1])/vitesse;
  if((cibleX - position_carte[2][0] <= 1 && cibleX - position_carte[2][0] >= -1) && (cibleY - position_carte[2][1] <= 1 && cibleY - position_carte[2][1] >= -1))  attaque = defense = -1;
}
  
//Faire une seul fonction pour toutes les cartes  
void deplacement_source_carte3(){
  if(position_carte[2][0] != source_carte[2][0])  position_carte[2][0] += (source_carte[2][0] - position_carte[2][0])/vitesse;  
  if(position_carte[2][1] != source_carte[2][1])  position_carte[2][1] += (source_carte[2][1] - position_carte[2][1])/vitesse;
}



void deplacement_cible_carte4(){
  if(position_carte[3][0] != cibleX)  position_carte[3][0] += (cibleX - position_carte[3][0])/vitesse;
  if(position_carte[3][1] != cibleY)  position_carte[3][1] += (cibleY - position_carte[3][1])/vitesse;
  if((cibleX - position_carte[3][0] <= 1 && cibleX - position_carte[3][0] >= -1) && (cibleY - position_carte[3][1] <= 1 && cibleY - position_carte[3][1] >= -1))  attaque = defense = -1;
}
  
//Faire une seul fonction pour toutes les cartes  
void deplacement_source_carte4(){
  if(position_carte[3][0] != source_carte[3][0])  position_carte[3][0] += (source_carte[3][0] - position_carte[3][0])/vitesse;  
  if(position_carte[3][1] != source_carte[3][1])  position_carte[3][1] += (source_carte[3][1] - position_carte[3][1])/vitesse;
}



void deplacement_cible_carte5(){
  if(position_carte[4][0] != cibleX)  position_carte[4][0] += (cibleX - position_carte[4][0])/vitesse;
  if(position_carte[4][1] != cibleY)  position_carte[4][1] += (cibleY - position_carte[4][1])/vitesse;
  if((cibleX - position_carte[4][0] <= 1 && cibleX - position_carte[4][0] >= -1) && (cibleY - position_carte[4][1] <= 1 && cibleY - position_carte[4][1] >= -1))  attaque = defense = -1;
}
  
//Faire une seul fonction pour toutes les cartes  
void deplacement_source_carte5(){
  if(position_carte[4][0] != source_carte[4][0])  position_carte[4][0] += (source_carte[4][0] - position_carte[4][0])/vitesse;  
  if(position_carte[4][1] != source_carte[4][1])  position_carte[4][1] += (source_carte[4][1] - position_carte[4][1])/vitesse;
}



void deplacement_cible_carte6(){
  if(position_carte[5][0] != cibleX)  position_carte[5][0] += (cibleX - position_carte[5][0])/vitesse;
  if(position_carte[5][1] != cibleY)  position_carte[5][1] += (cibleY - position_carte[5][1])/vitesse;
  if((cibleX - position_carte[5][0] <= 1 && cibleX - position_carte[5][0] >= -1) && (cibleY - position_carte[5][1] <= 1 && cibleY - position_carte[5][1] >= -1))  attaque = defense = -1;
}
  
//Faire une seul fonction pour toutes les cartes  
void deplacement_source_carte6(){
  if(position_carte[5][0] != source_carte[5][0])  position_carte[5][0] += (source_carte[5][0] - position_carte[5][0])/vitesse;  
  if(position_carte[5][1] != source_carte[5][1])  position_carte[5][1] += (source_carte[5][1] - position_carte[5][1])/vitesse;
}



void deplacement_cible_carte7(){
  if(position_carte[6][0] != cibleX)  position_carte[6][0] += (cibleX - position_carte[6][0])/vitesse;
  if(position_carte[6][1] != cibleY)  position_carte[6][1] += (cibleY - position_carte[6][1])/vitesse;
  if((cibleX - position_carte[6][0] <= 1 && cibleX - position_carte[6][0] >= -1) && (cibleY - position_carte[6][1] <= 1 && cibleY - position_carte[6][1] >= -1))  attaque = defense = -1;
}
  
//Faire une seul fonction pour toutes les cartes  
void deplacement_source_carte7(){
  if(position_carte[6][0] != source_carte[6][0])  position_carte[6][0] += (source_carte[6][0] - position_carte[6][0])/vitesse;  
  if(position_carte[6][1] != source_carte[6][1])  position_carte[6][1] += (source_carte[6][1] - position_carte[6][1])/vitesse;
}



void deplacement_cible_carte8(){
  if(position_carte[7][0] != cibleX)  position_carte[7][0] += (cibleX - position_carte[7][0])/vitesse;
  if(position_carte[7][1] != cibleY)  position_carte[7][1] += (cibleY - position_carte[7][1])/vitesse;
  if((cibleX - position_carte[7][0] <= 1 && cibleX - position_carte[7][0] >= -1) && (cibleY - position_carte[7][1] <= 1 && cibleY - position_carte[7][1] >= -1))  attaque = defense = -1;
}
  
//Faire une seul fonction pour toutes les cartes  
void deplacement_source_carte8(){
  if(position_carte[7][0] != source_carte[7][0])  position_carte[7][0] += (source_carte[7][0] - position_carte[7][0])/vitesse;  
  if(position_carte[7][1] != source_carte[7][1])  position_carte[7][1] += (source_carte[7][1] - position_carte[7][1])/vitesse;
}

void deplacement_compo_carte1(){
  if(position_carte[0][0] != cibleX)  position_carte[0][0] += (cibleX - position_carte[0][0])/vitesse_compo;
  if(position_carte[0][1] != cibleY)  position_carte[0][1] += (cibleY - position_carte[0][1])/vitesse_compo;
}

void deplacement_compo_carte2(){
  if(position_carte[1][0] != cibleX)  position_carte[1][0] += (cibleX - position_carte[1][0])/vitesse_compo;
  if(position_carte[1][1] != cibleY)  position_carte[1][1] += (cibleY - position_carte[1][1])/vitesse_compo;
}
void deplacement_compo_carte3(){
  if(position_carte[2][0] != cibleX)  position_carte[2][0] += (cibleX - position_carte[2][0])/vitesse_compo;
  if(position_carte[2][1] != cibleY)  position_carte[2][1] += (cibleY - position_carte[2][1])/vitesse_compo;
}
void deplacement_compo_carte4(){
  if(position_carte[3][0] != cibleX)  position_carte[3][0] += (cibleX - position_carte[3][0])/vitesse_compo;
  if(position_carte[3][1] != cibleY)  position_carte[3][1] += (cibleY - position_carte[3][1])/vitesse_compo;
}
void deplacement_compo_carte5(){
  if(position_carte[4][0] != cibleX)  position_carte[4][0] += (cibleX - position_carte[4][0])/vitesse_compo;
  if(position_carte[4][1] != cibleY)  position_carte[4][1] += (cibleY - position_carte[4][1])/vitesse_compo;
}
void deplacement_compo_carte6(){
  if(position_carte[5][0] != cibleX)  position_carte[5][0] += (cibleX - position_carte[5][0])/vitesse_compo;
  if(position_carte[5][1] != cibleY)  position_carte[5][1] += (cibleY - position_carte[5][1])/vitesse_compo;
}
void deplacement_compo_carte7(){
  if(position_carte[6][0] != cibleX)  position_carte[6][0] += (cibleX - position_carte[6][0])/vitesse_compo;
  if(position_carte[6][1] != cibleY)  position_carte[6][1] += (cibleY - position_carte[6][1])/vitesse_compo;
}
void deplacement_compo_carte8(){
  if(position_carte[7][0] != cibleX)  position_carte[7][0] += (cibleX - position_carte[7][0])/vitesse_compo;
  if(position_carte[7][1] != cibleY)  position_carte[7][1] += (cibleY - position_carte[7][1])/vitesse_compo;
}