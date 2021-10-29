/**** 
Name :Pong play
descripion : this is a virtual game of ping pong 
made as final extra project for suacode 
developer:Mucyo Moses
country:rwanda kigali
release date  :30th june 2020
***/

int gameScreen = 0;


// the paddles
float leftPaddleX= 0; // var for xposition of the left paddle
float leftPaddleY =0; // var for yPosition of the left paddle
float paddleWidth = 20; //var for width of the paddles
float paddleHeight = 95; //var for height of the paddles
float rightPaddleX; //var for x position of the right paddle
float rightPaddleY; //var for y position of the right paddle



//the ball
float ballX; //sets the x position of the ball
float ballY; //sets the y position of the ball
int ballWidth = 30; //sets the width of the ball
int ballHeight = 30; //sets the height of the ball
float radius= 15; // this is the radius of the ball


// the score
float leftScoreX; //sets the x position of the left player score
float leftScoreY = 60;//sets the y position of the left player score
float rightScoreX; //sets the x position of the right player score
int rightScoreY = 60; //sets the y position of the right player score
int leftScore = 0; //sets the left player score
int rightScore = 0; //sets the right player score
float scoreSize = 35; //sets the text size


//the prayer text 
int lineX;
int lineY = 0;
int secondLineX;
int secondLineY ; 
String prayerOne = "player 1:";
String prayerTwo = "player 2:";
float prayerOneX ; 
int prayerOneY = 60;
float prayerTwoX;
int prayerTwoY = 60;


// the speeds
int xSpeed = 10; // this is the speed of the ball in x-axis
int ySpeed = 10; // this is the speed of thw ball in y-axis
int reverse = -1; //this is used to reverse everything
int scoreAdder = 1; // this is to increment the scores
int startPoint = 0; // this is the first point of the graph


// checks if the ball overlap the paddle
boolean hasOverlappedLeftPaddle = false;
boolean hasOverlappedRightPaddle = false;


boolean startGame = false; // this wiil be used to start and end game 

//=====================================
void setup() 
{
  fullScreen();
  orientation(LANDSCAPE);
   
  rightPaddleX=width-paddleWidth;
 
  rightPaddleY = height-paddleHeight;
  
  ballX = width/2;
  
  ballY= height/2;
  leftScoreX = ballX-157;
  rightScoreX = ballX +263;
  lineX = width/2;
  secondLineX = width/2;
  secondLineY = height;
  prayerOneX = leftScoreX-90;
  prayerTwoX = rightScoreX-90;
  
}


//===================================
void draw() 
{
  // Display the contents of the current screen
  if (gameScreen == 0) 
  { 
    initScreen(); 
      
  } else if (gameScreen == 1) 
  { 
    gameplayScreen();
     
  } else if (gameScreen == 2) 
  {
    gameOverScreen();
     
  }
}

