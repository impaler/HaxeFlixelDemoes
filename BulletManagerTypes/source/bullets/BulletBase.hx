package bullets;
import org.flixel.FlxSprite;

class BulletBase extends FlxSprite
{
    public var damage:Int;
    public var speed:Int;
    public var ImagePath:String;

    public function new(X:Float = 0, Y:Float = 0)
    {
        super(X, Y, ImagePath);

//	We do this so it's ready for pool allocation straight away
        exists = false;
    }

    public function fire(bx:Int, by:Int):Void
    {
        x = bx;
        y = by;
        velocity.y = -speed;
        exists = true;
    }

    override public function update():Void
    {
        super.update();

//	Bullet off the top of the screen?
        if (exists && y < -height)
        {
            exists = false;
        }
    }

}

