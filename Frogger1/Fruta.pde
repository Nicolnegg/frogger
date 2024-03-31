class Fruta extends Rectangulo {
    Fruta(float x, float y, float w) {
        super(x, y, w, w);
    }
    void show() {
        fill(0, 255, 0);
        ellipse(x + w, y + h, w/2, h/2);
    }
}