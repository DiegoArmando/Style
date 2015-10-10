package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/data/data-goes-here.txt", "assets/data/data-goes-here.txt");
			type.set ("assets/data/data-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/auto_tiles.png", "assets/images/auto_tiles.png");
			type.set ("assets/images/auto_tiles.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/auto_tiles2.png", "assets/images/auto_tiles2.png");
			type.set ("assets/images/auto_tiles2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/auto_tiles3.png", "assets/images/auto_tiles3.png");
			type.set ("assets/images/auto_tiles3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Background.csv", "assets/images/Background.csv");
			type.set ("assets/images/Background.csv", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/Background.txt", "assets/images/Background.txt");
			type.set ("assets/images/Background.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/default_auto.txt", "assets/images/default_auto.txt");
			type.set ("assets/images/default_auto.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/DemoRobot.png", "assets/images/DemoRobot.png");
			type.set ("assets/images/DemoRobot.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/images-go-here.txt", "assets/images/images-go-here.txt");
			type.set ("assets/images/images-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/sprite_sheets/android.png", "assets/images/sprite_sheets/android.png");
			type.set ("assets/images/sprite_sheets/android.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/sprite_sheets/baymax.png", "assets/images/sprite_sheets/baymax.png");
			type.set ("assets/images/sprite_sheets/baymax.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/sprite_sheets/DemoRobot.png", "assets/images/sprite_sheets/DemoRobot.png");
			type.set ("assets/images/sprite_sheets/DemoRobot.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/sprite_sheets/minion_bot.png", "assets/images/sprite_sheets/minion_bot.png");
			type.set ("assets/images/sprite_sheets/minion_bot.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/sprite_sheets/minion_bot_L.png", "assets/images/sprite_sheets/minion_bot_L.png");
			type.set ("assets/images/sprite_sheets/minion_bot_L.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/sprite_sheets/mummy.png", "assets/images/sprite_sheets/mummy.png");
			type.set ("assets/images/sprite_sheets/mummy.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/sprite_sheets/octobot.png", "assets/images/sprite_sheets/octobot.png");
			type.set ("assets/images/sprite_sheets/octobot.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/TestAsset.png", "assets/images/TestAsset.png");
			type.set ("assets/images/TestAsset.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Tile 1.png", "assets/images/Tile 1.png");
			type.set ("assets/images/Tile 1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Tile 2.png", "assets/images/Tile 2.png");
			type.set ("assets/images/Tile 2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/TileMap.png", "assets/images/TileMap.png");
			type.set ("assets/images/TileMap.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/TileMap2.png", "assets/images/TileMap2.png");
			type.set ("assets/images/TileMap2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/music/Culex.wav", "assets/music/Culex.wav");
			type.set ("assets/music/Culex.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
			type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
			type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/sounds/beep.ogg", "assets/sounds/beep.ogg");
			type.set ("assets/sounds/beep.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/flixel.ogg", "assets/sounds/flixel.ogg");
			type.set ("assets/sounds/flixel.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/fonts/nokiafc22.ttf", "assets/fonts/nokiafc22.ttf");
			type.set ("assets/fonts/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("assets/fonts/arial.ttf", "assets/fonts/arial.ttf");
			type.set ("assets/fonts/arial.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
