package;

import org.flixel.plugin.photonstorm.FlxMath;
import org.flixel.plugin.photonstorm.FlxDelay;
import org.flixel.FlxG;
import org.flixel.FlxSprite;

class Enemy extends FlxSprite
{
	
	private var fireTime:FlxDelay;
	private var willFire:Bool = false;
	
    public function new()
    {
        super(0, 0, "assets/gfx/space-baddie.png");

        exists = false;
    }

    public function launch():Void
    {
        x = 64 + Std.int(Math.random() * (FlxG.width - 128));
        y = -16;
        velocity.x = -50 + Std.int(Math.random() * 100);
        velocity.y = 50;
		
		//	Will they shoot at the player? 70% chance of doing so
		if (FlxMath.chanceRoll(70))
		{
			willFire = true;
			fireTime = new FlxDelay(1000 + Std.int(Math.random() * 500));
			fireTime.start();
		}

        health = 4;
        exists = true;
    }

    override public function kill():Void
    {
        super.kill();

        FlxG.score += 100;
    }

    override public function update():Void
    {
        super.update();
		
		if (willFire && fireTime.hasExpired)
		{
			Registry.enemyBullets.fire(Std.int(x), Std.int(y));
			willFire = false;
		}

        if (y > FlxG.height)
        {
            exists = false;
        }
    }

}

