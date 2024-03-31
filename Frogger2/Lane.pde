class Lane extends Rectangulo{

  Obstacle[] obstacles;
 
  float spacing;
  
  Lane(float index,int n,int len , float spacing){
    super(0,index*grid,width,grid);
    obstacles=new Obstacle[n];
    float speed=random(-3,3);

    float offset=random(0,200);
    for (int i = 0; i<n;i++){
       obstacles[i]= new Obstacle(offset+spacing*i,index*grid,grid+len,grid,speed);
    }
  }
  
  void run(){
  
    for(Obstacle o : obstacles){
      o.show();  
      o.update();
      
  }
}
}
