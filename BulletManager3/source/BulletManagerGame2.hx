package;

import flash.Lib;
import flixel.FlxGame;
	
class BulletManagerGame2 extends FlxGame
{
	public function new()
	{
        //get the current runtime stage dimensions
		var stageWidth:Int = Std.int(Lib.current.stage.stageWidth/2);
		var stageHeight:Int = Std.int(Lib.current.stage.stageHeight/2);
        
        //initialise the game and set the game state PlayState
		super(stageWidth, stageHeight, PlayState, 2, 120, 60);
	}
}
