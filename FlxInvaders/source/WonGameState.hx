package;

import org.flixel.plugin.photonstorm.FlxDisplay;
import org.flixel.FlxButton;
import org.flixel.FlxG;
import org.flixel.FlxGroup;
import org.flixel.FlxObject;
import org.flixel.FlxSprite;
import org.flixel.FlxState;
import org.flixel.FlxText;

class WonGameState extends FlxState
{
	public var title:FlxText;
	public var startButton:FlxButton;
	public var resultText:String;
	public var t:FlxText;

	public function new ():Void {
		super();
	}

	override public function create():Void
	{
		//Create the text object to the width of the stage and align it centre
		t = new FlxText(4, 4, FlxG.width - 8, " ");
		t.alignment = "center";
		t.text = "You were victorious!";
		add(t);
		
		//Create the start button with the handler for clicking
		startButton = new FlxButton(0,100,"Play Again?",onStartClick);
		//Align the button to the centre of the stage
		FlxDisplay.screenCenter(startButton);
		add(startButton);
		
        #if desktop
		FlxG.mouse.show();
        #end
	}

	//The handler for the start button
	private function onStartClick ():Void {
		//Tell Flixel to change the active game state to the actual game
		FlxG.switchState (new PlayState());
	}

}