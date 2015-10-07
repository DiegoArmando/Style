package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.group.FlxGroup;
import flixel.FlxSprite;

/**
 * ...
 * @author Andrew Dunetz
 */

 /*
  * TODO (Andrew) :  
  * X - Make Outfit Switch System
  * Make Outfit Switch Interface
  * Rewrite Object Activation Code
  */
  
class Player extends FlxGroup
{
	public static inline var RUN_SPEED_SEC:Int = 64*3;
	public var x: Float = 0;
	public var y: Float = 0;
	
	private var OutfitIndex : Int = 1;
	
	private var TorsoArray : Array<FlxSprite>;
	private var TorsoSprite : FlxSprite;
	private var TorsoYOffset : Float;
	
	private var LegsArray : Array<FlxSprite>;
	private var LegsSprite: FlxSprite;
	private var LegsYOffset : Float;
	
	private var HeadArray : Array <FlxSprite>;
	private var HeadSprite: FlxSprite;
	private var HeadYOffset : Float;
	
	public function new( InX : Float, InY : Float) 
	{
		super( );
		
		x = InX;
		y = InY;
		
		LegsYOffset  = -64;
		TorsoYOffset = -64*2;
		HeadYOffset  = -64 * 3 + 64*.25;
		
		TorsoArray = [];
		LegsArray = [];
		HeadArray = [];
		
		AddOutfit( "assets/images/sprite_sheets/DemoRobot.png");     /// OUTFIT 0 - TEST ROBOT
		AddOutfit( "assets/images/sprite_sheets/minion_bot.png");  /// OUTFIT 1 - MINION BOT
		
		TorsoArray[OutfitIndex].revive();
		LegsArray[OutfitIndex].revive();
		HeadArray[OutfitIndex].revive();
		
		HeadSprite = HeadArray[OutfitIndex];
		TorsoSprite = TorsoArray[OutfitIndex];
		LegsSprite = LegsArray[OutfitIndex];
	}
	
	override public function update()
	{
		var IsRunning : Bool = false;
		
		var xOffset : Float = 0;
		var yOffset : Float = 0;
		
		if (FlxG.keys.anyPressed(["right","d"]))
		{
			xOffset += 1;
			IsRunning = true;
		}
		if (FlxG.keys.anyPressed(["left","a"]))
		{
			xOffset += -1;
			IsRunning = true;
		}
		if (FlxG.keys.anyPressed(["up","w"]))
		{
			yOffset += -1;
			IsRunning = true;
		}
		if (FlxG.keys.anyPressed(["down","s"]))
		{
			yOffset += 1;
			IsRunning = true;
		}
		
		/// Scale xOffset and yOffset
		{
			var Calc : Float = (xOffset * xOffset) + (yOffset * yOffset);
			var Magnitude : Float = Math.sqrt(Calc);
			if (Magnitude != 0)
			{
				xOffset = xOffset / Magnitude;
				yOffset /= Magnitude;
				
				xOffset *= (RUN_SPEED_SEC * FlxG.elapsed);
				yOffset *= (RUN_SPEED_SEC * FlxG.elapsed);
				
				x += xOffset;
				y += yOffset;
			}
		}
		
		if (IsRunning)
		{
			LegsSprite.animation.play("Walk");
		}
		else
		{
			LegsSprite.animation.play("Still");
		}
		
		/// Update the position of all the component sprites
		{
			if ( LegsSprite.animation.name == "Walk")
			{
				/// Offset our x just a little bit in either direction as we walk.
				var Side : Int = LegsSprite.animation.frameIndex;
				var nX : Float;
				if (Side == 3)
				{ nX = x - 8; }
				else if (Side == 5)
				{ nX = x + 8; }
				else
				{ nX = x;     }
				TorsoSprite.x = nX;
				HeadSprite.x  = nX;
				LegsSprite.x  = nX;
				
				/// Offset our y position just a little bit as we walk.
				var nY : Float;
				if ((Side % 2) == 0)
				{ nY = y;     }
				else
				{ nY = y - 8; }
				HeadSprite.y = nY + HeadYOffset;
				TorsoSprite.y = nY + TorsoYOffset;
				LegsSprite.y = nY + LegsYOffset;
			}
		}
		super.update();
	}
	
	public function AddOutfit( Path : String)
	{
		/// Outfit A
		var nTorsoSprite = new FlxSprite( x, y + TorsoYOffset);
		nTorsoSprite.loadGraphic(Path,true,64,64);
		nTorsoSprite.animation.add("Still", [1], 0, false);
		nTorsoSprite.animation.play("Still");
		TorsoArray.push(nTorsoSprite);
		add( nTorsoSprite);
		nTorsoSprite.kill();
		
		var nLegsSprite = new FlxSprite( x, y + LegsYOffset);
		nLegsSprite.loadGraphic(Path,true,64,64);
		nLegsSprite.animation.add("Walk", [2,3,4,5], 8, true);
		nLegsSprite.animation.add("Still", [2]);
		nLegsSprite.animation.play("Still");
		LegsArray.push(nLegsSprite);
		add( nLegsSprite);
		nLegsSprite.kill();
		
		var nHeadSprite = new FlxSprite( x, y + HeadYOffset);
		nHeadSprite.loadGraphic(Path,true,64,64);
		nHeadSprite.animation.add("Still", [0], 0, false);
		nHeadSprite.animation.play("Still");
		HeadArray.push(nHeadSprite);
		add( nHeadSprite);
		nHeadSprite.kill();
	}
}