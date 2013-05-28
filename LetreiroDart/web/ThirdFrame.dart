import 'dart:html';
import 'Frame.dart';

class ThirdFrame extends Frame {
  
  String oldLetter, newLetter;

  CanvasImageSource drawFrame() {
    CanvasElement canvas = new CanvasElement();
    canvas.width = width;
    canvas.height = height;
    CanvasRenderingContext2D cx = canvas.getContext("2d");
    
    CanvasImageSource letterTop = drawLetter(width, height, newLetter);
    cx.drawImage(letterTop, 0, 0);
    
    CanvasImageSource letterBottom = drawLetter(width, height, oldLetter);
    cx.drawImage(letterBottom, 0, 0);
    
    // FLAP
    int flapSize = (height * 0.40).toInt();
    cx.setFillColorRgb(110, 110, 110);
    cx.fillRect(0, (canvas.height/2), canvas.width, flapSize);
    
    CanvasImageSource flapLetter = drawFlapLetter(width, (height * 0.6).toInt(), newLetter);
    cx.drawImage(flapLetter, 0, (canvas.height/2) - flapSize);
    
    return canvas;
  }
  
  CanvasImageSource drawFlapLetter(int width, int height, String letter) {
    CanvasElement canvas = new CanvasElement();
    canvas.width = width;
    canvas.height = height;
    CanvasRenderingContext2D cx = canvas.getContext("2d");
    cx.translate(canvas.width / 2, (canvas.height / 2) + 6);
    cx.font = "20pt sans-serif";
    cx.textBaseline = 'middle';
    cx.textAlign = 'center';
  
    cx.setFillColorRgb(141, 150, 135);
    var metrics = cx.measureText(letter);
    var scalex = ((width - 20) / metrics.width);
    var scaley = (height / 20);
    var ypos = (height / (scaley * 1.25));
    cx.scale(scalex, scaley);
    cx.fillText(letter, 0, 0);
    
    return canvas;
  }
  
  CanvasImageSource drawLetter(int width, int height, String letter) {
    CanvasElement canvas = new CanvasElement();
    canvas.width = width;
    canvas.height = height;
    CanvasRenderingContext2D cx = canvas.getContext("2d");
    cx.translate(canvas.width / 2, (canvas.height / 2) + 6);
    cx.font = "20pt sans-serif";
    cx.textBaseline = 'middle';
    cx.textAlign = 'center';
  
    cx.setFillColorRgb(141, 150, 135);
    var metrics = cx.measureText(letter);
    var scalex = ((width - 20) / metrics.width);
    var scaley = (height / 20);
    var ypos = (height / (scaley * 1.25));
    cx.scale(scalex, scaley);
    cx.fillText(letter, 0, 0);
    
    return canvas;
  }
}