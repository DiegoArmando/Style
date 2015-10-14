package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.system.FlxSound;
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
	
	public var stateMem : PlayState;
	var word : FlxGroup;
	
	var text1:FlxText;
	var text2:FlxText;
	var textStylish:FlxText;
	
	var pointer:FlxSprite;
	var pointedOption:Int = 1;
	
	var menu_music:FlxSound;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		word = new FlxGroup();
		FlxG.state.bgColor = FlxColor.BLACK;
		text1 = new FlxText(FlxG.width / 2, FlxG.height / 2, 200, "She knew the robot uprising was inevitable,");
		text1.scale.set(5.0, 5.0);
		text2 = new FlxText(FlxG.width / 2, FlxG.width / 2 - 50, 200, "but she didn't think it would be so"); 
		text2.scale.set(5.0, 5.0);
		var textS1 = new FlxText(text2.x + 40, text2.y + 50, 200, "S");
		textS1.color = FlxColor.RED;
		var textT = new FlxText(textS1.x + 30, textS1.y, 200, "t");
		textT.color = FlxColor.GOLDENROD;
		var textY = new FlxText(textS1.x + 60, textS1.y, 200, "y");
		textY.color = FlxColor.YELLOW;
		var textL = new FlxText(textS1.x + 100, textS1.y, 200, "l");
		textL.color = FlxColor.GREEN;
		var textI = new FlxText(textS1.x + 130, textS1.y, 200, "i");
		textI.color = FlxColor.BLUE;
		var textS2 = new FlxText(textS1.x + 150, textS1.y, 200, "s");
		textS2.color = FlxColor.INDIGO;
		var textH = new FlxText(textS1.x + 180, textS1.y, 200, "h");
		textH.color = FlxColor.PURPLE;
		
		textS1.scale.set(5.0, 5.0);
		textT.scale.set(5.0, 5.0);
		textY.scale.set(5.0, 5.0);
		textL.scale.set(5.0, 5.0);
		textI.scale.set(5.0, 5.0);
		textS2.scale.set(5.0, 5.0);
		textH.scale.set(5.0, 5.0);
		
		word.add(text1);
		word.add(text2);
		word.add(textS1);
		word.add(textT);
		word.add(textY);
		word.add(textL);
		word.add(textI);
		word.add(textS2);
		word.add(textH);
		add(word);
		//pointer = new FlxSprite();
		//pointer.makeGraphic(10, 10, FlxColor.WHITE);
		//pointer.x = option1Text.x - pointer.width - 10;
		//add(pointer);
		
		menu_music = new FlxSound();
		menu_music.loadStream("assets/music/MainMenu.wav", true, false);
		menu_music.play();
	
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
		
		if (FlxG.keys.anyJustPressed(["SPACE", "ENTER"])) {
			menu_music.stop();
			FlxG.switchState(new StateManager());
		}
		super.update();
	}	
}