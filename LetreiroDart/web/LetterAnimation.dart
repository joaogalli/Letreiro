part of letreiro;

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
    cx.strokeRect(1, 1, canvas.width-2, canvas.height-2);
    
    cx.setFillColorRgb(36, 43, 30);
    cx.fillRect(0, canvas.height -(canvas.height * 0.05), canvas.width, (canvas.height * 0.05));
    cx.fillRect((canvas.width - (canvas.width * 0.05)), 0, (canvas.width * 0.05), canvas.height);
    
    CanvasImageSource drawFrame = null;
    
    int nextLetter = (currentLetter+1 >= letters.length) ? 0 : currentLetter+1;
    
    int letterWidth = (canvas.width * 0.8).toInt();
    int letterHeight = (canvas.height * 0.8).toInt();
    
    switch (currentFrame) {
      case 0:
        FirstFrame f1 = new FirstFrame();
        f1.width = letterWidth;
        f1.height = letterHeight;
        f1.letter = letters[currentLetter];
        drawFrame = f1.drawFrame();
        break;
      case 1:
        SecondFrame f2 = new SecondFrame();
        f2.width = letterWidth;
        f2.height = letterHeight;
        f2.oldLetter = letters[currentLetter];
        f2.newLetter = letters[nextLetter];
        drawFrame = f2.drawFrame();
        break;
      case 2:
        ThirdFrame f3 = new ThirdFrame();
        f3.width = letterWidth;
        f3.height = letterHeight;
        f3.oldLetter = letters[currentLetter];
        f3.newLetter = letters[nextLetter];
        drawFrame = f3.drawFrame();
        break;
    }

    if (drawFrame != null)    
      cx.drawImage(drawFrame, (canvas.width * 0.1), (canvas.height * 0.1));
    
    // top-trave
    cx.setFillColorRgb(0, 0, 0, 0.1);
    cx.fillRect(0, (canvas.height/2) - 10, canvas.width - (canvas.width * 0.07), 10);
    cx.setFillColorRgb(255, 255, 255, 0.1);
    cx.fillRect(0, (canvas.height/2), canvas.width - (canvas.width * 0.07), 10);
    
    // gradient
    
    CanvasGradient cg = cx.createLinearGradient(0, 0, 0, 50);
    cg.addColorStop(0.1, "rgba(255,255,255,0.2)");
    cg.addColorStop(1, "transparent");
    cx.fillStyle = cg;
    cx.fill();
    
    cx.fillRect((canvas.width * 0.02), (canvas.height * 0.02), (canvas.width * 0.9), (canvas.height * 0.43));
    
    if (this.letter == letters[currentLetter]) {
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