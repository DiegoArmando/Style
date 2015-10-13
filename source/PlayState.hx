package;

import flixel.FlxG;
import flixel.FlxBasic;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.tile.FlxTilemap;
import openfl.Assets;
import flixel.util.FlxColor;
import flixel.util.FlxSpriteUtil;
import flixel.FlxCamera;
import flixel.util.FlxRandom;
import flixel.FlxSubState;


/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	
	public static var player : Player;
	//public static var menu : MenuState;
	public var interactables : Array<Interactable>;
	
	public var IDNUM : Int;
	
	public var interactableIndex : Int = -1;
	public var selectedInteractable : Int = -1;
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	private static inline var TILE_WIDTH:Int = 64;
	private static inline var TILE_HEIGHT:Int = 64;
	
	var levelTiles:FlxTilemap;
	private var _highlightBox:FlxSprite;
	
	override public function create():Void
	{
		super.create();

		IDNUM = FlxRandom.int();
		//trace("PLayer Position after create: " + player.x + ", " + player.y);
		
		//trace("We are getting into create");
		levelTiles = new FlxTilemap();
		
		//levelTiles.auto = FlxTilemap.OFF;
		
		levelTiles.loadMap(Assets.getText("assets/images/Background3.csv"), "assets/images/TileMap3.png", TILE_WIDTH, TILE_HEIGHT, FlxTilemap.OFF);
		add(levelTiles);
		
		_highlightBox = new FlxSprite(0, 0);
		_highlightBox.makeGraphic(TILE_WIDTH, TILE_HEIGHT, FlxColor.TRANSPARENT);
		FlxSpriteUtil.drawRect(_highlightBox, 0, 0, TILE_WIDTH - 1, TILE_HEIGHT - 1, FlxColor.TRANSPARENT, { thickness: 1, color: FlxColor.RED });
		add(_highlightBox);
		
		/// The list of things in the environment that can be interacted with.
		interactables = [];
		/// Add something to it.
		var Disk : Interactable = new Interactable(FlxG.width/2+64, FlxG.height/2);
		add (Disk);
		interactables.push(Disk);
		
		var testEnemy : NPC = new NPC(FlxG.width / 2 - 200, FlxG.height / 2 - 200, true,"android", this);
		add(testEnemy);
		interactables.push(testEnemy);
		
		var otherEnemy : NPC = new NPC(FlxG.width / 2 - 100, FlxG.height / 2 - 200, true,"mummy", this);
		add(otherEnemy);
		interactables.push(otherEnemy);
		
		// player ini
	
		
		if (player == null)
		{
			player = new Player(FlxG.width / 2, FlxG.height / 2, this);	
			trace("Player information: ");
			trace("Player: " + player);
			trace("X: " + player.x + ", Y: " + player.y);
			trace("Player members: " + player.members);
		}
		else
		{
			trace("Player information: ");
			trace("Player: " + player);
			trace("X: " + player.x + ", Y: " + player.y);
			trace("Player members: " + player.members);
			//player.set_exists(true);
		}

		add( player);

		FlxG.camera.follow(player.referenceSprite, FlxCamera.STYLE_TOPDOWN, 1);
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		//player.update(); 
		
		//trace(player);
		
		var itemIndex : Int = 0;
		var itemSelected : Bool = false;
		var itemsInRange : Int = 0;
		
		
		if (FlxG.keys.anyJustPressed(["tab"]))
		{
			interactableIndex++;
		}
		
		/// Check to see if there are any objects within range that can be activated
		for (item in interactables)
		{
			//trace(itemIndex);
			/// Check if this item is in range.
			if ((item.x > player.x - 96) && (item.x < player.x + 96) &&
			    (item.y > player.y - 128) && (item.y < player.y + 64))
			{
				itemsInRange++;
				if (interactableIndex == -1)
				{
					interactableIndex = itemsInRange;
					selectedInteractable = itemIndex;
					itemSelected = true;
					item.setSubimage(2);
				}
				else
				{
					if (interactableIndex == itemsInRange)
					{
						itemSelected = true;
						item.setSubimage(2);
					}
					else
					{
						item.setSubimage(1);
					}
				}
			}
			else
			{
				item.setSubimage(0);
			}
			itemIndex++;
		}
		
		if (!itemSelected)
		{ 
			interactableIndex = -1; 
			selectedInteractable = -1;
		}
		
		if (FlxG.keys.anyJustPressed(["space"]))
		{
			if (selectedInteractable >= 0 && selectedInteractable <= interactables.length)
			{
				trace("Player position before interacting: " + player.x + ", " + player.y);
				//_gameSave.flush();
				interactables[selectedInteractable].interact(player);
				
			}
		}
		
		super.update();
	}
	
	public function setPlayer(playerArg : Player)
	{
		player = playerArg;
		player.Parent = this;
	}
}