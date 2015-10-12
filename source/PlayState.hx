package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import openfl.Assets;
import flixel.util.FlxColor;


/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	var blackSquare:FlxSprite;
	var whiteSquare1:FlxSprite; var whiteSquare2:FlxSprite; var whiteSquare3:FlxSprite; var whiteSquare4:FlxSprite; var whiteSquare5:FlxSprite; var whiteSquare6:FlxSprite;
	var whiteSquare7:FlxSprite; var whiteSquare8:FlxSprite; var whiteSquare9:FlxSprite; var whiteSquare10:FlxSprite; var whiteSquare11:FlxSprite; var whiteSquare12:FlxSprite;
	var inventory_items:Array</***********************************/Int>;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		blackSquare = new FlxSprite();
		whiteSquare1 = new FlxSprite(); whiteSquare2 = new FlxSprite(); whiteSquare3 = new FlxSprite(); whiteSquare4 = new FlxSprite();
		whiteSquare5 = new FlxSprite(); whiteSquare6 = new FlxSprite(); whiteSquare7 = new FlxSprite(); whiteSquare8 = new FlxSprite();
		whiteSquare9 = new FlxSprite(); whiteSquare10 = new FlxSprite(); whiteSquare11 = new FlxSprite(); whiteSquare12 = new FlxSprite();
		inventory();
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
		//add(new FlxText(100, 0, 200, "Blah blah blah blah blah", 12));
		//add(new FlxText(100, 50, 200, "Blah blah blah blah blah", 12));
		super.update();
	}
	
	private function inventory():Void
	{
		blackSquare.makeGraphic(160, 105, FlxColor.BLACK);
		whiteSquare1.makeGraphic(32, 32, FlxColor.WHITE); whiteSquare2.makeGraphic(32, 32, FlxColor.WHITE); whiteSquare3.makeGraphic(32, 32, FlxColor.WHITE);
		whiteSquare4.makeGraphic(32, 32, FlxColor.WHITE); whiteSquare5.makeGraphic(32, 32, FlxColor.WHITE); whiteSquare6.makeGraphic(32, 32, FlxColor.WHITE);
		whiteSquare7.makeGraphic(32, 32, FlxColor.WHITE); whiteSquare8.makeGraphic(32, 32, FlxColor.WHITE); whiteSquare9.makeGraphic(32, 32, FlxColor.WHITE);
		whiteSquare10.makeGraphic(32, 32, FlxColor.WHITE); whiteSquare11.makeGraphic(32, 32, FlxColor.WHITE); whiteSquare12.makeGraphic(32, 32, FlxColor.WHITE);
		
		add(blackSquare);
		add(whiteSquare1); add(whiteSquare2); add(whiteSquare3); add(whiteSquare4); add(whiteSquare5); add(whiteSquare6);
		add(whiteSquare7); add(whiteSquare8); add(whiteSquare9); add(whiteSquare10); add(whiteSquare11); add(whiteSquare12);
		
		blackSquare.x = 450; blackSquare.y = 50;
		
		whiteSquare1.x = 453; whiteSquare1.y = 53;
		whiteSquare2.x = 488; whiteSquare2.y = 53;
		whiteSquare3.x = 523; whiteSquare3.y = 53;
		whiteSquare4.x = 578; whiteSquare4.y = 53;
		
		whiteSquare5.x = 453; whiteSquare5.y = 88;
		whiteSquare6.x = 488; whiteSquare6.y = 88;
		whiteSquare7.x = 523; whiteSquare7.y = 88;
		whiteSquare8.x = 578; whiteSquare8.y = 88;
		
		whiteSquare9.x = 453; whiteSquare9.y = 123;
		whiteSquare10.x = 488; whiteSquare10.y = 123;
		whiteSquare11.x = 523; whiteSquare11.y = 123;
		whiteSquare12.x = 578; whiteSquare12.y = 123;
	}
}