package ;
import org.flixel.FlxSprite;

class Bullet extends FlxSprite
{
    public var damage:Int = 1;
    public var speed:Int = 300;

    public function new()
    {
        super(0, 0,"assets/gfx/bullet.png");

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

