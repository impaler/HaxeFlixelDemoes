package;

import org.flixel.FlxSprite;
import org.flixel.plugin.photonstorm.FlxSpecialFX;
import org.flixel.FlxG;
import org.flixel.plugin.photonstorm.fx.StarfieldFX;

class Registry
{
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

        if (FlxG.getPlugin(FlxSpecialFX) == null)
        {
            FlxG.addPlugin(new FlxSpecialFX());
        }
        
        var starfield = FlxSpecialFX.starfield();
        
        stars = starfield.create(0, 0, FlxG.width,FlxG.height, 300);
        starfield.setStarSpeed ( 0, 1 );
    
		background = new ScrollingBackground();
		
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

