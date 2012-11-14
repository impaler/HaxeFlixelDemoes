package;

import nme.Lib;
import org.flixel.FlxGame;
	
class Mode extends FlxGame
{
	
	public function new()
	{
		var stageWidth:Int = Lib.current.stage.stageWidth;
		var stageHeight:Int = Lib.current.stage.stageHeight;

		super(stageWidth, stageHeight, BunnyMarkState, 1);

		forceDebugger = true;
	}
}
