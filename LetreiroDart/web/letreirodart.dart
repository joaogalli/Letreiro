import 'dart:html';
import 'dart:async';

import 'LetreiroAnimation.dart';

void main() {
  createLetreiro("#canvy", 800, 120, "NOMESELA");
  createLetreiro("#canvy2", 800, 50, "NOMESELATRTOVGAB");
  createLetreiro("#canvy3", 800, 100, "NOMESELATRTOVGAB");
  createLetreiro("#canvy4", 1200, 100, "NOMEJOAO");
}

void createLetreiro(String canvasId, int width, int height, String text) {
  CanvasElement canvas = query(canvasId);
  canvas.width = width;
  canvas.height = height;
  CanvasRenderingContext2D cx = canvas.getContext("2d");  
  
  LetreiroAnimation la = new LetreiroAnimation();
  la.start(canvas, text);  
}

