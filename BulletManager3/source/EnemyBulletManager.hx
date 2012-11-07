package ;

import org.flixel.FlxGroup;

class EnemyBulletManager extends FlxGroup
	{
		public function new() 
		{
			super();
			
			var poolSize = 40;
			var i = 0;
			
			while (i < poolSize) {
			var bullet = new EnemyBullet();
				add(bullet);
				i++;
			}
			
		}
		
		public function fire(bx:Int, by:Int):Void
		{
			var bullet =  getFirstAvailable();
			if (bullet != null)
		   {
			   var bullet = cast ( getFirstAvailable(), EnemyBullet );
			   bullet.fire(bx, by);
		   }
			
		}

}