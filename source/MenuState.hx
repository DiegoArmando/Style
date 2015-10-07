package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxColor;

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{
	
	public static inline var OPTIONS:Int = 2;
	public static var ENEMIES:Array<String>;
	
	var option1Text:FlxText;
	var option2Text:FlxText;
	
	var pointer:FlxSprite;
	var pointedOption:Int = 1;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		FlxG.state.bgColor = FlxColor.BLACK;
		option1Text = new FlxText(FlxG.width / 2, FlxG.height / 2, 200, "Fight Basic Enemy");
		option2Text = new FlxText(FlxG.width / 2, FlxG.width / 2 - 50, 200, "Fight Tougher Enemy"); 
		option1Text.size = 16;
		option2Text.size = 16;
		add(option1Text);
		add(option2Text);
		pointer = new FlxSprite();
		pointer.makeGraphic(10, 10, FlxColor.WHITE);
		pointer.x = option1Text.x - pointer.width - 10;
		add(pointer);
	
		super.create();
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
		//set y position of cursor based on option choice
		switch(pointedOption) {
			case 1: pointer.y = option1Text.y;
			case 2: pointer.y = option2Text.y;
		}
		
		//listen for keys
		if (FlxG.keys.anyJustPressed(["UP","W"])) {
			pointedOption = pointedOption - 1;
			if (pointedOption < 1) {
				pointedOption = OPTIONS;
			}
		}
		if (FlxG.keys.anyJustPressed(["DOWN","S"])) {
			pointedOption = pointedOption + 1;
			if (pointedOption > OPTIONS) {
				pointedOption = 1;
			}
		}
		if (FlxG.keys.anyJustPressed(["SPACE", "ENTER"])) {
			switch(pointedOption) {
				case 1: FlxG.state.bgColor = FlxColor.BLUE;
						FlxG.switchState(new Battle());
						ENEMIES = ["Basic A", "", "Basic B"];
						FlxG.sound.playMusic("assets/music/Culex.wav", 1, true);
				case 2: FlxG.state.bgColor = FlxColor.RED;
						FlxG.switchState(new Battle());
						ENEMIES = ["Tough", "Basic A", "Basic B"];
						FlxG.sound.playMusic("assets/music/Culex.wav", 1, true);
			}
		}
		super.update();
	}	
}