package;

import org.flixel.FlxG;
import org.flixel.FlxSprite;

class Enemy extends FlxSprite
{
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
        velocity.y = 100;

        health = 4;
        exists = true;
    }

    override public function kill():Void
    {
        super.kill();

        FlxG.score += 20;
    }

    override public function update():Void
    {
        super.update();

        if (y > FlxG.height)
        {
            exists = false;
        }
    }

}

