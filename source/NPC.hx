package;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxSubState;

/**
 * ...
 * @author Matte Test
 */
class NPC extends Interactable
{
	public var IsMultipart : Bool;
	
	public var name : String;
	
	//private var parent : FlxState;
	public var HeadSprite : FlxSprite;
	public var HeadYOffset : Float;
	public var TorsoSprite : FlxSprite;
	public var TorsoYOffset : Float;
	public var LegsSprite : FlxSprite;
	public var LegsYOffset : Float;
	public var SelectSprite : FlxSprite;
	public var SelectYOffset : Float;
	
	private var name2 : String;
	
	public override function new(InX:Float, InY:Float, InIsMultipart : Bool, Path :String, parentRef : PlayState) 
	{
		super(InX, InY);
		name = Path;
		parent = parentRef;
		setName2();
		
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
	
	public override function interact(playerArg : Player)
	{
		trace("Player members in interact: " + playerArg.members);
		StateManager.ENEMIES = ["", name2, ""];
		
		var battleState = new Battle();
		//battleState.setPlayer(playerArg);
		
		//trace("Player members in battlestate before state switch: " + battleState.playerObject.members);
		//parent.remove(parent.
		
		parent.openSubState(battleState);
		//openSubState(battleState);
	}
	
	public override function setSubimage( subImage : Int)
	{
		SelectSprite.animation.frameIndex = subImage;
	}
	
	private function setName2()
	{
		
		/*OTHERNAME.set("arm1", "Arm_Many");
		OTHERNAME.set("channel1", "Channel");
		OTHERNAME.set("cocoa1", "Cocoa");
		OTHERNAME.set("fobio1", "Fobio");
		OTHERNAME.set("hm1", "Hertz");
		OTHERNAME.set("kitsch1", "Kitschy");
		OTHERNAME.set("lue1", "Lu-E");
		OTHERNAME.set("prod1", "Prodder");
		*/
		 
		
		switch(name)
		{
			case "arm1" :
				name2 = "Arm_Many";
			case "channel1" :
				name2 = "Channel";
			case "cocoa1" :
				name2 = "Cocoa";
			case "fobio1":
				name2 = "Fobio";
			case "hm1" :
				name2 = "Hertz";
			case "kitsch1" :
				name2 = "Kitschy";
			case "lue1" :
				name2 = "Lu-E";
			case "prod1" :
				name2 = "Prodder";
			case "android":
				name2 = "Basic";
			case "mummy":
				name2 = "Tough";
		}
	}
	
}