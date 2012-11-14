package ;

import org.flixel.FlxLayer;
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

			add(Registry.stars);
			add(Registry.background);
			add(Registry.fx);
			add(Registry.bullets);
			add(Registry.player);
			add(Registry.enemies);
			add(Registry.enemyBullets);
			add(Registry.hud);
			add(debug);
			
			#if cpp
			
			//add the state objects to the game
			var stars = new FlxLayer("stars");
			stars.add(Registry.stars);
			addLayer(stars);
			
			var bg = new FlxLayer("bg");
			bg.atlas = FlxLayer.createAtlas(Std.int(Registry.background.map.width), Std.int(Registry.background.map.height), "bg");
			bg.add(Registry.background);
			addLayer(bg);
			
			var fx = new FlxLayer("fx");
			fx.atlas = FlxLayer.createAtlas(10,10, "fx");
			fx.add(Registry.fx);
			addLayer(fx);
			
			var player = new FlxLayer("player");
			player.atlas = FlxLayer.createAtlas(200, 200, "player");
			player.add(Registry.bullets);
			player.add(Registry.player);
			addLayer(player);
			
			var player = new FlxLayer("enemies");
			player.atlas = FlxLayer.createAtlas(200, 200, "enemyBullets");
			player.add(Registry.enemyBullets);
			player.add(Registry.enemies);
			addLayer(player);
			
			var ui = new FlxLayer("ui");
			ui.atlas = FlxLayer.createAtlas(1024, 1024, "ui");
			ui.add(Registry.hud);
			addLayer(ui);
			
			var debugLayer = new FlxLayer("debug");	
			debugLayer.add(debug);
			addLayer(debug.layer);
			
			#end

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

