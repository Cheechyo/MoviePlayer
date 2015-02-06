class movieView{
  
  /*play Store*/
  int state = 1;

  void draw(){

  }

  void mouseClicked(){

    if(mouseX >= 418 && mouseX <= 418 + 522
    && mouseY >= 365 && mouseY <= 402 && state == 1){
      mv.jump( ((mouseX - 418) / 522.0) * mv.duration() );
      print("jump\n");
    }
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
  
  void drawUI(){
    fill(255);
    colorMode(RGB,255);
    drawList();
    drawPlayzone();
  }
  
  void playMovie(){
    if (mv.available()){
      mv.read();
    }
    image(mv,410 + 1,9 + 1,540 - 2,354 - 2);
  }
}  

