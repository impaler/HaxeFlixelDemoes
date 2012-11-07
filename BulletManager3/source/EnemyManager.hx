package;

import org.flixel.plugin.photonstorm.FlxCollision;
import org.flixel.FlxSprite;
import Enemy;
import nme.utils.Timer;
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

        releaseRate = 300;

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
		if (getFirstAvailable() != null) {
			var enemy = cast ( getFirstAvailable(), Enemy);

			if (enemy!=null)
			{
				enemy.launch();
			}
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
		
		if ( FlxCollision.pixelPerfectCheck(cast(bullet , FlxSprite), cast(enemy , FlxSprite)) ) {
			bullet.kill();

			enemy.hurt(1);
			
			Registry.fx.flashEffect(cast(enemy , FlxSprite));
			
			Registry.fx.explodeBlock(Std.int(enemy.x+enemy.width*.5), Std.int(enemy.y+enemy.height));
			
			FlxG.score += 1;
			
		}
		

    }


}