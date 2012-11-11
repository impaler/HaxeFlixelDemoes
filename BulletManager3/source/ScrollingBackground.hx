package;

import org.flixel.plugin.photonstorm.FlxDisplay;
import org.flixel.FlxGame;
import org.flixel.FlxU;
import nme.Assets;
import org.flixel.FlxG;
import org.flixel.FlxSprite;
import org.flixel.FlxTilemap;
import org.flixel.FlxGroup;

//	import com.photonstorm.flixel.FlxStarField;
	
//	import org.flixel.*;

	class ScrollingBackground extends FlxGroup
	{
//		[Embed(source = '../assets/mapCSV_Group1_Map1.csv', mimeType = 'application/octet-stream')] private var map1CSV:Class;
//		[Embed(source = '../assets/tiles.png')] private var tilesPNG:Class;
		
		public var map:FlxTilemap;
		private var dolly:FlxSprite;
//		private var stars:FlxStarField;
		
		public function new() 
		{
			super();
			
			//	The starfield behind the map
//			stars = new FlxStarField(0, 0, FlxG.width, FlxG.height, 200, 1);
//			stars.setStarSpeed(0, 0.5);
//			
			//	Our scrolling background map, created using DAME
			map = new FlxTilemap();
			map.loadMap(Assets.getText("assets/levels/mapCSV_Group1_Map1.csv"), "assets/levels/tiles.png", 16, 16, FlxTilemap.OFF);
			map.x = (FlxG.width / 2) - (map.width / 2);
//			map.y = -(map.height);
			
			//todo
//			map.scrollFactor.x = 0.5;
//			map.scrollFactor.y = 1;
			
			//	This is an invisible sprite that our scrolling background tracks
			dolly = new FlxSprite(FlxG.width/2, FlxG.height);
//			dolly = new FlxSprite(180, map.height);
			
			dolly.visible = false;
			
			//	Tell Flixels camera system to follow this sprite
			//	Call this AFTER setting the dolly coordinates to avoid the "camera panning to sprite" effect
			//todo
			FlxG.camera.follow(dolly,0);
			
//			add(stars);
			add(map);
			add(dolly);
		}
		
		override public function update():Void
		{
			super.update();
			
//			map.y += 1;
//			map.velocity.y = 200;
//			map.acceleration.y = 20;
			
			//todo dolly
			dolly.velocity.y = -20;
			
			//	Have we scrolled off the top of our map?
//			if (dolly.y < -480)
//			{
////					Yes, so let's reset back to the start again (we unfollow first to stop camera jittering)
//				FlxG.camera.unfollow();
//				dolly.y = map.height;
//				FlxG.camera.follow(dolly, 1);
//			}
			
			if ( map.y == FlxG.height) {
				map.y = -(map.height);
			}
			
		}

}