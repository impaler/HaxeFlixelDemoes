package ;

import org.flixel.FlxGroup;

class BulletManager extends FlxGroup
{

    public function new(poolSize:Int = 40)
    {
        super();

        //	Create only a limited poolSize amount of Bullets so we can reuse them
        var i = 0;
        while (i < poolSize) {
            var bullet = new Bullet();
            add(bullet);
            i++;
        }

    }

    // This lets us have a usefull method to FIRE and only use bullets in the poolSize
    public function fire(bx:Int, by:Int):Void
    {
        if (getFirstAvailable() != null)
        {
            var bullet = cast ( getFirstAvailable(), Bullet );
            bullet.fire(bx, by);
        }
    }

}

