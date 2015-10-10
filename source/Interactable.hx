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
		loadGraphic("assets/images/TestAsset.png", true, 64, 64);
		animation.add("Normal", [0,1,2], 0, false);
		animation.play("Normal");
	}
	
	public function interact( )
	{
		trace("Yeah! I was interacted with!");
	}
	
	public function setSubimage( subImage : Int)
	{
		animation.frameIndex = subImage;
	}
}