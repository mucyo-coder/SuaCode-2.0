//maxX = 854, maxY = 480

float screenWidth = 854; //set to your maxX
float screenHeight = 480; //set to your maxY
int centerX = 427; // this is the middle of screen maxX/2
int centerY = 240;// this is the middle of screen maxY/2


// the paddles
float leftPaddleX= 0; // var for xposition of the left paddle
float leftPaddleY =0; // var for yPosition of the left paddle
float rightPaddleX = 837; //var for x position of the right paddle
float rightPaddleY = 385; //var for y position of the right paddle
float paddleWidth = 17; //var for width of the paddles
float paddleHeight = 95; //var for height of the paddles


//the ball
float ballX = 427; //sets the x position of the ball
float ballY = 240; //sets the y position of the ball
int ballWidth = 30; //sets the width of the ball
int ballHeight = 30; //sets the height of the ball
float radius= 15; // this is the radius of the ball


// the score
int leftScoreX = 214; //sets the x position of the left player score
int leftScoreY = 240;//sets the y position of the left player score
int rightScoreX = 641; //sets the x position of the right player score
int rightScoreY = 240; //sets the y position of the right player score
int leftScore = 0; //sets the left player score
int rightScore = 0; //sets the right player score
int scoreSize = 35; //sets the text size


// the speeds
int xSpeed = 7; // this is the speed of the ball in x-axis
int ySpeed = 7; // this is the speed of thw ball in y-axis
int reverse = -1; //this is used to reverse everything
int scoreAdder = 1; // this is to increment the scores
int startPoint = 0; // this is the first point of the graph


// checks if the ball overlap the paddle
boolean hasOverlappedLeftPaddle = false;
boolean hasOverlappedRightPaddle = false;


boolean startGame = false; // this wiil be used to start and end game 


//===================================
void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}


//===================================
void draw() //runs forever
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


//===================================
void movePaddles(){
  
  //this is to make sure the left paddel moves when the left side is touched
  if(mouseX < centerX){
    leftPaddleY = constrain(mouseY, startPoint, screenHeight - paddleHeight); //constrain paddle to drawing window
  }else{
    rightPaddleY = constrain(mouseY, startPoint, screenHeight - paddleHeight); //constrain paddle to drawing window
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
      ballX = centerX;
      
      ballY = centerY;
      
      xSpeed= xSpeed * reverse;
     
      ySpeed= ySpeed * reverse;
    }
}


//==================================
void checkWall(){
  
    // Bounce at the top and bottom
  if ((ballY-radius <= startPoint) || (ballY+radius) >= screenHeight) {
    
    ySpeed= ySpeed * reverse;
    
  }
  
  
      //the right prayer's score
   if (ballX-radius <= startPoint){
     
    rightScore += scoreAdder;
    
    startGame= false;
    
    ballX = centerX;
      
    ballY = centerY;
  }
  
  
  // the left prayer's score 
  if (ballX +radius >= screenWidth){
    
    leftScore += scoreAdder; 
    
    startGame= false;
    
    ballX = centerX;
      
    ballY = centerY;
    
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