package;

	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Rectangle;

/**
 * This class is simple a strip of pixels used for when the aliens are shot
 * It's used in Fx.as as the Class given to the FlxEmitters
 * 
 * It could easily be a PNG instead, but I like keeping it here so it's really easy to change the colours/size
 * and see the results immediately. Once I'm 100% happy with it, I would then usually bake it into a PNG
 */
class Pixel extends Bitmap
{
    public function new()
    {
        var bit = new BitmapData(16, 2, false, 0x00000000);
        super(bit);
        
        bitmapData.fillRect(new Rectangle(0, 0, 2, 2), 0x00FF0000);
        bitmapData.fillRect(new Rectangle(2, 0, 2, 2), 0x80FF0000);
        bitmapData.fillRect(new Rectangle(4, 0, 2, 2), 0x80FF8000);
        bitmapData.fillRect(new Rectangle(6, 0, 2, 2), 0x00800000);
        bitmapData.fillRect(new Rectangle(8, 0, 2, 2), 0x00400000);
        bitmapData.fillRect(new Rectangle(10, 0, 2, 2), 0x00808000);
        bitmapData.fillRect(new Rectangle(12, 0, 2, 2), 0x00FF4000);
        bitmapData.fillRect(new Rectangle(14, 0, 2, 2), 0x00FF8000);
    }
    
}

