class Fruta extends Rectangulo {
  PImage imgMosca;
    Fruta(float x, float y, float w) {
        super(x, y, w, w);
        imgMosca = loadImage("Img/mosca.png");
    }
    void show() {
        image(imgMosca, x + w, y + h, w/2, h/2);
    }
}
