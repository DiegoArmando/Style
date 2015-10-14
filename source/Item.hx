package;

import flixel.FlxSprite;

class Item extends FlxSprite
{
	public var asset_path:String;
	public var clothing_type:String;
	public var clothing_index:Int;
	
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
		
		if (asset_path == "assets/images/sprite_sheets/minion_bot.png") {	clothing_index = 1;	}
		if (asset_path == "assets/images/sprite_sheets/android.png") {	clothing_index = 2;	}
		if (asset_path == "assets/images/sprite_sheets/baymax.png") {	clothing_index = 3;	}
		if (asset_path == "assets/images/sprite_sheets/kirisame_marisa.png") {	clothing_index = 4;	}
		if (asset_path == "assets/images/sprite_sheets/mondrian.png") {	clothing_index = 5;	}
		if (asset_path == "assets/images/sprite_sheets/mummy.png") {	clothing_index = 6;	}
		if (asset_path == "assets/images/sprite_sheets/octobot.png") {	clothing_index = 7;	}
	}
	
	/*public function move(InX:Float, InY:Float)
	{
		x = InX;
		y = InY;
	}*/
}