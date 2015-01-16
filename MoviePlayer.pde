import processing.video.*;

Movie mv;
String currentVideo;
String[] filenames;

/* colors */
color white;
color black;
color themeColor;

/* */
int list_scroll_y;
boolean list_scroll_clicked;

/*play Store*/
int state = 0;

/** delegate function */
/* init or loop function */
void setup(){
  background(200);
  size(960, 600);
  white = color(255, 255, 255);
  black = color(0, 0, 0);
  themeColor = color(0, 150, 136);
  list_scroll_y = 0;
  list_scroll_clicked = false;
  File folder = new File(dataPath(""));
  filenames = folder.list();
  for (int i = 0; i < filenames.length; i++){
    if (filenames[i].indexOf("mp4") != -1){      //println(filenames[i]);
      currentVideo = filenames[i];
      mv = new Movie(this, currentVideo);
      break;
    }
  }
}
void draw(){
  drawUI();
  showMovieList();
  playMovie();
}
/* event handlers */
void mousePressed(){
  print("x : " + mouseX + " y : " + mouseY + "\n");
  if (mouseX >= 16 && mouseX <= 16 + 18 + 18
      && mouseY >= 15 && mouseY <= 15 + 550){
    list_scroll_clicked = true;
    print("clicked\n");
  }
}
void mouseReleased(){
  list_scroll_clicked = false;
}
void keyPressed(){

}
void mouseClicked(){
  if (mouseX >= 409 && mouseX <= 409 + 219
    && mouseY >= 525 && mouseY <= 525 + 63){ // play
    mv.stop();
    mv = new Movie(this, currentVideo);
    mv.play();
    state = 1;
  } else if (mouseX >= 729 && mouseX <= 729 + 219
    && mouseY >= 525 && mouseY <= 525 + 63){ // stop
    mv.stop();
    state = 0;
  } else 
  /* movieList */
  if (mouseX >= 20 && mouseX <= 20 + 370){
    if (mouseY >= 15 && mouseY <= 15 + 580){
      int idx = mouseY / 55;
      print("idx : " + idx);
      if (idx < filenames.length){
        for (int i = 0; i < filenames.length; i++){
          if (filenames[i].indexOf("mp4") != -1){
            if (idx == 0){
              currentVideo = filenames[i];
              mv.stop();
              mv = new Movie(this, currentVideo);
              mv.play();
              state = 1;
              break;
            }
            idx = idx - 1;
          }
        }
      }
      println("currentVideo = " + currentVideo);
      state = 1;
    }
  }
}
/** custom function */
void drawUI(){
  fill(255);
  colorMode(RGB,255);
  drawList();
  drawPlayzone();
}
void drawList(){
  // init
  fill(white);
  // draw background panel
  fill(white);
  stroke(white);
  rect(10, 9, 379, 580);
  // draw scroll
  stroke(black);
  line(25, 15, 25+0, 15+550);
  // draw knob
  fill(themeColor);
  stroke(themeColor);
  if (list_scroll_clicked && mouseY >= 15 && mouseY <= 15 + 550){
    list_scroll_y = (mouseY - 15 - 18 / 2) * 100 / 550 ;
  }
  ellipse(16 + 18 / 2, 15 + (550 * list_scroll_y / 100) + 18 / 2, 18, 18);
  stroke(white);
  fill(white);
}
void drawPlayzone(){
  // init
  fill(255);
  //
  rect(410, 9, 540, 580);
  // draw videozone
  fill(themeColor);
  stroke(themeColor);
  rect(410, 9, 540, 353);
  // draw track
  stroke(black);
  line(418, 399, 418 + 522, 399);
  if(state == 1){
    stroke(themeColor);
    line(418, 399, 418 + 312, 399);
  }
  // draw value
  ellipse(718 + 26 / 2, 367 + 26 / 2, 26, 26);
  // draw comments
  fill(black);
  textAlign(LEFT, TOP);
  textSize(24);
  //stroke(black);
  //rect(436,416,488,48);
  text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc auctor gravida condimentum. Vestibulum urna dolor, accumsan quis est non, cursus sodales nunc."
    , 436
    , 416
    , 488
    , 120
  );

  // draw text Button
  fill(themeColor);
  textAlign(CENTER, CENTER);
  text("PLAY", 454, 533, 127, 41);
  text("STOP", 775, 533, 125, 41);
}

void showMovieList(){
  // draw item
  fill(0);
  textAlign(LEFT, TOP);
  textSize(24);
  // have a look in the data folder
  File folder = new File(dataPath(""));
  // list the files in the data folder
  filenames = folder.list();

  // get the number of jpg files
  //println(filenames.length + " files in specified directory");

  // print the filenames
  int numOfMovies = 0;
  for (int i = 0; i < filenames.length; i++){
    if (filenames[i].indexOf("mp4") != -1){
      //println(filenames[i]);
      text(filenames[i], 95, 25 + numOfMovies * 55);
      numOfMovies++;
    }
  }
}
void playMovie(){
  if (mv.available()){
    mv.read();
  }
  image(mv,410 + 1,9 + 1,540 - 2,354 - 2);
}
