part of letreiro;

class LetreiroAnimation {
  
  CanvasElement mainCanvas;
  
  CanvasRenderingContext2D mainContext;
  
  int letterWidth, letterHeight;
  
  double letterScalex, letterScaley;
  
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
    letterHeight = mainCanvas.height;
    
    letterScalex = letterWidth / 100;
    letterScaley = letterHeight / 100;
    print(letterScalex.toString() + ":" + letterScaley.toString());

    for (int i = 0; i < word.length; i++) {
      CanvasElement letterCanvas = new CanvasElement(width: 100, height: 100);
      LetterAnimation la = new LetterAnimation(letterCanvas, letters);
      la.letter = word[i];
      
      letterAnimations[i] = la;
    }
    
    timer = new Timer.periodic(new Duration(days: 0, hours: 0, minutes: 0, seconds: 0, milliseconds: 50, microseconds: 0), 
        (Timer t) => draw());
  }

  void draw() {
    mainContext.setFillColorRgb(200, 0, 0);
    mainContext.fillRect(0, 0, mainCanvas.width, mainCanvas.height);
    
    bool finished = true;
    for (int i = 0; i < letterAnimations.length; i++) {
      LetterAnimation la = letterAnimations[i];
      
      CanvasRenderingContext2D cx = la.canvas.getContext("2d");
      la.draw();
      
      CanvasElement canvasAux = new CanvasElement(width: letterWidth, height: letterHeight);
      CanvasRenderingContext2D cxAux = canvasAux.getContext("2d");
      cxAux.scale(letterScalex, letterScaley);
      cxAux.drawImage(la.canvas, 0, 0);
      
      mainContext.drawImage(canvasAux, (i*letterWidth), 0);
      
      if (!la.reached) {
        finished = false;
      }
    }
    
    if (finished) {
      timer.cancel();
    }
  }
  
}