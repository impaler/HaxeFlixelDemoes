package ;

import flixel.util.FlxCollision;
import flixel.FlxObject;
import flash.Lib;
import flixel.FlxG;
import flixel.FlxSprite;

class Player extends FlxSprite
{

    private var bulletDelay:Int = 75;
    private var lastFired:Int;
    private var xSpeed:Float = 200;
    private var ySpeed:Float = 100;

    public var fireType:Int = 1;
	public var lives:Int = 3;

    public function new()
    {
        //Set the player location to the center and automatically load it's bitmap :)
        super(FlxG.width / 2, FlxG.height - 16,"assets/gfx/player.png");
		health = 100;

	    scrollFactor.x = 0;
	    scrollFactor.y = 0;
    }

	public function bulletHitPlayer(bullet:FlxObject, player:FlxObject):Void
	{
		if ( FlxCollision.pixelPerfectCheck(cast(bullet , FlxSprite), cast(player , FlxSprite)) )
		{
			//	Hurt the player by the bullet damage amount\
			if (!Registry.godmode) {
					hurt(cast (bullet,EnemyBullet).damage);
			}
			
			//	Kill off the bullet, we're done with it now
			bullet.kill();
			
			//	Small FX
			Registry.fx.explodeBlock(Std.int(x), Std.int(y));
			
			Registry.fx.flashEffect(cast(player , FlxSprite));
			
			FlxG.camera.shake();
		}
	}
	
    override public function update():Void
    {
        super.update();
        
        //Make sure the ships movement is under control
        velocity.x = 0;
        velocity.y = 0;

		//todo improve touch controls
	   //var touches = FlxG.touches.list;
		//for (touch in touches)
		//{
		//	if (touch.pressed == true )
		//	{
        //       var direction = "none";
        //        var middle = FlxG.width*.5;
        //
        //        if ( touch.x <= middle )
        //        {
        //
        //            //FlxG.keys.pressed.LEFT = true;
        //            //FlxG.keys.pressed.RIGHT = false;
        //            direction = " - left";
        //
        //        } else if ( touch.x >= middle ) {
        //
        //            //FlxG.keys.pressed.RIGHT = true;
        //            //FlxG.keys.pressed.LEFT = false;
        //            direction = " - right";
	   //
        //        }
		//	}
        //
        //    if (touch.justReleased == true )
        //    {
        //            //FlxG.keys.pressed.LEFT = false;
        //            //FlxG.keys.pressed.RIGHT = false;
        //    }
		//}
		
        //Need to adds bound checking to these (as it can probably go too far left right now)
        if (FlxG.keys.pressed.LEFT && x > 0)
        {
             velocity.x -= xSpeed;
        }

        if (FlxG.keys.pressed.RIGHT && x < FlxG.width - width)
        {
             velocity.x += xSpeed;
        }

        if (FlxG.keys.pressed.UP && y >= 100)
        {
             velocity.y -= ySpeed;

             //if (y < 100)
             //{
             //    y = 100;
             //}
        }

        if (FlxG.keys.pressed.DOWN && y < FlxG.height - height)
        {
             velocity.y += ySpeed;
        }

        //Keep the ship on the screen at all times
        if (x < 0)
        {
            x = 0;
        }
        else if (x > FlxG.width - width)
        {
            x = FlxG.width - width;
        }

		 //Logic to Fire!
        // We dont want to fire too much at once, this lets the bulletDelay emulate an interval based on the timer
        if (FlxG.keys.pressed.CONTROL && Lib.getTimer() > lastFired + bulletDelay)
        {
           switch (fireType)
            {
                case 1:
                // Lame Single fire
                    Registry.bullets.fire(Std.int(x + 5), Std.int(y) );

                case 2:
                //	Double fire!
                    Registry.bullets.fire(Std.int(x), Std.int(y));
                    Registry.bullets.fire(Std.int(x + 10), Std.int(y));

                case 3:
                //	Quad fire!
                //Notice how a 40 limit on the Bullet manager now isnt enough!! :)
                    Registry.bullets.fire(Std.int(x - 8), Std.int(y));
                    Registry.bullets.fire(Std.int(x), Std.int(y - 4));
                    Registry.bullets.fire(Std.int(x + 10), Std.int(y - 4));
                    Registry.bullets.fire(Std.int(x + 18), Std.int(y));
            }

            //Use the awsome nme get timer that will work on all supported runtimes
            lastFired = Lib.getTimer();
        }
        //
        if ( fireType == 4 ) {
			//Auto Fire for testing
			if (Lib.getTimer() > lastFired + bulletDelay)
			{
					//	Quad fire!
					//Notice how a 40 limit on the Bullet manager now isnt enough!! :)
					Registry.bullets.fire(Std.int(x - 8), Std.int(y));
					Registry.bullets.fire(Std.int(x), Std.int(y - 4));
					Registry.bullets.fire(Std.int(x + 10), Std.int(y - 4));
					Registry.bullets.fire(Std.int(x + 18), Std.int(y));

					//Use the awsome nme get timer that will work on all supported runtimes
					lastFired = Lib.getTimer();
			}
        }

    }

	override public function kill():Void
	{
		lives--;
		
		health = 100;
		if ( lives ==0)
		super.kill();
	}

}