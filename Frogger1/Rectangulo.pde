class Rectangulo{
  float x;
  float y;
  float w;
  float h;
  
  Rectangulo(float x,float y, float w, float h){
    this.x = x;
    this.w = w;
    this.y = y;
    this.h = h;
    
  }
  boolean choca(Rectangulo Rect2){
    float izq=x;
    float der=x+w;
    float sup=y;
    float inf=y+h;
    
    float oizq=Rect2.x;
    float oder=Rect2.x+Rect2.w;
    float osup=Rect2.y;
    float oinf=Rect2.y+Rect2.h; 
    
    return !(izq >= oder || der <= oizq ||
    sup >= oinf || inf <= osup);
  }
}
