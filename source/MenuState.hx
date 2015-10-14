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
	
	var textS1 : FlxText;
	var textT : FlxText;
	var textY : FlxText;
	var textL : FlxText;
	var textI : FlxText;
	var textS2 : FlxText;
	var textH : FlxText;
	
	var enterText : FlxText;
	
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
		
		enterText = new FlxText(text2.x, text2.y + 250, "[press enter]");
		enterText.scale.set(5.0, 5.0);
		enterText.alpha = 0.0;
		add(enterText);
		
		textS1 = new FlxText(text2.x + 40, text2.y + 50, 200, "S");
		textS1.color = FlxColor.RED;
		textT = new FlxText(textS1.x + 30, textS1.y, 200, "t");
		textT.color = FlxColor.GOLDENROD;
		textY = new FlxText(textS1.x + 60, textS1.y, 200, "y");
		textY.color = FlxColor.YELLOW;
		textL = new FlxText(textS1.x + 100, textS1.y, 200, "l");
		textL.color = FlxColor.GREEN;
		textI = new FlxText(textS1.x + 130, textS1.y, 200, "i");
		textI.color = FlxColor.BLUE;
		textS2 = new FlxText(textS1.x + 150, textS1.y, 200, "s");
		textS2.color = FlxColor.INDIGO;
		textH = new FlxText(textS1.x + 180, textS1.y, 200, "h");
		textH.color = FlxColor.PURPLE;
		
		textS1.scale.set(5.0, 5.0);
		textT.scale.set(5.0, 5.0);
		textY.scale.set(5.0, 5.0);
		textL.scale.set(5.0, 5.0);
		textI.scale.set(5.0, 5.0);
		textS2.scale.set(5.0, 5.0);
		textH.scale.set(5.0, 5.0);
		
		textS1.alpha = 0.0;
		textT.alpha = 0.0;
		textY.alpha = 0.0;
		textL.alpha = 0.0;
		textI.alpha = 0.0;
		textS2.alpha = 0.0;
		textH.alpha = 0.0;
		
		add(text1);
		add(text2);
		add(textS1);
		add(textT);
		add(textY);
		add(textL);
		add(textI);
		add(textS2);
		add(textH);
		//add(word);
		
		
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
		
		text1.alpha -= 0.001;
		text2.alpha -= 0.001;
		
		textS1.alpha += 0.002;
		textT.alpha += 0.002;
		textY.alpha += 0.002;
		textL.alpha += 0.002;
		textI.alpha += 0.002;
		textS2.alpha += 0.002;
		textH.alpha += 0.002;
		enterText.alpha += 0.001;
		
		if (FlxG.keys.anyJustPressed(["SPACE", "ENTER"])) {
			menu_music.stop();
			FlxG.switchState(new StateManager());
		}
		super.update();
	}	
}