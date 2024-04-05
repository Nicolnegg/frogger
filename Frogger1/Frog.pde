class Frog extends Rectangulo {
  Obstacle attached = null;
  PImage imgRana;
  
  Frog(float x, float y, float w) {
    super(x, y, w, w);
    imgRana = loadImage("Img/frog.png");
  }
  
  void attach(Obstacle log) {
    attached = log;
  }
  
  void show() {
    image(imgRana, x, y, w, w);
  }
  
  void update() {
    if (attached != null) {
      x += attached.speed;
    }
    x = constrain(x, 0, width - 2);
  }
  
  void move(float xdir, float ydir) {
    x += xdir * grid;
    y += ydir * grid;
  }
}
