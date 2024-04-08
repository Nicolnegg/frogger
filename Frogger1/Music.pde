import processing.sound.*;
class Music{
    SoundFile currentSong;
    SoundFile laVelocidadDelaLuz;
    SoundFile lagoEnElCielo;
    SoundFile sadSong;
    final String[] SONGPATHS={"a","b"};
    Music(Frogger1 froger){
        this.laVelocidadDelaLuz=new SoundFile(froger,"Menu/assets/LagoEnElCielo.wav");
        this.lagoEnElCielo=new SoundFile(froger,"Menu/assets/LaVelocidadDeLaLuz.wav");
        this.sadSong=new SoundFile(froger,"Menu/assets/LosCaminosDeLaVida.wav");
        currentSong=this.lagoEnElCielo;
    }
    void setSong(int song){
        switch(song){
            case 0:
                currentSong=this.lagoEnElCielo;
                break;
            case 1:
                currentSong=this.laVelocidadDelaLuz;
                break;

        }
    }
    void setSong(){
        int randomInt=int(random(2));
        setSong(randomInt);
    }
    void stopMusic(){
    currentSong.stop();
    }
    void playMusic(){
        sadSong.stop();
        currentSong.play();
    }
    void playSadMusic(){
        currentSong.stop();
        sadSong.play();
    }
    boolean isPlaying(){
        return currentSong.isPlaying();
    }
    boolean isSadPlaying(){
        return sadSong.isPlaying();
    }
}