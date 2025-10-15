//import processing.sound.*;
// set up canvas

 
void setup(){

  size(1100, 600);
  noStroke();
  background(175);
  
  
   //SoundFile myMusic;
   //myMusic = new SoundFile(this, "TRACK.mp3");

  // label grid
  stroke(0);
  fill(0);
  
  text(" Player 1  " + "\n\n Player 2 ", 420, 20);
  text("BLOCKER DICE", 418, 86);
  text("1", 427, 142);
  text("2", 477, 142);
  text("Toss Dice: ", 510, 150);
  
  
}

int rowCells = 4;
int colCells = 8;

int scoreP1 = 0;
int scoreP2 = 0;
int scoreBase = 0;

float centerX = width/2;
float centerY = height/2;

//float rectSize = cellSize;

float shapeWidth = width/2;
float shapeHeight = height/2;

float cells = width / colCells;

//Start button default bool
boolean isOverRect = false;
    
  int placedPiecesP1 = 0;
  int placedPiecesP2 = 0;
  int placedPiecesTotal = 0;
void draw(){frameRate(10); // Debug 1 frame per second 
//TRIP MODE by pressing 7
  if(keyPressed&&key=='7'){
    background(random(0, 200), random(0, 200), random(0, 200));
  }

  
   
  // 3 squares for the mask of none placement pieces in canvas
  
  noStroke();
  //fill(random(0, 255/1.5), random(0, 240/3), random(0, 250/2.7));
  fill(0);
  rect(0, 400, 300, 40);
  fill(0);
  
  //fill(0);
  rect(0, 0, 200, 600);
  rect(200, 305, 1200, 600);
  rect(600, 0, 1200, 600);

  // Layout
  stroke(2);
  noFill();
  square(200, CENTER, 300); 
  
  //  EXTRA BOARD SPACE
  fill(175);
  stroke(2);
  strokeWeight(3);
  square(140, 315, 170);
  // BOTH GRIDS 0
  for(int i=0; i<rowCells; i++){
    stroke(color(75));
    strokeWeight(3);
    line(200, i * cells * rowCells * 1.5 * 2, 500, i * cells * rowCells * 1.5 * 2);
    line(200, i * cells * rowCells * 2.2 * i -10, 500, i * cells * rowCells * 2.2 * i -10);
    line(200, i * cells * rowCells * 2.8 * i -10, 500, i * cells * rowCells * 2.8 * i -10);

  }
  for(int i=0; i<colCells; i++){
    strokeWeight(3);
    line(220 + i * colCells * cells * 2 / 3.5 / 2, 300, 220 + i * cells * colCells * 2 / 3.5 / 2, 0);
    
  }
  
  for(int i=0; i<rowCells; i++){
    strokeWeight(3);
    
    line(200, i * cells * rowCells * 1.5, 450, i * cells * rowCells * 1.5);
  }
  for(int i=0; i<colCells; i++){
    strokeWeight(3);
    //line(220 + i  * colCells * cells * 2 / 3.5 / 2, 102, 220 + i * cells * colCells * 2 / 3.5 / 2, 0);
   
  }

  // game pieces
  stroke(1);
  fill(255);
  
  // first piece
  square(420, 180, 8);
  square(420, 170, 8);
  square(430, 180, 8);
  
  // second piece
  square(460, 180, 8);
  square(460, 170, 8);
  square(470, 180, 8);
  square(470, 170, 8);
  
  // thrid piece 
  square(420, 270, 8);
  square(420, 260, 8);
  square(420, 250, 8);
  
  // fourth piece
  square(445, 270, 8);
  square(445, 260, 8);
  
  // fifth piece
  square(480, 270, 8);
  square(480, 260, 8);
  square(480, 250, 8);
  square(470, 260, 8);
  square(470, 250, 8);
  
  // Blocker game pieces 
  fill(100, 240, 160);
  circle(430, 120, 20);
  
  // Builder game pieces
  fill(255);
  square(470, 110, 18);

  // SELECT CURRENT SHAPE AND DISPLAY
  boolean choosed = false;
  
  
  // Toss a Dice by Pressing 3
  if(keyPressed && key == '3'){
      text("Number: " + int(random(1, 20)), 510, 150);
      fill(175);
      noStroke();
      rect(510, 130, 65, 25);
      fill(0);
      text("Toss Dice: " + int(random(1, 20)), 510, 150);
  }
  
  if(keyPressed && key == '1'){
    choosed = true;
    fill(175);
    noStroke();
    rect(515, 80, 80, 60);
    fill(0);
    text("Current : ", 520, 120);

    if(choosed==true){
      fill(0);
      stroke(2);
      strokeWeight(3);
      
      fill(100, 240, 160);
      circle(580, 118, 18);
      scoreP1 += 3;
      
    }
 
  }
  if(keyPressed && key == '2'){ 
    choosed = true;
    fill(175);
    noStroke();
    rect(515, 80, 80, 60);
    fill(0);
    text("Current : ", 520, 120);

    if(choosed==true){
      fill(0);
      stroke(2);
      strokeWeight(2);
      
      fill(255);
      square(575, 110, 18);
      int buff = 100;
      for(int i=0; i<buff; i++){
        square(random(200, 350), random(100, 400), 4);
        
      }
      scoreP2 += 3; 
      

      }
    }


  // PLAYER ONE (BUILDER) BUTTONS [O] 
  // the button [Z] is to draw the shape in the board
  if(keyPressed && key == 'z'){
      scoreP1 += 2; // Gain points
      fill(100, 240, 160); // light green
      stroke(color(0));
      strokeWeight(2);
      circle(mouseX, mouseY, 13);  
  }
  if(keyPressed && key == 'o'){
      scoreP2 += 2; // Gain points
      fill(255);
      stroke(color(0));
      strokeWeight(2);
      square(mouseX, mouseY, 10);
    }

  // EXTRA CONTROLS 
  if(keyPressed && key == 'm'){
    noStroke(); 
    fill(5, 100, 230);
    rect(mouseX, mouseY, 22, 146);
    scoreP1 += -5;
    scoreP2 += -5;
    if(scoreP1==-50){
      background(255,0,0);
      fill(255);
      text("GAME OVER, BOTH PLAYERS FAILED", 210, 300);
    }
    if(scoreP2==-50){ 
      background(255,0,0);
      fill(255);
      text("GAME OVER, BOTH PLAYERS FAILED", 200, 300);
    }
    
  }
  if(keyPressed && key == 'q'){
    noStroke();
    fill(200, 70, 70);
    rect(mouseX, mouseY, 200, 26);
    scoreP1 += -5;
    scoreP2 += -5;
    if(scoreP1==-550&&scoreP2==-550){
      background(255,0,0);
      fill(255);
      text("GAME STARTED, BOTH PLAYERS FAILED STAY STATIC", 210, 300);
    }
  }

  
 
  float centerX = width/2;
  float centerY = height/2;
  
  float baseSize = 2;
  
// GLOW EFFECT FORMULA BUT IT BEEN MODIFY IN THIS GAME... GOOGLE SEARCHED
  for(int i = 10; i > 0; i--){
    float glowSize = baseSize + (i * 5);
    int alpha = i * 4;
    //stroke(2);
    //strokeWeight(3);
    noStroke();
    fill(225/3, 210, 100, alpha);
   
    
    if(keyPressed&&key=='1'){
      ellipse(centerX-random(200,485), centerY-random(50, 100), glowSize, glowSize);
      if(scoreP1>60){
        ellipse(centerX-random(200,485), centerY-random(0, 60), glowSize, glowSize);
      }
      
    }
    ellipse(centerX-370, random(0, 999), glowSize/2, glowSize/2);
    if(keyPressed&&key=='1'){
      centerX = centerX+random(25, 250);
    }
     
  }
  // END OF AI MODE
   
   int scoreWinner = 100;
   
  
  fill(175);
  noStroke();
  rect(510, 5, 80, 50);
  fill(0);
  text(" Score : " + scoreP1, 518, 20); 
  text(" Score : " + scoreP2, 518, 45); 
  // check who wins
  if(scoreP2>scoreP1&&scoreP2>=scoreWinner){
    background(0);
    fill(255);
    text("Blockers Wins", 700, 300);
    
  }
  if(scoreP1>scoreP2&&scoreP1>=scoreWinner){
    background(0);
    fill(255);
    text("Builder Wins", 700, 300);
  }
  
  if(scoreP1==scoreP2&&scoreP1>scoreBase&&scoreP2>scoreBase&&scoreP1>40&&scoreP2>40){
    background(0);
    fill(255);
    text("ITS A DRAW", 700, 300);
    
    }
    // guide
  fill(255);
  text("Guidence for Mechanics of the Game Play:\n \nPlayer 1 Press 'o' Which are the Builders. " +
       "\nPlayer 2 Press 'z' Which are the Blockers." + 
       "\nPlayer 3 Press 'm' Which are the blue Markers but Vertical." +
       "\nPlayer 4 Press 'q' which are the Red Markers but Horizontal" +
       
       "\n1) Avoid reaching -50 in the score." +
       "\n2) Place as many Blocks as possible without reaching score at 50 or will lose" +
       "\n3) Trip Mode by Pressing 7 Button toggle rainbow background on/off." + 
       "\n4) To create a new game Press space", 700, 100);
       

 //  RESTART BOARD
  if(keyPressed&&key==' '){
    background(175);
    stroke(0);
    fill(0);
    text(" Player 1  " + "\n\n Player 2 ", 420, 20);
    text("BLOCKER DICE", 418, 86);
    text("1", 427, 142);
    text("2", 477, 142);
    text("Toss Dice: ", 510, 150);
    placedPiecesTotal=0;
    scoreP1=0;
    scoreP2=0;
    
    
  }

    
if(keyPressed&&key!=' '||keyPressed&&key!='3'||keyPressed&&key!='7'){
  if(keyPressed&&key=='z'||keyPressed&&key=='o'){
      placedPiecesTotal += 1;
      fill(175); 
      stroke(color(random(150, 200), random(150, 200), random(150, 200)));
      strokeWeight(2);
      rect(508, 160, 100, 30);
      noFill();
      noStroke();
      fill(0);
      text("Total Moves: " + placedPiecesTotal, 510, 180);
      }
    }

  
}
