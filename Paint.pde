void setup() {
  size(1500, 900);
  surface.setResizable(true);
  frameRate(120);
  background(245);
}

int colorR;
int colorG;
int colorB;
int lineWeight = 100;
int colorSpeed = 4;
String colorChange = "All";
boolean welcome = true;

void draw() {
  
  //Welcome Message
  if (welcome == true) {
    noStroke();
    fill(255,239,206);
    rect(20,20,width-40,height-70);
    fill(0);
    textSize(30);
    text("Welcome to Paint!",40,60); 
    textSize(20);
    text("Controls:\nA/R/G/B  =  Select All/Red/Green/Blue Colors\n↑/↓  =  Increase/Decrease Selected Color Value\nScroll Wheel ↑/↓  =  Increase/Decrease Brush Thickness\nSpacebar  =  Set Background to Current Draw Color",40,110);
    text("Click anywhere to start.",40,300);
  }
  //End
  
  //Keep Red Value Between Parameters
  if (colorR < 0) {
    colorR=0;
  }
  if (colorR > 255) {
    colorR=255;
  }
  //End
  
  //Keep Green Value Between Parameters
  if (colorG < 0) {
    colorG=0;
  }
  if (colorG > 255) {
    colorG=255;
  }
  //End
  
  //Keep Blue Value Between Parameters
  if (colorB < 0) {
    colorB=0;
  }
  if (colorB > 255) {
    colorB=255;
  }
  //End
  
  //Bottom Bar
  noStroke();
  fill(255);
  rect(0,height-30,width,30);
  //End
  
  //Info Text
  textSize(12);
  fill(0);
  text("Color:",10,height-10);
  text("Red = "+colorR+" | G = "+colorG+" | B = "+colorB,75,height-10);
  text("Brush Size: "+lineWeight,280,height-10);
  text("Editing: "+colorChange,420,height-10);
  //End
  
  //Preview Color Box
  fill(colorR,colorG,colorB);
  stroke(colorR,colorG,colorB);
  strokeWeight(0);
  rect(50,height-22,15,15,5,5,5,5);
  //End
  
  //Drawing Line
  if (welcome == false) {
    if (mousePressed) {
      if (mouseButton == LEFT) {
      strokeWeight(lineWeight);
      line(mouseX,mouseY,pmouseX,pmouseY);
  }}}
  //End
  
  //Keep Line Weight ≥ 1
  if (lineWeight < 1) {
    lineWeight=1;
  }
  //End
}

void mouseReleased() {
  //Close Welcome Message
  if (welcome == true) {
    if (mouseButton == LEFT) {
      welcome = false;
      background(245);
  }}
  //End
}

void keyPressed() {
  //Change All Colors
  if (key == 'a') {
    colorChange = "All";
  }
  if (colorChange == "All") {
    if (keyCode == UP) {
      colorR = colorR + colorSpeed;
      colorB = colorB + colorSpeed;
      colorG = colorG + colorSpeed;
    }
    if (keyCode == DOWN) {
      colorR = colorR - colorSpeed;
      colorG = colorG - colorSpeed;
      colorB = colorB - colorSpeed;
  }}
  //End
  
  //Change Red
  if (key == 'r') {
    colorChange = "Red";
  }
  if (colorChange == "Red") {
    if (keyCode == UP) {
      colorR = colorR + colorSpeed;
    }
    if (keyCode == DOWN) {
      colorR = colorR - colorSpeed;
  }}
  //End
  
  //Change Green
  if (key == 'g') {
    colorChange = "Green";
  }
  if (colorChange == "Green") {
    if (keyCode == UP) {
      colorG = colorG + colorSpeed;
    }
    if (keyCode == DOWN) {
      colorG = colorG - colorSpeed;
  }}
  //End
  
  //Change Blue
  if (key == 'b') {
    colorChange = "Blue";
  }
  if (colorChange == "Blue") {
    if (keyCode == UP) {
      colorB = colorB + colorSpeed;
    }
    if (keyCode == DOWN) {
      colorB = colorB - colorSpeed;
  }}
  //End
  
  //Spacebar to Set Color
  if (key == ' ') {
    background(colorR,colorG,colorB);
  }
  //End
  
  //Left-Right Arrow Keys to Change Line Weight{
  if (keyCode == RIGHT) {
    lineWeight = lineWeight + 1;
  }
  if (keyCode == LEFT) {
    lineWeight = lineWeight - 1;
  }
  //End
}

//Scroll Wheel to Change Line Weight
void mouseWheel(MouseEvent event) {
  if (event.getCount() == 1.0) {
    lineWeight = lineWeight - 5;
  }  
  if (event.getCount() == -1.0) {
    lineWeight = lineWeight + 5;
  }}
//End
