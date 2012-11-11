package;

import org.flixel.FlxParticle;
import org.flixel.FlxSprite;
import nme.display.BlendMode;
import org.flixel.FlxLayer;
import org.flixel.system.input.Touch;
import addons.FlxEmitterExt;
import org.flixel.FlxEmitter;
import org.flixel.FlxG;
import org.flixel.FlxGroup;
import org.flixel.FlxState;
import org.flixel.FlxText;
import org.flixel.FlxTimer;

class TestState extends FlxState
{

	private var _infobox:FlxGroup;
	private var _infoText:FlxText;

	private var _emitters:FlxGroup;
	private var _emittersOld:FlxGroup;

	public function new( )
	{
		super( );
	}

	override public function create( ):Void
	{
		#if !neko
		FlxG.bgColor = 0xFF333333;
		#else
		FlxG.bgColor = {rgb: 0x333333, a: 0xFF};
		#end

		#if (desktop || flash) 
		FlxG.mouse.show( );
		#end

		//add info box
		_infobox = new FlxGroup();
		_infobox.add( new FlxText(0, 0, 300, "[H] toggle this information") );
		_infobox.add( new FlxText(0, 10, 300, "[G] to toggle gravity") );
		_infobox.add( new FlxText(0, 20, 300, "[CLICK] to spawn explosion") );
		_infobox.add( new FlxText(0, 30, 300, "[SPACE] to toggle emitter type") );
		add( _infobox );

		_emitters = new FlxGroup();

		var poolSize = 20;
		var i = 0;
		while ( i < poolSize ) {
			var particleCount = 10;

			var tempPixel = new FlxEmitterExt();
			tempPixel.setRotation( 0, 0 );
			tempPixel.setMotion( 0, 2, 2.2, 360, 100 );
//			tempPixel.makeParticles( "assets/particles.png", 220, 0, true, 0 );
			
			var paritcleSize = 200;
			while ( i < paritcleSize ) {
				tempPixel.add( new FadeParticle() );
				i++;
			}
			
			_emitters.add( tempPixel );
			i++;
		}

		add( _emitters );

		var Emitters = new FlxLayer ("ext");
		add( _emitters );
		Emitters.add( _emitters );
		Emitters.blend = BlendMode.ADD;
		addLayer( Emitters );

		_emittersOld = new FlxGroup();

		var poolSize = 20;
		var i = 0;
		while ( i < poolSize ) {
			var particleCount = 10;

			var tempPixel = new FlxEmitter();
			tempPixel.setRotation( 0, 0 );
//			tempPixel.makeParticles( "assets/particles.png", 220, 0, true, 0 );
			
			var paritcleSize = 200;
			while ( i < paritcleSize ) {
				tempPixel.add( new FadeParticle() );
				i++;
			}
			
			_emittersOld.add( tempPixel );
			i++;
		}

		var oldEmitters = new FlxLayer ("old");
		add( _emittersOld );
		oldEmitters.add( _emittersOld );
		addLayer( oldEmitters );
		_emittersOld.visible = false;

		//add top text
		_infoText = new FlxText (0, FlxG.height - 20, FlxG.width);
		_infoText.alignment = "center";
		add( _infoText );

		//add a constant explosion spawner
		FlxTimer.manager.add( new FlxTimer().start( 4, 0, onTimer ) );
	}

	private function onTimer( timer:FlxTimer ):Void
	{
		explode( FlxG.width / 2, FlxG.height / 2 );
	}

	public var touches:Array<Touch>;

	override public function update( ):Void
	{
		super.update( );

		//This is just to make the info text fade out
		if ( _infoText.alpha > 0 )
		{
			_infoText.alpha -= 0.01;
		}

		//spawn explosion
		#if (desktop || flash)
        
		if ( FlxG.mouse.justPressed( ) )
	{
		explode( FlxG.mouse.x, FlxG.mouse.y );
	}

		#elseif mobile
        
        touches = FlxG.touchManager.touches;
		for ( touch in touches )
		{
			if ( touch.justPressed( ) == true )
			{
				explode( touch.x, touch.y );
			}
		}

		#end

		//toggle infobox
		if ( FlxG.keys.justPressed( "H" ) )
		{
			_infobox.visible = !_infobox.visible;
		}

		//todo toggle gravity
		//		if (FlxG.keys.justPressed("G")) {
		//			if(_explosion.gravity == 0){
		//				_explosion.gravity = 400;
		//				_explosionOld.gravity = 400;
		//			}
		//			else
		//			{
		//				_explosion.gravity = 0;
		//				_explosionOld.gravity = 0;
		//			}
		//		}
		//					
		
		//toggle emitter type
		if ( FlxG.keys.justPressed( "SPACE" ) )
		{
			_emitters.visible = !_emitters.visible;
			_emittersOld.visible = !_emittersOld.visible;

			_infoText.alpha = 1;
			if ( _emitters.visible )
			{
				_infoText.text = "New Emitter Style (FlxEmitterExt)";
			}
			else
			{
				_infoText.text = "Old Emitter Style (FlxEmitter)";
			}
		}
	}

	private function explode( x:Float = 0, y:Float = 0 ):Void
	{

		if ( _emitters.visible )
		{
			var emit = _emitters.getFirstAvailable( FlxEmitterExt );
			
			if ( emit != null ) {

				var pixel = cast(emit, FlxEmitterExt);

				if ( pixel != null )
				{
					pixel.x = x;
					pixel.y = y;
					pixel.start( true, 2 );
				}

			}
			
		}
		else
		{
			var emit = _emittersOld.getFirstAvailable( FlxEmitter );

			if ( emit != null ) {

				var pixel = cast(emit, FlxEmitter);

				if ( pixel != null )
				{
					pixel.x = x;
					pixel.y = y;
					pixel.start( true, 2 );
				}

			}
		}


	}

}

