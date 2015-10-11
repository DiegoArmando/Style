package;
import flixel.FlxG;

/**
 * ...
 * @author Matte Test
 */
class NPC extends Interactable
{

	public override function new(InX:Float, InY:Float, name:String) 
	{
		super(InX, InY);
		loadGraphic("assets/images/enemies/" + name + ".png", true, 64, 64);
		
	}
	
	public override function interact()
	{
		FlxG.switchState(new MenuState());
	}
	
}