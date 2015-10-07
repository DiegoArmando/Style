package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.tile.FlxTilemap;
import openfl.Assets;
import flixel.util.FlxColor;
import flixel.util.FlxSpriteUtil;
/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	private static inline var TILE_WIDTH:Int = 128;
	private static inline var TILE_HEIGHT:Int = 128;
	
	var levelTiles:FlxTilemap;
	private var _highlightBox:FlxSprite;
	
	override public function create():Void
	{
		super.create();
		//load tile map
		//add tile map
		
		trace("We are getting into create");
		levelTiles = new FlxTilemap();
		
		//levelTiles.auto = FlxTilemap.OFF;
		
		levelTiles.loadMap(Assets.getText("assets/images/Background.csv"), "assets/images/TileMap2.png", TILE_WIDTH, TILE_HEIGHT, FlxTilemap.OFF);
		add(levelTiles);
		
		_highlightBox = new FlxSprite(0, 0);
		_highlightBox.makeGraphic(TILE_WIDTH, TILE_HEIGHT, FlxColor.TRANSPARENT);
		FlxSpriteUtil.drawRect(_highlightBox, 0, 0, TILE_WIDTH - 1, TILE_HEIGHT - 1, FlxColor.TRANSPARENT, { thickness: 1, color: FlxColor.RED });
		add(_highlightBox);
		
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