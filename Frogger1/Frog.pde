class Frog extends Rectangulo {
  Obstacle attached=null;
  Frog(float x, float y, float w) {
    super(x, y, w, w);
  }
  void attach(Obstacle log) {
    attached=log;
  }
  void show() {
    fill(255);
    rect(x, y, w, w);
  }
  void update() {
    if (attached !=null) {
      x += attached.speed;
    }
    x = constrain(x, 0, width-2);
  }
  void move(float xdir, float ydir) {
    x += xdir*grid;
    y += ydir*grid;
  }
}