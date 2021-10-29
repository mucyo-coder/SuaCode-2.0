//maxX = 854, maxY = 480
 
int screenWidth = 854; //set to your maxX
int screenHeight = 480; //set to your maxY

int leftPaddleX = 0; //Var for x position of the left paddle
int leftPaddleY = 0; //var for Y positiin of the left paddle

int rightPaddleX = 837; //var for x position of the right paddle
int rightPaddleY = 385; //var for y position of the right paddle

int paddleWidth = 17; //var for width of the paddles
int paddleHeight = 95; //var for height of the paddles

int ballX = 427; //sets the x position of the ball
int ballY = 240; //sets the y position of the ball

int ballWidth = 30; //sets the width of the ball
int ballHeight = 30; //sets the height of the ball

int leftScoreX = 214; //sets the x position of the left player score
int leftScoreY = 240;//sets the y position of the left player score

int rightScoreX = 641; //sets the x position of the right player score
int rightScoreY = 240; //sets the y position of the right player score

int leftPlayerScore = 0; //sets the left player score
int rightPlayerScore = 5; //sets the right player score

int scoreSize = 35; //sets the text size

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  
  background(0);  //sets the background black



  fill(0,255,0);
  
  stroke(0,0,255);
  
  rect(leftPaddleX, leftPaddleY, paddleWidth, paddleHeight); //this is the 1st paddle
  
  rect(rightPaddleX, rightPaddleY, paddleWidth, paddleHeight); //this is the 2nd paddle



  fill(255);
  
  stroke(0,0,255);
  
  ellipse(ballX, ballY, ballWidth, ballHeight); //this is the ball


  textSize(scoreSize); //set text size to 35
 
  fill(255);
  
  text(leftPlayerScore, leftScoreX, leftScoreY); //writes the score on the left

  text(rightPlayerScore, rightScoreX, rightScoreY); //writes the score in the right
  
  
   //Move ball up and left
   ballX = ballX - 1;
   ballY = ballY - 1;
}
