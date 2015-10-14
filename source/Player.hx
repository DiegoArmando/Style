package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.group.FlxSpriteGroup;
import flixel.FlxSprite;

/**
 * ...
 * @author Andrew Dunetz
 */

 /*
  * TODO (Andrew) :  
  */
class Player extends FlxSpriteGroup
{
	public static inline var RUN_SPEED_SEC:Int = 64 * 3;
	
	public var referenceSprite: FlxObject;
	static public var thing : Int = 0;
	
	public var Parent : Dynamic;
	
	public var AllowMovement : Bool = true;
	
	private var LegsIndex : Int = 0;
	private var TorsoIndex : Int = 0;
	private var HeadsIndex : Int = 0;
	
	private var TorsoArray : Array<FlxSprite>;
	public var TorsoSprite : FlxSprite;
	public var TorsoYOffset : Float;
	
	private var LegsArray : Array<FlxSprite>;
	public var LegsSprite: FlxSprite;
	public var LegsYOffset : Float;
	
	private var HeadArray : Array <FlxSprite>;
	public var HeadSprite: FlxSprite;
	public var HeadYOffset : Float;
	
	public function new( InX : Float, InY : Float, InParent : Dynamic) 
	{
		super( );
		
		Parent = InParent;
		
		x = InX;
		y = InY;
		
		LegsYOffset  = -64;
		TorsoYOffset = -64*2;
		HeadYOffset  = -64 * 3 + 64*.25;
		
		TorsoArray = [];
		LegsArray = [];
		HeadArray = [];
		
		AddOutfit( "assets/images/sprite_sheets/default.png");     	    /// OUTFIT 0
		AddOutfit( "assets/images/sprite_sheets/minion_bot.png"); 	    /// OUTFIT 1
		AddOutfit( "assets/images/sprite_sheets/android.png");  	    /// OUTFIT 2
		AddOutfit( "assets/images/sprite_sheets/baymax.png");           /// OUTFIT 3
		AddOutfit( "assets/images/sprite_sheets/kirisame_marisa.png");  /// OUTFIT 4
		AddOutfit( "assets/images/sprite_sheets/mondrian.png");  		/// OUTFIT 5
		AddOutfit( "assets/images/sprite_sheets/mummy.png");  			/// OUTFIT 6
		AddOutfit( "assets/images/sprite_sheets/octobot.png");  		/// OUTFIT 7
		
		TorsoArray[TorsoIndex].revive();
		LegsArray[LegsIndex].revive();
		HeadArray[HeadsIndex].revive();
		
		HeadSprite = HeadArray[HeadsIndex];
		TorsoSprite = TorsoArray[TorsoIndex];
		LegsSprite = LegsArray[LegsIndex];
		
		referenceSprite = new FlxObject();
	}
	
	override public function update()
	{
		
		//trace("Position: " + x + ", " + y);
		var IsRunning : Bool = false;
		
		var xOffset : Float = 0;
		var yOffset : Float = 0;
		
		if (AllowMovement)
		{
			if (FlxG.keys.anyPressed(["right","d"]))
			{
				xOffset += 1;
				HeadSprite.scale.x = -1;
				TorsoSprite.scale.x = -1;
				LegsSprite.scale.x = -1;
				IsRunning = true;
			}
			if (FlxG.keys.anyPressed(["left","a"]))
			{
				xOffset -= 1;
				HeadSprite.scale.x = 1;
				TorsoSprite.scale.x = 1;
				LegsSprite.scale.x = 1;
				IsRunning = true;
			}
			if (FlxG.keys.anyPressed(["up","w"]))
			{
				yOffset -= 1;
				IsRunning = true;
			}
			if (FlxG.keys.anyPressed(["down","s"]))
			{
				yOffset += 1;
				IsRunning = true;
			}
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
			}
		}
		
