package com.dytme.ImageTiler;

import processing.core.PApplet;
import processing.core.PGraphics;
import processing.core.PImage;

import java.util.Objects;

/**
 * Main object class which allows the creation of seamless textures.
 * Behaves similarly to PImage or SoundFile, as in its an object that needs to be defined, created, and then referenced through .render()
 */
public class TiledImage {

    PApplet applet;

    PGraphics tiledImage; // Credit to ChatGPT for helping me understand the syntax of and how to actually use PGraphics!
                          // The public documentation is very sparse and the dev one is... 'above my pay-grade'.

    // Not only is using a PGraphics element here is ideal for performance, it also acts as a clipping mask!
    //     Which means both that we don't have to do as many computations for some tiling modes,
    //     but also that it's a fallback in case the user passes some really funky numbers.

    PImage img; // Passes through the actual image that we're tiling

    // Fields that determine the boundaries of the tiled image
    // These are public to allow other objects to reference their positioning when placing themselves. Although it's
    /**
     * Coordinates for the (by default) top-left corner of your TiledImage object.
     * Keep in mind that these coordinates are impacted by shapeMode()
     */
    public float xPos, yPos;

    /**
     * The dimensions of your TiledImage object.
     * Keep in mind that these do not represent the coordinates for a the bottom-right corner, but rather the size of the object itself.
     * If you want to use coordinates, you can add xPos and yPos to xSize and ySize respectively.
     */
    public final float xSize, ySize;

    // Fields that determine the size of a single image (Depends on mode)
    float xImgSize, yImgSize; // (0 = Default)

    String constraintAxis = "x"; // Determines the constrained axis (Depends on mode)

    // Fields that determine how many instances of the image should be repeated on each axis (Depends on mode)
    int xImgCount, yImgCount; // (0 = Auto-Compute)



    // ▀█▀ █ █░░ █ █▄░█ █▀▀   █▀▄▀█ █▀█ █▀▄ █▀▀ █▀
    // ░█░ █ █▄▄ █ █░▀█ █▄█   █░▀░█ █▄█ █▄▀ ██▄ ▄█
    // (Constructors)


    // Forced Size (Default)

    /**
     *
     * @param instance PApplet (this)
     * @param img PImage object to use as a source image
     * @param xPos X position of the object
     * @param yPos Y position of the object
     * @param xSize X size of the object
     * @param ySize Y size of the object
     * @param xImgSize Custom X size for the source image
     * @param yImgSize Custom Y size for the source image
     */
    public TiledImage(PApplet instance, PImage img, float xPos, float yPos, float xSize, float ySize, float xImgSize, float yImgSize) {
        this.applet = instance;

        this.img   = img;
        this.xPos  = xPos;
        this.xSize = xSize;
        this.yPos  = yPos;
        this.ySize = ySize;

        this.xImgSize = xImgSize;
        this.yImgSize = yImgSize;


        // If no size was provided for an axis, fall back to the default size of the image;
        if (Float.isNaN(xImgSize) || xImgSize == 0.0) {
            xImgSize = img.width;
        }
        if (Float.isNaN(yImgSize) || yImgSize == 0.0) {
            yImgSize = img.height;
        }

        // After the specific computations were done, call on the method that actually tiles the image
        computePGraphic();

    }


    // Actual Size

    /**
     * This is the default constructor, that uses the original resolution of source_image. This mode requires no extra parameters.
     * @param instance PApplet (this)
     * @param img PImage object to use as a source image
     * @param xPos X position of the object
     * @param yPos Y position of the object
     * @param xSize X size of the object
     * @param ySize Y size of the object
     */
    public TiledImage(PApplet instance, PImage img, float xPos, float yPos, float xSize, float ySize) {
        // Extracts the image size by itself and constructs a forced size tiled image.
        this(instance, img, xPos, yPos, xSize, ySize, img.width, img.height);
    }


    // Image Count

    /**
     * This constructor allows you to force the library to resize source_image to a specific resolution before tiling it.
     * @param instance PApplet (this)
     * @param img PImage object to use as a source image
     * @param xPos X position of the object
     * @param yPos Y position of the object
     * @param xSize X size of the object
     * @param ySize Y size of the object
     * @param constraintAxis Which axis (if any) will be prioritized in order to maintain aspect ratio. Use either "x" or "y". If none is provided, then source_image will be freely distorted to ensure that the image count is satisfied on both axis.
     * @param xImgCount How many times to tile on the X axis
     * @param yImgCount How many times to tile on the Y axis
     */
    public TiledImage(PApplet instance, PImage img, float xPos, float yPos, float xSize, float ySize, String constraintAxis, int xImgCount, int yImgCount) {
        this.applet = instance;

        this.img   = img;
        this.xPos  = xPos;
        this.xSize = xSize;
        this.yPos  = yPos;
        this.ySize = ySize;

        this.constraintAxis = constraintAxis;
        this.xImgCount      = xImgCount;
        this.yImgCount      = yImgCount;


        // Store the aspect ratio of the original image
        float aspectRatio = (float) img.width /img.height;

        if (Objects.equals(constraintAxis, "x")) { // Constrain the scaling to the x-axis and clip the y-axis.

            xImgSize = xSize/xImgCount;
            yImgSize = xImgSize*aspectRatio;

        } else if (Objects.equals(constraintAxis, "y")) { // Constrain the scaling to the y-axis and clip the x-axis.

            yImgSize = ySize/yImgCount;
            xImgSize = yImgSize*aspectRatio;

        } else { // If we don't care about the aspect ratio of the image and just want to force the tiling to fit in the area.

            xImgSize = xSize/xImgCount;
            yImgSize = ySize/yImgCount;

        }

        // After the specific computations were done, call on the method that actually tiles the image
        computePGraphic();

    }




    // █▀▄▀█ █▀▀ ▀█▀ █░█ █▀█ █▀▄ █▀
    // █░▀░█ ██▄ ░█░ █▀█ █▄█ █▄▀ ▄█


    void computePGraphic() {

        tiledImage = applet.createGraphics(Math.round(xSize), Math.round(ySize)); // Create the actual PGraphics instance // , applet.P2D
        tiledImage.beginDraw();
        tiledImage.clear();

        // We loop through however many instances of the image would fit the tiling area on the horizontal axis, and then for each horizontal instance do the same on the vertical.
        for (int i = 0; i<Math.ceil(xSize/xImgSize); i++ ) {
            for (int j = 0; j<Math.ceil(ySize/yImgSize); j++ ) {
                // tiledImage.image() NOT JUST image()  ->  It will otherwise not be generated within TiledImage
                tiledImage.image(img, xImgSize*i, yImgSize*j, xImgSize, yImgSize);
            }
        }

        tiledImage.endDraw();

    }

    /**
     * Draws the tiled image to the screen.
     * Call this in your draw() loop.
     */
    public void render() {

        // If there is a tiledImage defined already, render it.
        if (tiledImage != null) { applet.image(tiledImage, xPos, yPos); }
    }


}
