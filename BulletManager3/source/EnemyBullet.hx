package ;

import org.flixel.plugin.photonstorm.FlxVelocity;
import org.flixel.FlxG;
import org.flixel.FlxSprite;

	class EnemyBullet extends FlxSprite
	{
		public var damage:Int = 25;
		public var speed:Int = 240;
		
		public function new() 
		{
			super(0, 0, 'assets/gfx/enemy-bullet.png');
			
			//	We do this so it's ready for pool allocation straight away
			exists = false;
		}

		public function fire(bx:Int, by:Int):Void
		{
			x = bx;
			y = by;
			
			FlxVelocity.moveTowardsObject(this, Registry.player, speed);
			
			exists = true;
		}
		
		override public function update():Void
		{
			super.update();
			
			//	Bullet off the screen?
			if (exists && (y < 0 || y > FlxG.height || x < 0 || x > FlxG.width))
			{
				exists = false;
			}
		}

}