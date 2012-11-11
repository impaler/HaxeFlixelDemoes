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
	  
loadGraphic(Graphics, true);
frame = randomFrame;
	  
	  
	  
	  
	  
	  
//	  var randomFrame:Int;
//	  var totalFrames:Int = 1;
//	  
//		var sprite:FlxSprite = new FlxSprite();
//		sprite.loadGraphic("assets/jets.png", true);
//		totalFrames = sprite.frames;
//		sprite.destroy();
//
//	  randomFrame = Math.floor(FlxG.random() * totalFrames); 
//	  loadGraphic("assets/jets.png", true);
//	  frame = randomFrame;
	  
//	  loadGraphic(,false,false,0,0,true,(Std.string(Math.random)));
//         makeGraphic(4, 4, 0xFF44FF44);
	  this.alpha = .4;
		exists = false;
//	  lifespan = 0;
//			friction = 500;
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
