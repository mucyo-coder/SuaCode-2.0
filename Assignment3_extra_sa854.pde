//maxX = 854, maxY = 480

float screenWidth = 854; //set to your maxX
float screenHeight = 480; //set to your maxY
int centerX = 427; // this is the middle of screen maxX/2
int centerY = 240;// this is the middle of screen maxY/2


// the paddles
int leftPaddleX= 0; // var for xposition of the left paddle
int leftPaddleY =0; // var for yPosition of the left paddle
int rightPaddleX = 837; //var for x position of the right paddle
int rightPaddleY = 385; //var for y position of the right paddle
int paddleWidth = 17; //var for width of the paddles
int paddleHeight = 95; //var for height of the paddles


//the ball
int ballX = 427; //sets the x position of the ball
int ballY = 240; //sets the y position of the ball
int ballWidth = 30; //sets the width of the ball
int ballHeight = 30; //sets the height of the ball
int radius= 15; // this is the radius of the ball

// the score
int leftScoreX = 214; //sets the x position of the left player score
int leftScoreY = 240;//sets the y position of the left player score
int rightScoreX = 641; //sets the x position of the right player score
int rightScoreY = 240; //sets the y position of the right player score
int leftScore = 0; //sets the left player score
int rightScore = 0; //sets the right player score
int scoreSize = 35; //sets the text size


// the prayer text 
int lineX = 427;
int lineY = 0;
int secondLineX = 427;
int secondLineY = 480;
String prayerOne = "prayer 1:";
String prayerTwo = "prayer 2:";
int prayerOneX = 53;
int prayerOneY = 240;
int prayerTwoX = 480;
int prayerTwoY = 240;


// the speeds
int xSpeed = 5; // this is the speed of the ball in x-axis
int ySpeed = 5; // this is the speed of thw ball in y-axis
int reverse = -1; //this is used to reverse everything
int scoreAdder = 1; // this is to increment the scores
int startPoint = 0; // this is the first point of the graph



boolean startGame = false;


void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
 
  orientation(LANDSCAPE);
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
  
  text(leftScore, leftScoreX, leftScoreY); //writes the score on the left

  text(rightScore, rightScoreX, rightScoreY); //writes the score in the right
  
  
  // the text prayer thing
   // the text for prayer
  fill(0,0,255);
  text(prayerOne,prayerOneX,prayerOneY);
  
  
  fill(255,0,0);
  text(prayerTwo,prayerTwoX,prayerTwoY);
  line(lineX,lineY,secondLineX,secondLineY);
  
  
   //this to start the game when the screen is tapped
  if (mousePressed) {
    
     startGame= true;
  }
 
 
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
    
    
    //the right prayer's score
   if (ballX-radius <= startPoint){
     
    rightScore += scoreAdder;
    
    startGame= false;
    
    background(#AE1010);
  }
  
  
  // the left prayer's score 
  if (ballX +radius >= screenWidth){
    
    leftScore += scoreAdder; 
    
    startGame= false;
    
    background(#190B8C);
    
  }
  
   
   // Bounce at the top and bottom
  if ((ballY-radius <= startPoint) || (ballY+radius) >= screenHeight) {
    
    ySpeed= ySpeed * reverse;
  }
  
}



