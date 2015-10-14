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
	
	override public function create():Void
	{
		super.create();
		//load tile map
		//add tile map
		
		trace("We are getting into create");
		levelTiles = new FlxTilemap();
		
		//levelTiles.auto = FlxTilemap.OFF;
		
		levelTiles.loadMap(Assets.getText("assets/images/NoWalls.csv"), "assets/images/TileMap3.png", TILE_WIDTH, TILE_HEIGHT, FlxTilemap.OFF);
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
		
		var testBoss = new NPC(3200, 3000, false, "fobio", "Fobio", this);
		testBoss.Dialog.push("HUH, so does it happen to be the case that if you have no dialog, you can't enter battle?");
		testBoss.Dialog.push("Be afraid, for this text is not even showing up.");
		testBoss.Dialog.push("Is it?");
		testBoss.Dialog.push("Oh look, a battle! (hopefully)");
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
		
		var curv = new NPC(1183, 2801, false, "fobio", "Fobio", this);
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