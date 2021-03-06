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
	public var InCombat : Bool = false;
	
	public var name : String = "def name";
	public var Parent : Dynamic;
	
	public var Dialog : Array<String>;
	
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
	

	public override function new(InX:Float, InY:Float, InIsMultipart : Bool, fileName : String, Name : String, InParent : Dynamic) 
	{
		super(InX, InY, "");
		name = Name;
		Parent = InParent;

		setName2();
		
		IsMultipart = InIsMultipart;
		Dialog = new Array<String>();
		SelectYOffset = -32;
		
		SelectSprite = new FlxSprite( x-32, y + SelectYOffset);
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
			
			TorsoSprite = new FlxSprite( x-32, y + TorsoYOffset);
			TorsoSprite.loadGraphic("assets/images/sprite_sheets/" + fileName + ".png", true, 64, 64);
			TorsoSprite.animation.add("Still", [1], 0, false);
			TorsoSprite.animation.play("Still");
			add( TorsoSprite);
			
			LegsSprite = new FlxSprite( x-32, y + LegsYOffset);
			LegsSprite.loadGraphic("assets/images/sprite_sheets/" + fileName + ".png",true,64,64);
			LegsSprite.animation.add("Still", [2]);
			LegsSprite.animation.play("Still");
			add( LegsSprite);
			
			HeadSprite = new FlxSprite( x-32, y + HeadYOffset);
			HeadSprite.loadGraphic("assets/images/sprite_sheets/" + fileName + ".png",true,64,64);
			HeadSprite.animation.add("Still", [0], 0, false);
			HeadSprite.animation.play("Still");
			add( HeadSprite);
		}
		else
		{
			Sprite = new FlxSprite( x-(192/2), y-192);
			Sprite.loadGraphic("assets/images/enemies/" + fileName + "Sheet.png", true, 192, 192);
			Sprite.animation.add("still", [0, 1], 1, true);
			Sprite.animation.play("still");
			add( Sprite);
		}
	}
	
	public override function update()
	{
		
		super.update();
	}
	
	public override function interact(playerArg : Player)
	{
		////trace("active dialog from "+this);
		Parent.playerInDialog = true;
		Parent.dialogHandler.startDialog(this,this.goToBattle);
	}
	
	public function goToBattle()
	{
		StateManager.ENEMIES = ["", name+" A", ""];
		
		if (name == "Lu-E") {
			StateManager.ENEMIES = [name+" A", name+" B", ""];
		}
		
		else if (name == "Minion") {
			StateManager.ENEMIES = ["Minion A", "Minion B", "Minion C"];
		}
		
		else if (name == "Hertz and Mech 2") {
			StateManager.ENEMIES = ["Hertz A", "Hertz B", "Hertz C"];
		}
		
		else if (name == "Baymax") {
			StateManager.ENEMIES = ["Baymax A", "Baymax B", "Baymax C"];
		}
		
		else if (name == "MannoBot") {
			StateManager.ENEMIES = ["MannoBot A", "MannoBot B", "MannoBot C"];
		}
		
		else if (name == "Kirisame") {
			StateManager.ENEMIES = ["Kirisame A", "Kirisame B", "Kirisame C"];
		}
		
		else if (name == "Octobot") {
			StateManager.ENEMIES = ["OctoBot A", "OctoBot B", "OctoBot C"];
		}
		
		InCombat = true;
		
		var battleState = new Battle();
		battleState.playerObject = Parent.player;
		//battleState.setPlayer(playerArg);
		
		////trace("Player members in battlestate before state switch: " + battleState.playerObject.members);
		//parent.remove(parent.
		Parent.map_music.stop();
		StateManager.npcToKill = this;
		Parent.openSubState(battleState);
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