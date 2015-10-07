package;

import flixel.FlxSprite;

/**
 * ...
 * @author Andrew Dunetz
 */
class Interactable extends FlxSprite
{
	
	public function new(InX : Float, InY : Float) 
	{
		super( InX, InY);
	}
	
	public function interact( InX : Float, InY : Float)
	{
		/// Check if the point is within us.
		if ((InX > x) && (InX < x + width) && (InY > y) && (InY < y + height))
		{
			action();
		}
		else
		{
			//trace("I was not clicked!");
		}
	}
	
	public function action()
	{
		trace("Did Action");
	}
}