package ;

import org.flixel.FlxSprite;
import org.flixel.FlxG;
import org.flixel.FlxText;
import org.flixel.FlxState;

class PlayState extends FlxState
	{
		private var debug:FlxText;
		private var controls:FlxText;

        //create all the game state objects, overriding create is the best place		
		override public function create():Void
		{
            //initialise the Registry since the game is ready to access things like FlxG.width
            Registry.init();
            
            //create some debug text
            controls = new FlxText(0, 0, 360, "Press Ctrl to Fire! ---------- Press 1 / 2 / 3 to change Fire Type!");
			debug = new FlxText(0, 10, 200, "");
            
            //add the state objects to the game
			add(Registry.stars);
			add(Registry.bullets);
			add(Registry.player);
			add(debug);
			add(controls);
            
		}
		
		override public function update():Void
		{
            //update the debug text to tell us some useful things about the bullets FlxGroup
			debug.text = "Bullet Pool: " + Registry.bullets.countLiving() + "/" + Registry.bullets.members.length;
			
            //setup the logic to have different fire modes
			if (FlxG.keys.justReleased("ONE"))
			{
				Registry.player.fireType = 1;
			}
			
			if (FlxG.keys.justReleased("TWO"))
			{
				Registry.player.fireType = 2;
			}
			
			if (FlxG.keys.justReleased("THREE"))
			{
				Registry.player.fireType = 3;
			}
            
            //dont forget to update the rest of the core state and everything in it
            super.update();
		}
		
	}

