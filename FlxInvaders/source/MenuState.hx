package;

import org.flixel.plugin.photonstorm.FlxDisplay;
import org.flixel.FlxG;
import org.flixel.FlxButton;
import org.flixel.FlxText;
import org.flixel.FlxState;

class MenuState extends FlxState
{
	public var title:FlxText;
	public var startButton:FlxButton;

	public function new( )
	{
		super( );
		FlxG.mouse.show( );
	}

	override public function create( ):Void
	{
		//Create the welcome text
		var welcomeText = "Welcome to FlxInvaders";
		//Create the text object to the width of the stage and align it centre
		var t:FlxText = new FlxText(4, 4, FlxG.width - 8, welcomeText);
		t.alignment = "center";
		add( t );

		//Create the start button with the handler for clicking
		startButton = new FlxButton(0, 0, "Start", onStartClick);
		startButton.y = 140;
		//Align the button to the centre of the stage
		FlxDisplay.screenCenter( startButton );
		add( startButton );
	}

	//The handler for the start button
	private function onStartClick( ):Void
	{
		//Tell Flixel to change the active game state to the actual game
		FlxG.switchState( new PlayState( ) );
	}

}