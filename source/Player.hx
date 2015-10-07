package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.group.FlxGroup;
import flixel.FlxSprite;

/**
 * ...
 * @author Andrew Dunetz
 */

 enum Outfits
{
	OutfitA;
	OutfitB;
}

class Player extends FlxGroup
{
	
	public static inline var RUN_SPEED_SEC:Int = 64*3;
	public var x: Float = 0;
	public var y: Float = 0;
	
	private var Torso: FlxSprite;
	private var TorsoYOffset : Float;
	private var Legs: FlxSprite;
	private var LegsYOffset : Float;
	private var Head: FlxSprite;
	private var HeadYOffset : Float;
	
	private var Torsos : Array<FlxSprite>;
	private var LegsArray : Array<FlxSprite>;
	private var Heads : Array<FlxSprite>;
	
	public function new( InX : Float, InY : Float) 
	{
		super( );
		
		x = InX;
		y = InY;
		
		LegsYOffset  = -64;
		TorsoYOffset = -64*2+32;
		HeadYOffset  = -64 * 2;
		
		{
			Torsos = [];
			LegsArray = [];
			Heads = [];
			
			/// Outfit A
			var Torso = new FlxSprite( InX, InY + TorsoYOffset);
			Torso.loadGraphic("assets/images/DemoRobot.png",true,64,64);
			Torso.animation.add("Still", [1], 0, false);
			Torso.animation.play("Still");
			Torsos.push(Torso);
			add( Torso);
			
			Legs = new FlxSprite( InX, InY + LegsYOffset);
			Legs.loadGraphic("assets/images/DemoRobot.png",true,64,64);
			Legs.animation.add("Walk", [2,3,4,5], 8, true);
			Legs.animation.add("Still", [2]);
			Legs.animation.play("Still");
			LegsArray.push(Legs);
			add( Legs);
			
			var Head = new FlxSprite( InX, InY + HeadYOffset);
			Head.loadGraphic("assets/images/DemoRobot.png",true,64,64);
			Head.animation.add("Still", [0], 0, false);
			Head.animation.play("Still");
			Heads.push( Head);
			add( Head);
		}
		
		Head = Heads[0];
		Torso = Torsos[0];
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
			Legs.animation.play("Walk");
		}
		else
		{
			Legs.animation.play("Still");
		}
		
		/// Update the position of all the component sprites
		{
			if ( Legs.animation.name == "Walk")
			{
				/// Offset our x just a little bit in either direction as we walk.
				var Side : Int = Legs.animation.frameIndex;
				var nX : Float;
				if (Side == 3)
				{ nX = x - 8; }
				else if (Side == 5)
				{ nX = x + 8; }
				else
				{ nX = x;     }
				Torso.x = nX;
				Head.x  = nX;
				Legs.x  = nX;
				
				/// Offset our y position just a little bit as we walk.
				var nY : Float;
				if ((Side % 2) == 0)
				{ nY = y;     }
				else
				{ nY = y - 8; }
				Head.y = nY + HeadYOffset;
				Torso.y = nY + TorsoYOffset;
				Legs.y = nY + LegsYOffset;
			}
		}
		super.update();
	}
}