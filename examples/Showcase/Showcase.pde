
/*

▀▀█▀▀ ▀█▀ ▒█░░░ ▀█▀ ▒█▄░▒█ ▒█▀▀█   ▒█▀▄▀█ ▒█▀▀▀█ ▒█▀▀▄ ▒█▀▀▀ 
░▒█░░ ▒█░ ▒█░░░ ▒█░ ▒█▒█▒█ ▒█░▄▄   ▒█▒█▒█ ▒█░░▒█ ▒█░▒█ ▒█▀▀▀ 
░▒█░░ ▄█▄ ▒█▄▄█ ▄█▄ ▒█░░▀█ ▒█▄▄█   ▒█░░▒█ ▒█▄▄▄█ ▒█▄▄▀ ▒█▄▄▄ 

▒█▀▀▀█ ▒█░▒█ ▒█▀▀▀█ ▒█░░▒█ ▒█▀▀█ ░█▀▀█ ▒█▀▀▀█ ▒█▀▀▀ 
░▀▀▀▄▄ ▒█▀▀█ ▒█░░▒█ ▒█▒█▒█ ▒█░░░ ▒█▄▄█ ░▀▀▀▄▄ ▒█▀▀▀ 
▒█▄▄▄█ ▒█░▒█ ▒█▄▄▄█ ▒█▄▀▄█ ▒█▄▄█ ▒█░▒█ ▒█▄▄▄█ ▒█▄▄▄


Little example sketch to showcase the 3 tiling modes and their specific settings.
You can cycle through all available modes and their settings using left click.

If you want to see how each tiling mode is implemented code-wise, then check the TilingModes.pde file.

Ice texture from CC0-textures.com

*/


// █▀ █▀▀ ▀█▀ █░█ █▀█
// ▄█ ██▄ ░█░ █▄█ █▀▀


// Import the library
import com.dytme.ImageTiler.*;


// Image that will be tiled using the library
PImage texture;


void setup() {
  size(1060, 740, P2D);
  // pixelDensity(1);
  texture = loadImage("ice.jpg");
 
  setupActualSize();
  setupFixedSize();
  setupImageCount();
  setupImageCountX();
  setupImageCountY();
}

String modeParameters = "";
int currentMode = 1;

// Render the example TiledImage alongside its parameters
void draw() {
  
  // Render the scene to support the showcase
  background(#D9D9D9);
  
  fill(#FFFFFF);
  
  stroke(#000000);
  strokeWeight(2);
  rect(20, 20, 300, 340); // Properties Panel
  rect(20, 420, 300, 300); // Original Image Panel
  rect(340, 20, 700, 700); // Texture Panel
  
  switch(currentMode) {
    case 1: renderActualSize(); break;
    case 2: renderFixedSize(); break;
    case 3: renderImageCount(); break;
    case 4: renderImageCountX(); break;
    case 5: renderImageCountY(); break;
  }
  
  noStroke();
  fill(#000000);
  textSize(24);
  text(modeParameters, 30, 30, 280, 340);
  
  // Draw original image
  text("Original Image (Scaled 1x1)", 20, 406); 
  image(texture, 21, 421, 298, 298);
  
}


// Cycle through the tiling modes
void mousePressed() {
  
  currentMode++;
  
  if (currentMode >= 6) {
    currentMode = 1;
  }
  
}