		// Check for collisions on the tile map and prevent movement when there is one.
		{
			var TileSize = 64;
			
			var TileXOffset : Int = 1;
			if (xOffset <= 0) { TileXOffset = 0; }
			
			var TileYOffset : Int = 1;
			if (yOffset <= 0) { TileYOffset = 0; }
			
			// Check for Collisions in the x direction
		    {
				var currentTileX : Int = Math.floor (x / TileSize);
				var currentTileY : Int = Math.floor (y / TileSize);
				
				var nextTileX : Int;
				if (xOffset > 0) { nextTileX = Math.floor ( (x + 32 + xOffset) / TileSize); }
				else { nextTileX = Math.floor ( (x + (-32) + xOffset) / TileSize); }
				
				var nextTileY : Int;
				if (yOffset > 0) { nextTileY = Math.floor ( (y + 32 + yOffset) / TileSize); }
				else { nextTileY = Math.floor ( (y + (-32) + yOffset) / TileSize); }
				
				if (currentTileX != nextTileX)
				{
					if (Parent.levelTiles.getTile(nextTileX, currentTileY) == 1)
					{
						x += xOffset;
					}
				}
				else
				{
					x += xOffset;
				}
				
				if (currentTileY != nextTileY)
				{
					if (Parent.levelTiles.getTile(currentTileX, nextTileY) == 1)
					{
						y += yOffset;
					}
				}
				else
				{
					y += yOffset;
				}
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
			referenceSprite.x = x;
			referenceSprite.y = y;
			if ( LegsSprite.animation.name == "Walk")
			{
				/// Offset our x just a little bit in either direction as we walk.
				var Side : Int = LegsSprite.animation.frameIndex;
				var nX : Float;
				if (Side == 3)
				{ nX = x - 8 - 32; }
				else if (Side == 5)
				{ nX = x + 8 - 32; }
				else
				{ nX = x - 32;     }
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
			else 
			{
				TorsoSprite.x = x - 32;
				HeadSprite.x  = x - 32;
				LegsSprite.x  = x - 32;
				HeadSprite.y = y + HeadYOffset;
				TorsoSprite.y = y + TorsoYOffset;
				LegsSprite.y = y + LegsYOffset;
			}
		}
		super.update();
	}
	
	public function SwitchOutfit( PartType : Int, NewPartIndex : Int) : Int
	{
		/*
		 * PARTTYPE VALUES:
		 * 	0 : Legs
		 *  1 : Torso
		 *  2 : Head
		 */
		
		var INVALID_PARTTYPE  : Int = 0;
		var INVALID_OUTFIT    : Int = 1;
		var ALREADY_WEARING   : Int = 2;
		var SUCCESSFUL_SWITCH : Int = 3;
		 
		/// Validate that the switch is actually possible.
		if (PartType < 0 || PartType > 2)
		{ return INVALID_PARTTYPE; }
		if (NewPartIndex < 0 || NewPartIndex >= TorsoArray.length)
		{ return INVALID_OUTFIT; }
	    
		/// Perform the switch
		if (PartType == 0)
		{
			if (NewPartIndex == LegsIndex)
			{ return ALREADY_WEARING; }
			trace ("PartIndex: "+NewPartIndex);
			LegsSprite.kill();
			LegsArray[NewPartIndex].revive();
			LegsSprite = LegsArray[NewPartIndex];
			LegsSprite.x = x; LegsSprite.y = y + LegsYOffset;
		}
		else if (PartType == 1)
		{
			if (NewPartIndex == TorsoIndex)
			{ return ALREADY_WEARING; }
			TorsoSprite.kill();
			TorsoArray[NewPartIndex].revive();
			TorsoSprite = TorsoArray[NewPartIndex];
			TorsoSprite.x = x; TorsoSprite.y = y + TorsoYOffset;
		}
		else if (PartType == 2)
		{
			if (NewPartIndex == HeadsIndex)
			{ return ALREADY_WEARING; }
			HeadSprite.kill();
			HeadArray[NewPartIndex].revive();
			HeadSprite = HeadArray[NewPartIndex];
			HeadSprite.x = x; HeadSprite.y = y + HeadYOffset;
		}
		
		return SUCCESSFUL_SWITCH;
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