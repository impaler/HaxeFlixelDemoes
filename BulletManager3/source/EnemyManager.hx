package;

import flixel.util.FlxCollision;
import flixel.FlxSprite;
import Enemy;
import flixel.FlxG;
import flash.Lib;
import flixel.FlxObject;
import flixel.group.FlxGroup;

class EnemyManager extends FlxGroup
{
    private var lastReleased:Int;
    private var releaseRate:Int;

    public function new()
    {
        super();

        releaseRate = 100;

        var poolSize = 500;
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
	
    public function bulletHitEnemy(bullet:Bullet, enemy:Enemy):Void
    {
		
		if ( FlxCollision.pixelPerfectCheck(bullet,enemy) )
        {
			bullet.kill();

			enemy.hurt(1);
			
			Registry.fx.flashEffect(enemy);
			
			Registry.fx.explodeBlock(Std.int(enemy.x+enemy.width*.5), Std.int(enemy.y+enemy.height));
			
			Registry.score += 1;
			
		}
		

    }


}