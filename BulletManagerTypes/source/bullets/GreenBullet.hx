package bullets;
import org.flixel.FlxSprite;

class GreenBullet extends BulletBase
{
    public function new(X:Float = 0, Y:Float = 0)
    {
	    damage = 3;
	    speed = 400;
	    ImagePath = "assets/gfx/bullet_green.png";
	    
        super(X,Y);
    }

}

