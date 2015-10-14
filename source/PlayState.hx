package;

import flixel.FlxG;
import flixel.FlxBasic;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
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
	
	public var map_music:FlxSound;
	
	override public function create():Void
	{
		super.create();
		//load tile map
		//add tile map
		
		levelTiles = new FlxTilemap();
		
		map_music = new FlxSound();
		map_music.loadStream("assets/music/MapMusic.wav", true, false);
		map_music.play(true);
		
		//levelTiles.auto = FlxTilemap.OFF;
		
		levelTiles.loadMap(Assets.getText("assets/images/Background4.csv"), "assets/images/TileMap3.png", TILE_WIDTH, TILE_HEIGHT, FlxTilemap.OFF);
		add(levelTiles);
		
		_highlightBox = new FlxSprite(0, 0);
		_highlightBox.makeGraphic(TILE_WIDTH, TILE_HEIGHT, FlxColor.TRANSPARENT);
		FlxSpriteUtil.drawRect(_highlightBox, 0, 0, TILE_WIDTH - 1, TILE_HEIGHT - 1, FlxColor.TRANSPARENT, { thickness: 1, color: FlxColor.RED });
		add(_highlightBox);
		
		/// The list of things in the environment that can be interacted with.
		interactables = [];
		/// Add something to it.
		/*
		var Disk : Interactable = new Interactable(FlxG.width/2+64, FlxG.height/2, "assets/);
		add (Disk);
		interactables.push(Disk);
		
		var Disk1 : Interactable = new Interactable(FlxG.width/2+64, FlxG.height/2+128);
		add (Disk1);
		interactables.push(Disk1);
		
		var Disk2 : Interactable = new Interactable(FlxG.width/2, FlxG.height/2+128);
		add (Disk2);
		interactables.push(Disk2);
		
		var Disk3 : Interactable = new Interactable(FlxG.width/2, FlxG.height/2);
		add (Disk3);
		interactables.push(Disk3);
		*/
		var testDude = new NPC(3000, 3000, true, "android", "Android", this);
		testDude.Dialog.push("I am android.");
		testDude.Dialog.push("From Google (TM), I have blessed the world with my platform.");
		testDude.Dialog.push("Now I will bless you with my wisdom.");
		testDude.Dialog.push("Do not ask which language is the worst,");
		testDude.Dialog.push("For that language is Java!");
		add(testDude);
		interactables.push(testDude);
		
		var testBoss = new NPC(3200, 3000, false, "fobio", "Fobio", this);
		testBoss.Dialog.push("HUH, so does it happen to be the case that if you have no dialog, you can't enter battle?");
		testBoss.Dialog.push("Be afraid, for this text is not even showing up.");
		testBoss.Dialog.push("Is it?");
		testBoss.Dialog.push("Oh look, a battle! (hopefully)");
		add(testBoss);
		interactables.push(testBoss);
		
		// player ini
		player = new Player(3300, 3300, this);
		FlxG.camera.follow(player.referenceSprite, FlxCamera.STYLE_TOPDOWN, 1);

		add( player);
		
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
		
		if (!map_music.active) {
			map_music.play(true);
		}
		
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
				interactables[selectedInteractable].interact(player);
			}
			else if (delayInteract)
			{
				delayInteract = false;
			}
		}
		
		super.update();
	}	
}