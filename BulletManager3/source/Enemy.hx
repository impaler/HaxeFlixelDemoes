package;

import flixel.util.FlxRandom;
import flixel.util.FlxTimer;
import flixel.util.FlxMath;
import flixel.FlxG;
import flixel.FlxSprite;

class Enemy extends FlxSprite
{
	
	private var fireTime:FlxTimer;
	private var willFire:Bool = false;
	
    public function new()
    {
        super(0, 0, "assets/gfx/space-baddie.png");
	    scrollFactor.x=0;
	    scrollFactor.y=0;
        exists = false;
    }

    public function launch():Void
    {
        x = 64 + Std.int(Math.random() * (FlxG.width - 128));
        y = -16;
        velocity.x = -50 + Std.int(Math.random() * 100);
        velocity.y = 50;
		
		//	Will they shoot at the player? 70% chance of doing so
		if (FlxRandom.chanceRoll(70))
		{
			willFire = true;
			fireTime = FlxTimer.start(1000 + Std.int(Math.random() * 500));
		}

        health = 4;
        exists = true;
    }

    override public function kill():Void
    {
        super.kill();

        Registry.score += 100;
    }

    override public function update():Void
    {
        super.update();
		
		if (willFire && fireTime.finished)
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

