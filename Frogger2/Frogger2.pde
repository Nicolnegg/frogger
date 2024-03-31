Frog frog;
Lane[]lanes;
float grid = 40 ;

void resetGame(){
  frog= new Frog(width/2-grid/2,height-grid,grid);
  frog.attach(null);
}
void setup() {
  size(600,560);

  //frog= new Frog(width/2-grid/2,height-grid,grid);
  resetGame();
  int totalLanes=int(height/grid);
  lanes=new Lane[totalLanes];
  
  //for (int i =0;i<lanes.length;i++){
  //    lanes[i]=new Lane(i*grid,3,1,200);
  //}
  lanes[0]=new Lane(0,0,0,0);
  lanes[1]=new Lane(1,3,1,150);
  lanes[2]=new Lane(2,3,1,150);
  lanes[3]=new Lane(3,3,1,150);
  lanes[4]=new Lane(4,3,1,150);
  lanes[6]=new Lane(6,3,1,150);
  lanes[7]=new Lane(7,3,1,150);
  lanes[8]=new Lane(8,3,1,150);  
  lanes[5]=new Lane(0,0,0,0);
  lanes[9]=new Lane(9,3,1,150);  
  lanes[10]=new Lane(0,0,0,0);
  
  
  






}

void draw() {
  background(0);
  for (Lane lane:lanes){
    lane.run();
    
  }
//  fill(255,100,100);
//  rect(0,height-grid,width,grid);
//  rect(0,height-grid*5,width,grid);
//  rect(0,height-grid*9,width,grid);
//  fill(255,200,100);
//  rect(0,height-grid*13,width,grid);
 
//  for (Obstacle car: cars){
//    car.show();
//    car.update();
//    if (car.choca(frog)){
//      println("GAME OVER");
//      resetGame();
      
//    }
//  }
 
//  for (Obstacle log: logs){
//    log.show();
//    log.update();

//    }
//  if(frog.y < height-grid*5 && frog.y >height-grid*8){
//    boolean ok=false;  
//    for (Obstacle log: logs){
//      if(frog.choca(log)){
//        ok=true;
//        frog.attach(log);
//      }

//    }
//    if(!ok){
//      resetGame();  
//  } 
//  }
//  else{
//   frog.attach(null);

//}
//  frog.update();
//  frog.show();
  
//  win();
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
