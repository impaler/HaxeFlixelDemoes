package ;

import nme.Lib;
import org.flixel.FlxU;
import org.flixel.FlxSprite;
import org.flixel.FlxG;
import org.flixel.FlxText;
import org.flixel.FlxState;

class PlayState extends FlxState
	{
		private var debug:FlxText;

        //create all the game state objects, overriding create is the best place		
		override public function create():Void
		{
            //initialise the Registry since the game is ready to access things like FlxG.width
            Registry.init();
            
            //create some debug text
            debug = new FlxText(0, 0, 200, "");
            
            //add the state objects to the game
			add(Registry.stars);
			add(Registry.background);
			add(Registry.fx);
            add(Registry.enemies);
			add(Registry.bullets);
			add(Registry.enemyBullets);
			add(Registry.player);
			add(Registry.hud);
			add(debug);
			
			times = new Array();
            
		}
	private var times:Array<Float>;
	
		override public function update():Void
		{	
			var t = Lib.getTimer();
			var now:Float = t / 1000;
			times.push(now);
			
			while(times[0] < now - 1)
			{
				times.shift();
			}
			
            //update the debug text to tell us some useful things about the bullets FlxGroup
			debug.text = "Bullet Pool: " + Registry.bullets.countLiving() + "/" + Registry.bullets.members.length + " - Press F1/F2/F3 - "+"\nFPS: " + times.length + "/" + Lib.current.stage.frameRate;
			
            FlxG.overlap(Registry.bullets, Registry.enemies, Registry.enemies.bulletHitEnemy);
			
			FlxG.overlap(Registry.enemyBullets, Registry.player, Registry.player.bulletHitPlayer);
            
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
			
			if (FlxG.keys.justReleased("FOUR"))
			{
				Registry.player.fireType = 4;
			}
            
            //dont forget to update the rest of the core state and everything in it
            super.update();
		}

	override public function destroy():Void
	{
		Registry.hud.liveUpdate = false;
		//todo
//		Registry.destroy();
		
		super.destroy();
	}
		
	}

