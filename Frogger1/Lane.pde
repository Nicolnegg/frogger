class Lane extends Rectangulo{

  Obstacle[] obstacles;
  float speed;
  float spacing;
  
  Lane(float x,float y,float w,float h,int n, float spd, float spc){
    super(x,y,w,h);
    obstacles=new Obstacle[n];
    speed=spd;
    spacing=spc;
  }
}
