import processing.pdf.*;
boolean record;
// external popup of input
import javax.swing.*; 
boolean set_input = false;

// 2D Array of objects
TSV[][] TSV_grid;

// Number of columns and rows in the grid
int cols = 8;
int rows = 8;
int tile_dim = 200;
float Text_size = tile_dim/10;
float shape_ratio = 0.7;
// Display text
PFont f;  

// Random
float injectionRate = 20;
int defect_num;


// Level of configuration
boolean EnableDraw = true;

int loop_num = 100000;


import java.io.FileWriter;
FileWriter tracefile = null;
//PrintWriter  tracefile;
void setup() {
  size(1400,1000);
  //fullScreen();
  if (set_input) {
    try { 
      UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
    } 
    catch (Exception e) { 
      e.printStackTrace();
    } 
    String S_cols = JOptionPane.showInputDialog(frame, "Col", "4");
    if (S_cols != null) cols=Integer.parseInt(S_cols);
    String S_rows = JOptionPane.showInputDialog(frame, "Row", "4");
    if (S_rows != null) rows=Integer.parseInt(S_rows);
    //String S_redudant = JOptionPane.showInputDialog(frame, "Redundancy", "false");
    //if (S_redudant != null) redundantTSV=Boolean.parseBoolean(S_redudant);
    tile_dim = min (width/(cols+1), height/(rows+1));
    Text_size = tile_dim/5;
  } else {  
    //cols = width/tile_dim-1;
    //rows = height/tile_dim-1;
    tile_dim = min (width/(cols+1), height/(rows+1));
    Text_size = tile_dim/5;
    //tile_dim = min( floor(width/cols), floor(height/rows));
  }
  f = createFont("Arial", 40, true);
  TSV_grid = new TSV[cols][rows];
  TSV_Cluster_Gen();

  //LayerRandom();
}

void draw() {
  if (record) {
    // Note that #### will be replaced with the frame number. Fancy!
    beginRecord(PDF, "frame-####.pdf");
  }

  background(255);

  // The counter variables i and j are also the column and row numbers and 
  // are used as arguments to the constructor for each object in the grid.  

  if (EnableDraw) {
    TSV_Cluster_Draw();
    TSV_Cluster_Par();
  } else {
    frameRate=99999;
  }
  if (record) {
    endRecord();
    record = false;
  }
  
}

void mousePressed() {
  record = true;
}

void keyPressed() {
  
}
