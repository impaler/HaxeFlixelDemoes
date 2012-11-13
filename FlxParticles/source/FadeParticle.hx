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
		loadGraphic( Graphics  );
		
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
		exists = true;
		visible = true;
		this.alpha = .4;
	}


}
