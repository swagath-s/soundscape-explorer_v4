import ddf.minim.*;
import ddf.minim.signals.*;
import controlP5.*;
import javax.sound.sampled.*;
import ddf.minim.ugens.*;

Minim              centreMin;
Minim              frontMin;
Minim              backMin;
Minim              rightMin;
Minim              leftMin;
Minim              messMin;
MultiChannelBuffer sampleBuffer;
MultiChannelBuffer sampleBuffer2;
MultiChannelBuffer sampleBuffer3;
 
AudioOutput        output;
AudioOutput        output2;
AudioOutput        output3;
AudioOutput        output4;
AudioOutput        output5;
AudioOutput        output6;
/*Sampler            sampler;
Sampler            sampler2;
Sampler            sampler3;*/

AudioPlayer centre;
AudioPlayer front;
AudioPlayer back;
AudioPlayer right;
AudioPlayer left;
AudioPlayer mess;

 
Mixer.Info[] mixerInfo;


void play(String name, Minim minim, AudioPlayer player){                                 //play() takes name of a file in sketch folder and plays it
   minim.stop();
  //println(name);
   try {
      sampleBuffer = new MultiChannelBuffer(1, 1024);
      player = minim.loadFile(name+".mp3");              
    }
    catch (Exception e) {
      println("Exception while tryin load sample!\n");
    }
    player.play();
}

void scape(Cell x){
  play(x.centreFile, centreMin, centre);
  play(x.frontFile, frontMin, front);
  play(x.backFile, backMin, back);
  play(x.rightFile, rightMin, right);
  play(x.leftFile, leftMin, left);
}
 
  
void audioSetup()
{
  
  //AUDIO SETUP
  
  // create Minim and an AudioOutput
  centreMin  = new Minim(this);
  frontMin  = new Minim(this);
  backMin  = new Minim(this);
  rightMin = new Minim(this);
  leftMin = new Minim(this);
  messMin = new Minim(this);
  
  //getting list of mixers
 
  mixerInfo = AudioSystem.getMixerInfo();
 
  for(int i = 0; i < mixerInfo.length; i++)
  {println(i + " = " + mixerInfo[i].getName());} 
  
  println("names are done");
 
  //setting them up as output mixers and giving them 
  Mixer mixer = AudioSystem.getMixer(mixerInfo[1]);
  centreMin.setOutputMixer(mixer); 
  messMin.setOutputMixer(mixer);
  
  Mixer mixer2 = AudioSystem.getMixer(mixerInfo[2]);
  frontMin.setOutputMixer(mixer2);
 
  Mixer mixer3 = AudioSystem.getMixer(mixerInfo[3]);
  backMin.setOutputMixer(mixer3);
  
  Mixer mixer4 = AudioSystem.getMixer(mixerInfo[4]);
  rightMin.setOutputMixer(mixer4);
  
  Mixer mixer5 = AudioSystem.getMixer(mixerInfo[5]);
  leftMin.setOutputMixer(mixer5);
  
  // giving outputs to all the Minims using AudioOutputs
  
  output = centreMin.getLineOut();
  output2 = frontMin.getLineOut();
  output3 = backMin.getLineOut();
  output4 = rightMin.getLineOut();
  output5 = leftMin.getLineOut();
  output6 = messMin.getLineOut();
}