import cc.arduino.*  ;

int button = 7;
int led = 13;
int buttonState = 0;
String na = "NULL";


//making the Cell class and creating our grid

public class Cell {
  public int x = -1;
  public int y = -1; 
  public Cell(int X, int Y) {
    x = X;
    y = Y;
  }
  void assign(){
    centreFile = strfry(x, y);
    if (y==4)
      frontFile = na;
    else
      frontFile  = strfry(x, y+1);
    if (y==0)
      backFile = na;
    else
      backFile   = strfry(x, y-1);
    if (x==4)
      rightFile = na;
    else
      rightFile  = strfry(x+1, y);
    if (x==0)
       leftFile = na;
    else
      leftFile   = strfry(x-1, y);
    
  }
  public String centreFile;
  public String frontFile;
  public String backFile;
  public String rightFile;
  public String leftFile;
}


Cell[][] grid = new Cell[5][5];

//Cell potato  = new Cell;


String strfry(int n, int p){                              //strfry() takes two ints and returns their concatenated string
  return (Integer.toString(n)+Integer.toString(p));
}
void cellAssign(Cell[][] grid) {
  for (int i = 0; i <5; i++) {
    for (int k = 0; k<5; k++) {
      Cell temp = new Cell(i, k);
      temp.assign();
      grid[i][k] = temp;
      
    }
  }
}

{  
  cellAssign(grid);
}

Cell now = new Cell(2, 1);



void display(Cell x){
  println(x.x, x.y);  
  /*for (int i = 0; i<4; i++){
    println();
  }
  println("   "+x.frontFile);
  println(x.leftFile, x.centreFile, x.rightFile);
  println("   "+x.backFile);*/
}

void move(String where) {
  if (  (where == "front" && now.y == 4) ||
        (where == "right" && now.x == 4) ||
        (where == "back" && now.y == 0) ||
        (where == "left" && now.x == 0)   )
      play("edge", messMin, mess);
  else {
    switch (where) {
    case "front":
      now = grid[now.x][now.y+1];
      scape(now);
      display(now);
      break;
    case "right":
      now = grid[now.x+1][now.y];
      scape(now);
      display(now);
      break;
    case "back":
      now = grid[now.x][now.y-1];
      scape(now);
      display(now);
      break;
    case "left":
      now = grid[now.x-1][now.y];
      scape(now);
      display(now);
      break;
    }
  }
}



//preparing to detect button press; readButton is called from draw()

Arduino anp = new Arduino(this, "COM3", 57600);

void anpPinSetup() {
  anp.pinMode(button, Arduino.INPUT);
  anp.pinMode(led, Arduino.OUTPUT);
}


void readButton() {
  buttonState = anp.digitalRead(button);
  if (buttonState == 1) {
    anp.digitalWrite(led, Arduino.HIGH);
    move(dirn);
    delay(300);
  } else {
    anp.digitalWrite(led, Arduino.LOW);
  }
}