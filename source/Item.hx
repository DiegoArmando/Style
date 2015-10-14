package;

import flixel.FlxSprite;

class Item extends FlxSprite
{
	public var asset_path:String;
	public var clothing_type:String;
	
	public function new(InX:Float, InY:Float, InAsset_path:String, InClothing_type:String)
	{
		super();
		asset_path = InAsset_path;
		clothing_type = InClothing_type;
		if (asset_path != "")
		{
			loadGraphic(asset_path, false, 64, 64);
		}
		x = InX;
		y = InY;
	}
	
	public function move(InX:Float, InY:Float)
	{
		x = InX;
		y = InY;
	}
}