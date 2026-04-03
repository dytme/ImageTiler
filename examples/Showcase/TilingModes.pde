

//█░█ █▄░█ █ █░█ █▀▀ █▀█ █▀ ▄▀█ █░░   █▀█ ▄▀█ █▀█ ▄▀█ █▀▄▀█ █▀▀ ▀█▀ █▀▀ █▀█ █▀
//█▄█ █░▀█ █ ▀▄▀ ██▄ █▀▄ ▄█ █▀█ █▄▄   █▀▀ █▀█ █▀▄ █▀█ █░▀░█ ██▄ ░█░ ██▄ █▀▄ ▄█

// Used to keep all TiledImages in the same spot.

float xPos = 341;
float yPos = 21;
float xSize = 698;
float ySize = 698;



// ▄▀ ▄█ ▀▄    ▄▀█ █▀▀ ▀█▀ █░█ ▄▀█ █░░   █▀ █ ▀█ █▀▀
// ▀▄ ░█ ▄▀    █▀█ █▄▄ ░█░ █▄█ █▀█ █▄▄   ▄█ █ █▄ ██▄


TiledImage actualSize;

void setupActualSize() {
  actualSize = new TiledImage(this, texture, xPos, yPos, xSize, ySize);
}

void renderActualSize() {
  modeParameters = "Actual Size\n   - this,\n   - texture,\n   - xPos,\n   - yPos,\n   - xSize,\n   - ySize\n";
  actualSize.render();
}

// ▄▀ ▀█ ▀▄    █▀▀ █ ▀▄▀ █▀▀ █▀▄   █▀ █ ▀█ █▀▀
// ▀▄ █▄ ▄▀    █▀░ █ █░█ ██▄ █▄▀   ▄█ █ █▄ ██▄

TiledImage fixedSize;

void setupFixedSize() {
  fixedSize = new TiledImage(this, texture, xPos, yPos, xSize, ySize, 150, 150);
}

void renderFixedSize() {
  modeParameters = "Fixed Size\n   - this,\n   - texture,\n   - xPos,\n   - yPos,\n   - xSize,\n   - ySize,\n   - 150,\n   - 150\n";
  fixedSize.render();
}


// ▄▀ ▀▀▄ ▀▄   █ █▀▄▀█ ▄▀█ █▀▀ █▀▀   █▀▀ █▀█ █░█ █▄░█ ▀█▀
// ▀▄ ▄▄▀ ▄▀   █ █░▀░█ █▀█ █▄█ ██▄   █▄▄ █▄█ █▄█ █░▀█ ░█░

TiledImage imageCount;

void setupImageCount() {
  imageCount = new TiledImage(this, texture, xPos, yPos, xSize, ySize, "", 3, 10);
}

void renderImageCount() {
  modeParameters = "Image Count\n   - this,\n   - texture,\n   - xPos,\n   - yPos,\n   - xSize,\n   - ySize,\n   - \"\",\n   - 10,\n   - 5\n";
  imageCount.render();
}


// ▄▀ █░█ ▀▄   █ █▀▄▀█ ▄▀█ █▀▀ █▀▀   █▀▀ █▀█ █░█ █▄░█ ▀█▀   ▄▀ ▀▄▀   █▀▀ █▀█ █▄░█ █▀ ▀█▀ █▀█ ▄▀█ █ █▄░█ █▀▀ █▀▄ ▀▄
// ▀▄ ▀▀█ ▄▀   █ █░▀░█ █▀█ █▄█ ██▄   █▄▄ █▄█ █▄█ █░▀█ ░█░   ▀▄ █░█   █▄▄ █▄█ █░▀█ ▄█ ░█░ █▀▄ █▀█ █ █░▀█ ██▄ █▄▀ ▄▀

TiledImage imageCountX;

void setupImageCountX() {
  imageCountX = new TiledImage(this, texture, xPos, yPos, xSize, ySize, "x", 3, 10);
}

void renderImageCountX() {
  modeParameters = "Image Count X\n   - this,\n   - texture,\n   - xPos,\n   - yPos,\n   - xSize,\n   - ySize,\n   - \"x\",\n   - 10,\n   - 5\n";
  imageCountX.render();
}


// ▄▀ █▀ ▀▄    █ █▀▄▀█ ▄▀█ █▀▀ █▀▀   █▀▀ █▀█ █░█ █▄░█ ▀█▀   ▄▀ █▄█   █▀▀ █▀█ █▄░█ █▀ ▀█▀ █▀█ ▄▀█ █ █▄░█ █▀▀ █▀▄ ▀▄
// ▀▄ ▄█ ▄▀    █ █░▀░█ █▀█ █▄█ ██▄   █▄▄ █▄█ █▄█ █░▀█ ░█░   ▀▄ ░█░   █▄▄ █▄█ █░▀█ ▄█ ░█░ █▀▄ █▀█ █ █░▀█ ██▄ █▄▀ ▄▀

TiledImage imageCountY;

void setupImageCountY() {
  imageCountY = new TiledImage(this, texture, xPos, yPos, xSize, ySize, "y", 3, 10);
}

void renderImageCountY() {
  modeParameters = "Image Count Y\n   - this,\n   - texture,\n   - xPos,\n   - yPos,\n   - xSize,\n   - ySize,\n   - \"y\",\n   - 10,\n   - 5\n";
  imageCountY.render();
}
