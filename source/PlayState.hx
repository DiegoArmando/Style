package;

import flixel.FlxG;
import flixel.FlxBasic;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.FlxObject;
import flixel.util.FlxMath;
import flixel.tile.FlxTilemap;
import openfl.Assets;
import flixel.util.FlxColor;
import flixel.util.FlxSpriteUtil;
import flixel.FlxCamera;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	public var player : Player;
	public var playerGroup : FlxGroup;
	public var interactables : Array<Interactable>;
	public var playerInDialog : Bool = false;
	public var delayInteract : Bool = false;
	
	public var interactableIndex : Int = -1;
	public var selectedInteractable : Int = -1;
	
	public var dialogHandler : DialogManager;
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	private static inline var TILE_WIDTH:Int = 64;
	private static inline var TILE_HEIGHT:Int = 64;
	
	var levelTiles:FlxTilemap;
	private var _highlightBox:FlxSprite;
	
	private var hasLoaded = false;
	
	override public function create():Void
	{
		super.create();
		//menu = new MenuState();
		//menu.stateMem = this;
		//load tile map
		//add tile map
		
		//trace("We are getting into create");
		levelTiles = new FlxTilemap();
		
		//levelTiles.auto = FlxTilemap.OFF;
		
		levelTiles.loadMap(Assets.getText("assets/images/Background3.csv"), "assets/images/TileMap3.png", TILE_WIDTH, TILE_HEIGHT, FlxTilemap.OFF);
		levelTiles.setTileProperties(1, FlxObject.NONE);
		levelTiles.setTileProperties(2, FlxObject.ANY);
		levelTiles.setTileProperties(3, FlxObject.ANY);
		add(levelTiles);
		
		_highlightBox = new FlxSprite(0, 0);
		_highlightBox.makeGraphic(TILE_WIDTH, TILE_HEIGHT, FlxColor.TRANSPARENT);
		FlxSpriteUtil.drawRect(_highlightBox, 0, 0, TILE_WIDTH - 1, TILE_HEIGHT - 1, FlxColor.TRANSPARENT, { thickness: 1, color: FlxColor.RED });
		add(_highlightBox);
		
		/// The list of things in the environment that can be interacted with.
		interactables = [];
		/// Add something to it.
		var Disk : Interactable = new Interactable(FlxG.width/2+64, FlxG.height/2, "assets/images/TestAsset.png");
		add (Disk);
		interactables.push(Disk);
		
		var testEnemy : NPC = new NPC(1500, FlxG.height / 2 - 200, true, "android", this);
		testEnemy.Dialog.push("Do not argue about which language is the worst!");
		testEnemy.Dialog.push("For that language is Java.");
		testEnemy.Dialog.push("I would know.");
		add(testEnemy);
		interactables.push(testEnemy);
		
		var otherEnemy : NPC = new NPC(1400, FlxG.height / 2 - 200, true,"mummy",this);
		otherEnemy.Dialog.push("Did you know King Tut was probably murdered!");
		otherEnemy.Dialog.push("It was probably me.");
		otherEnemy.Dialog.push("I would know.");
		add(otherEnemy);
		interactables.push(otherEnemy);
		
		// player ini
		playerGroup = new FlxGroup();
		player = new Player(FlxG.width/2, FlxG.height/2, this);
		playerGroup.add(player);
		add (playerGroup);
		FlxG.camera.follow(player.referenceSprite, FlxCamera.STYLE_TOPDOWN, 1);
		
		
		/// Keep this at the bottom of the create function
		dialogHandler = new DialogManager(player, this);
		add (dialogHandler);
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
		super.update();
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
						selectedInteractable = itemIndex;
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
		
		if (FlxG.keys.anyJustReleased(["space"]) && !playerInDialog)
		{
			if (selectedInteractable >= 0 && selectedInteractable <= interactables.length && !delayInteract)
			{
				//menu.stateMem = this;
				//trace (selectedInteractable);
				interactables[selectedInteractable].interact();
			}
			else if (delayInteract)
			{
				delayInteract = false;
			}
		}
		
		
	}	
}