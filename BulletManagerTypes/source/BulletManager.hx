package ;

import bullets.GreenBullet;
import bullets.BulletBase;
import bullets.BlueBullet;
import org.flixel.FlxTypedGroup;
import org.flixel.FlxGroup;

class BulletManager extends FlxTypedGroup<BulletBase>
{

    public function new(poolSize:Int = 40)
    {
        super();
	    
        var i = 0;
        while (i < poolSize/2) {
            add(new BlueBullet());
            i++;
        }
	    
	    var i = 0;
	     while (i < poolSize/2) {
	         add(new GreenBullet());
	         i++;
	     }

    }

    public inline function fireBlueBullet(bx:Int, by:Int):Void
    {
	    fireBulletType(bx, by, BlueBullet);
    }
	
    public inline function fireGreenBullet(bx:Int, by:Int):Void
    {
		fireBulletType(bx, by, GreenBullet);
    }

	//You can call this directly or create shortcut wrappers like above
	public inline function fireBulletType( bx:Int, by:Int, type:Class<BulletBase> ):Void
	{
		if (getFirstAvailable(type) != null)
        {
	        getFirstAvailable(type).fire(bx, by);
        }
	}

}

