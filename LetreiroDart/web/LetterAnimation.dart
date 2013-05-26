import 'dart:html';
import 'dart:async';

import 'FirstFrame.dart';
import 'SecondFrame.dart';
import 'ThirdFrame.dart';

class LetterAnimation {
  
  List letters;
  
  int currentLetter = 0;
  
  int currentFrame = 0;
  
  String letter;
  
  CanvasElement canvas;
  
  bool reached = false; 
  
  LetterAnimation(CanvasElement canvas, List letters) {
    this.canvas = canvas;
    this.letters = letters;
  }
  
  void start() {
    reached = false;
  }
  
  void draw() {
    if (reached) 
      return;
    
    CanvasRenderingContext2D cx = canvas.getContext("2d");
    
    cx.setFillColorRgb(0, 0, 0);
    cx.fillRect(0, 0, canvas.width, canvas.height);
    
    cx.setFillColorRgb(255, 255, 255);
//  cx.setStrokeColorRgb(255, 255, 255);
//  cx.strokeText(letter, 0, 0);
    cx.strokeRect(1, 1, canvas.width-2, canvas.height-2);
    
    CanvasImageSource drawFrame = null;
    
    int nextLetter = (currentLetter+1 >= letters.length) ? 0 : currentLetter+1;
    
    switch (currentFrame) {
      case 0:
        FirstFrame f1 = new FirstFrame();
        f1.width = canvas.width;
        f1.height = canvas.height;
        f1.letter = letters[currentLetter];
        drawFrame = f1.drawFrame();
        break;
      case 1:
        SecondFrame f2 = new SecondFrame();
        f2.width = canvas.width;
        f2.height = canvas.height;
        f2.oldLetter = letters[currentLetter];
        f2.newLetter = letters[nextLetter];
        drawFrame = f2.drawFrame();
        break;
      case 2:
        ThirdFrame f3 = new ThirdFrame();
        f3.width = canvas.width;
        f3.height = canvas.height;
        f3.oldLetter = letters[currentLetter];
        f3.newLetter = letters[nextLetter];
        drawFrame = f3.drawFrame();
        break;
    }
    
    if (drawFrame != null)    
      cx.drawImage(drawFrame, 0, 0);
    
    if (this.letter == letters[currentLetter]) {
      print("Letter reached.");
      reached = true;
    }
    
    currentFrame++;
    if (currentFrame > 2) {
      currentFrame = 0;
      currentLetter++;
      if (currentLetter >= letters.length) {
        currentLetter = 0;
      }
      
    }
  }
  
}