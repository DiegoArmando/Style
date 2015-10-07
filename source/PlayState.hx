package;

import flixel.FlxG;
import flixel.FlxBasic;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	public var player : Player;
	public var interactables : Array<Interactable>;
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		
		/// The list of things in the environment that can be interacted with.
		interactables = [];
		/// Add something to it.
		var Disk : Interactable = new Interactable(FlxG.width/2+64, FlxG.height/2);
		Disk.loadGraphic("assets/images/TestAsset.png");
		add (Disk);
		interactables.push(Disk);
		
		// player ini
		player = new Player(FlxG.width/2, FlxG.height/2);
		add( player);
		
		
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
		/// Check to see if we triggered any interactable objects.
		if (FlxG.mouse.justPressed)
		{
			for (item in interactables)
			{
				item.interact( FlxG.mouse.x, FlxG.mouse.y);
			}
		}
		
		super.update();
	}	
}