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
movieView movieView;
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
  movieView = new movieView(this);
}
void draw(){
  movieView.drawUI();
  showMovieList();
  movieView.playMovie();
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
  movieView.mouseClicked();
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

void drawList(){
  listView.draw();
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


