package bullets;
import org.flixel.FlxSprite;

class BlueBullet extends BulletBase
{
    public function new(X:Float = 0, Y:Float = 0)
    {
	    damage = 1;
	    speed = 300;
	    ImagePath = "assets/gfx/bullet_blue.png";
	    
        super(X,Y);
    }

}

