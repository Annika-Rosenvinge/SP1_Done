class Game {
  //egenskaber
  int w;
  int h;
  int numberOfEnemies;
  int numberOfFood;
  int playerLife;
  int player2Life;
  int[][]board;
  Keys keys;
  Dot player;
  Dot[] player2;
  Dot[] enemies;
  Dot[] food;
  int lifeMax=100;
  int lifeMin=0;

  //konstruktør
  Game (int gridWidth, int gridHeight, int enemyNumbers, int foodNumbers) {
    w = gridWidth;
    h = gridHeight;
    numberOfEnemies = enemyNumbers;
    numberOfFood = foodNumbers;
    enemies = new Dot[enemyNumbers];
    playerLife = 50;
    board = new int[gridWidth][gridHeight];
    player = new Dot(0, 1, w-1, h-1);
    keys = new Keys();
    food = new Dot[foodNumbers];

    for (int i = 0; i < enemyNumbers; i++) {
      enemies[i] = new Dot ( w-1, h-1, w-1, h-1);
    }
    for (int i = 0; i < foodNumbers; i++) {
      food[i] = new Dot ( w-1, h-1, w-1, h-1);
    }
    playerLife = lifeMax;
    player2Life = lifeMax;
  }
  //metoder
  int[][] getBoard() { 
    return board;
  }

  int getWidth() {
    return h;
  }

  int getHeight() {
    return w;
  }
  int playerLife() {
    return playerLife;
  }
  int player2Life() {
    return player2Life;
  }

  void onKeyPressed(char k) {
    keys.onKeyPressed(k);
  }
  void onKeyReleased(char k) {
    keys.onKeyReleased(k);
  }
  void update() {
    updatePlayer();
    updatePlayer2();
    updateEnemies();
    updateEnemiesP2();
    updateFood();
    updateFoodP2();
    checkForCollisions();
    checkForCollisionsP2();
    checkForFoodColl();
    checkForFoodCollP2();


    clearBoard();
  }

  void updatePlayer() {
    // tjekke om spilleren har trykket på a,s,d eller w
    //og koden fortæller hvilken vej man skal rykke sig
    if (keys.wDown) { 
      player.moveUp();
    }
    if (keys.aDown) {
      player.moveLeft();
    }
    if (keys.sDown) {
      player.moveDown();
    }
    if (keys.dDown) {
      player.moveRight();
    }
  }
  void updatePlayer2() {
    // tjekke om spilleren har trykket på a,s,d eller w
    //og koden fortæller hvilken vej man skal rykke sig
    if (keys.p1Down) { 
      player.moveUp();
    }
    if (keys.p3Down) {
      player.moveLeft();
    }
    if (keys.p2Down) {
      player.moveDown();
    }
    if (keys.p4Down) {
      player.moveRight();
    }
  }

  void updateEnemies() {
    // looper igennem alle fjender
    for (int i=0; i<enemies.length; i++) {
      // nogle gange skal fjende i følge efter spiller andre gange flytte sig random

      if (i>=0) {
        int dX = player.xPos - enemies[i].xPos;
        int dY = player.yPos - enemies[i].yPos;

        //denne blok fortæller enemy hvilken vej den skal rykke sig.
        if (dX>0) {
          enemies[i].moveRight();
        } else  if (dX<0) {
          enemies[i].moveLeft();
        } else if (dY>0) {
          enemies[i].moveDown();
        } else if (dY<0) {
          enemies[i].moveUp();
        }
      }
      int rand = (int) random(4);
      if (rand == 0) {
        enemies[i].moveUp();
      }
      if (rand == 1) {
        enemies[i].moveDown();
      }
      if (rand == 2) {
        enemies[i].moveRight();
      }
      if (rand == 3) {
        enemies[i].moveLeft();
      }
    }
  }

  void updateEnemiesP2() {
    // looper igennem alle fjender
    for (int i=0; i<enemies.length; i++) {
      // nogle gange skal fjende i følge efter spiller andre gange flytte sig random

      if (i>=0) {
        int dX = player.xPos - enemies[i].xPos;
        int dY = player.yPos - enemies[i].yPos;

        //denne blok fortæller enemy hvilken vej den skal rykke sig.
        if (dX>0) {
          enemies[i].moveRight();
        } else  if (dX<0) {
          enemies[i].moveLeft();
        } else if (dY>0) {
          enemies[i].moveDown();
        } else if (dY<0) {
          enemies[i].moveUp();
        }
      }
      int rand = (int) random(4);
      if (rand == 0) {
        enemies[i].moveUp();
      }
      if (rand == 1) {
        enemies[i].moveDown();
      }
      if (rand == 2) {
        enemies[i].moveRight();
      }
      if (rand == 3) {
        enemies[i].moveLeft();
      }
    }
  }

  void updateFood() {
    // looper igennem alle fjender
    for (int i=0; i<food.length; i++) {
      // nogle gange skal fjende i følge efter spiller andre gange flytte sig random

      if (i>=0) {
        int dX = player.xPos - food[i].xPos;
        int dY = player.yPos - food[i].yPos;

        //denne blok fortæller enemy hvilken vej den skal rykke sig.
        if (dX>0) {
          food[i].moveRight();
        } else  if (dX<0) {
          food[i].moveLeft();
        } else if (dY>0) {
          food[i].moveDown();
        } else if (dY<0) {
          food[i].moveUp();
        }
      }
      int rand = (int) random(4);
      if (rand == 0) {
        food[i].moveUp();
      }
      if (rand == 1) {
        food[i].moveDown();
      }
      if (rand == 2) {
        food[i].moveRight();
      }
      if (rand == 3) {
        food[i].moveLeft();
      }
    }
  }
  void updateFoodP2() {
    // looper igennem alle fjender
    for (int i=0; i<food.length; i++) {
      // nogle gange skal fjende i følge efter spiller andre gange flytte sig random

      if (i>=0) {
        int dX = player2.xPos - food[i].xPos;
        int dY = player2.yPos - food[i].yPos;

        //denne blok fortæller enemy hvilken vej den skal rykke sig.
        if (dX>0) {
          food[i].moveRight();
        } else  if (dX<0) {
          food[i].moveLeft();
        } else if (dY>0) {
          food[i].moveDown();
        } else if (dY<0) {
          food[i].moveUp();
        }
      }
      int rand = (int) random(4);
      if (rand == 0) {
        food[i].moveUp();
      }
      if (rand == 1) {
        food[i].moveDown();
      }
      if (rand == 2) {
        food[i].moveRight();
      }
      if (rand == 3) {
        food[i].moveLeft();
      }
    }
  }



  void checkForCollisions() {
    // dvs hvis der er 1 i feltet og 2 er samme sted har vi collision
    // spørg hver fjende er du samme sted som player?
    for (int i=0; i<enemies.length; i++) {
      //getX og getY er funktioner under dots
      if (enemies[i].getX() == player.getX() && enemies[i].getY() == player.getY()) {
        // then coll and player looses one lifepoint
        if (playerLife>lifeMin) {
          playerLife--;
        }
      }
    }
  }

  void checkForCollisionsP2() {
    // dvs hvis der er 1 i feltet og 2 er samme sted har vi collision
    // spørg hver fjende er du samme sted som player?
    for (int i=0; i<enemies.length; i++) {
      //getX og getY er funktioner under dots
      if (enemies[i].getX() == player2.getX() && enemies[i].getY() == player2.getY()) {
        // then coll and player looses one lifepoint
        if (player2Life>lifeMin) {
          player2Life--;
        }
      }
    }
  }
  void checkForFoodColl() {
    // dvs hvis der er 1 i feltet og 2 er samme sted har vi collision
    // spørg hver fjende er du samme sted som player?
    for (int i=0; i<food.length; i++) {
      //getX og getY er funktioner under dots
      if (food[i].getX() == player.getX() && food[i].getY() == player.getY()) {
        // then coll and player looses one lifepoint
        if (playerLife<lifeMin) {
          playerLife++;
          food[i].x = (int)random(0, 25);
          food[i].y = (int)random(0, 25);
        }
      }
    }
  }
  void checkForFoodCollP2() {
    // dvs hvis der er 1 i feltet og 2 er samme sted har vi collision
    // spørg hver fjende er du samme sted som player?
    for (int i=0; i<food.length; i++) {
      //getX og getY er funktioner under dots
      if (food[i].getX() == player2.getX() && food[i].getY() == player2.getY()) {
        // then coll and player looses one lifepoint
        if (player2Life<lifeMin) {
          player2Life++;
          food[i].x = (int)random(0, 25);
          food[i].y = (int)random(0, 25);
        }
      }
    }
  }



  // denne metode sikre at der ikke kommer uendelige enemies, da de ikke bliver "fjernet"
  void clearBoard() {
    for (int y = 0; y < h; ++y) {
      for (int x = 0; x < w; ++x) {
        board[x][y]=0;
      }
    }
  }
  // denne metode sikre at man kan se player og enemies
  void populateBoard() {
    // insert player
    board[player.getX()][player.getY()] = 1;
    for (int i = 0; i < enemies.length; ++i) {
      board[enemies[i].getX()][enemies[i].getY()]= 2;
    }
    for ( int i=0; i<food.length; i++) {
      board[food[i].getX()][food[i].getY()] = 3;
    }
  }
}
