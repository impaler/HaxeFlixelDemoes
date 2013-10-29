package;

import flash.display.Bitmap;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.geom.Rectangle;

/**
 * This class is simple a strip of pixels used for trailing behind the player ship
 * It's used in Fx.as as the Class given to the Jets FlxEmitter
 * 
 * It could easily be a PNG instead, but I like keeping it here so it's really easy to change the colours/size
 * and see the results immediately. Once I'm 100% happy with it, I would then usually bake it into a PNG
 */
class Jets extends Bitmap {

    public function new()
    {
        super(new BitmapData(3, 1, false, 0x000000));

        bitmapData.fillRect(new Rectangle(0, 0, 1, 1), 0xFFFF00);
        bitmapData.fillRect(new Rectangle(1, 0, 1, 1), 0xFF8000);
        bitmapData.fillRect(new Rectangle(2, 0, 1, 1), 0xFF0000);
    }

}