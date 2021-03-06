

import processing.sound.*;

import java.io.FilenameFilter;
// See: https://docs.oracle.com/javase/6/docs/api/java/io/File.html
// See: https://docs.oracle.com/javase/6/docs/api/java/io/FilenameFilter.html

String[] soundNames;
ArrayList<SoundFile> soundfiles = new ArrayList<SoundFile>();
Reverb reverb;
void setup() {
  size(1920,200);
  String path = sketchPath("data/audio");
  soundNames = listFileNames(path);
  //printArray(soundNames);
  reverb = new Reverb(this);
  for (int i = 0; i < soundNames.length; i ++){
     soundfiles.add(new SoundFile(this, "audio/"+soundNames[i])); 
  } 
  
   
   
}

void draw(){
  int index = int(map(mouseX, 0, width, 0, soundNames.length));
  float indexMap = int(map(mouseX, 0, width, 0.0, 1.0));
 if(!soundfiles.get(index).isPlaying()){
     soundfiles.get(index).play();
     //reverb.process(soundfiles.get(index));
     //reverb.set(indexMap, indexMap, indexMap);
     //println("index :"+index+" trigger the soundfile :"+soundNames[index]); 
   }
}

FilenameFilter soundFileFilter = new FilenameFilter(){
  public boolean accept(File dir, String name) {
    String lowercaseName = name.toLowerCase();
    //println(lowercaseName);
    return (!lowercaseName.startsWith(".") && lowercaseName.endsWith(".wav") || !lowercaseName.startsWith(".") && lowercaseName.endsWith(".aif"));
  }
};
    
// This function returns all the files in a directory as an array of Strings  
String[] listFileNames(String dir) {
  File file = new File(dir);
  // See: https://docs.oracle.com/javase/6/docs/api/java/io/File.html
  
  if (file.isDirectory()) {
    String names[] = file.list(soundFileFilter);
    printArray(names);
    return names;
  } else {
    // If it's not a directory
    return null;
  }
}
