package;

import nme.Lib;
import org.flixel.FlxGame;
	
class BulletManagerGame1 extends FlxGame
{
	public function new()
	{
        //get the current runtime stage dimensions
		var stageWidth:Int = Lib.current.stage.stageWidth;
		var stageHeight:Int = Lib.current.stage.stageHeight;
        
        //initialise the game and set the game state PlayState
		super(stageWidth, stageHeight, PlayState, 1, 60, 60);
        
        //use flixel's handy inbuilt debugger
		forceDebugger = true;
	}
}
