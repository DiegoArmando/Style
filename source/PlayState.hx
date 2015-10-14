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
	
	//private var item_selected:Bool;
	//private var i_slotI:Int;
	//private var i_slotJ:Int;
	//private var tmp_item:Item;
	
	/*private var tmpX:Float;
	private var tmpY:Float;
	private var tmpAsset_path:String;
	private var tmpClothing_type:String;
	
	private var tmp2X:Float;
	private var tmp2Y:Float;
	private var tmp2Asset_path:String;
	private var tmp2Clothing_type:String;
	
	private var tmp_item_array:Array<Item>;
	private var counter:Int;*/
	
	public var npcInCombat : NPC;
	
	var boss1dead : Bool = false;
	var boss2dead : Bool = false;
	var boss3dead : Bool = false;
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
		
		//item_selected = false;
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
		var testDude = new NPC(3000, 2800, true, "android", "Android", this);
		testDude.Dialog.push("I know I look convincingly human, but don't be fooled!");
		testDude.Dialog.push("It's just my spectacular human fashion sense.");
		testDude.Dialog.push("I only had to cut off two arms to fit into this shirt. That was probably worth it.");
		testDude.Dialog.push("Right?");
		testDude.Dialog.push("...Right?");
		add(testDude);
		interactables.push(testDude);
		
		var mummy = new NPC(3050, 3900, true, "mummy", "Mummy", this);
		mummy.Dialog.push("I may have been playing with human medical supplies.");
		mummy.Dialog.push("I may have gotten stuck in gauze.");
		add(mummy);
		interactables.push(mummy);
		
		var testBoss = new NPC(2917, 3370, false, "fobio", "Fobio", this);
		testBoss.Dialog.push("Oh my, have you assembled an outfit to fight me?");
		testBoss.Dialog.push("I won't say I'm impressed, but I'm certainly amused.");
		testBoss.Dialog.push("Come at me then. Lets see if those fists of yours are good for anything\n besides making <i>terrible</i> outfits.");
		add(testBoss);
		interactables.push(testBoss);
		
		var lue = new NPC(3804, 3029, false, "lue", "Lu-E", this);
		//lue.Sprite.setSize(0.5, 0.5);
		lue.Dialog.push("I used to be a purse. I was very fashionable at the time.");
		lue.Dialog.push("Humans gave purses sentience and were <i>surpised<i> when robots took over.");
		lue.Dialog.push("Anyway, if you want to fight me I'll thwomp ya.");
		add(lue);
		interactables.push(lue);
		
		var handm = new NPC(3898, 3732, false, "hm", "Hertz", this);
		handm.Dialog.push("How did you get out of your cell?");
		handm.Dialog.push("And how did you get such a cute shirt?");
		handm.Dialog.push("And are you ready to get those cute shoes clobbered right off of you?");
		add(handm);
		interactables.push(handm);
		
		var arm = new NPC(2295, 3397, false, "arm", "Arm-Many", this);
		arm.Dialog.push("I love what you're doing with your torso, darling.");
		arm.Dialog.push("Being covered in cloth, very chic right now, very hot.");
		arm.Dialog.push("...why are you looking at me like that?");
		add(arm);
		interactables.push(arm);
		
		var chan = new NPC(1782, 3752, false, "channel", "Channel", this);
		chan.Dialog.push("Oh my. You shouldn't be out of your cell at all.");
		chan.Dialog.push("Or, now that I think about it,");
		chan.Dialog.push("still attached to your legs.");
		add(chan);
		interactables.push(chan);
		
		var coco = new NPC(1186, 4019, false, "cocoa", "Cocoa", this);
		coco.Dialog.push("Robots don't drink hot cocoa, you know.");
		coco.Dialog.push("...Please take some cocoa. I have 30 years of backup.");
		//coco.Dialog.push("(I don't even like cocoa)");
		add(coco);
		interactables.push(coco);
		
		var prod = new NPC(554, 3817, false, "prod", "Prodder", this);
		prod.Dialog.push("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
		prod.Dialog.push("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
		prod.Dialog.push("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\nAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\nAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\nAAAAAAAAAAAAAAAAAAAAAAAA");
		add(prod);
		interactables.push(prod);
		
		var curv = new NPC(1183, 2801, false, "curvea", "Curve-A", this);
		curv.Dialog.push("I don't know how you made it past Fobio and the others, \nbut you'll never make it past me.");
		curv.Dialog.push("And even if you make it past me, there's no way you'll get past Kitsch.");
		curv.Dialog.push("To be honest, Kitsch scares me. But you don't!");
		add(curv);
		interactables.push(curv);
		
		var fridge = new NPC(1165, 695, false, "kitsch", "Kitschy", this);
		fridge.Dialog.push("Ugh. It's one of you things.");
		fridge.Dialog.push("I thought we locked you all up.");
		fridge.Dialog.push("You can't even stay jalied correctly. Let's see if you can die correctly.");
		add(fridge);
		interactables.push(fridge);
		
		var mond = new NPC(667, 3222, true, "mondrian", "Mondrian", this);
		mond.Dialog.push("...");
		mond.Dialog.push("......");
		mond.Dialog.push("Ellipse");
		mond.Dialog.push("I wish Fabio was here.");
		add(mond);
		interactables.push(mond);
		
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
		
		/*tmp_item_array = new Array<Item>();
		for (i in 0...4)
		{
			tmp_item_array[i] = null;
		}
		
		counter = 1;
		tmp_item = new Item(0, 0, "", "");*/
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
		
		if (StateManager.killNPC)
		{
			////trace ("kill npc");
			StateManager.killNPC = false;
			if (StateManager.npcToKill != null)
			{
				remove (StateManager.npcToKill);
				var isAlive = function (item : Interactable) return item != StateManager.npcToKill;
				interactables.filter(isAlive);
			}
		}
		
		if (StateManager.BOSSBOOLS[0] == true && boss1dead == false)
		{
			////trace("Fobio is confirmed for dead in PLaystate");
			boss1dead = true;
			levelTiles.setTile(44, 51, 1);
			levelTiles.setTile(44, 52, 1);
			levelTiles.setTile(44, 53, 1);
		}
		else
		{
			//////trace("Fobio is still alive");
		}
		
		if (StateManager.BOSSBOOLS[1] == true && boss2dead == false)
		{
			boss2dead = true;
			levelTiles.setTile(17, 41, 1);
			levelTiles.setTile(18, 41, 1);
			levelTiles.setTile(19, 41, 1);
		}
		
		
		//************************************
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
		
		if (FlxG.keys.anyJustPressed(["space"]) && !playerInDialog)
		{
			if (selectedInteractable >= 0 && selectedInteractable <= interactables.length && !delayInteract)
			{
				//menu.stateMem = this;
				//////trace (selectedInteractable);
				interactables[selectedInteractable].interact(player);
			}
			else if (delayInteract)
			{
				delayInteract = false;
			}
			
			
		}
		
		/*if (FlxG.keys.anyJustPressed(["g"]))
		{
			inventory[0][0] = "assets/images/sprite_sheets/mondrian.png";
			inventory_items[0][0] = null;
		}*/
		//////trace ("got here");
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
				//inventory_items[0][0] = null;
				inventory[0][0] = "";
			}
			
			//Second Head slot
			else if (FlxG.mouse.screenX >= 818 && FlxG.mouse.screenX <= 882 && FlxG.mouse.screenY >= 3 && FlxG.mouse.screenY <= 65 && inventory[0][1] != "")
			{
				inventory_items[0][1].kill();
				//inventory_items[0][1] = null;
				inventory[0][1] = "";
			}
			
			//Third Head Slot
			else if (FlxG.mouse.screenX >= 883 && FlxG.mouse.screenX <= 947 && FlxG.mouse.screenY >= 3 && FlxG.mouse.screenY <= 65 && inventory[0][2] != "")
			{
				inventory_items[0][2].kill();
				//inventory_items[0][2] = null;
				inventory[0][2] = "";
			}
			
			//Equipped Head slot
			else if (FlxG.mouse.screenX >= 957 && FlxG.mouse.screenX <= 1021 && FlxG.mouse.screenY >= 3 && FlxG.mouse.screenY <= 65 && inventory[0][3] != "")
			{
				inventory_items[0][3].kill();
				//inventory_items[0][3] = null;
				inventory[0][3] = "";
			}
			
			
			
			//First Body slot
			else if (FlxG.mouse.screenX >= 753 && FlxG.mouse.screenX <= 817 && FlxG.mouse.screenY >= 69 && FlxG.mouse.screenY <= 131 && inventory[0][0] != "")
			{
				(inventory_items[1][0]).kill();
				//inventory_items[0][0] = null;
				inventory[1][0] = "";
			}
			
			//Second Body slot
			else if (FlxG.mouse.screenX >= 818 && FlxG.mouse.screenX <= 882 && FlxG.mouse.screenY >= 69 && FlxG.mouse.screenY <= 131 && inventory[0][1] != "")
			{
				inventory_items[1][1].kill();
				//inventory_items[0][1] = null;
				inventory[1][1] = "";
			}
			
			//Third Body Slot
			else if (FlxG.mouse.screenX >= 883 && FlxG.mouse.screenX <= 947 && FlxG.mouse.screenY >= 69 && FlxG.mouse.screenY <= 131 && inventory[0][2] != "")
			{
				inventory_items[1][2].kill();
				//inventory_items[0][2] = null;
				inventory[1][2] = "";
			}
			
			//Equipped Body slot
			else if (FlxG.mouse.screenX >= 957 && FlxG.mouse.screenX <= 1021 && FlxG.mouse.screenY >= 69 && FlxG.mouse.screenY <= 131 && inventory[0][3] != "")
			{
				inventory_items[1][3].kill();
				//inventory_items[0][3] = null;
				inventory[1][3] = "";
			}
			
			
			
			//First Legs slot
			if (FlxG.mouse.screenX >= 753 && FlxG.mouse.screenX <= 817 && FlxG.mouse.screenY >= 136 && FlxG.mouse.screenY <= 198 && inventory[0][0] != "")
			{
				(inventory_items[2][0]).kill();
				//inventory_items[0][0] = null;
				inventory[2][0] = "";
			}
			
			//Second Legs slot
			else if (FlxG.mouse.screenX >= 818 && FlxG.mouse.screenX <= 882 && FlxG.mouse.screenY >= 136 && FlxG.mouse.screenY <= 198 && inventory[0][1] != "")
			{
				inventory_items[2][1].kill();
				//inventory_items[0][1] = null;
				inventory[2][1] = "";
			}
			
			//Third Legs Slot
			else if (FlxG.mouse.screenX >= 883 && FlxG.mouse.screenX <= 947 && FlxG.mouse.screenY >= 136 && FlxG.mouse.screenY <= 198 && inventory[0][2] != "")
			{
				inventory_items[2][2].kill();
				//inventory_items[0][2] = null;
				inventory[2][2] = "";
			}
			
			//Equipped Legs slot
			else if (FlxG.mouse.screenX >= 957 && FlxG.mouse.screenX <= 1021 && FlxG.mouse.screenY >= 136 && FlxG.mouse.screenY <= 198 && inventory[0][3] != "")
			{
				inventory_items[2][3].kill();
				//inventory_items[0][3] = null;
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
			if (FlxG.mouse.screenX >= 753 && FlxG.mouse.screenX <= 817 && FlxG.mouse.screenY >= 3 && FlxG.mouse.screenY <= 65)
			{
				headI = 0;
				headJ = 0;
			}
			
			//Second Head slot
			if (FlxG.mouse.screenX >= 818 && FlxG.mouse.screenX <= 882 && FlxG.mouse.screenY >= 3 && FlxG.mouse.screenY <= 65)
			{
				headI = 0;
				headJ = 1;
			}
			
			//Third Head Slot
			if (FlxG.mouse.screenX >= 883 && FlxG.mouse.screenX <= 947 && FlxG.mouse.screenY >= 3 && FlxG.mouse.screenY <= 65)
			{
				headI = 0;
				headJ = 2;
			}
			
			//Equipped Head slot
			if (FlxG.mouse.screenX >= 957 && FlxG.mouse.screenX <= 1021 && FlxG.mouse.screenY >= 3 && FlxG.mouse.screenY <= 65)
			{
				headI = 0;
				headJ = 3;
			}
			
			
			
			//First Body slot
			if (FlxG.mouse.screenX >= 753 && FlxG.mouse.screenX <= 817 && FlxG.mouse.screenY >= 69 && FlxG.mouse.screenY <= 131)
			{
				bodyI = 1;
				bodyJ = 0;
			}
			
			//Second Body slot
			if (FlxG.mouse.screenX >= 818 && FlxG.mouse.screenX <= 882 && FlxG.mouse.screenY >= 69 && FlxG.mouse.screenY <= 131)
			{
				bodyI = 1;
				bodyJ = 1;
			}
			
			//Third Body Slot
			if (FlxG.mouse.screenX >= 883 && FlxG.mouse.screenX <= 947 && FlxG.mouse.screenY >= 69 && FlxG.mouse.screenY <= 131)
			{
				bodyI = 1;
				bodyJ = 2;
			}
			
			//Equipped Body slot
			if (FlxG.mouse.screenX >= 957 && FlxG.mouse.screenX <= 1021 && FlxG.mouse.screenY >= 69 && FlxG.mouse.screenY <= 131)
			{
				bodyI = 1;
				bodyJ = 3;
			}
			
			
			
			//First Legs slot
			if (FlxG.mouse.screenX >= 753 && FlxG.mouse.screenX <= 817 && FlxG.mouse.screenY >= 136 && FlxG.mouse.screenY <= 198)
			{
				legsI = 2;
				legsJ = 0;
			}
			
			//Second Legs slot
			if (FlxG.mouse.screenX >= 818 && FlxG.mouse.screenX <= 882 && FlxG.mouse.screenY >= 136 && FlxG.mouse.screenY <= 198)
			{
				legsI = 2;
				legsJ = 1;
			}
			
			//Third Legs Slot
			if (FlxG.mouse.screenX >= 883 && FlxG.mouse.screenX <= 947 && FlxG.mouse.screenY >= 136 && FlxG.mouse.screenY <= 198)
			{
				legsI = 2;
				legsJ = 2;
			}
			
			//Equipped Legs slot
			if (FlxG.mouse.screenX >= 957 && FlxG.mouse.screenX <= 1021 && FlxG.mouse.screenY >= 136 && FlxG.mouse.screenY <= 198)
			{
				legsI = 2;
				legsJ = 3;
			}
		}
		
		/*
		//Moving items around in the inventory.
		if (FlxG.mouse.justPressed)
		{
			//First Head slot
			if (FlxG.mouse.screenX >= 753 && FlxG.mouse.screenX <= 817 && FlxG.mouse.screenY >= 3 && FlxG.mouse.screenY <= 65)
			{
				if (!item_selected)
				{
					item_selected = true;
					i_slotI = 0;
					i_slotJ = 0;
				}
				else if (i_slotI == 0 && i_slotJ == 0)
				{
					item_selected = false;
					i_slotI = -1;
					i_slotJ = -1;
				}
				else if (item_selected && i_slotI == 0 && i_slotJ != -1)
				{
					item_selected = false;
					move_item(i_slotI, i_slotJ, 0, 0);
					i_slotI = -1;
					i_slotJ = -1;
				}
			}
			
			//Second Head slot
			if (FlxG.mouse.screenX >= 818 && FlxG.mouse.screenX <= 882 && FlxG.mouse.screenY >= 3 && FlxG.mouse.screenY <= 65)
			{
				if (!item_selected)
				{
					item_selected = true;
					i_slotI = 0;
					i_slotJ = 1;
				}
				else if (i_slotI == 0 && i_slotJ == 1)
				{
					item_selected = false;
					i_slotI = -1;
					i_slotJ = -1;
				}
				else if (item_selected && i_slotI == 0 && i_slotJ != -1)
				{
					item_selected = false;
					move_item(i_slotI, i_slotJ, 0, 1);
					i_slotI = -1;
					i_slotJ = -1;
				}
			}
			
			//Third Head Slot
			if (FlxG.mouse.screenX >= 883 && FlxG.mouse.screenX <= 947 && FlxG.mouse.screenY >= 3 && FlxG.mouse.screenY <= 65)
			{
				if (!item_selected)
				{
					item_selected = true;
					i_slotI = 0;
					i_slotJ = 2;
				}
				else if (i_slotI == 0 && i_slotJ == 2)
				{
					item_selected = false;
					i_slotI = -1;
					i_slotJ = -1;
				}
				else if (item_selected && i_slotI == 0 && i_slotJ != -1)
				{
					item_selected = false;
					move_item(i_slotI, i_slotJ, 0, 2);
					i_slotI = -1;
					i_slotJ = -1;
				}
			}
			
			//Equipped Head slot
			if (FlxG.mouse.screenX >= 957 && FlxG.mouse.screenX <= 1021 && FlxG.mouse.screenY >= 3 && FlxG.mouse.screenY <= 65)
			{
				if (!item_selected)
				{
					item_selected = true;
					i_slotI = 0;
					i_slotJ = 3;
				}
				else if (i_slotI == 0 && i_slotJ == 3)
				{
					item_selected = false;
					i_slotI = -1;
					i_slotJ = -1;
				}
				else if (item_selected && i_slotI == 0 && i_slotJ != -1)
				{
					item_selected = false;
					move_item(i_slotI, i_slotJ, 0, 3);
					i_slotI = -1;
					i_slotJ = -1;
				}
			}	
		}*/
		
	}
	
	private function move_item(i1:Int, j1:Int, i2:Int, j2:Int):Void
	{
		/*
		//tmp_item = new Item(inventory_items[i1][j1].x, inventory_items[i1][j1].y, inventory_items[i1][j1].asset_path, inventory_items[i1][j1].clothing_type);
		tmp_item.x = inventory_items[i1][j1].x;
		tmp_item.y = inventory_items[i1][j1].y;
		tmp_item.asset_path = inventory_items[i1][j1].asset_path;
		tmp_item.clothing_type = inventory_items[i1][j1].clothing_type;
		
		//inventory_items[i1][j1].destroy();
		//inventory_items[i1][j1] = new Item(inventory_items[i2][j2].x, inventory_items[i2][j2].y, inventory_items[i2][j2].asset_path, inventory_items[i2][j2].clothing_type);
		inventory_items[i1][j1].x = inventory_items[i2][j2].x;
		inventory_items[i1][j1].y = inventory_items[i2][j2].y;
		inventory_items[i1][j1].asset_path = inventory_items[i2][j2].asset_path;
		inventory_items[i1][j1].clothing_type = inventory_items[i2][j2].clothing_type;
		
		//inventory_items[i2][j2].destroy();
		//inventory_items[i2][j2] = new Item(tmp_item.x, tmp_item.y, tmp_item.asset_path, tmp_item.clothing_type);
		//tmp_item.destroy();
		inventory_items[i2][j2].x = tmp_item.x;
		inventory_items[i2][j2].y = tmp_item.y;
		inventory_items[i2][j2].asset_path = tmp_item.asset_path;
		inventory_items[i2][j2].clothing_type = tmp_item.clothing_type;
		*/
		/*
		tmpX = inventory_items[i1][j1].x;
		tmpY = inventory_items[i1][j1].y;
		tmpAsset_path = inventory_items[i1][j1].asset_path;
		tmpClothing_type = inventory_items[i1][j1].clothing_type;
		
		tmp2X = inventory_items[i2][j2].x;
		tmp2Y = inventory_items[i2][j2].y;
		tmp2Asset_path = inventory_items[i2][j2].asset_path;
		tmp2Clothing_type = inventory_items[i2][j2].clothing_type;
		
		inventory_items[i1][j1].x = tmp2X;
		inventory_items[i1][j1].y = tmp2Y;
		inventory_items[i1][j1].asset_path = tmp2Asset_path;
		inventory_items[i1][j1].clothing_type = tmp2Clothing_type;
		
		inventory_items[i2][j2].x = tmpX;
		inventory_items[i2][j2].y = tmpY;
		inventory_items[i2][j2].asset_path = tmpAsset_path;
		inventory_items[i2][j2].clothing_type = tmpClothing_type;
		*/
		/*
		tmp_item = inventory_items[i1][j1];
		inventory_items[i1][j1] = inventory_items[i2][j2];
		inventory_items[i2][j2] = tmp_item;
		*/
		/*
		tmpX = inventory_items[i1][j1].x;
		tmpY = inventory_items[i1][j1].y;
		tmpAsset_path = inventory_items[i1][j1].asset_path;
		tmpClothing_type = inventory_items[i1][j1].clothing_type;
		
		tmp2X = inventory_items[i2][j2].x;
		tmp2Y = inventory_items[i2][j2].y;
		tmp2Asset_path = inventory_items[i2][j2].asset_path;
		tmp2Clothing_type = inventory_items[i2][j2].clothing_type;
		
		inventory_items[i1][j1].destroy();
		inventory_items[i2][j2].destroy();
		
		inventory_items[i1][j1] = new Item(tmp2X, tmp2Y, tmp2Asset_path, tmp2Clothing_type);
		inventory_items[i2][j2] = new Item(tmpX, tmpY, tmpAsset_path, tmpClothing_type);
		*/
		/*
		if (j1 == 0)
		{
			tmp_item_array.push(inventory_items[i1][j2]);
			while (j2 != counter)
			{
				tmp_item_array.push(inventory_items[i1][counter]);
				counter++;
			}
			tmp_item_array.push(inventory_items[i1][j2]);
			counter++;
			while (counter != 4)
			{
				tmp_item_array.push(inventory_items[i1][counter]);
				counter++;
			}
			inventory_items[i1] = tmp_item_array;
		}
		else if (j1 == 1)
		{
			
		}
		else if (j1 == 2)
		{
			
		}
		else if (j1 == 3)
		{
			
		}
		*/
		/*
		tmp_item_array.pop();
		tmp_item_array.pop();
		tmp_item_array.pop();
		tmp_item_array.pop();
		
		tmp_item_array.push(inventory_items[i1][3]);
		tmp_item_array.push(inventory_items[i1][2]);
		tmp_item_array.push(inventory_items[i1][1]);
		tmp_item_array.push(inventory_items[i1][0]);
		inventory_items[i1] = tmp_item_array;
		*/
	}
}