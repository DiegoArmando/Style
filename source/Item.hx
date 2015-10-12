package;

import flixel.FlxSprite;

class Item extends FlxSprite
{
	var asset_path:String;
	var InClothing_type:String;
	
	public function new(InX:Float, InY:Float, InAsset_path:String, InClothing_type:String)
	{
		super(InX, InY);
		loadGraphic(asset_path, false, 32, 32);
		scale.set(0.5, 0.5);
		x = InX;
		y = InY;
	}
	
	public function move(InX:Float, InY:Float)
	{
		x = InX;
		y = InY;
	}
}