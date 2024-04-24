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
PImage newLevelImage;
PImage continueButton;
int menuBtnSelected=0;
PFont font;
Button[] menuBtns;
void TitleMenu(){
  DrawBackground(titleBackground);
  filter(BLUR);
  imageMode(CENTER);
  for(int i=0;i<menuBtns.length;i++){
    menuBtns[i].show(menuBtnSelected==i,width/2,(i+1)*height/4);
  }

}

void initMenuSettings(){
  titleBackground=loadImage("Menu/assets/Swamp1.jpg");
  newLevelImage=loadImage("Menu/assets/newLevel.png");
  continueButton=loadImage("Menu/assets/continueButton.png");
  menuBtns=new Button[3];
  //playBtn[0]=loadImage("Menu/assets/butonPlayNS.png");
  menuBtns[0]=new Button("Menu/assets/buttonPlayS.png","Menu/assets/buttonPlayNS.png",150,50);
  menuBtns[1]=new Button("Menu/assets/buttonCreditsS.png","Menu/assets/buttonCreditsNS.png",200,50);
  menuBtns[2]=new Button("Menu/assets/buttonQuitS.png","Menu/assets/buttonQuitNS.png",150,50);
  credits=loadImage("Menu/assets/credits.png");
  menuBtn=loadImage("Menu/assets/buttonBackS.png");
  gameOverImage=loadImage("Menu/assets/GameOverScreen.png");
  font=createFont("Menu/assets/ARCADE_N.TTF",20);
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
void newLevelScreen(){
  DrawBackground(titleBackground);
  filter(BLUR);
  imageMode(CENTER);
  image(newLevelImage,width/2,height/3,200,50);
  fill(0,0,0);
  textAlign(CENTER);
  textFont(font);
  text("Nivel " + nivel, width/2,height/3+5);
  imageMode(CENTER);
  image(continueButton,width/2,height*2/3,200,50);
}
void keyPressedCredits(){
  if(keyCode==ENTER || key==' '){
    gameState=0;
    if(!music.isPlaying()){
      music.setSong();
      music.playMusic();
    }
  }
}
void keyPressedNewLevel(){
  if(keyCode==ENTER ||key==' '){
    gameState=5;
    if(!music.isPlaying()){
      music.setSong();
      music.playMusic();
    }
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
    nivel = 1;
}
void DrawWinMenu(){
    /**View for victory */
}
