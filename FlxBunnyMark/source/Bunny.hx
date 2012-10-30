package ;
import org.flixel.FlxSprite;

/**
 * ...
 * @author Zaphod
 */

class Bunny extends FlxSprite
{
	
	public function new(gravity:Float = 0,x:Float=0,y:Float=0) 
	{
		super(x,y);
		
        //cache the rotated graphics to optimise flash software rendering
		#if flash
		loadRotatedGraphic("assets/wabbit_alpha.png", 16, -1, false, true);
		#else
		loadGraphic("assets/wabbit_alpha.png");
		#end
		velocity.x = 50 * (Math.random() * 5) * (Math.random() < 0.5 ? 1 : -1);
		velocity.y = 50 * ((Math.random() * 5) - 2.5) * (Math.random() < 0.5 ? 1 : -1);
		
		acceleration.y = gravity;
		
		angle = 15 - Math.random() * 30;
		angularVelocity = 30 * (Math.random() * 5) * (Math.random() < 0.5 ? 1 : -1);

		//bottleneck for flash software rendering
		#if !flash
		scale.x = scale.y = 0.3 + Math.random();
		#end
	}
	
	override public function update():Void 
	{
		super.update();
		
		//bottleneck for flash software rendering
		#if !flash
		alpha = 0.3 + 0.7 * y / BunnyMarkState.maxY;
		#end
		
		if (x > BunnyMarkState.maxX)
		{
			velocity.x *= -1;
			x = BunnyMarkState.maxX;
		}
		else if (x < BunnyMarkState.minX)
		{
			velocity.x *= -1;
			x = BunnyMarkState.minX;
		}
		if (y > BunnyMarkState.maxY)
		{
			velocity.y *= -0.8;
			y = BunnyMarkState.maxY;
			if (Math.random() > 0.5) velocity.y -= 3 + Math.random() * 4;
		}
		else if (y < BunnyMarkState.minY)
		{
			velocity.y *= -0.8;
			y = BunnyMarkState.minY;
		}
	}
	
}