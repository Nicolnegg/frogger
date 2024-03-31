Frog frog;
Obstacle[] cars;
Obstacle[] logs;
float grid = 40 ;

void resetGame(){
  frog= new Frog(width/2-grid/2,height-grid,grid);
  frog.attach(null);
}
void setup() {
  size(600,560);
  cars=new Obstacle[24];
  logs=new Obstacle[8];
  //frog= new Frog(width/2-grid/2,height-grid,grid);
  resetGame();
  int index=0;
  //Fila 1
  for(int i =0;i<3;i++){
    float x=i*random(grid*3,300);  //separación
    cars[index]=new Obstacle(x,height-grid*2,grid*2,grid,4);
    index++;
  }
  //Fila 2
  for(int i =0;i<5;i++){
    float x=i*random(grid*4,200);  //separación
    cars[index]=new Obstacle(x,height-grid*3,grid,grid,-2);
    index++;
  }
  //Fila 3
  for(int i =0;i<4;i++){
    float x=i*random(grid*4,200);  //separación
    cars[index]=new Obstacle(x,height-grid*4,grid,grid, 3.2);
    index++;
  }
   //Fila 9
  for(int i =0;i<5;i++){
    float x=i*random(grid*2,300);  //separación
    cars[index]=new Obstacle(x,height-grid*10,grid,grid,0.9);
    index++;
  }
   //Fila 10
  for(int i =0;i<4;i++){
    float x=i*random(grid*2,300);  //separación
    cars[index]=new Obstacle(x,height-grid*11,grid,grid,-3.9);
    index++;
  } 
   //Fila 11
  for(int i =0;i<3;i++){
    float x=i*random(grid*2,300);  //separación
    cars[index]=new Obstacle(x,height-grid*12,grid*2,grid,2.9);
    index++;
  }  
  index=0;
  ////Fila 5
  for(int i =0;i<3;i++){
    float x=i*random(grid*2,200);  //separación
    logs[index]=new Obstacle(x,height-grid*6,grid*3,grid,1.2);
    index++;
  }
  //Fila 6
  for(int i =0;i<2;i++){
    float x=i*random(grid*2,300);  //separación
    logs[index]=new Obstacle(x,height-grid*7,grid*2,grid,-2.2);
    index++;
  }
    //Fila 7
  for(int i =0;i<3;i++){
    float x=i*random(grid*2,300);  //separación
    logs[index]=new Obstacle(x,height-grid*8,grid*2,grid,0.6);
    index++;
  } 

}

void draw() {
  background(0);
  fill(255,100,100);
  rect(0,height-grid,width,grid);
  rect(0,height-grid*5,width,grid);
  rect(0,height-grid*9,width,grid);
  fill(255,200,100);
  rect(0,height-grid*13,width,grid);
 
  for (Obstacle car: cars){
    car.show();
    car.update();
    if (car.choca(frog)){
      println("GAME OVER");
      resetGame();
      
    }
  }
 
  for (Obstacle log: logs){
    log.show();
    log.update();

    }
  if(frog.y < height-grid*5 && frog.y >height-grid*8){
    boolean ok=false;  
    for (Obstacle log: logs){
      if(frog.choca(log)){
        ok=true;
        frog.attach(log);
      }

    }
    if(!ok){
      resetGame();  
  } 
  }
  else{
   frog.attach(null);

}
  frog.update();
  frog.show();
  
  win();
}
void keyPressed(){

  if(keyCode== UP){
    frog.move(0,-1);
  } else if (keyCode== DOWN){
    frog.move(0,1);
  } else if (keyCode== RIGHT){
    frog.move(1,0);
  } else if (keyCode== LEFT){
    frog.move(-1,0);
  }
}

void win(){
    if(frog.y==height-grid*13){
    println("WIN!");
    resetGame();
  }
}
