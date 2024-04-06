Frog frog;
Obstacle[] cars;
Obstacle[] logs;
Fruta[] frutas;
float grid = 40;
int puntuacion = 0;
int nivel = 1;
PImage imagenFondo;
PImage imagenW;
PImage imagenAgua;

Music music;
void resetGame() {
  frog = new Frog(width / 2 - grid / 2, grid * 2, grid);
  frog.attach(null);
  puntuacion = 0;
  generarNivel(nivel);// Reiniciar la puntuación
}

void setup() {
  music=new Music(this);
  music.playMusic();
  size(600, 560);
  initMenuSettings();
  cars = new Obstacle[24];
  logs = new Obstacle[8];
  frutas = new Fruta[10]; // Ajustar la cantidad de frutas
  resetGame();
  generarNivel(nivel);
  nivel=1;
  imagenFondo = loadImage("Img/pasto_2.png");
  imagenFondo.resize(width, height / 30);
  imagenW = loadImage("Img/pasto.png");
  imagenW.resize(width, height / 30);
  imagenAgua = loadImage("Img/agua.png");
  imagenAgua.resize(width, height / 10);
}
void draw(){
  switch(gameState){
    case MENUSCREEN:
      TitleMenu();
      break;
    case GAMEOVERSCREEN:
      GameOverScreen();
      break;
    case NEWLEVELSCREEN:
      break;
    case CREDITSSCREEN:
      creditsScreen();
      break;
    case GAMESCREEN:
      playGame();
      break;
  }
}
void playGame() {
  background(0);
  imageMode(CORNER);
  image(imagenW, 0, height-grid, width, grid);  
  image(imagenFondo, 0, height-grid*5, width, grid);
  image(imagenAgua, 0, height-grid*8, width, grid*3);
  image(imagenFondo, 0, height-grid*9, width, grid);
  image(imagenFondo, 0, height-grid*13, width, grid);

  for (Obstacle car : cars) {
    car.show();
    car.update();
    if (car.choca(frog)) {
      println("GAME OVER");
      // music.stopMusic();
      // music.setSong();
      // music.playMusic();
      gameState=2;
      resetGame();
    }
  }

  for (Obstacle log : logs) {
    log.show();
    log.update();
  }

  for (int i = 0; i < frutas.length; i++) {
    if (frutas[i] != null) {
      frutas[i].show();
      if (frog.choca(frutas[i])) {
        frutas[i] = null;
        puntuacion += 20; // Aumentar la puntuación al recoger una fruta
      }
    }
  }

  if (frog.y < height-grid*5 && frog.y > height-grid*8) {
    boolean ok = false;
    for (Obstacle log : logs) {
      if (frog.choca(log)) {
        ok = true;
        frog.attach(log);
      }
    }
    if (!ok) {
      resetGame();
    }
  } else {
    frog.attach(null);
  }
  frog.update();
  frog.show();
  mostrarPuntuacion();
  if (puntuacion >= 50 && frog.y==height-grid*13) {
    nivel++;
    generarNivel(nivel);
  }
}

void keyPressed() {
  switch(gameState){
    case MENUSCREEN:
      keyPressedMenu();
      break;
    case GAMESCREEN:
      keyPressedInGame();
      break;
    case CREDITSSCREEN:
      keyPressedCredits();
      break;
    case GAMEOVERSCREEN:
      keyPressedCredits();
      break;
  }
  
}

void keyPressedInGame(){
  if (keyCode == UP) {
        frog.move(0, -1);
      } else if (keyCode == DOWN) {
        frog.move(0, 1);
      } else if (keyCode == RIGHT) {
        frog.move(1, 0);
      } else if (keyCode == LEFT) {
        frog.move(-1, 0);
      } else if(key=='P' || key=='p'){
        gameState=0;
      } 
}

void generarNivel(int nivel) {
  // Reiniciar obstáculos y frutas
  frog = new Frog(width / 2 - grid / 2, grid, grid);
  frog.attach(null);
  cars = new Obstacle[24];
  logs = new Obstacle[8];
  frutas = new Fruta[100]; // Ajustar la cantidad de frutas
  int index = 0;
  imageMode(CENTER); // Configura el modo de la imagen al centro
  //Fila 1
  for(int i =1;i<4;i++){
    float x=i*random(grid*3+140,200);  //separación
    String imgPath = "Img/camion_" + int(random(1, 5)) + ".png"; // Selecciona aleatoria
    cars[index]=new Obstacle(x,height-grid*2,grid*2,grid,4, imgPath);
    index++;
  }
  //Fila 2
  for(int i =1;i<6;i++){
    float x=i*random(grid*4+80,200);  //separación
    String imgPath = "Img/carro_" + int(random(1, 8)) + ".png"; // Selecciona aleatoria
    cars[index]=new Obstacle(x,height-grid*3,grid,grid,3,imgPath);
    index++;
  }
  //Fila 3
  for(int i =1;i<5;i++){
    float x=i*random(grid*4+100,200);  //separación
    String imgPath = "Img/camioneta_" + int(random(1, 7)) + ".png";
    cars[index]=new Obstacle(x,height-grid*4,grid,grid, -4,imgPath);
    index++;
  }
   //Fila 9
  for(int i =1;i<6;i++){
    float x=i*random(grid*2+80,200);  //separación
    String imgPath = "Img/carro_" + int(random(1, 8)) + ".png";
    cars[index]=new Obstacle(x,height-grid*10,grid,grid,0.9,imgPath);
    index++;
  }
   //Fila 10
  for(int i =1;i<5;i++){
    float x=i*random(grid*2+100,200);  //separación
    String imgPath = "Img/camioneta_" + int(random(1, 7)) + ".png";
    cars[index]=new Obstacle(x,height-grid*11,grid,grid,-2,imgPath);
    index++;
  } 
   //Fila 11
  for(int i =1;i<4;i++){
    float x=i*random(grid*2+140,200);  //separación
    String imgPath = "Img/camion_" + int(random(1, 5)) + ".png"; // Selecciona aleatoria
    cars[index]=new Obstacle(x,height-grid*12,grid*2,grid,2.9,imgPath);
    index++;
  }  
  index=0;
  //Fila 5
  for(int i =0;i<3;i++){
    float x=i*random(grid*2,200);  //separación
    logs[index]=new Obstacle(x,height-grid*6,grid*3,grid,1.2,"Img/tronco_1.png");
    index++;
  }
  //Fila 6
  for(int i =0;i<2;i++){
    float x=i*random(grid*2,300);  //separación
    logs[index]=new Obstacle(x,height-grid*7,grid*2,grid,-2.2,"Img/tronco_2.png");
    index++;
  }
   //Fila 7
  for(int i =0;i<3;i++){
    float x=i*random(grid*2,300);  //separación
    logs[index]=new Obstacle(x,height-grid*8,grid*2,grid,0.6,"Img/tronco_2.png");
    index++;
  }
  for (int i = 0; i < nivel + 10; i++) {
    float x = random(width);
    float y = random(height); 
    frutas[i] = new Fruta(x, y, grid);
  }
}

void mostrarPuntuacion() {
  fill(255);
  textSize(20);
  text("Puntuación: " + puntuacion, 10, 30);
}
