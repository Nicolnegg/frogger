class Lane extends Rectangulo {
  Rectangulo[] obstacles;
  float speed;
  float spacing;

  Lane(float y, float x, float w, float h, int n, float nivel) {
    super(x, y, w, h);
    obstacles = new Rectangulo[n];
    speed = nivel * 0.2;
    spacing = w / n;
    for (int i = 0; i < obstacles.length; i++) {
      float obsX = x + i * spacing;
      if (y == height - grid * 2 || y == height - grid * 6 || y == height - grid * 10) {
        obstacles[i] = new Obstacle(obsX, y, grid, grid, nivel * 0.9,"Img/carro_1.png");
      } else {
        obstacles[i] = new Obstacle(obsX, y, grid * 2, grid, -nivel * 0.9,"Img/carro_1.png");
      }
    }
  }

  void update() {
    for (Rectangulo obs : obstacles) {
      if (frog != null && obs.choca(frog)) {
        // Si hay colisión con el obstáculo, el juego se reinicia
        resetGame();
      }
      if (obs instanceof Obstacle) {
        ((Obstacle) obs).update();
      }
    }
  }

  void show() {
    for (Rectangulo obs : obstacles) {
      if (obs instanceof Obstacle) {
        ((Obstacle) obs).show();
      }
    }
  }
}
