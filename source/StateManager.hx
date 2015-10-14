package;

import flixel.FlxState;
import flixel.FlxG;
//import openfl.utils.Dictionary;
/**
 * ...
 * @author Matte Test
 */
class StateManager extends FlxState
{

	public static var ENEMIES:Array<String>;
	public static var X : Float;
	public static var Y : Float;
	public static var play : PlayState;
	public static var player : Player;
	//var player : Player;
	//public static var OTHERNAME: Dictionary < String, String>;
	
	override public function create():Void
	{
		super.create();

		play = new PlayState();
		FlxG.switchState(play);
	}
	
}