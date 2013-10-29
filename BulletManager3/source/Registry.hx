package;

import flixel.addons.plugin.effects.FlxSpecialFX;
import flixel.addons.plugin.effects.fx.StarfieldFX;
import flixel.FlxSprite;
import flixel.FlxG;

class Registry
{
    public static var score:Int=0;
    public static var stars:FlxSprite;
    public static var player:Player;
    
	public static var bullets:BulletManager;
	public static var enemyBullets:EnemyBulletManager;
	
    public static var enemies:EnemyManager;
    public static var fx:Fx;
	public static var hud:HUD;
	
	public static var godmode:Bool = false;
	
	public static var background:ScrollingBackground;

    //Setup the Registry Objects
    public static function init()
    {


        background = new ScrollingBackground();


        FlxG.plugins.add(new FlxSpecialFX());

        var starfield = FlxSpecialFX.starfield();

        stars = starfield.create(0, 0, Std.int(FlxG.width),Std.int(FlxG.width), 1000, 1);
        starfield.setStarSpeed(0, -2);
        stars.scrollFactor.x=0;
        stars.scrollFactor.y=0;

        FlxSpecialFX.startFX();

        //create the player ship
        player = new Player();
        
		enemyBullets = new EnemyBulletManager();
        bullets = new BulletManager(260);
        
        enemies = new EnemyManager();
        fx = new Fx();
		
		hud = new HUD();
		
		godmode = true;

    }

}

