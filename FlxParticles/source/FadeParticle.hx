package ;

import org.flixel.FlxG;
import org.flixel.FlxSprite;
import org.flixel.plugin.photonstorm.FlxColor;
import org.flixel.FlxParticle;

class FadeParticle extends FlxParticle
{
  public function new() 
  {
	  super();
	  
		var Graphics = "assets/jets.png";
		var totalFrames:Int = 1;
		var randomFrame:Int;
			  
		var sprite:FlxSprite = new FlxSprite();
		sprite.loadGraphic(Graphics, true);
		totalFrames = sprite.frames;
		sprite.destroy();
			  
		randomFrame = Math.floor(FlxG.random() * totalFrames); 
			  
		loadGraphic(Graphics, true,false,0,0,true);
		frame = randomFrame;
		
		this.alpha = .4;
		exists = false;

  }
  override public function update():Void 
  {
	 if(alpha > 0)
		this.alpha -= .01;
	 super.update();
  }

	override public function onEmit( ):Void
	{
		this.alpha = .4;
	}


}
