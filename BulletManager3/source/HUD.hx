package;

import flixel.util.FlxPoint;
import flixel.util.FlxSpriteUtil;
import flixel.ui.FlxBar;
import flixel.addons.text.FlxBitmapFont;
import flixel.group.FlxGroup;
import Registry;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup;

	class HUD extends FlxGroup
	{
		private var panel:FlxSprite;
		private var healthBar:FlxBar;
		private var score:FlxBitmapFont;
		private var lives:FlxBitmapFont;
		
		public var liveUpdate:Bool;

		public function new() 
		{
			super();

			
			panel = new FlxSprite(0, 0, 'assets/gfx/hud.png');
			FlxSpriteUtil.screenCenter(panel, true, false);


			score = new FlxBitmapFont('assets/gfx/digits_font_ilkke.png', 7, 6, "0123456789", 10, 1);
			score.setText("", false, 1, 0, FlxBitmapFont.ALIGN_CENTER);
			score.x = panel.x + 11;
			score.y = 12;

			lives = new FlxBitmapFont('assets/gfx/digits_font_ilkke.png', 7, 6, "0123456789", 10, 1);
			lives.setText(Std.string(Registry.player.lives), false);
			lives.x = panel.x + 119;
			lives.y = 12;
			
			//	We create a Health Bar - if you look carefully at the colours, what we make is a totally black bar that acts as a "mask" over the hud image
			healthBar = new FlxBar(59, 6, 1, 100, 10, Registry.player,'health');
			healthBar.createFilledBar(0xff000000, 0x00000000);
			healthBar.x = panel.x + 124;
			healthBar.y = 10;

			liveUpdate = true;

			add(panel);
			add(score);
			add(lives);
			add(healthBar);

			var scrollFactor = new FlxPoint(0, 0);
			this.setAll("scrollFactor",scrollFactor);

//			panel.scrollFactor.x=0;
//			panel.scrollFactor.y=0;
//
//            score.scrollFactor.x=0;
//            score.scrollFactor.y=0;

			//this.setAll("scrollFactor.x",0);
			//this.setAll("scrollFactor.y",0);

		}
		
		override public function update():Void
		{
			super.update();
			
			//	We set liveUpdate to "false" when we switch to the Game Over state, so it no longer polls objects that have been nulled
			if (liveUpdate)
			{
				score.text = Std.string( Registry.score );
				lives.text = Std.string (Registry.player.lives);
			}
		}
		
		override public function destroy():Void
		{
			trace("HUD nuked");
		}
		
	}

