//maxX = 854, maxY = 480

float screenWidth = 854; //set to your maxX
float screenHeight = 480; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  
  background(0);  //sets the background black

  fill(#0F3A06);
  stroke(#08277F);
  rect(0, 0, 17, 95); //this is the 1st padle
  
  fill(#0F3A06);
  stroke(#08277F);
  rect(836,384, 17, 95); //this is the 2nd padle

  fill(255);
  stroke(#08277F);
  ellipse(427, 240, 30, 30); //this is the ball


  textSize(35); //set text size to 35

  fill(255);
  text(0, 327, 240); //writes the score on the left
  
  textSize(35); //set text size to 35

  fill(255);
  text(5, 527, 240); //writes the score in the right
  
}
