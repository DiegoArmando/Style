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
	public var interactableIndex : Int = -1;
	public var selectedInteractable : Int = -1;
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
		
		//item_selected = false;
		//load tile map
		//add tile map
		
		trace("We are getting into create");
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
		
		var Disk1 : Interactable = new Interactable(FlxG.width/2+64, FlxG.height/2+128);
		add (Disk1);
		interactables.push(Disk1);
		
		var Disk2 : Interactable = new Interactable(FlxG.width/2, FlxG.height/2+128);
		add (Disk2);
		interactables.push(Disk2);
		
		var Disk3 : Interactable = new Interactable(FlxG.width/2, FlxG.height/2);
		add (Disk3);
		interactables.push(Disk3);
		
		// player ini
		player = new Player(FlxG.width/2, FlxG.height/2, this);
		add( player);
		
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
				interactables[selectedInteractable].interact();
			}
		}
		
		/*if (FlxG.keys.anyJustPressed(["g"]))
		{
			inventory[0][0] = "assets/images/sprite_sheets/mondrian.png";
			inventory_items[0][0] = null;
		}*/
		
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