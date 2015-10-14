package;

import flixel.FlxSprite;
import flixel.FlxBasic;
import flixel.FlxG;
import flixel.group.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;
using flixel.util.FlxSpriteUtil;

class HUD extends FlxTypedGroup<FlxSprite>
{
	private var _background:FlxSprite;
	private var _backHead1:FlxSprite; private var _backHead2:FlxSprite; private var _backHead3:FlxSprite; private var _backEquippedHead:FlxSprite;
	private var _backBody1:FlxSprite; private var _backBody2:FlxSprite; private var _backBody3:FlxSprite; private var _backEquippedBody:FlxSprite;
	private var _backLegs1:FlxSprite; private var _backLegs2:FlxSprite; private var _backLegs3:FlxSprite; private var _backEquippedLegs:FlxSprite;
	
	private var lineStyle = { color:FlxColor.BLACK, thickness:1 };
	
	public function new()
	{
		super();
		_background = new FlxSprite().makeGraphic(275, 204, FlxColor.WHITE);
		_background.drawRect(1, 1, 272, 201, FlxColor.BLACK);
		//_background.drawRect(200, 1, 73, 201, FlxColor.WHITE);
		
		_background.drawRect(3, 3, 64, 64, FlxColor.GRAY);
		_background.drawRect(69, 3, 64, 64, FlxColor.GRAY);
		_background.drawRect(136, 3, 64, 64, FlxColor.GRAY);
		_background.drawRect(207, 3, 64, 64, FlxColor.RED);
		
		_background.drawRect(3, 70, 64, 64, FlxColor.GRAY);
		_background.drawRect(69, 70, 64, 64, FlxColor.GRAY);
		_background.drawRect(136, 70, 64, 64, FlxColor.GRAY);
		_background.drawRect(207, 70, 64, 64, FlxColor.RED);
		
		_background.drawRect(3, 136, 64, 64, FlxColor.GRAY);
		_background.drawRect(69, 136, 64, 64, FlxColor.GRAY);
		_background.drawRect(136, 136, 64, 64, FlxColor.GRAY);
		_background.drawRect(207, 136, 64, 64, FlxColor.RED);
		
		_background.x = 750;
		
		add(_background);
		forEach(function(spr:FlxSprite)
		{
			spr.scrollFactor.set();
		});
	}
	
