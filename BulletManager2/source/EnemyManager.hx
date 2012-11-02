package;

import org.flixel.FlxG;
import nme.Lib;
import org.flixel.FlxObject;
import org.flixel.FlxGroup;

class EnemyManager extends FlxGroup
{
    private var lastReleased:Int;
    private var releaseRate:Int;

    public function new()
    {
        super();

        releaseRate = 500;

        var poolSize = 100;
        var i = 0;
        while (i < poolSize) {
            var enemy = new Enemy();
            add(enemy);
            i++;
        }
    }

    public function release():Void
    {
        var enemy = cast ( getFirstAvailable(), Enemy);

        if (enemy!=null)
        {
            enemy.launch();
        }
    }

    override public function update():Void
    {
        super.update();

        if (Lib.getTimer() > lastReleased + releaseRate)
        {
            lastReleased = Lib.getTimer();

            release();
        }
    }

    public function bulletHitEnemy(bullet:FlxObject, enemy:FlxObject):Void
    {
        bullet.kill();

        enemy.hurt(1);

        Registry.fx.explodeBlock(Std.int(enemy.x), Std.int(enemy.y));

        FlxG.score += 1;
    }

}