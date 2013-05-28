import 'dart:html';
import 'Frame.dart';

class FirstFrame extends Frame {
  
  String letter;
  
  CanvasImageSource drawFrame() {
    CanvasElement canvas = new CanvasElement();
    canvas.width = width;
    canvas.height = height;
    CanvasRenderingContext2D cx = canvas.getContext("2d");
    
    CanvasImageSource letterDraw = drawLetter(width, height, letter);
    cx.drawImage(letterDraw, 0, 0);
    
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