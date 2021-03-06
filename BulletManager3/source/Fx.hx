package;

import flixel.util.FlxColor;
import flixel.effects.particles.FlxParticle;
import haxe.Timer;
import flixel.effects.particles.FlxEmitter;
import flixel.group.FlxGroup;
import flixel.FlxSprite;

class Fx extends FlxGroup
{
    private var pixels:FlxGroup;
    private var jet:FlxEmitter;

    public function new()
    {
        super();

       pixels = new FlxGroup();

        //	Here we create an FlxGroup containing 40 FlxEmitters, all the same, used when the aliens are shot/explode        
        var poolSize = 100;
        var i = 0;
        while (i < poolSize) {
            var particleCount = 10;
            
            var tempPixel = new FlxEmitter(10,10,particleCount);
            tempPixel.setXSpeed( -50, 50);
            tempPixel.setYSpeed( -50, 50);
            tempPixel.setRotation(0, 0);
            
            var p = 0;
            while (p < particleCount) {
                var whitePixel = new FlxParticle();
                whitePixel.makeGraphic(2, 2);
				whitePixel.alpha = Math.random();
	            whitePixel.scrollFactor.x=0;
	            whitePixel.scrollFactor.y=0;
                tempPixel.add(whitePixel);
                
                p++;
            }
            
            pixels.add(tempPixel);

            i++;
        }

	    var particleSize=80;
        //	Jet thrusters for trailing behind the ship
        //jet = new FlxEmitter();
        jet = new FlxEmitter(0,0,particleSize);
        jet.setSize(8, 8);
        jet.gravity = 300;
        jet.setXSpeed( - 30, 30);
        jet.setYSpeed(80, 120);
        jet.setRotation(0, 0);


	    var p = 0;
	    while (p < particleSize)
	    {
		    var whitePixel = new FlxParticle();
		    whitePixel.makeGraphic(2, 2, FlxColor.LIME);
		    whitePixel.alpha = Math.random();
		    whitePixel.scrollFactor.x=0;
		    whitePixel.scrollFactor.y=0;
		    jet.add(whitePixel);

		    p++;
	    }
        //jet.makeParticles(Jets, particleSize, 0, true, 0);
        jet.start(false);

        add(pixels);
        add(jet);
    
    }

    override public function update():Void
    {
        super.update();

//      We can't use jet.at(Registry.player) because we need to offset the x/y a little to make
//      it look like the jets are coming from the bottom middle of the ship
        jet.x = Registry.player.x + 4;
        jet.y = Registry.player.y + 12;
    }

    public function explodeBlock(ax:Int, ay:Int):Void
    {
		var pixel = pixels.getFirstAvailable();
		
		if (pixel != null) {
			//the cast here tells Haxe what type of object we are using so we can call start()
			var pixel = cast(pixels.getFirstAvailable(FlxEmitter),FlxEmitter);
				pixel.x = ax;
				pixel.y = ay;
				pixel.start(true,2);
		}
        
    }

	public function flashEffect( object:FlxSprite, color:Int = 0xff00ffff ):Void
	{
		var flashObject = cast(object, FlxSprite);
		flashObject.color = color;



		haxe.Timer.delay(restoreColor.bind(flashObject), 10);
	}

	private function restoreColor( object:FlxSprite ):Void
	{
		object.color = 0xffffffff;
	}

}

