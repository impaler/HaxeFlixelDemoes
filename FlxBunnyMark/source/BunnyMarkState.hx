package;

import org.flixel.FlxPoint;
import org.flixel.plugin.photonstorm.FlxCollision;
import org.flixel.system.input.Touch;
import nme.installer.Assets;
import flash.ui.Mouse;
import nme.Assets;
import nme.Lib;
import org.flixel.FlxButton;
import org.flixel.FlxCamera;
import org.flixel.FlxG;
import org.flixel.FlxGroup;
import org.flixel.FlxSprite;
import org.flixel.FlxState;
import org.flixel.FlxText;
import org.flixel.FlxTileblock;
import org.flixel.plugin.pxText.FlxBitmapTextField;
import org.flixel.plugin.pxText.PxBitmapFont;
import org.flixel.plugin.pxText.PxTextAlign;

/**
 * ...
 * @author Zaphod
 * 
 * Add bunnies with touch/mouse by Impaler
 * 
 */
class BunnyMarkState extends FlxState
{
	private var numBunnies:Int;
	private var incBunnies:Int;
	
	public static var minX:Int;
	public static var minY:Int;
	public static var maxX:Int;
	public static var maxY:Int;
	
	private var gravity:Float;
	
	private var bunnies:FlxGroup;
	private var bunny:FlxSprite;
	private var pirate:FlxSprite;
	
	private var bg:FlxTileblock;
	private var bgSize:Int;
	
	private var addBunniesBtn:FlxButton;
	private var removeBunniesBtn:FlxButton;
	
	private var bunnyCounter:FlxText;
	private var fpsCounter:FlxText;

	
	private var times:Array<Float>;
    
    private var touches:Array<Touch>;
    
	public function new()
	{
		gravity = 5;
		incBunnies = 100;
		numBunnies = incBunnies;
		
		bgSize = 32;
		
		minX = minY = 0;
		maxX = FlxG.width;
		maxY = FlxG.height;
		
		super();
	}
	
	override public function create():Void 
	{
		#if flash
		FlxG.framerate = 60;
		FlxG.flashFramerate = 60;
		#else
		FlxG.framerate = 60;
		FlxG.flashFramerate = 60;
		#end
		
		var bgWidth:Int = Math.ceil(FlxG.width / bgSize) * bgSize;
		var bgHeight:Int = Math.ceil(FlxG.height / bgSize) * bgSize;
		
		bg = new FlxTileblock(0, 0, bgWidth, bgHeight);
		bg.loadTiles("assets/grass.png");
		
		pirate = new FlxSprite().loadGraphic("assets/pirate.png");

		addBunniesBtn = new FlxButton(FlxG.width - 80 - 20, 20, "Add Bunnies", onAddBunnies);
        
		removeBunniesBtn = new FlxButton(20, 20, "Remove", onRemoveBunnies);

		bunnyCounter = new FlxText(0, 10, FlxG.width, "Bunnies: " + numBunnies);
		bunnyCounter.setFormat(null, 22, 0x000000, "center");
		
		fpsCounter = new FlxText(0, bunnyCounter.y + bunnyCounter.height + 10, FlxG.width, "FPS: " + 30);
		fpsCounter.setFormat(null, 22, 0x000000, "center");
        
        bunnies = new FlxGroup();
        
        touchSprite = new FlxSprite();
        touchSprite.makeGraphic(20, 20);
        touchSprite.color = Std.int(Math.random() * 0xffffff);
        touchSprite.alpha = 0;
        
        add(bg);
        add(bunnies);
        add(bunnyCounter);
        add(pirate);
        add(removeBunniesBtn);
        add(addBunniesBtn);
        addBunnies(numBunnies);
        add(fpsCounter);
        add(touchSprite);
        
        #if !mobile
        FlxG.mouse.show();
        #end
    
        times = [];
	}
    
    private var touchSprite:FlxSprite;
	
	private function addBunnies(numToAdd:Int,x:Float=0,y:Float=0):Void
	{
		for (i in 0...(numToAdd))
		{
			bunny = new Bunny(gravity,x,y);
			bunnies.add(bunny);
		}
        
	}
	
	private function onAddBunnies():Void 
	{
		addBunnies(incBunnies);
		
	}
    
    private function onRemoveBunnies():Void 
  	{
        RemoveBunnies(incBunnies);
  	}
    
    private function RemoveBunnies(numToRemove:Int):Void 
    {
        var thing = bunnies.members;
        if ( bunnies.members!=null ) {
            if ( thing.length >=1 ) 
            {
                for (i in 0...(numToRemove))
                {
                    var bunny = bunnies.getFirstExtant();
                    if ( bunny != null ) {
                        bunnies.remove(bunny,true);
                        bunny.kill();
                        bunny.destroy();
                        bunny = null;
                    }
                }
            }
        }
    }
    
	override public function update():Void 
	{
		super.update();
        
        touches = FlxG.touchManager.touches;
		for (touch in touches)
		{
			if (touch.justPressed() == true )
			{               
                touchSprite.x = touch.x-(touchSprite.width*.5);
			    touchSprite.y = touch.y-(touchSprite.height*.5);
                //only if your not touching the ui
                if (!FlxG.overlap(touchSprite, removeBunniesBtn) && !FlxG.overlap(touchSprite, addBunniesBtn)){
                    addBunnies(incBunnies,touch.x,touch.y);
                }
			}
		}
        
        #if (desktop||flash)
        
        if (FlxG.mouse.justReleased()) {
            touchSprite.x = FlxG.mouse.x-(touchSprite.width*.5);
            touchSprite.y = FlxG.mouse.y-(touchSprite.height*.5);
            if (!FlxG.overlap(touchSprite, removeBunniesBtn) && !FlxG.overlap(touchSprite, addBunniesBtn)){
            addBunnies(incBunnies,FlxG.mouse.x,FlxG.mouse.y);
            }
        }
        
        #end
		
		var t = Lib.getTimer();
		pirate.x = Std.int((FlxG.width - pirate.width) * (0.5 + 0.5 * Math.sin(t / 3000)));
		pirate.y = Std.int(FlxG.height - 1.3 * pirate.height + 70 - 30 * Math.sin(t / 100));
		
		var now:Float = t / 1000;
		times.push(now);
		while(times[0] < now - 1)
		{
			times.shift();
		}
		
		fpsCounter.text = FlxG.width + "x" + FlxG.height + "\nFPS: " + times.length + "/" + Lib.current.stage.frameRate;
        bunnyCounter.text = "Bunnies: " + bunnies.length;
    
	}
	
}