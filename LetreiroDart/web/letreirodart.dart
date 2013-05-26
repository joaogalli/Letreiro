import 'dart:html';
import 'dart:async';

import 'LetreiroAnimation.dart';

void main() {
  CanvasElement canvas = query("#canvy");
  canvas.width = 800;
  canvas.height = 100;
  CanvasRenderingContext2D cx = canvas.getContext("2d");  
  
  LetreiroAnimation la = new LetreiroAnimation();
  la.start(canvas, "NOME ELA");
}


