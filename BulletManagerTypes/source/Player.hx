package ;

import nme.Lib;
import nme.Assets;
import org.flixel.FlxG;
import org.flixel.FlxSprite;

class Player extends FlxSprite
{

    private var bulletDelay:Int = 75;
    private var lastFired:Int;
    private var xSpeed:Float = 200;
    private var ySpeed:Float = 100;

    public var fireType:Int = 1;

    public function new()
    {
        //Set the player location to the center and automatically load it's bitmap :)
        super(FlxG.width / 2, FlxG.height - 16,"assets/gfx/player.png");
    }

    override public function update():Void
    {
        super.update();
        
        //Make sure the ships movement is under control
        velocity.x = 0;
        velocity.y = 0;

        //Need to adds bound checking to these (as it can probably go too far left right now)
        if (FlxG.keys.LEFT && x > 0)
        {
            velocity.x -= xSpeed;
        }

        if (FlxG.keys.RIGHT && x < FlxG.width - width)
        {
            velocity.x += xSpeed;
        }

        if (FlxG.keys.UP && y >= 100)
        {
            velocity.y -= ySpeed;

            if (y < 100)
            {
                y = 100;
            }
        }

        if (FlxG.keys.DOWN && y < FlxG.height - height)
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
        if (FlxG.keys.CONTROL && Lib.getTimer() > lastFired + bulletDelay)
        {
           switch (fireType)
            {
                case 1:
                // Lame Single fire
                    Registry.bullets.fireBlueBullet(Std.int(x + 5), Std.int(y) );

                case 2:
                //	Double fire!
                    Registry.bullets.fireBlueBullet(Std.int(x), Std.int(y));
                    Registry.bullets.fireGreenBullet(Std.int(x + 10), Std.int(y));

                case 3:
                //	Quad fire!
                //Notice how a 40 limit on the Bullet manager now isnt enough!! :)
                    Registry.bullets.fireBlueBullet(Std.int(x - 8), Std.int(y));
                    Registry.bullets.fireGreenBullet(Std.int(x), Std.int(y - 4));
                    Registry.bullets.fireBlueBullet(Std.int(x + 10), Std.int(y - 4));
                    Registry.bullets.fireGreenBullet(Std.int(x + 18), Std.int(y));
            }
            
            //Use the awsome nme get timer that will work on all supported runtimes
            lastFired = Lib.getTimer();
        }

    }

}