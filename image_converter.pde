/*
do "naughty" things to images
*/

PImage test;
PImage output;
int currColor = 0;
int ys = 0;
color[] pallette = new color[257];//65536


void setup(){
  size(1024,512);
  test = loadImage("test3.png");
  test.loadPixels();
  
  for(int i = 0; i < pallette.length; i++){
    pallette[i] = color(0,0);
  }
  
  //output = createImage(test.width, test.height, ARGB);
  //output.loadPixels();
  //int truePos = 0;
  //for(int y = 0; y < test.height; y++){
  //  for(int x = 0; x < test.width; x++){
  //    int pos = x * (y + 1);
  //    color tmp = test.pixels[truePos];//(test.height * test.width) - truePos - 1];
  //    int r = (int)red(tmp);
  //    int g = (int)green(tmp);
  //    int b = (int)blue(tmp);
  //    int a = (int)alpha(tmp);
  //    int lum = (r + g + b) / 3;
  //    output.pixels[truePos] = color(lum, a);//color(0,g,g);//color(r,g,b,a);//color(255);//
  //    truePos++;
  //  }
  //}
  //output.updatePixels();
  //output.save("output.png");
  //exit();
  //if(color(255,127,111) != color(255,127,111)){
  //  println("why");
  //}
  int truePos = 0;
  boolean end = false;
  for(int y = 0; y < test.height && !end; y++){
    for(int x = 0; x < test.width && !end; x++){
      color tmp = test.pixels[truePos];//(test.height * test.width) - truePos - 1];
      boolean finish = false;
      boolean match = false;
      for(int i = 0; i < pallette.length && finish == false; i++){
        color tmp2 = pallette[i];
        if(currColor >= pallette.length){
          finish = true;
          end = true;
          println("true - " + truePos);
          exit();
        }else{
          if(getLum(tmp2) == getLum(tmp)){ //<>//
          //if(pallette[i] == tmp){
            //finish = true;
            ys++;
            //if(i >= currColor || match == true){
              finish = true;
            //}
            //match = true;
          }else{
            if(i == currColor && match == false){
              pallette[currColor] = tmp; //<>//
              currColor++;
              finish = true;
            }
          }
        }
      }
      truePos++;
    }
  }
  println("curr - " + currColor);
  println("ys - " + ys);
  printHexArray(pallette);
  exit();
}

void draw(){
  //pushMatrix();
  //scale(.5);
  //image(test, 0,0);
  ////image(output, 1024,0);
  //popMatrix();
}

void printHexArray(color[] array){
  for(int i = 0; i < array.length; i++){
    println(String.format("[%d] %s", i, hex(array[i])));
  }
}

int getLum(color in){
  return int((red(in) + green(in) + blue(in) + alpha(in)) / 4);//) / 3) % 256;// + alpha(in)) / 4) % 256;
}