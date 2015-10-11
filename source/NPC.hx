package;
import flixel.FlxG;
import flixel.FlxSprite;

/**
 * ...
 * @author Matte Test
 */
class NPC extends Interactable
{
	public var IsMultipart : Bool;
	
	public var HeadSprite : FlxSprite;
	public var HeadYOffset : Float;
	public var TorsoSprite : FlxSprite;
	public var TorsoYOffset : Float;
	public var LegsSprite : FlxSprite;
	public var LegsYOffset : Float;
	public var SelectSprite : FlxSprite;
	public var SelectYOffset : Float;
	
	public override function new(InX:Float, InY:Float, InIsMultipart : Bool, Path :String) 
	{
		super(InX, InY);
		
		IsMultipart = InIsMultipart;
		
		SelectYOffset = -32;
		
		SelectSprite = new FlxSprite( x, y + SelectYOffset);
		SelectSprite.loadGraphic("assets/images/halo.png", true, 64, 64);
		SelectSprite.animation.add("Normal", [0,1,2], 0, false);
		SelectSprite.animation.play("Normal");
		add( SelectSprite);
		
		if (IsMultipart)
		{
			LegsYOffset  = -64;
			TorsoYOffset = -64*2;
			HeadYOffset  = -64 * 3 + 64 * .25;
			remove (Sprite);
			
			TorsoSprite = new FlxSprite( x, y + TorsoYOffset);
			TorsoSprite.loadGraphic("assets/images/sprite_sheets/" + Path + ".png", true, 64, 64);
			TorsoSprite.animation.add("Still", [1], 0, false);
			TorsoSprite.animation.play("Still");
			add( TorsoSprite);
			
			LegsSprite = new FlxSprite( x, y + LegsYOffset);
			LegsSprite.loadGraphic("assets/images/sprite_sheets/" + Path + ".png",true,64,64);
			LegsSprite.animation.add("Still", [2]);
			LegsSprite.animation.play("Still");
			add( LegsSprite);
			
			HeadSprite = new FlxSprite( x, y + HeadYOffset);
			HeadSprite.loadGraphic("assets/images/sprite_sheets/" + Path + ".png",true,64,64);
			HeadSprite.animation.add("Still", [0], 0, false);
			HeadSprite.animation.play("Still");
			add( HeadSprite);
		}
		else
		{
			Sprite = new FlxSprite( x, y);
			Sprite.loadGraphic("assets/images/enemies/" + Path + ".png", true, 64, 64);
			Sprite.animation.add("Still", [1], 0, false);
			Sprite.animation.play("Still");
			add( Sprite);
		}
	}
	
	public override function interact()
	{
		FlxG.switchState(new MenuState());
	}
	
	public override function setSubimage( subImage : Int)
	{
		SelectSprite.animation.frameIndex = subImage;
	}
	
}