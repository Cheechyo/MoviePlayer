import processing.video.*;

Movie mv;
String currentVideo;

/* colors */
color white;
color black;
color themeColor;

/*play Store*/
int state = 0;

<<<<<<< HEAD
ItemListView listView;
=======
movieView movieView;

>>>>>>> FETCH_HEAD
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
<<<<<<< HEAD
  listView = new ItemListView();
=======
  movieView = new movieView(this);
>>>>>>> FETCH_HEAD
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
<<<<<<< HEAD
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
=======
  /* movieList */
  if (mouseX >= 40 && mouseX <= 20 + 370){
    if (mouseY >= 15 && mouseY <= 15 + 580){
      // 25 + numOfMovies * 55 + (600 - list_height - 25) * list_scroll_y / 100
      int numOfMovies = 0;
      for (int i = 0; i < filenames.length; i++){
        if (filenames[i].indexOf("mp4") != -1){
          numOfMovies++;
        }
      }
      int list_height = numOfMovies * 55;
      int idx = (mouseY - 25 + (list_height + 25 - 600) * list_scroll_y / 100) / 55;
      currentVideoIndex = idx;
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
      state = 1;
    }
>>>>>>> FETCH_HEAD
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


