boolean RandomDefect(){
  float r = random(0,100);
  if (r <= injectionRate){
    return true;
  }else{
    return false;
  }
}
void TSV_Cluster_Gen() {
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Initialize each object
       TSV_grid[i][j] = new TSV((i+.5)*tile_dim,(j+.5)*tile_dim,tile_dim*shape_ratio,tile_dim*shape_ratio,i,j);
       if (RandomDefect()) {
         TSV_grid[i][j].Status = "faulty";
       } else {
         TSV_grid[i][j].Status = "healthy";
       }
       TSV_grid[i][j].link_x = (i+1.3)*tile_dim;
       TSV_grid[i][j].link_y = (j+1.3)*tile_dim;
    }
  }
}

void TSV_Cluster_Draw(){
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      //TSV_grid[i][j].display();
      TSV_grid[i][j].DrawATSV();
    }
  }
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      //TSV_grid[i][j].display();
      TSV_grid[i][j].DrawLink();
    }
  }
}

void TSV_Cluster_Par(){
  int[] pc;
  int[] pr;
  pc = new int[cols];
  pr = new int[rows];
  for (int i = 0; i < cols; i++) {
    pc[i] = 0;
    for (int j = 0; j < rows; j++) {
      if (TSV_grid[i][j].Status == "faulty") {
         pc[i]++;
      }
    }
  }
  for (int j = 0; j < rows; j++) {
    pr[j] = 0;
    for (int i = 0; i < cols; i++) {
      if (TSV_grid[i][j].Status == "faulty") {
         pr[j]++;
      }
    }
  }
  for (int i = 0; i < cols; i++) {
    textFont(f, Text_size*2);
    textAlign(CENTER, CENTER);
    fill(0);
    text(str(pc[i]%2), (i+.5)*tile_dim, (rows+.5)*tile_dim);
  }
  for (int j = 0; j < rows; j++) {
    textFont(f, Text_size*2);
    textAlign(CENTER, CENTER);
    fill(0);
    text(str(pr[j]%2), (cols+.5)*tile_dim, (j+.5)*tile_dim);
  }
}
