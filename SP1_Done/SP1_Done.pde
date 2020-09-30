Game game = new Game(25, 25, 5, 4);
PFont font;

void setup() {
  size(1001,1001);
  frameRate(10);
  font = createFont("CopperplateGothic-Bold-16.vlw", 16, true);
  textFont(font, 16);
}
void keyPressed() {
  game.onKeyPressed(key);
}

void keyReleased() {
  game.onKeyReleased(key);
}
void draw(){
  //metoden update(); bliver hentet fra game, her gør det så player, 
  //enemy og board bliver vist og alt det andet der er i update();
  game.update();
  background(0);
  
  int [][] board = game.getBoard();
  for (int y = 0; y < game.getHeight(); y++){
    for (int x = 0; x < game.getWidth(); x++){
      //der bliver brugt modulus for at få sammenhængen mellem x og y
      if (board [x][y]==1){
        println("player found " + x + " " + y);
        //player color
        fill(0, 0, 255);
        } 
      else if (board[x][y]==2) {
        //enemy color
        fill(255, 0, 0);
      } 
      else if (board[x][y]==3) {
        //food color
        fill(0, 255, 0);
      }
      else if (board[x][y]==4){
        //player2 color
        fill (255,250,0);
      }
      else if (board[x][y]==0) {
        //bacground color
        fill(0, 0, 0);
      }
      stroke (100,100,100);
      rect(x*40,y*40,40,40);
    }
  }
  fill(255);
  text("Lifes: "+game.playerLife(), 25,25);
  text("Player 2 Life: "+game.player2Life(), 25,40);
}
