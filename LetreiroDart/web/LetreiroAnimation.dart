import 'dart:html';
import 'dart:async';

import 'LetterAnimation.dart';

class LetreiroAnimation {
  
  CanvasElement mainCanvas;
  
  CanvasRenderingContext2D mainContext;
  
  int letterWidth;
  
  List letterAnimations;
  
  List letters = [' ', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'X', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  
  Timer timer;
  
  LetreiroAnimation() {
  }

  CanvasImageSource start(CanvasElement mainCanvas, String word) {
    this.mainCanvas = mainCanvas;
    this.mainContext = mainCanvas.getContext("2d");
    
    letterAnimations = new List(word.length);
    
    letterWidth = (mainCanvas.width / word.length).toInt();
    int letterHeight = mainCanvas.height;
    
    for (int i = 0; i < word.length; i++) {
      CanvasElement letterCanvas = new CanvasElement(width: letterWidth, height: letterHeight);
      LetterAnimation la = new LetterAnimation(letterCanvas, letters);
      la.letter = word[i];
      
      letterAnimations[i] = la;
    }
    
    timer = new Timer.periodic(new Duration(days: 0, hours: 0, minutes: 0, seconds: 0, milliseconds: 50, microseconds: 0), 
        (Timer t) => draw());
  }

  void draw() {
    print('1');
    bool finished = true;
    for (int i = 0; i < letterAnimations.length; i++) {
      LetterAnimation la = letterAnimations[i];
      la.draw();
      
      mainContext.drawImage(la.canvas, (i*letterWidth).toInt(), 0);
      
      if (!la.reached)
        finished = false;
    }
    
    if (finished) {
      timer.cancel();
    }
  }
  
}