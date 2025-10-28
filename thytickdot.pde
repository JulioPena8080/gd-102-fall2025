import processing.sound.*;
//set up canvas
SoundFile myMusic1;
SoundFile myMusic2;

void setup(){

  size(1100, 600);
  noStroke();
  background(175);
  
  myMusic1 = new SoundFile(this, "TRACK_1.wav");
  myMusic2 = new SoundFile(this, "Sidechain.wav");

  // label grid
  stroke(0);
  fill(0);
  
  text(" Player 1  " + "\n\n Player 2 ", 420, 20);
  text("P1                 P2", 418, 86);
  text("1", 427, 142);
  text("2", 477, 142);
  text("Toss Dice: ", 510, 150);
  
  
}

int rowCells = 4;
int colCells = 8;

int scoreP1 = 0;
int scoreP2 = 0;
int scoreP3 = 0;
int scoreP4 = 0;
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
  int p1Win = 0;
  int p2Win = 0;
 
  // abilities limitations                          ||-------------- WARNING !! NOT DONE YET-----------------||
  int p1Ability = 10;
  int p2Ability = 10;
  
  // round number 
  int roundNum = 0;
  boolean gameRunning = false;
  
void draw(){frameRate(60); // Debug 1 frame per second 
    //translate(200, 100);
    //scale(1.1);
    gameRunning=true;
    
    fill(175);
    noStroke();
    rect(510, 5, 80, 100);
    fill(0);
    if(gameRunning==true){
        textSize(10);
        text(" Score : " + scoreP1, 518, 20); 
        text(" Score : " + scoreP2, 518, 45);
        text("P3 score : " + scoreP3, 518, 60);
        text("P4 score : " + scoreP4, 518, 80);
    }
  if(keyPressed&&key=='q'){ // P3 is X 
    scoreP3+=5;
  }
  if(keyPressed&&key=='m'){ // P4 is O
    scoreP4+=5;
  }

//TRIP MODE by pressing 7

  if(keyPressed&&key=='7'){
    background(random(0, 200), random(0, 200), random(0, 200));
  }
    // each player tolal 
  if(keyPressed&&key=='z'){
    placedPiecesP1 += 1;
  }
  if(keyPressed&&key=='o'){
    placedPiecesP2 += 1;
  }
  
  // Play musyc by pressing 5 or 4
  if(keyPressed&&key=='5'){
    myMusic2.play();

  }
  if(keyPressed&&key=='2'){
      myMusic2.stop();
    }
  if(keyPressed&&key=='4'){
    myMusic1.play();

  }
  if(keyPressed&&key=='2'){
      myMusic1.stop();
    }
  
  // ability usage
  if(keyPressed&&key=='1'){
     p1Ability-=1;
  }
  
  if(keyPressed&&key=='0'){
     p2Ability-=1;
  }


  

  // 3 squares for the mask of none placement pieces in canvas
  
  noStroke();
  //fill(random(0, 255/1.5), random(0, 240/3), random(0, 250/2.7));
  fill(0);
  rect(0, 400, 300, 40);
  fill(0);
  
  //fill(0);
  rect(0, 0, 200, 600); // first at left
  rect(200, 305, 1200, 600); // second at mid
  rect(650, 0, 1200, 600); //third at right
  


  // Layout
  stroke(2);
  noFill();
  square(200, CENTER, 300); 
  
  // BOTH GRIDS 0
  for(int i=0; i<rowCells; i++){
    stroke(color(75));
    strokeWeight(3);
    line(200, i * cells * rowCells * 1.5 * 2, 500, i * cells * rowCells * 1.5 * 2);
    line(200, i * cells * rowCells * 2.2 * i -10, 500, i * cells * rowCells * 2.2 * i -10);
    line(200, i * cells * rowCells * 2.8 * i -10, 0, i * cells * rowCells * 2.8 * i -10);

  }
  for(int i=0; i<colCells; i++){
    strokeWeight(3);
    line(220 + i * colCells * cells * 2 / 3.5 / 2, 302, 220 + i * cells * colCells * 2 / 3.5 / 2, 0);
    
  }
  
  for(int i=0; i<rowCells; i++){
    strokeWeight(3);
    
    line(200, i * cells * rowCells * 1.5, 500, i * cells * rowCells * 1.5);
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
      scoreP1 += 10;
      int buff = 10;
      for(int i=0; i<buff; i++){
        circle(random(0, 580), random(0, 210), 18);
      }
      
    }
 
  }
  if(keyPressed && key == '0'){ 
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
        square(random(0, 600), random(0, 400), 4);
        
      }
      scoreP2 += 10; 
     
      }
    }


  // PLAYER ONE (BUILDER) BUTTONS [O] 
  // the button [Z] is to draw the shape in the board
  
  if(keyPressed && key == '6'){
    background(175);
    stroke(0);
    fill(0);
    text(" Player 1  " + "\n\n Player 2 ", 420, 20);
    text("P1                 P2", 418, 86);
    text("1", 427, 142);
    text("2", 477, 142);
    text("Toss Dice: ", 510, 150);
    roundNum++;
    text("Round: " + roundNum, 510, 250);
    text("P1: Ability: " + p1Ability, 510, 220);
    text("P2: Ability: " + p2Ability, 510, 230);
    text("P1 Moves: " + placedPiecesP1, 510, 280);
    text("P2 Moves: " + placedPiecesP2, 510, 300);
    
    

    
  }
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
    stroke(color(0,0,255));
    noFill();
    circle(mouseX, mouseY, 10);
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
   
    
    if(keyPressed&&key=='1'&&scoreP1>700){
     
      ellipse(centerX-random(200,485), centerY-random(50, 100), glowSize, glowSize);
      if(scoreP1>60){
        ellipse(centerX-random(200,485), centerY-random(0, 60), glowSize, glowSize);
      }
      
    }
    ellipse(centerX-370, random(0, 999), glowSize/2, glowSize/2);
    if(keyPressed&&key=='1'&&scoreP1>700){
      centerX = centerX+random(25, 250);
    }
     
  }
  // END OF AI MODE
   
   int scoreWinner = 1000;
   
  
 

  // check who wins 
  
  // first player one which are blockers 
  if(scoreP2>scoreP1&&scoreP2>=scoreWinner){
    background(225/3, 210, 100);
    fill(0);
    translate(0, 0);
    //rotate(180);
    scale(1.5);
    text("Blockers Wins", 200, 300);
    fill(100);
    rect(400, 200, 140, 60);
    fill(0);
    text("LeaderBoard:" + "P1: " + p1Win + " " + "P2: " + p2Win, 400, 220);

    
  }

  //check who wins 
  
  // second player Two which is are builders
  if(scoreP1>scoreP2&&scoreP1>=scoreWinner){
    background(175);
    fill(0);
    translate(0, 0);
    scale(1.5);
    text("Builder Wins", 200, 300);
      // if player won score 

    fill(100);
    rect(400, 200, 140, 60);
    fill(0);
    text("LeaderBoard:" + "P1: " + p1Win + " " + "P2: " + p2Win, 400, 220);

  }
  
