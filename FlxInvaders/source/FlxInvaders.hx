package;
import org.flixel.FlxCamera;
import nme.events.Event;
import nme.Lib;
import org.flixel.FlxG;
import org.flixel.FlxGame;

class FlxInvaders extends FlxGame
{
	public function new()
	{
		super(320, 240, MenuState, 2,60,60); //Create a new FlxGame object at 320x240 with 2x pixels, 
    
		// then load PlayState
		#if !neko
		FlxG.bgColor = 0x000000;
		#else
		FlxG.bgColor = {rgb: 0x000000, a: 0xff};
		#end
		forceDebugger = true;
        
		//Here we are just displaying the cursor to encourage people to click the game,
		// which will give Flash the browser focus and let the keyboard work.
		//Normally we would do this in say the main menu state or something,
		// but FlxInvaders has no menu :P
        #if desktop
		FlxG.mouse.show();
        #end
        }


}