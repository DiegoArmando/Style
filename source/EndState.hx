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
class EndState extends FlxState
{
	
	
	var menu_music:FlxSound;
	
	var textS1 : FlxText;
	var textT : FlxText;
	var textY : FlxText;
	var textL : FlxText;
	var textI : FlxText;
	var textS2 : FlxText;
	var textH : FlxText;

	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		
		textS1 = new FlxText(700, 400, 200, "W");
		textS1.color = FlxColor.RED;
		textT = new FlxText(textS1.x + 30, textS1.y, 200, "i");
		textT.color = FlxColor.GOLDENROD;
		textY = new FlxText(textS1.x + 60, textS1.y, 200, "n");
		textY.color = FlxColor.YELLOW;
		textL = new FlxText(textS1.x + 100, textS1.y, 200, "n");
		textL.color = FlxColor.GREEN;
		textI = new FlxText(textS1.x + 130, textS1.y, 200, "e");
		textI.color = FlxColor.BLUE;
		textS2 = new FlxText(textS1.x + 150, textS1.y, 200, "r");
		textS2.color = FlxColor.INDIGO;
		textH = new FlxText(textS1.x + 180, textS1.y, 200, "!");
		textH.color = FlxColor.PURPLE;
		
		textS1.scale.set(5.0, 5.0);
		textT.scale.set(5.0, 5.0);
		textY.scale.set(5.0, 5.0);
		textL.scale.set(5.0, 5.0);
		textI.scale.set(5.0, 5.0);
		textS2.scale.set(5.0, 5.0);
		textH.scale.set(5.0, 5.0);
		
		textS1.scrollFactor.set(0.0, 0.0);
		textT.scrollFactor.set(0.0, 0.0);
		textY.scrollFactor.set(0.0, 0.0);
		textL.scrollFactor.set(0.0, 0.0);
		textI.scrollFactor.set(0.0, 0.0);
		textS2.scrollFactor.set(0.0, 0.0);
		textH.scrollFactor.set(0.0, 0.0);
		

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

		super.update();
	}	
}