class Button{
    int state;
    PImage selected;
    PImage notSelected;
    float btnHeight;
    float btnWidth;
    Button(String selectedPath,String notSelectedPath,float btnWidth,float btnHeight){
        state=0;
        this.btnHeight=btnHeight;
        this.btnWidth=btnWidth;
        selected=loadImage(selectedPath);
        notSelected=loadImage(notSelectedPath);
    }
    void show(boolean condition,float x,float y){
        if(condition){
            image(selected,x,y,btnWidth,btnHeight);
        }else{
            image(notSelected,x,y,btnWidth,btnHeight);
        }
    }
    void switchState(){
        state=(state+1)%2;
    }
    
}
