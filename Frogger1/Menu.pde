int gameState=0;
/*
0: Main Menu
1: Pause Menu
2: End Game
3: PlayGame
*/
PImage button;

final int MENUSCREEN=0;
final int PAUSESCREEN=1;
final int GAMEOVERSCREEN=2;
final int NEWLEVELSCREEN=3;
final int CREDITSSCREEN=4;
final int GAMESCREEN=5;
PImage titleBackground;
PImage playGreenButton;
PImage credits;
PImage menuBtn,gameOverImage;
int menuBtnSelected=0;
Button[] menuBtns;
void TitleMenu(){
  DrawBackground(titleBackground);
  imageMode(CENTER);
  for(int i=0;i<menuBtns.length;i++){
    menuBtns[i].show(menuBtnSelected==i,width/2,(i+1)*height/4);
  }

}

void initMenuSettings(){
  titleBackground=loadImage("Menu/assets/Swamp1.jpg");
  menuBtns=new Button[3];
  //playBtn[0]=loadImage("Menu/assets/butonPlayNS.png");
  menuBtns[0]=new Button("Menu/assets/buttonPlayS.png","Menu/assets/buttonPlayNS.png",150,50);
  menuBtns[1]=new Button("Menu/assets/buttonCreditsS.png","Menu/assets/buttonCreditsNS.png",200,50);
  menuBtns[2]=new Button("Menu/assets/buttonQuitS.png","Menu/assets/buttonQuitNS.png",150,50);
  credits=loadImage("Menu/assets/credits.png");
  menuBtn=loadImage("Menu/assets/buttonBackS.png");
  gameOverImage=loadImage("Menu/assets/GameOverScreen.png");
}
void keyPressedMenu(){
  if(keyCode==UP){
    menuBtnSelected=(menuBtnSelected-1+3)%3;
  }else if(keyCode==DOWN){
    menuBtnSelected=(menuBtnSelected+1)%3;
  }else if(keyCode==ENTER || key==' '){
    switch(menuBtnSelected){
      case 0:
        gameState=5;
        break;
      case 1:
        gameState=4;
        break;
      case 2:
        exit();
        break;
    }
  }
}
void creditsScreen(){
  DrawBackground(titleBackground);
  imageMode(CENTER);
  image(credits,width/2,height/3,300,250);
  menuBtnSelected=0;
  image(menuBtn,width/2,4*height/5,150,50);

}
void keyPressedCredits(){
  if(keyCode==ENTER || key==' '){
    gameState=0;
  }
}
void DrawBackground(PImage background){
  background(0);
  imageMode(CORNER);
  
  image(background,0,0,width,height);
  filter(BLUR);

}

void GameOverScreen(){
    imageMode(CORNER);
    image(gameOverImage,0,0,width,height);
}
void DrawWinMenu(){
    /**View for victory */
}


