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
			path.set ("assets/images/Background.csv", "assets/images/Background.csv");
			type.set ("assets/images/Background.csv", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/Background.txt", "assets/images/Background.txt");
			type.set ("assets/images/Background.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/Background2.csv", "assets/images/Background2.csv");
			type.set ("assets/images/Background2.csv", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/Background3.csv", "assets/images/Background3.csv");
			type.set ("assets/images/Background3.csv", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/bars.png", "assets/images/bars.png");
			type.set ("assets/images/bars.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/default_auto.txt", "assets/images/default_auto.txt");
			type.set ("assets/images/default_auto.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/DemoRobot.png", "assets/images/DemoRobot.png");
			type.set ("assets/images/DemoRobot.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/enemies/arm1.png", "assets/images/enemies/arm1.png");
			type.set ("assets/images/enemies/arm1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/enemies/arm2.png", "assets/images/enemies/arm2.png");
			type.set ("assets/images/enemies/arm2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/enemies/channel1.png", "assets/images/enemies/channel1.png");
			type.set ("assets/images/enemies/channel1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/enemies/channel2.png", "assets/images/enemies/channel2.png");
			type.set ("assets/images/enemies/channel2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/enemies/cocoa1.png", "assets/images/enemies/cocoa1.png");
			type.set ("assets/images/enemies/cocoa1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/enemies/cocoa2.png", "assets/images/enemies/cocoa2.png");
			type.set ("assets/images/enemies/cocoa2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/enemies/enemies.7z", "assets/images/enemies/enemies.7z");
			type.set ("assets/images/enemies/enemies.7z", Reflect.field (AssetType, "binary".toUpperCase ()));
			path.set ("assets/images/enemies/fobio1.png", "assets/images/enemies/fobio1.png");
			type.set ("assets/images/enemies/fobio1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/enemies/fobio2.png", "assets/images/enemies/fobio2.png");
			type.set ("assets/images/enemies/fobio2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/enemies/hm1.png", "assets/images/enemies/hm1.png");
			type.set ("assets/images/enemies/hm1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/enemies/hm2.png", "assets/images/enemies/hm2.png");
			type.set ("assets/images/enemies/hm2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/enemies/kitsch1.png", "assets/images/enemies/kitsch1.png");
			type.set ("assets/images/enemies/kitsch1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/enemies/kitsch2.png", "assets/images/enemies/kitsch2.png");
			type.set ("assets/images/enemies/kitsch2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/enemies/lue1.png", "assets/images/enemies/lue1.png");
			type.set ("assets/images/enemies/lue1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/enemies/lue2.png", "assets/images/enemies/lue2.png");
			type.set ("assets/images/enemies/lue2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/enemies/pro2.png", "assets/images/enemies/pro2.png");
			type.set ("assets/images/enemies/pro2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/enemies/prod.png", "assets/images/enemies/prod.png");
			type.set ("assets/images/enemies/prod.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/floor.png", "assets/images/floor.png");
			type.set ("assets/images/floor.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/gate.png", "assets/images/gate.png");
			type.set ("assets/images/gate.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/halo.png", "assets/images/halo.png");
			type.set ("assets/images/halo.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/images-go-here.txt", "assets/images/images-go-here.txt");
			type.set ("assets/images/images-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/plant1.png", "assets/images/plant1.png");
			type.set ("assets/images/plant1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/plant2.png", "assets/images/plant2.png");
			type.set ("assets/images/plant2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/sprite_sheets/android.png", "assets/images/sprite_sheets/android.png");
			type.set ("assets/images/sprite_sheets/android.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/sprite_sheets/baymax.png", "assets/images/sprite_sheets/baymax.png");
			type.set ("assets/images/sprite_sheets/baymax.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/sprite_sheets/default.png", "assets/images/sprite_sheets/default.png");
			type.set ("assets/images/sprite_sheets/default.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/sprite_sheets/DemoRobot.png", "assets/images/sprite_sheets/DemoRobot.png");
			type.set ("assets/images/sprite_sheets/DemoRobot.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/sprite_sheets/kirisame_marisa.png", "assets/images/sprite_sheets/kirisame_marisa.png");
			type.set ("assets/images/sprite_sheets/kirisame_marisa.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/sprite_sheets/minion_bot.png", "assets/images/sprite_sheets/minion_bot.png");
			type.set ("assets/images/sprite_sheets/minion_bot.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/sprite_sheets/minion_bot_L.png", "assets/images/sprite_sheets/minion_bot_L.png");
			type.set ("assets/images/sprite_sheets/minion_bot_L.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/sprite_sheets/mondrian.png", "assets/images/sprite_sheets/mondrian.png");
			type.set ("assets/images/sprite_sheets/mondrian.png", Reflect.field (AssetType, "image".toUpperCase ()));
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
			path.set ("assets/images/TileMap3.png", "assets/images/TileMap3.png");
			type.set ("assets/images/TileMap3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/wall.png", "assets/images/wall.png");
			type.set ("assets/images/wall.png", Reflect.field (AssetType, "image".toUpperCase ()));
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
