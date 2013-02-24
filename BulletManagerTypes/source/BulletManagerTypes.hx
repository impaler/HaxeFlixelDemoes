package;

import nme.Lib;
import org.flixel.FlxGame;
	
class BulletManagerTypes extends FlxGame
{
	public function new()
	{
        //get the current runtime stage dimensions and half them as we are scaling the screen x2
		var stageWidth:Int = Std.int(Lib.current.stage.stageWidth/2);
		var stageHeight:Int = Std.int(Lib.current.stage.stageHeight/2);
        
        //initialise the game and set the game state PlayState, x2 scale,  run at 60 fps
		super(stageWidth, stageHeight, PlayState, 2, 60, 60);
	}
}
