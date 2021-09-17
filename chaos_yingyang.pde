int frames = 180;
float diam = 500, theta, theta2;

void setup() {
  size(1500, 1500);
  
  smooth(8);
//  noStroke();
  frameRate(100); // Set little frame rate ro decrase animation speed
}

void anticlockwise_flare(float wd, float ht, float radius, float freq) {
translate(wd, ht);
  noFill();
  stroke(150);
  beginShape();
  float r = radius;
  int flare = 0;
  for (float i = 0; i >= -TWO_PI; i -= PI/180) {
    float x = (r + random(10)) * cos(i); 
    float y = (r + random(10)) * sin(i);
    
    
    flare = int(random(freq));
    
    if(flare == 4) {
        x = (r + random(radius/1.5)) * cos(i); 
        y = (r + random(radius/1.5)) * sin(i);
    }
   
   vertex(x, y); 
  }
  endShape();  
}

void clockwise_flare(float wd, float ht, float radius) {
  translate(wd, ht);
  noFill();
  stroke(125);
  beginShape();
  float r = radius;
  int flare = 0;
  for (float i = 0; i <= TWO_PI; i += PI/180) {
    float x = (r + random(10)) * cos(i); 
    float y = (r + random(10)) * sin(i);
    
    
    flare = int(random(10));
    
    if(flare == 4) {
        x = (r + random(radius/1.5)) * cos(i); 
        y = (r + random(radius/1.5)) * sin(i);
    }
   
   vertex(x, y); 
  }
  endShape();  
}

void anticlockwise(float wd, float ht, float radius) {
  translate(wd, ht);
  noFill();
  stroke(255);
  beginShape();
  float r = radius;
  for (float i = 0; i >= -TWO_PI; i -= PI/180) {
    float x = (r + random(10)) * cos(i); 
    float y = (r + random(10)) * sin(i);
    vertex(x, y);
  }
  endShape();  
}

void clockwise(float wd, float ht, float radius) {
  translate(wd, ht);
  noFill();
  stroke(255);
  beginShape();
  float r = radius;
  for (float i = 0; i <= TWO_PI; i += PI/180) {
    float x = (r + random(10)) * cos(i); 
    float y = (r + random(10)) * sin(i);
    vertex(x, y);
  }
  endShape();  
}

void yingyang(float posX, float posY) {
  pushMatrix();
  translate(posX, posY);
  rotate(theta2);
//  noStroke();
  fill(100);
//  yingyang();
  arc(0,0,diam/8, diam/8, PI/2,PI+PI/2);
  fill(255);
  arc(0,0,diam/8, diam/8, PI+PI/2,TWO_PI+PI/2);
  
  fill(100);
  ellipse(0,-diam/32, diam/16, diam/16);
  fill(255);
  ellipse(0, diam/32, diam/16, diam/16);
  anticlockwise_flare(0, -diam/32, 3, 30);
  
  fill(255);
  // final circle
  ellipse(0,-diam/32 + 15, diam/64, diam/64);
  fill(100);
  // final inner circle
  ellipse(0,diam/32 + 15, diam/64, diam/64);
  anticlockwise_flare(0, diam/16, 3, 30);  
  popMatrix();
  theta2 += TWO_PI / 50;
  anticlockwise_flare(posX/2, posY/2 - 60, 35, 20);
//  clockwise_flare(posX/2, posY/2 - 60, 35);
  noStroke();
}

void yingyang2(float posX, float posY) {
  pushMatrix();
  translate(posX, posY);
  rotate(-theta2);
//  noStroke();
  fill(100);
//  yingyang();
  arc(0, 0, diam/8, diam/8, PI/2,PI+PI/2);
  fill(255);
  arc(0, 0, diam/8, diam/8, PI+PI/2,TWO_PI+PI/2);
  
  fill(100);
  ellipse(0, -diam/32, diam/16, diam/16);
  fill(255);
  // final inner circle
  ellipse(0, diam/32, diam/16, diam/16);
  anticlockwise_flare(0, -diam/32, 3, 30);
   
  fill(255);
  ellipse(0, -diam/32 + 15, diam/64, diam/64);
  fill(100);
  // final inner circle
  ellipse(0, diam/32 + 15, diam/64, diam/64);
  anticlockwise_flare(0, diam/16, 3, 30);
    
  popMatrix();
  theta2 += TWO_PI / 50;
  anticlockwise_flare(posX, posY, 35, 30);
//  clockwise_flare(posX/2, posY/2 - 60, 35);
  noStroke();
}

void draw() {
  clear();
  background(255);
//  background(#35465c);
  pushMatrix();
  translate(width/2, height/2 - 125);
  rotate(theta);
  noStroke();
  fill(100);
//  yingyang();
  arc(0,0,diam, diam, PI/2,PI+PI/2);
  fill(255);
  arc(0,0,diam, diam, PI+PI/2,TWO_PI+PI/2);
  
  fill(100);
   
  ellipse(0,-diam/4, diam/2, diam/2);
  fill(255);
  ellipse(0,diam/4, diam/2, diam/2);
  
  fill(255);
  yingyang(0, -diam/4);
//  ellipse(0,-diam/4, diam/8, diam/8);
  fill(100);
  yingyang2(0, diam/2);
//  ellipse(0,diam/4, diam/8, diam/8);
    
  popMatrix();
  
  theta += TWO_PI/frames;
  anticlockwise_flare(width/2, height/2 -125, 255, 10);
  clockwise_flare(width/50 -25, height/50 - 35, 255);
  anticlockwise(width/50 - 30, height/50 - 30, 250);
  clockwise(width/50 - 30, height/50 - 30, 250);
}
