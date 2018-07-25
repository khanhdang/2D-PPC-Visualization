// TSV class
color TSVFaultyColor = color(205,50,50);
color TSVColor = color(255,255,255);
class TSV{
  float x, y;   // x,y location
  float w, h;   // width and height
  float link_x = -1, link_y = -1;
  int x_idx, y_idx;
  String Status = "normal";
  String label = "b("+str(y_idx)+","+str(x_idx)+")";
  // initialization
  TSV(float tempX, float tempY, float tempW, float tempH, int tempX_idx, int tempY_idx) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    x_idx = tempX_idx;
    y_idx = tempY_idx;
    label = "b("+str(y_idx)+","+str(x_idx)+")";
  }
  void DrawATSV() {
    stroke(0);
    if (Status == "faulty") {
      fill(TSVFaultyColor);
    } else {
      fill(TSVColor);
    }
    ellipse(x, y, w, h);
    fill(0);
    textFont(f, Text_size);
    textAlign(CENTER, CENTER);
    text(label, x, y);
    fill(85,155,0);
    textFont(f, Text_size);
  }
  void DrawLink() {
    stroke(0,100,255,200);
    fill(0,100,255,100);
    strokeWeight(10);
    
    if (link_x != -1) {
      arrowLine(x, y, link_x, y, 0, radians(30), true);
    }
    stroke(0,200,55,200);
    if (link_y != -1) {
      arrowLine(x, y, x, link_y, 0, radians(30), true);
    }
    //reset stroke
    stroke(0);
    strokeWeight(1);    
    fill(255);
  }
  void display() {
    DrawATSV();
    DrawLink();
  }
}
