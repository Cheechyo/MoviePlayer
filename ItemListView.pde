class ItemListView{
  int list_scroll_y;
  boolean list_scroll_clicked;
  String[] itemList;
  String currentVideo;
  int currentVideoIndex;

  ItemListView(){
    list_scroll_y = 0;
    list_scroll_clicked = false;
  }
  void draw(){
    // init
    fill(white);
    // draw background panel
    fill(white);
    stroke(white);
    rect(10, 0, 379, 600);
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
  void mousePressed(){
    if (mouseX >= 16 && mouseX <= 16 + 18 + 18
        && mouseY >= 15 && mouseY <= 15 + 550){
      list_scroll_clicked = true;
    }
  }
  void mouseReleased(){
    list_scroll_clicked = false;
  }
  int mouseClicked(){
    if (mouseX >= 40 && mouseX <= 20 + 370){
      if (mouseY >= 15 && mouseY <= 15 + 580){
        int numOfMovies = 0;
        for (int i = 0; i < itemList.length; i++){
          if (itemList[i].indexOf("mp4") != -1){
            numOfMovies++;
          }
        }
        int list_height = numOfMovies * 55;
        int idx = (mouseY - 25 + (list_height + 25 - 600) * list_scroll_y / 100) / 55;
        if (currentVideoIndex == idx){
          return 0;
        }
        currentVideoIndex = idx;
        return 1;
      }
    }
    return 0;
  }
  void setListItems(String[] listItems){
    itemList = listItems;
  }
  void showMovieList(){
      // print the filenames
    int numOfMovies = 0;
    if (itemList == null){
      return;
    }
    for (int i = 0; i < itemList.length; i++){
      if (itemList[i].indexOf("mp4") != -1){
        numOfMovies++;
      }
    }
    int list_height = numOfMovies * 55;
    numOfMovies = 0;
    for (int i = 0; i < itemList.length; i++){
      //println(filenames[i]);
      if (currentVideoIndex == numOfMovies){
        stroke(white);
        fill(240);
        rect(40, 25 + numOfMovies * 55 + (600 - list_height - 25) * list_scroll_y / 100, 330, 55);
      }
      fill(black);
      text(itemList[i], 95, 25 + numOfMovies * 55 + (600 - list_height - 25) * list_scroll_y / 100);
      numOfMovies++;
    }
  }
  String getSelectedItem(){
    return itemList[currentVideoIndex];
  }
  int getSelectedIdx(){
    return currentVideoIndex;
  }
}
