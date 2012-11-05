package;

import org.flixel.FlxG;
import nme.Lib;
import org.flixel.FlxParticle;
import org.flixel.FlxEmitter;
import org.flixel.FlxGroup;

class Fx extends FlxGroup
{
    private var pixels:FlxGroup;
    private var jet:FlxEmitter;

    public function new()
    {
        super();

       pixels = new FlxGroup();

        //	Here we create an FlxGroup containing 40 FlxEmitters, all the same, used when the aliens are shot/explode        
        var poolSize = 40;
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
                tempPixel.add(whitePixel);
                
                p++;
            }
            
            pixels.add(tempPixel);

            i++;
        }

        //	Jet thrusters for trailing behind the ship
        jet = new FlxEmitter();
        jet.setSize(8, 8);
        jet.gravity = 300;
        jet.setXSpeed( - 30, 30);
        jet.setYSpeed(80, 120);
        jet.setRotation(0, 0);
        jet.makeParticles(Jets, 80, 0, true, 0);
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
        var pixel = cast(pixels.getFirstAvailable(FlxEmitter),FlxEmitter);
        
        if (pixel!=null)
        {
            pixel.x = ax;
            pixel.y = ay;
            pixel.start(true,2);
        }
        
    }

}

