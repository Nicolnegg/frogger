class Obstacle extends Rectangulo {
  float speed;
  PImage imgCarro; 
  Obstacle(float x, float y, float w, float h, float s, String imgPath) {
    super(x, y, w, h);
    speed = s;
    imgCarro = loadImage(imgPath);
  }
  void update() {
    x = x + speed;
    if (speed > 0 && x > width+grid) {
      x = -w-grid;
    } else if (speed < 0 && x < -w-grid) {
      x = width+grid;
    }
  }
  void show() {
    // Calcula la escala de la imagen para mantener su proporción
    float scale = min(w / imgCarro.width, h / imgCarro.height);
    float imageWidth = imgCarro.width * scale;
    float imageHeight = imgCarro.height * scale;
    float offsetX = (w - imageWidth) / 2;
    float offsetY = (h - imageHeight) / 2;
    image(imgCarro, x + offsetX, y + offsetY, imageWidth, imageHeight);
  }
}