/********* SCREEN CONTENTS *********/
void initScreen() 
{
  background(#2F2D41);

  textAlign(CENTER);
  fill(#EDEFF1);

  textSize(70);
  text("pong play", width/2, height/2);
  
  textSize(30);
  text("Made by Mucyo Moses for suacode", width/2, height/1.5);

  textSize(15);
  text("Click to start", width/2, height-30);
  
}

void gameplayScreen() 
{
  background(0);  //sets the background black

  //calling the function defined bellow 
  displayScores();
  displayBall();
  displayPaddles();
  moveBall();
  checkWall();
  setGameMode();
  movePaddles();
  checkLeftPaddle();
  checkRightPaddle();
  
}

void gameOverScreen()
  {
    //conditional statement that checks if all player lifes has been exhausted 
    if (leftScore == 11 || rightScore ==11)
    {
      gameOver(); 
      textSize(15);
  text("Developer Mucyo moses personally thanks you for playing this game ",width/2, height/1.5);

  textSize(15);
  text("Click👆 to Restart", width/2, height-30);

   }
 }
   
void mousePressed() 
{
  // if we are on the initial screen when clicked, start the game 
  if (gameScreen==0) 
  {
    startGame();
      
  }

  if (gameScreen==2) 
  {
    restart();
     leftScore=11;
     rightScore=11;
  }
}

 

void startGame() 
{
  gameScreen=1;
}

void gameOver() 
{
  gameScreen=2;
}

void restart() 
{
  

  gameScreen = 1;
}



//===================================
void movePaddles(){
  
  //this is to make sure the left paddel moves when the left side is touched
  if(mouseX < width/2){
    leftPaddleY = constrain(mouseY, startPoint,height - paddleHeight); //constrain paddle to drawing window
  }else{
    rightPaddleY = constrain(mouseY, startPoint, height - paddleHeight); //constrain paddle to drawing window
  }
  
}


//==================================
void checkLeftPaddle(){
  
  //Check if there is an overlap between ball and left paddle
  hasOverlappedLeftPaddle = doesOverlap(leftPaddleX, leftPaddleY, paddleWidth, paddleHeight, ballX, ballY, radius);

  if (hasOverlappedLeftPaddle) {

    xSpeed = xSpeed * reverse;//this is to bounce the ball
  }

}


//===================================
void checkRightPaddle(){
  
  //Check if there is an overlap between ball and right paddle
  hasOverlappedRightPaddle = doesOverlap(rightPaddleX, rightPaddleY, paddleWidth, paddleHeight, ballX, ballY, radius); 

  if (hasOverlappedRightPaddle) {

    xSpeed = xSpeed * reverse; // this to bounce the ball

  }
}


//==================================
void displayScores(){
  
  textSize(scoreSize); //set text size to 35
 
  fill(255);
  
  text(leftScore, leftScoreX, leftScoreY); //writes the score on the left

  text(rightScore, rightScoreX, rightScoreY); //writes the score in the right
  
  // the text prayer thing
   // the text for prayer
  fill(0,0,255);
  text(prayerOne,prayerOneX,prayerOneY);
  
  fill(255,0,0);
  text(prayerTwo,prayerTwoX,prayerTwoY);
  
  fill(255);
  line(lineX,lineY,secondLineX,secondLineY);
  
}


//===================================
void displayBall(){
  
  fill(255);
  
  stroke(0,0,255);
  
  ellipse(ballX, ballY, ballWidth, ballHeight); //this is the ball
  
}


//===================================
void displayPaddles(){
  
  fill(0,255,0);
  
  stroke(0,0,255);
  
  rect(leftPaddleX, leftPaddleY, paddleWidth, paddleHeight); //this is the 1st paddle
  
  rect(rightPaddleX, rightPaddleY, paddleWidth, paddleHeight); //this is the 2nd paddle
  
}


//===================================
void moveBall(){
  
  if (startGame) {
     //ball movement and position
     ballX = ballX+xSpeed;
     
     ballY = ballY+ySpeed;

    }else{
      ballX = width/2;
      
      ballY = height/2;
      
      xSpeed= xSpeed * reverse;
     
      ySpeed= ySpeed * reverse;
    }
}


//==================================
void checkWall(){
  
    // Bounce at the top and bottom
  if ((ballY-radius <= startPoint) || (ballY+radius) >= height) {
    
    ySpeed= ySpeed * reverse;
    
  }
  
  
      //the right prayer's score
   if (ballX-radius <= startPoint){
     
    rightScore += scoreAdder;
    
    startGame= false;
    
    ballX = width/2;
      
    ballY = height/2;
    
    background(#AE1010); // this to flash a blue screen when blue side scorws

  }
  
  
  // the left prayer's score 
  if (ballX +radius >= width){
    
    leftScore += scoreAdder; 
    
    startGame= false;
    
    ballX = width/2;
      
    ballY = height/2;
    
    background(#190B8C);//to flash red screen when the red side wins
  }
}


//==================================
void setGameMode(){
  //this to start the game when the screen is tapped
  if (mousePressed) {
    
     startGame= true;
  }
}


//======================================
//Checks if ball overlaps paddle

boolean doesOverlap(float xPaddle, float yPaddle, float widthPaddle, float heightPaddle, float xBall, float yBall, float radius) 
{

  float ballLeftEdge = xBall-radius; //left edge of ball
  float ballBottomEdge = yBall+radius; //bottom edge of ball
  float ballRightEdge = xBall+radius; //right edge of ball
  float ballTopEdge = yBall-radius; //top edge of ball

  float paddleLeftEdge = xPaddle; //left edge of paddle
  float paddleBottomEdge = yPaddle+heightPaddle; //bottom edge of paddle
  float paddleRightEdge = xPaddle+widthPaddle; //right edge of paddle
  float paddleTopEdge = yPaddle; //top edge of paddle

  if (ballBottomEdge >= paddleTopEdge //Check if bottom edge of ball and top edge of paddle overlap
    && ballTopEdge <= paddleBottomEdge //Check if top edge of ball and bottom edge of paddle overlap
    && ballLeftEdge <= paddleRightEdge //Check if left edge of ball and right edge of paddle overlap
    && ballRightEdge >= paddleLeftEdge ) //Check if right edge of ball and left edge of paddle overlap
  {   
    return true;
  } else { 
    return false;
  }
 }

