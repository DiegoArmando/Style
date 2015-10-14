package;

import flixel.FlxG;
import flixel.FlxBasic;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import openfl.Assets;
import flixel.util.FlxColor;
import flixel.tile.FlxTilemap;
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
	public var inventory:Array<Array<String>>;
	public var inventory_items:Array<Array<Item>>;
	private var _hud:HUD;
	
	private var headI:Int;
	private var headJ:Int;
	private var bodyI:Int;
	private var bodyJ:Int;
	private var legsI:Int;
	private var legsJ:Int;

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
		
		//load tile map
		//add tile map
		
		trace("We are getting into create");
		levelTiles = new FlxTilemap();
		
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
		FlxG.camera.follow(player.referenceSprite, FlxCamera.STYLE_TOPDOWN, 1);
		
		_hud = new HUD();
		add(_hud);
		
		inventory = new Array<Array<String>>();
		for (i in 0...3)
		{
			inventory[i] = new Array<String>();
			for (j in 0...4)
			{
				inventory[i][j] = "";
			}
		}
		
		inventory_items = new Array<Array<Item>>();
		for (i in 0...3)
		{
			inventory_items[i] = new Array<Item>();
			for (j in 0...4)
			{
				inventory_items[i][j] = null;
			}
		}
		
		headI = -1;
		headJ = -1;
		bodyI = -1;
		bodyJ = -1;
		legsI = -1;
		legsJ = -1;
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
		var itemIndex : Int = 0;
		var itemSelected : Bool = false;
		var itemsInRange : Int = 0;
		
		
		/************************************
		inventory[0][0] = "assets/images/sprite_sheets/android.png";
		inventory[0][1] = "assets/images/sprite_sheets/baymax.png";
		inventory[0][2] = "assets/images/sprite_sheets/minion_bot.png";
		inventory[0][3] = "assets/images/sprite_sheets/mummy.png";
		
		inventory[1][0] = "assets/images/sprite_sheets/android.png";
		inventory[1][1] = "assets/images/sprite_sheets/baymax.png";
		inventory[1][2] = "assets/images/sprite_sheets/minion_bot.png";
		inventory[1][3] = "assets/images/sprite_sheets/mummy.png";
		
		inventory[2][0] = "assets/images/sprite_sheets/android.png";
		inventory[2][1] = "assets/images/sprite_sheets/baymax.png";
		inventory[2][2] = "assets/images/sprite_sheets/minion_bot.png";
		inventory[2][3] = "assets/images/sprite_sheets/mummy.png";
		//************************************/
		
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
		
		
		//trace ("got here");
		left_click_HUD();
		right_click_HUD();
		_hud.updateHUD(inventory, inventory_items, headI, headJ, bodyI, bodyJ, legsI, legsJ);
		super.update();
	}
	
	private function right_click_HUD()
	{
		if (FlxG.mouse.justPressedRight)
		{
			//First Head slot
			if (FlxG.mouse.screenX >= 753 && FlxG.mouse.screenX <= 817 && FlxG.mouse.screenY >= 3 && FlxG.mouse.screenY <= 65 && inventory[0][0] != "")
			{
				(inventory_items[0][0]).kill();
				inventory[0][0] = "";
			}
			
			//Second Head slot
			else if (FlxG.mouse.screenX >= 818 && FlxG.mouse.screenX <= 882 && FlxG.mouse.screenY >= 3 && FlxG.mouse.screenY <= 65 && inventory[0][1] != "")
			{
				inventory_items[0][1].kill();
				inventory[0][1] = "";
			}
			
			//Third Head Slot
			else if (FlxG.mouse.screenX >= 883 && FlxG.mouse.screenX <= 947 && FlxG.mouse.screenY >= 3 && FlxG.mouse.screenY <= 65 && inventory[0][2] != "")
			{
				inventory_items[0][2].kill();
				inventory[0][2] = "";
			}
			
			//Equipped Head slot
			else if (FlxG.mouse.screenX >= 957 && FlxG.mouse.screenX <= 1021 && FlxG.mouse.screenY >= 3 && FlxG.mouse.screenY <= 65 && inventory[0][3] != "")
			{
				inventory_items[0][3].kill();
				inventory[0][3] = "";
			}
			
			
			
			//First Body slot
			else if (FlxG.mouse.screenX >= 753 && FlxG.mouse.screenX <= 817 && FlxG.mouse.screenY >= 69 && FlxG.mouse.screenY <= 131 && inventory[0][0] != "")
			{
				(inventory_items[1][0]).kill();
				inventory[1][0] = "";
			}
			
			//Second Body slot
			else if (FlxG.mouse.screenX >= 818 && FlxG.mouse.screenX <= 882 && FlxG.mouse.screenY >= 69 && FlxG.mouse.screenY <= 131 && inventory[0][1] != "")
			{
				inventory_items[1][1].kill();
				inventory[1][1] = "";
			}
			
			//Third Body Slot
			else if (FlxG.mouse.screenX >= 883 && FlxG.mouse.screenX <= 947 && FlxG.mouse.screenY >= 69 && FlxG.mouse.screenY <= 131 && inventory[0][2] != "")
			{
				inventory_items[1][2].kill();
				inventory[1][2] = "";
			}
			
			//Equipped Body slot
			else if (FlxG.mouse.screenX >= 957 && FlxG.mouse.screenX <= 1021 && FlxG.mouse.screenY >= 69 && FlxG.mouse.screenY <= 131 && inventory[0][3] != "")
			{
				inventory_items[1][3].kill();
				inventory[1][3] = "";
			}
			
			
			
			//First Legs slot
			if (FlxG.mouse.screenX >= 753 && FlxG.mouse.screenX <= 817 && FlxG.mouse.screenY >= 136 && FlxG.mouse.screenY <= 198 && inventory[0][0] != "")
			{
				(inventory_items[2][0]).kill();
				inventory[2][0] = "";
			}
			
			//Second Legs slot
			else if (FlxG.mouse.screenX >= 818 && FlxG.mouse.screenX <= 882 && FlxG.mouse.screenY >= 136 && FlxG.mouse.screenY <= 198 && inventory[0][1] != "")
			{
				inventory_items[2][1].kill();
				inventory[2][1] = "";
			}
			
			//Third Legs Slot
			else if (FlxG.mouse.screenX >= 883 && FlxG.mouse.screenX <= 947 && FlxG.mouse.screenY >= 136 && FlxG.mouse.screenY <= 198 && inventory[0][2] != "")
			{
				inventory_items[2][2].kill();
				inventory[2][2] = "";
			}
			
			//Equipped Legs slot
			else if (FlxG.mouse.screenX >= 957 && FlxG.mouse.screenX <= 1021 && FlxG.mouse.screenY >= 136 && FlxG.mouse.screenY <= 198 && inventory[0][3] != "")
			{
				inventory_items[2][3].kill();
				inventory[2][3] = "";
			}
		}
	}
	
	private function left_click_HUD()
	{
		//Select an item to have it equip.
		if (FlxG.mouse.justPressed)
		{
			//First Head slot
			if (FlxG.mouse.screenX >= 753 && FlxG.mouse.screenX <= 817 && FlxG.mouse.screenY >= 3 && FlxG.mouse.screenY <= 65 && headI == 0 && headJ == 0)
			{
				headI = -1;
				headJ = -1;
				player.SwitchOutfit(2, 0);
			}
			else if (FlxG.mouse.screenX >= 753 && FlxG.mouse.screenX <= 817 && FlxG.mouse.screenY >= 3 && FlxG.mouse.screenY <= 65)
			{
				headI = 0;
				headJ = 0;
				player.SwitchOutfit(2, inventory_items[0][0].clothing_index);
			}
			
			//Second Head slot
			if (FlxG.mouse.screenX >= 818 && FlxG.mouse.screenX <= 882 && FlxG.mouse.screenY >= 3 && FlxG.mouse.screenY <= 65 && headI == 0 && headJ == 1)
			{
				headI = -1;
				headJ = -1;
				player.SwitchOutfit(2, 0);
			}
			else if (FlxG.mouse.screenX >= 818 && FlxG.mouse.screenX <= 882 && FlxG.mouse.screenY >= 3 && FlxG.mouse.screenY <= 65)
			{
				headI = 0;
				headJ = 1;
				player.SwitchOutfit(2, inventory_items[0][1].clothing_index);
			}
			
			//Third Head Slot
			if (FlxG.mouse.screenX >= 883 && FlxG.mouse.screenX <= 947 && FlxG.mouse.screenY >= 3 && FlxG.mouse.screenY <= 65 && headI == 0 && headJ == 2)
			{
				headI = -1;
				headJ = -1;
				player.SwitchOutfit(2, 0);
			}
			else if (FlxG.mouse.screenX >= 883 && FlxG.mouse.screenX <= 947 && FlxG.mouse.screenY >= 3 && FlxG.mouse.screenY <= 65)
			{
				headI = 0;
				headJ = 2;
				player.SwitchOutfit(2, inventory_items[0][2].clothing_index);
			}
			
			//Equipped Head slot
			if (FlxG.mouse.screenX >= 957 && FlxG.mouse.screenX <= 1021 && FlxG.mouse.screenY >= 3 && FlxG.mouse.screenY <= 65 && headI == 0 && headJ == 3)
			{
				headI = -1;
				headJ = -1;
				player.SwitchOutfit(2, 0);
			}
			else if (FlxG.mouse.screenX >= 957 && FlxG.mouse.screenX <= 1021 && FlxG.mouse.screenY >= 3 && FlxG.mouse.screenY <= 65)
			{
				headI = 0;
				headJ = 3;
				player.SwitchOutfit(2, inventory_items[0][3].clothing_index);
			}
			
			
			
			//First Body slot
			if (FlxG.mouse.screenX >= 753 && FlxG.mouse.screenX <= 817 && FlxG.mouse.screenY >= 69 && FlxG.mouse.screenY <= 131 && bodyI == 1 && bodyJ == 0)
			{
				bodyI = -1;
				bodyJ = -1;
				player.SwitchOutfit(1, 0);
			}
			else if (FlxG.mouse.screenX >= 753 && FlxG.mouse.screenX <= 817 && FlxG.mouse.screenY >= 69 && FlxG.mouse.screenY <= 131)
			{
				bodyI = 1;
				bodyJ = 0;
				player.SwitchOutfit(1, inventory_items[1][0].clothing_index);
			}
			
			//Second Body slot
			if (FlxG.mouse.screenX >= 818 && FlxG.mouse.screenX <= 882 && FlxG.mouse.screenY >= 69 && FlxG.mouse.screenY <= 131 && bodyI == 1 && bodyJ == 1)
			{
				bodyI = -1;
				bodyJ = -1;
				player.SwitchOutfit(1, 0);
			}
			else if (FlxG.mouse.screenX >= 818 && FlxG.mouse.screenX <= 882 && FlxG.mouse.screenY >= 69 && FlxG.mouse.screenY <= 131)
			{
				bodyI = 1;
				bodyJ = 1;
				player.SwitchOutfit(1, inventory_items[1][1].clothing_index);
			}
			
			//Third Body Slot
			if (FlxG.mouse.screenX >= 883 && FlxG.mouse.screenX <= 947 && FlxG.mouse.screenY >= 69 && FlxG.mouse.screenY <= 131 && bodyI == 1 && bodyJ == 2)
			{
				bodyI = -1;
				bodyJ = -1;
				player.SwitchOutfit(1, 0);
			}
			else if (FlxG.mouse.screenX >= 883 && FlxG.mouse.screenX <= 947 && FlxG.mouse.screenY >= 69 && FlxG.mouse.screenY <= 131)
			{
				bodyI = 1;
				bodyJ = 2;
				player.SwitchOutfit(1, inventory_items[1][2].clothing_index);
			}
			
			//Equipped Body slot
			if (FlxG.mouse.screenX >= 957 && FlxG.mouse.screenX <= 1021 && FlxG.mouse.screenY >= 69 && FlxG.mouse.screenY <= 131 && bodyI == 1 && bodyJ == 3)
			{
				bodyI = -1;
				bodyJ = -1;
				player.SwitchOutfit(1, 0);
			}
			else if (FlxG.mouse.screenX >= 957 && FlxG.mouse.screenX <= 1021 && FlxG.mouse.screenY >= 69 && FlxG.mouse.screenY <= 131)
			{
				bodyI = 1;
				bodyJ = 3;
				player.SwitchOutfit(1, inventory_items[1][3].clothing_index);
			}
			
			
			
			//First Legs slot
			if (FlxG.mouse.screenX >= 753 && FlxG.mouse.screenX <= 817 && FlxG.mouse.screenY >= 136 && FlxG.mouse.screenY <= 198 && legsI == 2 && legsJ == 0)
			{
				legsI = -1;
				legsJ = -1;
				player.SwitchOutfit(0, 0);
			}
			else if (FlxG.mouse.screenX >= 753 && FlxG.mouse.screenX <= 817 && FlxG.mouse.screenY >= 136 && FlxG.mouse.screenY <= 198)
			{
				legsI = 2;
				legsJ = 0;
				player.SwitchOutfit(0, inventory_items[2][0].clothing_index);
			}
			
			//Second Legs slot
			if (FlxG.mouse.screenX >= 818 && FlxG.mouse.screenX <= 882 && FlxG.mouse.screenY >= 136 && FlxG.mouse.screenY <= 198 && legsI == 2 && legsJ == 1)
			{
				legsI = -1;
				legsJ = -1;
				player.SwitchOutfit(0, 0);
			}
			else if (FlxG.mouse.screenX >= 818 && FlxG.mouse.screenX <= 882 && FlxG.mouse.screenY >= 136 && FlxG.mouse.screenY <= 198)
			{
				legsI = 2;
				legsJ = 1;
				player.SwitchOutfit(0, inventory_items[2][1].clothing_index);
			}
			
			//Third Legs Slot
			if (FlxG.mouse.screenX >= 883 && FlxG.mouse.screenX <= 947 && FlxG.mouse.screenY >= 136 && FlxG.mouse.screenY <= 198 && legsI == 2 && legsJ == 2)
			{
				legsI = -1;
				legsJ = -1;
				player.SwitchOutfit(0, 0);
			}
			else if (FlxG.mouse.screenX >= 883 && FlxG.mouse.screenX <= 947 && FlxG.mouse.screenY >= 136 && FlxG.mouse.screenY <= 198)
			{
				legsI = 2;
				legsJ = 2;
				player.SwitchOutfit(0, inventory_items[2][2].clothing_index);
			}
			
			//Equipped Legs slot
			if (FlxG.mouse.screenX >= 957 && FlxG.mouse.screenX <= 1021 && FlxG.mouse.screenY >= 136 && FlxG.mouse.screenY <= 198 && legsI == 2 && legsJ == 3)
			{
				legsI = -1;
				legsJ = -1;
				player.SwitchOutfit(0, 0);
			}
			else if (FlxG.mouse.screenX >= 957 && FlxG.mouse.screenX <= 1021 && FlxG.mouse.screenY >= 136 && FlxG.mouse.screenY <= 198)
			{
				legsI = 2;
				legsJ = 3;
				player.SwitchOutfit(0, inventory_items[2][3].clothing_index);
			}
		}
	}
}