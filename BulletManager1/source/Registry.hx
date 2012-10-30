package ;

import org.flixel.FlxG;
import org.flixel.plugin.photonstorm.fx.StarfieldFX;

class Registry
{
    public static var stars:StarfieldFX;
    public static var player:Player;
    public static var bullets:BulletManager;

    //Setup the Registry Objects
    public static function init()
    {
        //create the Starfield BG and set the star direction up
        stars = new StarfieldFX();
        stars.create(0,0,FlxG.width,FlxG.height,300,1,20);
        stars.setStarSpeed ( 0, 1 );
        
        //create the player ship
        player = new Player();
        
        //create the Bullet manager with a default of 40 bullets
        bullets = new BulletManager();
        //if you want more bullets available for the quadshot just insert your desired amount like so;
        //bullets = new BulletManager(100);

    }

}

