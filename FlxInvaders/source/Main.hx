package;

import org.flixel.FlxG;
import nme.display.Sprite;
import nme.Lib;

import org.flixel.FlxGame;

/**
 * @author Joshua Granick
 */
class Main extends Sprite 
{
	
	public function new () 
	{
		super();
		
		var demo:FlxGame = new FlxInvaders();
		addChild(demo);
	}
	
	public static function main() {
		
		Lib.current.addChild(new Main());
   
	}
	
}