	public function updateHUD(inventory:Array<Array<String>>, inventory_items:Array<Array<Item>>, headI:Int, headJ:Int, bodyI:Int, bodyJ:Int, legsI:Int, legsJ:Int):Void
	{
		//Redraw the HUD to make sure it reverts after an item is de-selected.
		_background.drawRect(3, 3, 64, 64, FlxColor.GRAY);
		_background.drawRect(69, 3, 64, 64, FlxColor.GRAY);
		_background.drawRect(136, 3, 64, 64, FlxColor.GRAY);
		_background.drawRect(207, 3, 64, 64, FlxColor.GRAY);
		
		_background.drawRect(3, 70, 64, 64, FlxColor.GRAY);
		_background.drawRect(69, 70, 64, 64, FlxColor.GRAY);
		_background.drawRect(136, 70, 64, 64, FlxColor.GRAY);
		_background.drawRect(207, 70, 64, 64, FlxColor.GRAY);
		
		_background.drawRect(3, 136, 64, 64, FlxColor.GRAY);
		_background.drawRect(69, 136, 64, 64, FlxColor.GRAY);
		_background.drawRect(136, 136, 64, 64, FlxColor.GRAY);
		_background.drawRect(207, 136, 64, 64, FlxColor.GRAY);
		
		//If an item is selected, draw an extra rect to show what is selected.
		if (headI != -1 && headJ != -1)
		{
			if (headJ == 0)
			{
				_background.drawRect(3, 3, 64, 64, FlxColor.BROWN);
			}
			else if (headJ == 1)
			{
				_background.drawRect(69, 3, 64, 64, FlxColor.BROWN);
			}
			else if (headJ == 2)
			{
				_background.drawRect(136, 3, 64, 64, FlxColor.BROWN);
			}
			else if (headJ == 3)
			{
				_background.drawRect(207, 3, 64, 64, FlxColor.BROWN);
			}
		}
		if (bodyI != -1 && bodyJ != -1)
		{
			if (bodyJ == 0)
			{
				_background.drawRect(3, 70, 64, 64, FlxColor.BROWN);
			}
			else if (bodyJ == 1)
			{
				_background.drawRect(69, 70, 64, 64, FlxColor.BROWN);
			}
			else if (bodyJ == 2)
			{
				_background.drawRect(136, 70, 64, 64, FlxColor.BROWN);
			}
			else if (bodyJ == 3)
			{
				_background.drawRect(207, 70, 64, 64, FlxColor.BROWN);
			}
		}
		if (legsI != -1 && legsJ != -1)
		{
			if (legsJ == 0)
			{
				_background.drawRect(3, 136, 64, 64, FlxColor.BROWN);
			}
			else if (legsJ == 1)
			{
				_background.drawRect(69, 136, 64, 64, FlxColor.BROWN);
			}
			else if (legsJ == 2)
			{
				_background.drawRect(136, 136, 64, 64, FlxColor.BROWN);
			}
			else if (legsJ == 3)
			{
				_background.drawRect(207, 136, 64, 64, FlxColor.BROWN);
			}
		}
		
		/*if (i_slotI != -1 && i_slotJ != -1)
		{
			if (i_slotI == 0)
			{
				//Head slot 1
				if (i_slotJ == 0)
				{
					_background.drawRect(3, 3, 64, 64, FlxColor.YELLOW);
				}
				//Head slot 2
				else if (i_slotJ == 1)
				{
					_background.drawRect(69, 3, 64, 64, FlxColor.YELLOW);
				}
				//Head slot 3
				else if (i_slotJ == 2)
				{
					_background.drawRect(136, 3, 64, 64, FlxColor.YELLOW);
				}
				//Equipped head slot
				else if (i_slotJ == 3)
				{
					_background.drawRect(207, 3, 64, 64, FlxColor.YELLOW);
				}
			}
			else if (i_slotI == 1)
			{
				//Body slot 1
				if (i_slotJ == 0)
				{
					_background.drawRect(3, 70, 64, 64, FlxColor.YELLOW);
				}
				//Body slot 2
				else if (i_slotJ == 1)
				{
					_background.drawRect(69, 70, 64, 64, FlxColor.YELLOW);
				}
				//Body slot 3
				else if (i_slotJ == 2)
				{
					_background.drawRect(136, 70, 64, 64, FlxColor.YELLOW);
				}
				//Equipped body slot
				else if (i_slotJ == 3)
				{
					_background.drawRect(207, 70, 64, 64, FlxColor.YELLOW);
				}
			}
			else if (i_slotI == 2)
			{
				//Legs slot 1
				if (i_slotJ == 0)
				{
					_background.drawRect(3, 136, 64, 64, FlxColor.YELLOW);
				}
				//Legs slot 2
				else if (i_slotJ == 1)
				{
					_background.drawRect(69, 136, 64, 64, FlxColor.YELLOW);
				}
				//Legs slot 3
				else if (i_slotJ == 2)
				{
					_background.drawRect(136, 136, 64, 64, FlxColor.YELLOW);
				}
				//Equipped legs slot
				else if (i_slotJ == 3)
				{
					_background.drawRect(207, 136, 64, 64, FlxColor.YELLOW);
				}
			}
		}*/
		
		//Subsets of clothing
		for (i in 0...3)
		{
			for (j in 0...4)
			{
				if (inventory[i][j] != "" && inventory_items[i][j] == null)
				{
					//Head pieces
					if (i == 0)
					{
						if (j == 0)
						{
							inventory_items[i][j] = new Item(_background.x + 3,  _background.y + 3, inventory[i][j], "head");
							(inventory_items[i][j]).animation.frameIndex = 0;
							_backHead1 = inventory_items[i][j];
							//_backHead1 = new Item(_background.x + 3, _background.y + 3, inventory[i][j], "head");
							add(_backHead1);
							//add(inventory_items[i][j]);
							//inventory_items[i][j] = _backHead1;
						}
						else if (j == 1)
						{
							 inventory_items[i][j] = new Item(_background.x + 68, _background.y + 3, inventory[i][j], "head");
							 (inventory_items[i][j]).animation.frameIndex = 0;
							 _backHead2 = inventory_items[i][j];
							//_backHead2 = new Item(_background.x + 68, _background.y + 3, inventory[i][j], "head");
							add(_backHead2);
							//inventory_items[i][j] = _backHead2;
						}
						else if (j == 2)
						{
							inventory_items[i][j] = new Item(_background.x + 133, _background.y + 3, inventory[i][j], "head");
							(inventory_items[i][j]).animation.frameIndex = 0;
							_backHead3 = inventory_items[i][j];
							//_backHead3 = new Item(_background.x + 133, _background.y + 3, inventory[i][j], "head");
							add(_backHead3);
							//inventory_items[i][j] = _backHead3;
						}
						else if (j == 3)
						{
							inventory_items[i][j] = new Item(_background.x + _background.width - 68, _background.y + 3, inventory[i][j], "head");
							(inventory_items[i][j]).animation.frameIndex = 0;
							_backEquippedHead = inventory_items[i][j];
							//_backEquippedHead = new Item(_background.x + _background.width - 68, _background.y + 3, inventory[i][j], "head");
							add(_backEquippedHead);
							//inventory_items[i][j] = _backEquippedHead;
						}
						
					}
					//Body pieces
					else if (i == 1)
					{
						if (j == 0)
						{
							inventory_items[i][j] = new Item(_background.x + 3, _background.y + 69, inventory[i][j], "body");
							(inventory_items[i][j]).animation.frameIndex = 1;
							_backBody1 = inventory_items[i][j];
							//_backBody1 = new Item(_background.x + 3, _background.y + 69, inventory[i][j], "body");
							add(_backBody1);
							//inventory_items[i][j] = _backBody1;
						}
						else if (j == 1)
						{
							inventory_items[i][j] = new Item(_background.x + 68, _background.y + 69, inventory[i][j], "body");
							(inventory_items[i][j]).animation.frameIndex = 1;
							_backBody2 = inventory_items[i][j];
							//_backBody2 = new Item(_background.x + 68, _background.y + 69, inventory[i][j], "body");
							add(_backBody2);
							//inventory_items[i][j] = _backBody2;
						}
						else if (j == 2)
						{
							inventory_items[i][j] = new Item(_background.x + 133, _background.y + 69, inventory[i][j], "body");
							(inventory_items[i][j]).animation.frameIndex = 1;
							_backBody3 = inventory_items[i][j];
							//_backBody3 = new Item(_background.x + 133, _background.y + 69, inventory[i][j], "body");
							add(_backBody3);
							//inventory_items[i][j] = _backBody3;
						}
						else if (j == 3)
						{
							inventory_items[i][j] = new Item(_background.x + _background.width - 68, _background.y + 69, inventory[i][j], "body");
							(inventory_items[i][j]).animation.frameIndex = 1;
							_backEquippedBody = inventory_items[i][j];
							//_backEquippedBody = new Item(_background.x + _background.width - 68, _background.y + 68, inventory[i][j], "body");
							add(_backEquippedBody);
							//inventory_items[i][j] = _backEquippedBody;
						}
					}
					//Leg pieces
					else if (i == 2)
					{
						if (j == 0)
						{
							inventory_items[i][j] = new Item(_background.x + 3, _background.y + 136, inventory[i][j], "legs");
							(inventory_items[i][j]).animation.frameIndex = 2;
							_backLegs1 = inventory_items[i][j];
							//_backLegs1 = new Item(_background.x + 3, _background.y + 135, inventory[i][j], "legs");
							add(_backLegs1);
							//inventory_items[i][j] = _backLegs1;
						}
						else if (j == 1)
						{
							inventory_items[i][j] = new Item(_background.x + 68, _background.y + 136, inventory[i][j], "legs");
							(inventory_items[i][j]).animation.frameIndex = 2;
							_backLegs2 = inventory_items[i][j];
							//_backLegs2 = new Item(_background.x + 68, _background.y + 135, inventory[i][j], "legs");
							add(_backLegs2);
							//inventory_items[i][j] = _backLegs2;
						}
						else if (j == 2)
						{
							inventory_items[i][j] = new Item(_background.x + 133, _background.y + 136, inventory[i][j], "legs");
							(inventory_items[i][j]).animation.frameIndex = 2;
							_backLegs3 = inventory_items[i][j];
							//_backLegs3 = new Item(_background.x + 133, _background.y + 135, inventory[i][j], "legs");
							add(_backLegs3);
							//inventory_items[i][j] = _backLegs3;
						}
						else if (j == 3)
						{
							inventory_items[i][j] = new Item(_background.x + _background.width - 67, _background.y + 136, inventory[i][j], "legs");
							(inventory_items[i][j]).animation.frameIndex = 2;
							_backEquippedLegs = inventory_items[i][j];
							//_backEquippedLegs = new Item(_background.x + _background.width - 67, _background.y + 133, inventory[i][j], "legs");
							add(_backEquippedLegs);
							//inventory_items[i][j] = _backEquipedLegs;
						}
					}
				}
			}
		}
		add(_background);
		forEach(function(spr:FlxSprite)
		{
			spr.scrollFactor.set();
		});
		/*for (spr in _background)
		{
			spr.scrollFactor.set();
		};*/
	}
}