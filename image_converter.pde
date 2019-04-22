/*
do "naughty" things to images
*/

PImage test;
PImage output;

void setup(){
  size(1024,512);
  test = loadImage("test.png");
  test.loadPixels();
  output = createImage(test.width, test.height, RGB);
  output.loadPixels();
  int truePos = 0;
  for(int y = 0; y < test.height; y++){
    for(int x = 0; x < test.width; x++){
      int pos = x * (y + 1);
      color tmp = test.pixels[truePos];
      int r = (int)red(tmp);
      int g = (int)green(tmp);
      int b = (int)blue(tmp);
      int a = (int)alpha(tmp);
      output.pixels[truePos] = color(255-r,255-b,255-g);//color(255);//color((r + g + b) / 3);
      truePos++;
    }
  }
  output.updatePixels();
  output.save("output.png");
  //exit();
}

void draw(){
  pushMatrix();
  scale(.5);
  image(test, 0,0);
  image(output, 1024,0);
  popMatrix();
}