// LEADERBOARD
     if(scoreP2==scoreWinner){
        p2Win++;
        if(p2Win==1){p2Win=1;}
     }
     if(scoreP1==scoreWinner){
        p1Win++;
        if(p1Win==1){p1Win=1;}
     }
     if(p1Ability==0){background(0);fill(255);text("P1: LOST BY ABILITY", 350, 25);}
     if(p2Ability==0){background(0);fill(255);text("P2: LOST BY ABILITY", 350, 25);}
     
     // if both player meet at the same scoure // after 500 score 'its a draw' function is called
  PImage avatar_hype;
  avatar_hype = loadImage("avatar3.png");
  if(scoreP1==scoreP2&&scoreP1>scoreBase&&scoreP2>scoreBase&&scoreP1>500&&scoreP2>500){
    background(0);
    image(avatar_hype, 510, 500);
    fill(255);
    text("ITS A DRAW", 400, 300);
    }
  
      // guide
    fill(255);
    // count the time and the amount in score and place it in the leaderboard  /// TO DO 
       

 //  RESTART BOARD
  if(keyPressed&&key==' '){
    background(175);
    stroke(0);
    fill(0);
    text(" Player 1  " + "\n\n Player 2 ", 420, 20);
    text("P1                 P2", 418, 86);
    text("1", 427, 142);
    text("2", 477, 142);
    text("Toss Dice: ", 510, 150);

    placedPiecesTotal=0;
    scoreP1=0;
    scoreP2=0;
    roundNum=0;
    p1Ability=10;
    p2Ability=10;

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
    
    // avatars for each level 
  int level_1 = 350;
  int level_2 = 600;
  int level_3 = 950;
  
  PImage avatar;
  PImage avatar_dead;

  
  avatar = loadImage("avatar.png");
  avatar_dead = loadImage("avatar2.png");
  
  if(scoreP1>=level_1){
    scale(0.1);
    image(avatar, 510, 50);   
  }
  if(scoreP2>=level_1){
    image(avatar, 600, 25);
    
  }
  
  if(scoreP1>level_2){ 
    image(avatar_dead, 600, 900);
  }
  
  if(scoreP2>level_2){
    image(avatar_dead, 1600, 900);
  }
  
  if(scoreP1>level_3){
    image(avatar_hype, 600, 1900);
  }
  if(scoreP2>level_3){
    image(avatar_hype, 1600, 1900);
  
  }
  
  

  
}

void keyPressed(){
  
  // use a X as a mark for the PLAYER 3 and
  // reSizing the text without affecting others texts in canvas
  
  if(keyPressed && key == 'q'){
  //noStroke();
  fill(200, 70, 70);
  textSize(25);
  text("X", mouseX, mouseY, 3000*40);
  scoreP1-=5;
  scoreP2-=5;
  }
  
  
}

  
