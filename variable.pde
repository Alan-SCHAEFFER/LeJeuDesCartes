int wth = 1280;
int hgt = 720;

ArrayList<Card> deckJ1 = new ArrayList<Card>();
ArrayList<Card> deckJ2 = new ArrayList<Card>();
ArrayList<Composant> compo = new ArrayList<Composant>();

int turn = 1;
int maxCard = 10;

float[] positionDeck = {hgt*0.8, hgt*0.2};
float[][] positionDraw = {{wth/2, 1.5*hgt}, {wth/2, -0.5*hgt}};

int attack = -1;
int defense = -1;
int priseCompo = -1;

int scoreJ1 = 0;
int scoreJ2 = 0;