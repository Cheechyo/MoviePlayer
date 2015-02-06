import processing.video.*;

Movie mv;
String currentVideo;

/* colors */
color white;
color black;
color themeColor;

/*play Store*/
int state = 0;

ItemListView listView;
/** delegate function */
/* init or loop function */
void setup(){
  background(200);
  size(960, 600);
  white = color(255, 255, 255);
  black = color(0, 0, 0);
  themeColor = color(0, 150, 136);
  
  File folder = new File(dataPath(""));
  String[] filenames = folder.list();
  for (int i = 0; i < filenames.length; i++){
    if (filenames[i].indexOf("mp4") != -1){
      currentVideo = filenames[0];
      mv = new Movie(this, currentVideo);
      break;
    }
  }
  listView = new ItemListView();
}
void draw(){
  drawUI();
  showMovieList();
  playMovie();
}
/* event handlers */
void mousePressed(){
  listView.mousePressed();
}
void mouseReleased(){
  listView.mouseReleased();
}
void keyPressed(){

}
void mouseClicked(){
  int x;
  
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
 /* movie play Bar Controll*/
 if(mouseX >= 418 && mouseX <= 418 + 522
    && mouseY >= 365 && mouseY <= 402 && state == 1){
      x = mouseX;
      mv.jump( ((x - 418) / 522.0) * mv.duration() );
      print("jump\n");
  }
  if (listView.mouseClicked() == 1){
    String item = listView.getSelectedItem();
    mv.stop();
    mv = new Movie(this, item);
    mv.play();
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
  listView.draw();
}
void drawPlayzone(){
  float lineposition = 0;
  float ellipseXposition = 0;
  
  lineposition = mv.time() / mv.duration() * 522;
  
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
    line(418, 399,  418 + lineposition, 399);
  }
  // draw value
  ellipseXposition = 418 + lineposition;
  if(ellipseXposition > 418 + 522 - 26/2){
      ellipseXposition = 418 + 522 - 26/2;
  }else if(ellipseXposition < 418 + 26/2){
    ellipseXposition = 418 + 26/2;
  }
  
  ellipse(ellipseXposition, 367 + 26 / 2 , 26, 26);
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
  String[] filenames = folder.list();
  listView.setListItems(filenames);
  listView.showMovieList();
}
void playMovie(){
  if (mv.available()){
    mv.read();
  }
  image(mv,410 + 1,9 + 1,540 - 2,354 - 2);
}
