package;

import flixel.FlxSprite;
import flixel.group.FlxGroup;

/**
 * ...
 * @author Andrew Dunetz
 */
class Interactable extends FlxGroup
{
	public var Sprite : FlxSprite;
	
	public var x : Float;
	public var y : Float;
	
	public function new(InX : Float, InY : Float, InPath : String) 
	{
		super( );
		
		x = InX;
		y = InY;
		if (InPath != "")
		{
			Sprite = new FlxSprite(InX, InY);
			Sprite.loadGraphic(InPath, true, 64, 64);
			Sprite.animation.add("Normal", [0,1,2], 0, false);
			Sprite.animation.play("Normal");
			add (Sprite);
		}
	}
	
	public function interact( )
	{
		trace("Yeah! I was interacted with!");
	}
	
	public function setSubimage( subImage : Int)
	{
		Sprite.animation.frameIndex = subImage;
	}
}