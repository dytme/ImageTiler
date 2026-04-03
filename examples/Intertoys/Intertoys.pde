
/* 

██╗███╗░░██╗████████╗███████╗██████╗░████████╗░█████╗░██╗░░░██╗░██████╗
██║████╗░██║╚══██╔══╝██╔════╝██╔══██╗╚══██╔══╝██╔══██╗╚██╗░██╔╝██╔════╝
██║██╔██╗██║░░░██║░░░█████╗░░██████╔╝░░░██║░░░██║░░██║░╚████╔╝░╚█████╗░
██║██║╚████║░░░██║░░░██╔══╝░░██╔══██╗░░░██║░░░██║░░██║░░╚██╔╝░░░╚═══██╗
██║██║░╚███║░░░██║░░░███████╗██║░░██║░░░██║░░░╚█████╔╝░░░██║░░░██████╔╝
╚═╝╚═╝░░╚══╝░░░╚═╝░░░╚══════╝╚═╝░░╚═╝░░░╚═╝░░░░╚════╝░░░░╚═╝░░░╚═════╝░

█▀▀ ▀▄▀ ▄▀█ █▀▄▀█ █▀█ █░░ █▀▀   █▀ █▄▀ █▀▀ ▀█▀ █▀▀ █░█  █▀▀ █▀█ █▀█   █ █▀▄▀█ ▄▀█ █▀▀ █▀▀ ▀█▀ █ █░░ █▀▀ █▀█ █▀█ ▀█ █▀▄
██▄ █░█ █▀█ █░▀░█ █▀▀ █▄▄ ██▄   ▄█ █░█ ██▄ ░█░ █▄▄ █▀█  █▀░ █▄█ █▀▄   █ █░▀░█ █▀█ █▄█ ██▄ ░█░ █ █▄▄ ██▄ █▀▄ █▀▀ █▄ █▄▀


Created by d_ytme in October 2025 as a University Assignment, converted into an example for the library

If you're only interested in seeing how TiledImage is being utilized, then check the Storefront.pde file.


External Credits: Inter-Toys for their logo and branding.
                  Bricks & Planks Textures from cc0-textures.com
                  Green Army People photos from Victor Buy

*/




// █░░ █ █▄▄ █▀█ ▄▀█ █▀█ █ █▀▀ █▀
// █▄▄ █ █▄█ █▀▄ █▀█ █▀▄ █ ██▄ ▄█


import com.dytme.ImageTiler.*;




// █▀▄▀█ █▀▀ ▀█▀ █░█ █▀█ █▀▄ █▀
// █░▀░█ ██▄ ░█░ █▀█ █▄█ █▄▀ ▄█


void setup() {
 
 size(1280,720,P2D); // P2D is more efficient than the default rendering engine. 
 surface.setLocation(100,100); // Force the window to appear on the screen (and not off-screen, can happen sometimes)
 pixelDensity(1); // Disable pixel scaling on high-resolution devices (causes issues when a device is connected to external monitors)
 surface.setResizable(false); // Disable window resizing (a lot of positioning is absolute and not relative, would break stuff)
 
 // Methods that load in different variables
 loadStorefrontAssets();
 
}


void draw() {
  
  background(#FFFFFF);
  noStroke();
  
  // Draw the background scene itself
  drawBuilding();
  drawStoreSignHolder();
  drawStorefrontFrame();
  
  // Draw the overlapping part of the storefront
  drawStoreWindowFrame();

}




// █▀▀ █░█ █▀▀ █▄░█ ▀█▀   █░█ ▄▀█ █▄░█ █▀▄ █░░ █▀▀ █▀█ █▀
// ██▄ ▀▄▀ ██▄ █░▀█ ░█░   █▀█ █▀█ █░▀█ █▄▀ █▄▄ ██▄ █▀▄ ▄█


void windowResized() {
  surface.setSize(1280, 720);
}
