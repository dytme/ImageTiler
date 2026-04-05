# Reference

TiledImage objects are mostly static, meaning that once created, the `Size`, `Source Image`, `TilingMode` and parameters for the tiling procedure cannot be changed. However, the position of a TiledImage Object *can* be changed.

---

## Creating a TiledImage Object

It's recommended to only create a TiledImage object once, in the `setup()` part of your Sketch. This is to avoid performance and memory issues related to recalculating the same `PGraphic` element over and over again. Part of why this library is so efficient at what it does is because it computes the TiledImage object once, with the `.render()` method taking very few resources to execute.

### Universal Constructor Parameters

The first 6 parameters of any TilingMode are identical to one another, as they represent universal fields that are needed irrespective of the chosen tiling mode.
```java
texture = new TiledImage(PApplet, source_image, xPos, yPos, xSize, ySize)
```

**parent** (PApplet)
:   Refers to the window/instance of your sketch. If you don't really know what this means, you can safely use `this`.

**source_image** (PImage)
:   A `PImage` object which will be used as the source image for your TiledImage object. This has to be loaded/handled separately. *Do not provide a filepath*

**xPos, yPos** (float)
:   Coordinates for the (by default) top-left corner of your TiledImage object. Keep in mind that these coordinates are impacted by [shapeMode()](https://processing.org/reference/shapeMode_.html)

**xSize, ySize** (float)
:   The dimensions of your TiledImage object. *Keep in mind that these do not represent the coordinates for a the bottom-right corner, but rather the size of the object itself.* If you want to use coordinates, you can add `xPos` and `yPos` to `xSize` and `ySize` respectively.

### Example Setup Code

??? example "Example Setup Code"
    ```java
    TiledImage texture;

    void setup() {
        PImage image = loadImage("file_path_here");
        texture = new TiledImage(this, image, 100, 100, 300, 300);
    }

    void draw() {
        texture.render();
    }
    ```

---

## Applying Different Tiling Modes

TilingModes are selected depending on the constructor parameters that you provide. Either they will utilize a completely separate constructor (Fixed Size vs Image Count), or a specific field will pick a specific submode (like in the case of ImageCount)

### Actual Size Constructor

This is the default mode, where the original resolution of `source_image` will be utilized. This mode requires no extra parameters.

```java
texture = new TiledImage(PApplet, source_image, xPos, yPos, xSize, ySize)
```

For an example, [See Actual Size Mode](tilingmodes.md#actual-size-default)

### Fixed Size Constructor

This mode allows you to force the library to resize `source_image` to a specific resolution before tiling it.

```java
texture = new TiledImage(PApplet, source_image, xPos, yPos, xSize, ySize, xImgSize, yImgSize)
```

**xImgSize, yImgSize** (float)
:   The new resolution of your `PImage source_image`. Keep in mind that this mode does not account for aspect ratio, so you can freely resize/distort the source image.

For an example, [See Fixed Size Mode](tilingmodes.md#fixed-size)

### Image Count Constructor

This mode allows you to force the library to resize `source_image` to a specific resolution before tiling it.

```java
texture = new TiledImage(PApplet, source_image, xPos, yPos, xSize, ySize, axisConstraint, xImgCount, yImgCount)
```

**axisConstraint** (String)
:   Which axis (if any) will be prioritised in order to maintain aspect ratio. Use either `"x"` or `"y"`. If none is provided, then `source_image` will be freely distorted to ensure that the image count is satisfied on both axis.

**xImgCount, yImgCount** (float)
:   How many times should the image be tiled on the X and Y axis respectively. 

For an example, [See Image Count Mode](tilingmodes.md#image-count-non-constrained)

---

## Moving a TiledImage Object

The `xPos` and `yPos` parameters of a TiledImage object are public, meaning that you can change them directly. No getter/setter is provided, as changing the position does nothing but change the coordinates at which the `PGraphic` element is rendered. This can be done at any point in the execution of your program *after the TiledImage Object was constructed.*

??? example "Example Getter/Setter Procedure"
    ```java
    // Valid Getter Procedure
    if (texture.xPos <= 100) { ... }

    // Valid Setter Procedure
    texture.yPos = 200;
    ```