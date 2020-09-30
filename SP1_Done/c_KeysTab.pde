class Keys {
  //egenskaber
  private boolean wDown = false;
  private boolean aDown = false;
  private boolean sDown = false;
  private boolean dDown = false;
  private boolean p1Down = false;
  private boolean p2Down = false;
  private boolean p3Down = false;
  private boolean p4Down = false;

  //kontruktør
  Keys() {
  }

  // metoder
  // Disse 2 metoder gør så spilleren kan rykke sig
  // Den øverste er hvis man trykker på en tast, så bliver boolean = true og det betyder,
  // at spillleren rykker sig den vej, denne her metode for tildelt under game tab.
  void onKeyPressed(char k) {
    if (k=='a' || k=='A') {
      aDown=true;
    }
    if (k=='s' || k=='S') {
      sDown=true;
    }
    if (k=='w' || k=='W') {
      wDown=true;
    }
    if (k=='d' || k=='D') {
      dDown=true;
    }
    if (keyCode ==UP) {
      p1Down= true;
    } else if (keyCode == DOWN) {
      p2Down=true;
    } else if (keyCode ==LEFT) {
      p3Down=true;
    } else if (keyCode == RIGHT) {
      p4Down=true;
    }
  }
  // denne her metode fortæller at når tasten ikke længere presses eller holdes inde, 
  // altså hvis en eller flere af boolean's = false; 
  // så skal den ikke længere rykke sig den vej den får tildelt under game tab.
  void onKeyReleased(char k) {
    if (k=='a' || k=='A') {
      aDown=false;
    }
    if (k=='s' || k=='S') {
      sDown=false;
    }
    if (k=='w' || k=='W') {
      wDown=false;
    }
    if (k=='d' || k=='D') {
      dDown=false;
    }
    if (keyCode == UP) {
      p1Down=false;
    } else if (keyCode == DOWN) {
      p2Down=false;
    } else if (keyCode == LEFT) {
      p3Down=false;
    } else if (keyCode== RIGHT) {
      p4Down=false;
    }
  }
}
