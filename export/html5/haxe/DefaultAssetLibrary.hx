package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Future;
import lime.app.Preloader;
import lime.app.Promise;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.text.Font;
import lime.utils.ByteArray;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if (js && html5)
import lime.net.URLLoader;
import lime.net.URLRequest;
#elseif flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if (openfl && !flash)
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_arial_ttf);
		
		#end
		
		#if flash
		
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		className.set ("assets/images/Background.csv", __ASSET__assets_images_background_csv);
		type.set ("assets/images/Background.csv", AssetType.TEXT);
		className.set ("assets/images/Background.txt", __ASSET__assets_images_background_txt);
		type.set ("assets/images/Background.txt", AssetType.TEXT);
		className.set ("assets/images/Background2.csv", __ASSET__assets_images_background2_csv);
		type.set ("assets/images/Background2.csv", AssetType.TEXT);
		className.set ("assets/images/Background3.csv", __ASSET__assets_images_background3_csv);
		type.set ("assets/images/Background3.csv", AssetType.TEXT);
		className.set ("assets/images/Background4.csv", __ASSET__assets_images_background4_csv);
		type.set ("assets/images/Background4.csv", AssetType.TEXT);
		className.set ("assets/images/bars.png", __ASSET__assets_images_bars_png);
		type.set ("assets/images/bars.png", AssetType.IMAGE);
		className.set ("assets/images/battlebackground.png", __ASSET__assets_images_battlebackground_png);
		type.set ("assets/images/battlebackground.png", AssetType.IMAGE);
		className.set ("assets/images/bookshelf_book.png", __ASSET__assets_images_bookshelf_book_png);
		type.set ("assets/images/bookshelf_book.png", AssetType.IMAGE);
		className.set ("assets/images/bookshelf_l.png", __ASSET__assets_images_bookshelf_l_png);
		type.set ("assets/images/bookshelf_l.png", AssetType.IMAGE);
		className.set ("assets/images/chest.png", __ASSET__assets_images_chest_png);
		type.set ("assets/images/chest.png", AssetType.IMAGE);
		className.set ("assets/images/computer.png", __ASSET__assets_images_computer_png);
		type.set ("assets/images/computer.png", AssetType.IMAGE);
		className.set ("assets/images/computer_l.png", __ASSET__assets_images_computer_l_png);
		type.set ("assets/images/computer_l.png", AssetType.IMAGE);
		className.set ("assets/images/default_auto.txt", __ASSET__assets_images_default_auto_txt);
		type.set ("assets/images/default_auto.txt", AssetType.TEXT);
		className.set ("assets/images/DemoRobot.png", __ASSET__assets_images_demorobot_png);
		type.set ("assets/images/DemoRobot.png", AssetType.IMAGE);
		className.set ("assets/images/dialogPanel.png", __ASSET__assets_images_dialogpanel_png);
		type.set ("assets/images/dialogPanel.png", AssetType.IMAGE);
		className.set ("assets/images/drawers.png", __ASSET__assets_images_drawers_png);
		type.set ("assets/images/drawers.png", AssetType.IMAGE);
		className.set ("assets/images/drawers_l.png", __ASSET__assets_images_drawers_l_png);
		type.set ("assets/images/drawers_l.png", AssetType.IMAGE);
		className.set ("assets/images/enemies/arm1.png", __ASSET__assets_images_enemies_arm1_png);
		type.set ("assets/images/enemies/arm1.png", AssetType.IMAGE);
		className.set ("assets/images/enemies/arm2.png", __ASSET__assets_images_enemies_arm2_png);
		type.set ("assets/images/enemies/arm2.png", AssetType.IMAGE);
		className.set ("assets/images/enemies/armSheet.png", __ASSET__assets_images_enemies_armsheet_png);
		type.set ("assets/images/enemies/armSheet.png", AssetType.IMAGE);
		className.set ("assets/images/enemies/channel1.png", __ASSET__assets_images_enemies_channel1_png);
		type.set ("assets/images/enemies/channel1.png", AssetType.IMAGE);
		className.set ("assets/images/enemies/channel2.png", __ASSET__assets_images_enemies_channel2_png);
		type.set ("assets/images/enemies/channel2.png", AssetType.IMAGE);
		className.set ("assets/images/enemies/channelSheet.png", __ASSET__assets_images_enemies_channelsheet_png);
		type.set ("assets/images/enemies/channelSheet.png", AssetType.IMAGE);
		className.set ("assets/images/enemies/cocoa1.png", __ASSET__assets_images_enemies_cocoa1_png);
		type.set ("assets/images/enemies/cocoa1.png", AssetType.IMAGE);
		className.set ("assets/images/enemies/cocoa2.png", __ASSET__assets_images_enemies_cocoa2_png);
		type.set ("assets/images/enemies/cocoa2.png", AssetType.IMAGE);
		className.set ("assets/images/enemies/cocoaSheet.png", __ASSET__assets_images_enemies_cocoasheet_png);
		type.set ("assets/images/enemies/cocoaSheet.png", AssetType.IMAGE);
		className.set ("assets/images/enemies/curvea.png", __ASSET__assets_images_enemies_curvea_png);
		type.set ("assets/images/enemies/curvea.png", AssetType.IMAGE);
		className.set ("assets/images/enemies/enemies.7z", __ASSET__assets_images_enemies_enemies_7z);
		type.set ("assets/images/enemies/enemies.7z", AssetType.BINARY);
		className.set ("assets/images/enemies/fobio1.png", __ASSET__assets_images_enemies_fobio1_png);
		type.set ("assets/images/enemies/fobio1.png", AssetType.IMAGE);
		className.set ("assets/images/enemies/fobio2.png", __ASSET__assets_images_enemies_fobio2_png);
		type.set ("assets/images/enemies/fobio2.png", AssetType.IMAGE);
		className.set ("assets/images/enemies/fobioSheet.png", __ASSET__assets_images_enemies_fobiosheet_png);
		type.set ("assets/images/enemies/fobioSheet.png", AssetType.IMAGE);
		className.set ("assets/images/enemies/hm1.png", __ASSET__assets_images_enemies_hm1_png);
		type.set ("assets/images/enemies/hm1.png", AssetType.IMAGE);
		className.set ("assets/images/enemies/hm2.png", __ASSET__assets_images_enemies_hm2_png);
		type.set ("assets/images/enemies/hm2.png", AssetType.IMAGE);
		className.set ("assets/images/enemies/hmSheet.png", __ASSET__assets_images_enemies_hmsheet_png);
		type.set ("assets/images/enemies/hmSheet.png", AssetType.IMAGE);
		className.set ("assets/images/enemies/kitsch1.png", __ASSET__assets_images_enemies_kitsch1_png);
		type.set ("assets/images/enemies/kitsch1.png", AssetType.IMAGE);
		className.set ("assets/images/enemies/kitsch2.png", __ASSET__assets_images_enemies_kitsch2_png);
		type.set ("assets/images/enemies/kitsch2.png", AssetType.IMAGE);
		className.set ("assets/images/enemies/kitschSheet.png", __ASSET__assets_images_enemies_kitschsheet_png);
		type.set ("assets/images/enemies/kitschSheet.png", AssetType.IMAGE);
		className.set ("assets/images/enemies/lue1.png", __ASSET__assets_images_enemies_lue1_png);
		type.set ("assets/images/enemies/lue1.png", AssetType.IMAGE);
		className.set ("assets/images/enemies/lue2.png", __ASSET__assets_images_enemies_lue2_png);
		type.set ("assets/images/enemies/lue2.png", AssetType.IMAGE);
		className.set ("assets/images/enemies/lueSheet.png", __ASSET__assets_images_enemies_luesheet_png);
		type.set ("assets/images/enemies/lueSheet.png", AssetType.IMAGE);
		className.set ("assets/images/enemies/prod1.png", __ASSET__assets_images_enemies_prod1_png);
		type.set ("assets/images/enemies/prod1.png", AssetType.IMAGE);
		className.set ("assets/images/enemies/prod2.png", __ASSET__assets_images_enemies_prod2_png);
		type.set ("assets/images/enemies/prod2.png", AssetType.IMAGE);
		className.set ("assets/images/enemies/prodSheet.png", __ASSET__assets_images_enemies_prodsheet_png);
		type.set ("assets/images/enemies/prodSheet.png", AssetType.IMAGE);
		className.set ("assets/images/floor.png", __ASSET__assets_images_floor_png);
		type.set ("assets/images/floor.png", AssetType.IMAGE);
		className.set ("assets/images/gate.png", __ASSET__assets_images_gate_png);
		type.set ("assets/images/gate.png", AssetType.IMAGE);
		className.set ("assets/images/halo.png", __ASSET__assets_images_halo_png);
		type.set ("assets/images/halo.png", AssetType.IMAGE);
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		className.set ("assets/images/plant1.png", __ASSET__assets_images_plant1_png);
		type.set ("assets/images/plant1.png", AssetType.IMAGE);
		className.set ("assets/images/plant2.png", __ASSET__assets_images_plant2_png);
		type.set ("assets/images/plant2.png", AssetType.IMAGE);
		className.set ("assets/images/sprite_sheets/android.png", __ASSET__assets_images_sprite_sheets_android_png);
		type.set ("assets/images/sprite_sheets/android.png", AssetType.IMAGE);
		className.set ("assets/images/sprite_sheets/baymax.png", __ASSET__assets_images_sprite_sheets_baymax_png);
		type.set ("assets/images/sprite_sheets/baymax.png", AssetType.IMAGE);
		className.set ("assets/images/sprite_sheets/default.png", __ASSET__assets_images_sprite_sheets_default_png);
		type.set ("assets/images/sprite_sheets/default.png", AssetType.IMAGE);
		className.set ("assets/images/sprite_sheets/DemoRobot.png", __ASSET__assets_images_sprite_sheets_demorobot_png);
		type.set ("assets/images/sprite_sheets/DemoRobot.png", AssetType.IMAGE);
		className.set ("assets/images/sprite_sheets/kirisame_marisa.png", __ASSET__assets_images_sprite_sheets_kirisame_marisa_png);
		type.set ("assets/images/sprite_sheets/kirisame_marisa.png", AssetType.IMAGE);
		className.set ("assets/images/sprite_sheets/minion_bot.png", __ASSET__assets_images_sprite_sheets_minion_bot_png);
		type.set ("assets/images/sprite_sheets/minion_bot.png", AssetType.IMAGE);
		className.set ("assets/images/sprite_sheets/minion_bot_L.png", __ASSET__assets_images_sprite_sheets_minion_bot_l_png);
		type.set ("assets/images/sprite_sheets/minion_bot_L.png", AssetType.IMAGE);
		className.set ("assets/images/sprite_sheets/mondrian.png", __ASSET__assets_images_sprite_sheets_mondrian_png);
		type.set ("assets/images/sprite_sheets/mondrian.png", AssetType.IMAGE);
		className.set ("assets/images/sprite_sheets/mummy.png", __ASSET__assets_images_sprite_sheets_mummy_png);
		type.set ("assets/images/sprite_sheets/mummy.png", AssetType.IMAGE);
		className.set ("assets/images/sprite_sheets/octobot.png", __ASSET__assets_images_sprite_sheets_octobot_png);
		type.set ("assets/images/sprite_sheets/octobot.png", AssetType.IMAGE);
		className.set ("assets/images/TestAsset.png", __ASSET__assets_images_testasset_png);
		type.set ("assets/images/TestAsset.png", AssetType.IMAGE);
		className.set ("assets/images/Tile 1.png", __ASSET__assets_images_tile_1_png);
		type.set ("assets/images/Tile 1.png", AssetType.IMAGE);
		className.set ("assets/images/Tile 2.png", __ASSET__assets_images_tile_2_png);
		type.set ("assets/images/Tile 2.png", AssetType.IMAGE);
		className.set ("assets/images/TileMap.png", __ASSET__assets_images_tilemap_png);
		type.set ("assets/images/TileMap.png", AssetType.IMAGE);
		className.set ("assets/images/TileMap2.png", __ASSET__assets_images_tilemap2_png);
		type.set ("assets/images/TileMap2.png", AssetType.IMAGE);
		className.set ("assets/images/TileMap3.png", __ASSET__assets_images_tilemap3_png);
		type.set ("assets/images/TileMap3.png", AssetType.IMAGE);
		className.set ("assets/images/titlepage.png", __ASSET__assets_images_titlepage_png);
		type.set ("assets/images/titlepage.png", AssetType.IMAGE);
		className.set ("assets/images/wall.png", __ASSET__assets_images_wall_png);
		type.set ("assets/images/wall.png", AssetType.IMAGE);
		className.set ("assets/music/BattleMusic.wav", __ASSET__assets_music_battlemusic_wav);
		type.set ("assets/music/BattleMusic.wav", AssetType.SOUND);
		className.set ("assets/music/BossMusic.wav", __ASSET__assets_music_bossmusic_wav);
		type.set ("assets/music/BossMusic.wav", AssetType.SOUND);
		className.set ("assets/music/Culex.wav", __ASSET__assets_music_culex_wav);
		type.set ("assets/music/Culex.wav", AssetType.SOUND);
		className.set ("assets/music/MainMenu.wav", __ASSET__assets_music_mainmenu_wav);
		type.set ("assets/music/MainMenu.wav", AssetType.SOUND);
		className.set ("assets/music/MapMusic.wav", __ASSET__assets_music_mapmusic_wav);
		type.set ("assets/music/MapMusic.wav", AssetType.SOUND);
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		className.set ("assets/sounds/attack.wav", __ASSET__assets_sounds_attack_wav);
		type.set ("assets/sounds/attack.wav", AssetType.SOUND);
		className.set ("assets/sounds/battle_start.wav", __ASSET__assets_sounds_battle_start_wav);
		type.set ("assets/sounds/battle_start.wav", AssetType.SOUND);
		className.set ("assets/sounds/menu.wav", __ASSET__assets_sounds_menu_wav);
		type.set ("assets/sounds/menu.wav", AssetType.SOUND);
		className.set ("assets/sounds/menu2.wav", __ASSET__assets_sounds_menu2_wav);
		type.set ("assets/sounds/menu2.wav", AssetType.SOUND);
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp3);
		type.set ("assets/sounds/beep.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/beep.ogg", __ASSET__assets_sounds_beep_ogg);
		type.set ("assets/sounds/beep.ogg", AssetType.SOUND);
		className.set ("assets/sounds/flixel.ogg", __ASSET__assets_sounds_flixel_ogg);
		type.set ("assets/sounds/flixel.ogg", AssetType.SOUND);
		className.set ("assets/fonts/nokiafc22.ttf", __ASSET__assets_fonts_nokiafc22_ttf);
		type.set ("assets/fonts/nokiafc22.ttf", AssetType.FONT);
		className.set ("assets/fonts/arial.ttf", __ASSET__assets_fonts_arial_ttf);
		type.set ("assets/fonts/arial.ttf", AssetType.FONT);
		
		
		#elseif html5
		
		var id;
		id = "assets/data/data-goes-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/Background.csv";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/Background.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/Background2.csv";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/Background3.csv";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/Background4.csv";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/bars.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/battlebackground.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/bookshelf_book.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/bookshelf_l.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/chest.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/computer.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/computer_l.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/default_auto.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/DemoRobot.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/dialogPanel.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/drawers.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/drawers_l.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/enemies/arm1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/enemies/arm2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/enemies/armSheet.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/enemies/channel1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/enemies/channel2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/enemies/channelSheet.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/enemies/cocoa1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/enemies/cocoa2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/enemies/cocoaSheet.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/enemies/curvea.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/enemies/enemies.7z";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/enemies/fobio1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/enemies/fobio2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/enemies/fobioSheet.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/enemies/hm1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/enemies/hm2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/enemies/hmSheet.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/enemies/kitsch1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/enemies/kitsch2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/enemies/kitschSheet.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/enemies/lue1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/enemies/lue2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/enemies/lueSheet.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/enemies/prod1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/enemies/prod2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/enemies/prodSheet.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/floor.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/gate.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/halo.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/images-go-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/plant1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/plant2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprite_sheets/android.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprite_sheets/baymax.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprite_sheets/default.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprite_sheets/DemoRobot.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprite_sheets/kirisame_marisa.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprite_sheets/minion_bot.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprite_sheets/minion_bot_L.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprite_sheets/mondrian.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprite_sheets/mummy.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sprite_sheets/octobot.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/TestAsset.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Tile 1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Tile 2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/TileMap.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/TileMap2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/TileMap3.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/titlepage.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/wall.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/music/BattleMusic.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/music/BossMusic.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/music/Culex.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/music/MainMenu.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/music/MapMusic.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/music/music-goes-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/attack.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/battle_start.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/menu.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/menu2.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/sounds-go-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/beep.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/flixel.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/beep.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/flixel.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/fonts/nokiafc22.ttf";
		className.set (id, __ASSET__assets_fonts_nokiafc22_ttf);
		
		type.set (id, AssetType.FONT);
		id = "assets/fonts/arial.ttf";
		className.set (id, __ASSET__assets_fonts_arial_ttf);
		
		type.set (id, AssetType.FONT);
		
		
		var assetsPrefix = null;
		if (ApplicationMain.config != null && Reflect.hasField (ApplicationMain.config, "assetsPrefix")) {
			assetsPrefix = ApplicationMain.config.assetsPrefix;
		}
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/images/Background.csv", __ASSET__assets_images_background_csv);
		type.set ("assets/images/Background.csv", AssetType.TEXT);
		
		className.set ("assets/images/Background.txt", __ASSET__assets_images_background_txt);
		type.set ("assets/images/Background.txt", AssetType.TEXT);
		
		className.set ("assets/images/Background2.csv", __ASSET__assets_images_background2_csv);
		type.set ("assets/images/Background2.csv", AssetType.TEXT);
		
		className.set ("assets/images/Background3.csv", __ASSET__assets_images_background3_csv);
		type.set ("assets/images/Background3.csv", AssetType.TEXT);
		
		className.set ("assets/images/Background4.csv", __ASSET__assets_images_background4_csv);
		type.set ("assets/images/Background4.csv", AssetType.TEXT);
		
		className.set ("assets/images/bars.png", __ASSET__assets_images_bars_png);
		type.set ("assets/images/bars.png", AssetType.IMAGE);
		
		className.set ("assets/images/battlebackground.png", __ASSET__assets_images_battlebackground_png);
		type.set ("assets/images/battlebackground.png", AssetType.IMAGE);
		
		className.set ("assets/images/bookshelf_book.png", __ASSET__assets_images_bookshelf_book_png);
		type.set ("assets/images/bookshelf_book.png", AssetType.IMAGE);
		
		className.set ("assets/images/bookshelf_l.png", __ASSET__assets_images_bookshelf_l_png);
		type.set ("assets/images/bookshelf_l.png", AssetType.IMAGE);
		
		className.set ("assets/images/chest.png", __ASSET__assets_images_chest_png);
		type.set ("assets/images/chest.png", AssetType.IMAGE);
		
		className.set ("assets/images/computer.png", __ASSET__assets_images_computer_png);
		type.set ("assets/images/computer.png", AssetType.IMAGE);
		
		className.set ("assets/images/computer_l.png", __ASSET__assets_images_computer_l_png);
		type.set ("assets/images/computer_l.png", AssetType.IMAGE);
		
		className.set ("assets/images/default_auto.txt", __ASSET__assets_images_default_auto_txt);
		type.set ("assets/images/default_auto.txt", AssetType.TEXT);
		
		className.set ("assets/images/DemoRobot.png", __ASSET__assets_images_demorobot_png);
		type.set ("assets/images/DemoRobot.png", AssetType.IMAGE);
		
		className.set ("assets/images/dialogPanel.png", __ASSET__assets_images_dialogpanel_png);
		type.set ("assets/images/dialogPanel.png", AssetType.IMAGE);
		
		className.set ("assets/images/drawers.png", __ASSET__assets_images_drawers_png);
		type.set ("assets/images/drawers.png", AssetType.IMAGE);
		
		className.set ("assets/images/drawers_l.png", __ASSET__assets_images_drawers_l_png);
		type.set ("assets/images/drawers_l.png", AssetType.IMAGE);
		
		className.set ("assets/images/enemies/arm1.png", __ASSET__assets_images_enemies_arm1_png);
		type.set ("assets/images/enemies/arm1.png", AssetType.IMAGE);
		
		className.set ("assets/images/enemies/arm2.png", __ASSET__assets_images_enemies_arm2_png);
		type.set ("assets/images/enemies/arm2.png", AssetType.IMAGE);
		
		className.set ("assets/images/enemies/armSheet.png", __ASSET__assets_images_enemies_armsheet_png);
		type.set ("assets/images/enemies/armSheet.png", AssetType.IMAGE);
		
		className.set ("assets/images/enemies/channel1.png", __ASSET__assets_images_enemies_channel1_png);
		type.set ("assets/images/enemies/channel1.png", AssetType.IMAGE);
		
		className.set ("assets/images/enemies/channel2.png", __ASSET__assets_images_enemies_channel2_png);
		type.set ("assets/images/enemies/channel2.png", AssetType.IMAGE);
		
		className.set ("assets/images/enemies/channelSheet.png", __ASSET__assets_images_enemies_channelsheet_png);
		type.set ("assets/images/enemies/channelSheet.png", AssetType.IMAGE);
		
		className.set ("assets/images/enemies/cocoa1.png", __ASSET__assets_images_enemies_cocoa1_png);
		type.set ("assets/images/enemies/cocoa1.png", AssetType.IMAGE);
		
		className.set ("assets/images/enemies/cocoa2.png", __ASSET__assets_images_enemies_cocoa2_png);
		type.set ("assets/images/enemies/cocoa2.png", AssetType.IMAGE);
		
		className.set ("assets/images/enemies/cocoaSheet.png", __ASSET__assets_images_enemies_cocoasheet_png);
		type.set ("assets/images/enemies/cocoaSheet.png", AssetType.IMAGE);
		
		className.set ("assets/images/enemies/curvea.png", __ASSET__assets_images_enemies_curvea_png);
		type.set ("assets/images/enemies/curvea.png", AssetType.IMAGE);
		
		className.set ("assets/images/enemies/enemies.7z", __ASSET__assets_images_enemies_enemies_7z);
		type.set ("assets/images/enemies/enemies.7z", AssetType.BINARY);
		
		className.set ("assets/images/enemies/fobio1.png", __ASSET__assets_images_enemies_fobio1_png);
		type.set ("assets/images/enemies/fobio1.png", AssetType.IMAGE);
		
		className.set ("assets/images/enemies/fobio2.png", __ASSET__assets_images_enemies_fobio2_png);
		type.set ("assets/images/enemies/fobio2.png", AssetType.IMAGE);
		
		className.set ("assets/images/enemies/fobioSheet.png", __ASSET__assets_images_enemies_fobiosheet_png);
		type.set ("assets/images/enemies/fobioSheet.png", AssetType.IMAGE);
		
		className.set ("assets/images/enemies/hm1.png", __ASSET__assets_images_enemies_hm1_png);
		type.set ("assets/images/enemies/hm1.png", AssetType.IMAGE);
		
		className.set ("assets/images/enemies/hm2.png", __ASSET__assets_images_enemies_hm2_png);
		type.set ("assets/images/enemies/hm2.png", AssetType.IMAGE);
		
		className.set ("assets/images/enemies/hmSheet.png", __ASSET__assets_images_enemies_hmsheet_png);
		type.set ("assets/images/enemies/hmSheet.png", AssetType.IMAGE);
		
		className.set ("assets/images/enemies/kitsch1.png", __ASSET__assets_images_enemies_kitsch1_png);
		type.set ("assets/images/enemies/kitsch1.png", AssetType.IMAGE);
		
		className.set ("assets/images/enemies/kitsch2.png", __ASSET__assets_images_enemies_kitsch2_png);
		type.set ("assets/images/enemies/kitsch2.png", AssetType.IMAGE);
		
		className.set ("assets/images/enemies/kitschSheet.png", __ASSET__assets_images_enemies_kitschsheet_png);
		type.set ("assets/images/enemies/kitschSheet.png", AssetType.IMAGE);
		
		className.set ("assets/images/enemies/lue1.png", __ASSET__assets_images_enemies_lue1_png);
		type.set ("assets/images/enemies/lue1.png", AssetType.IMAGE);
		
		className.set ("assets/images/enemies/lue2.png", __ASSET__assets_images_enemies_lue2_png);
		type.set ("assets/images/enemies/lue2.png", AssetType.IMAGE);
		
		className.set ("assets/images/enemies/lueSheet.png", __ASSET__assets_images_enemies_luesheet_png);
		type.set ("assets/images/enemies/lueSheet.png", AssetType.IMAGE);
		
		className.set ("assets/images/enemies/prod1.png", __ASSET__assets_images_enemies_prod1_png);
		type.set ("assets/images/enemies/prod1.png", AssetType.IMAGE);
		
		className.set ("assets/images/enemies/prod2.png", __ASSET__assets_images_enemies_prod2_png);
		type.set ("assets/images/enemies/prod2.png", AssetType.IMAGE);
		
		className.set ("assets/images/enemies/prodSheet.png", __ASSET__assets_images_enemies_prodsheet_png);
		type.set ("assets/images/enemies/prodSheet.png", AssetType.IMAGE);
		
		className.set ("assets/images/floor.png", __ASSET__assets_images_floor_png);
		type.set ("assets/images/floor.png", AssetType.IMAGE);
		
		className.set ("assets/images/gate.png", __ASSET__assets_images_gate_png);
		type.set ("assets/images/gate.png", AssetType.IMAGE);
		
		className.set ("assets/images/halo.png", __ASSET__assets_images_halo_png);
		type.set ("assets/images/halo.png", AssetType.IMAGE);
		
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		
		className.set ("assets/images/plant1.png", __ASSET__assets_images_plant1_png);
		type.set ("assets/images/plant1.png", AssetType.IMAGE);
		
		className.set ("assets/images/plant2.png", __ASSET__assets_images_plant2_png);
		type.set ("assets/images/plant2.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprite_sheets/android.png", __ASSET__assets_images_sprite_sheets_android_png);
		type.set ("assets/images/sprite_sheets/android.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprite_sheets/baymax.png", __ASSET__assets_images_sprite_sheets_baymax_png);
		type.set ("assets/images/sprite_sheets/baymax.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprite_sheets/default.png", __ASSET__assets_images_sprite_sheets_default_png);
		type.set ("assets/images/sprite_sheets/default.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprite_sheets/DemoRobot.png", __ASSET__assets_images_sprite_sheets_demorobot_png);
		type.set ("assets/images/sprite_sheets/DemoRobot.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprite_sheets/kirisame_marisa.png", __ASSET__assets_images_sprite_sheets_kirisame_marisa_png);
		type.set ("assets/images/sprite_sheets/kirisame_marisa.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprite_sheets/minion_bot.png", __ASSET__assets_images_sprite_sheets_minion_bot_png);
		type.set ("assets/images/sprite_sheets/minion_bot.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprite_sheets/minion_bot_L.png", __ASSET__assets_images_sprite_sheets_minion_bot_l_png);
		type.set ("assets/images/sprite_sheets/minion_bot_L.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprite_sheets/mondrian.png", __ASSET__assets_images_sprite_sheets_mondrian_png);
		type.set ("assets/images/sprite_sheets/mondrian.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprite_sheets/mummy.png", __ASSET__assets_images_sprite_sheets_mummy_png);
		type.set ("assets/images/sprite_sheets/mummy.png", AssetType.IMAGE);
		
		className.set ("assets/images/sprite_sheets/octobot.png", __ASSET__assets_images_sprite_sheets_octobot_png);
		type.set ("assets/images/sprite_sheets/octobot.png", AssetType.IMAGE);
		
		className.set ("assets/images/TestAsset.png", __ASSET__assets_images_testasset_png);
		type.set ("assets/images/TestAsset.png", AssetType.IMAGE);
		
		className.set ("assets/images/Tile 1.png", __ASSET__assets_images_tile_1_png);
		type.set ("assets/images/Tile 1.png", AssetType.IMAGE);
		
		className.set ("assets/images/Tile 2.png", __ASSET__assets_images_tile_2_png);
		type.set ("assets/images/Tile 2.png", AssetType.IMAGE);
		
		className.set ("assets/images/TileMap.png", __ASSET__assets_images_tilemap_png);
		type.set ("assets/images/TileMap.png", AssetType.IMAGE);
		
		className.set ("assets/images/TileMap2.png", __ASSET__assets_images_tilemap2_png);
		type.set ("assets/images/TileMap2.png", AssetType.IMAGE);
		
		className.set ("assets/images/TileMap3.png", __ASSET__assets_images_tilemap3_png);
		type.set ("assets/images/TileMap3.png", AssetType.IMAGE);
		
		className.set ("assets/images/titlepage.png", __ASSET__assets_images_titlepage_png);
		type.set ("assets/images/titlepage.png", AssetType.IMAGE);
		
		className.set ("assets/images/wall.png", __ASSET__assets_images_wall_png);
		type.set ("assets/images/wall.png", AssetType.IMAGE);
		
		className.set ("assets/music/BattleMusic.wav", __ASSET__assets_music_battlemusic_wav);
		type.set ("assets/music/BattleMusic.wav", AssetType.SOUND);
		
		className.set ("assets/music/BossMusic.wav", __ASSET__assets_music_bossmusic_wav);
		type.set ("assets/music/BossMusic.wav", AssetType.SOUND);
		
		className.set ("assets/music/Culex.wav", __ASSET__assets_music_culex_wav);
		type.set ("assets/music/Culex.wav", AssetType.SOUND);
		
		className.set ("assets/music/MainMenu.wav", __ASSET__assets_music_mainmenu_wav);
		type.set ("assets/music/MainMenu.wav", AssetType.SOUND);
		
		className.set ("assets/music/MapMusic.wav", __ASSET__assets_music_mapmusic_wav);
		type.set ("assets/music/MapMusic.wav", AssetType.SOUND);
		
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/sounds/attack.wav", __ASSET__assets_sounds_attack_wav);
		type.set ("assets/sounds/attack.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/battle_start.wav", __ASSET__assets_sounds_battle_start_wav);
		type.set ("assets/sounds/battle_start.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/menu.wav", __ASSET__assets_sounds_menu_wav);
		type.set ("assets/sounds/menu.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/menu2.wav", __ASSET__assets_sounds_menu2_wav);
		type.set ("assets/sounds/menu2.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp3);
		type.set ("assets/sounds/beep.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/beep.ogg", __ASSET__assets_sounds_beep_ogg);
		type.set ("assets/sounds/beep.ogg", AssetType.SOUND);
		
		className.set ("assets/sounds/flixel.ogg", __ASSET__assets_sounds_flixel_ogg);
		type.set ("assets/sounds/flixel.ogg", AssetType.SOUND);
		
		className.set ("assets/fonts/nokiafc22.ttf", __ASSET__assets_fonts_nokiafc22_ttf);
		type.set ("assets/fonts/nokiafc22.ttf", AssetType.FONT);
		
		className.set ("assets/fonts/arial.ttf", __ASSET__assets_fonts_arial_ttf);
		type.set ("assets/fonts/arial.ttf", AssetType.FONT);
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						onChange.dispatch ();
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if (requestedType == BINARY && (assetType == BINARY || assetType == TEXT || assetType == IMAGE)) {
				
				return true;
				
			} else if (requestedType == null || path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), ByteArray));
		else return AudioBuffer.fromFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return cast (Type.createInstance (className.get (id), []), ByteArray);
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return bitmapData.getPixels (bitmapData.rect);
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);
		
		#elseif html5
		
		var bytes:ByteArray = null;
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var data = loader.data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), ByteArray);
		else return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if flash
		
		var src = Type.createInstance (className.get (id), []);
		
		var font = new Font (src.fontName);
		font.src = src;
		return font;
		
		#elseif html5
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return Font.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Image);
			
		} else {
			
			return Image.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var bytes:ByteArray = null;
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var data = loader.data;
		
		if (Std.is (data, String)) {
			
			return cast data;
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes.readUTFBytes (bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		//if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		//}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String):Future<AudioBuffer> {
		
		var promise = new Promise<AudioBuffer> ();
		
		#if (flash)
		
		if (path.exists (id)) {
			
			var soundLoader = new Sound ();
			soundLoader.addEventListener (Event.COMPLETE, function (event) {
				
				var audioBuffer:AudioBuffer = new AudioBuffer();
				audioBuffer.src = event.currentTarget;
				promise.complete (audioBuffer);
				
			});
			soundLoader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			soundLoader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			soundLoader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getAudioBuffer (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<AudioBuffer> (function () return getAudioBuffer (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadBytes (id:String):Future<ByteArray> {
		
		var promise = new Promise<ByteArray> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				promise.complete (bytes);
				
			});
			loader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.dataFormat = BINARY;
			loader.onComplete.add (function (_):Void {
				
				promise.complete (loader.data);
				
			});
			loader.onProgress.add (function (_, loaded, total) {
				
				if (total == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (loaded / total);
					
				}
				
			});
			loader.onIOError.add (function (_, e) {
				
				promise.error (e);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<ByteArray> (function () return getBytes (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadImage (id:String):Future<Image> {
		
		var promise = new Promise<Image> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				promise.complete (Image.fromBitmapData (bitmapData));
				
			});
			loader.contentLoaderInfo.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.contentLoaderInfo.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var image = new js.html.Image ();
			image.onload = function (_):Void {
				
				promise.complete (Image.fromImageElement (image));
				
			}
			image.onerror = promise.error;
			image.src = path.get (id);
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Image> (function () return getImage (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = ByteArray.readFile ("../Resources/manifest");
			#elseif ios
			var bytes = ByteArray.readFile ("assets/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								#if ios
								path.set (asset.id, "assets/" + asset.path);
								#else
								path.set (asset.id, asset.path);
								#end
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	public override function loadText (id:String):Future<String> {
		
		var promise = new Promise<String> ();
		
		#if html5
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.onComplete.add (function (_):Void {
				
				promise.complete (loader.data);
				
			});
			loader.onProgress.add (function (_, loaded, total) {
				
				if (total == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (loaded / total);
					
				}
				
			});
			loader.onIOError.add (function (_, msg) promise.error (msg));
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getText (id));
			
		}
		
		#else
		
		promise.completeWith (loadBytes (id).then (function (bytes) {
			
			return new Future<String> (function () {
				
				if (bytes == null) {
					
					return null;
					
				} else {
					
					return bytes.readUTFBytes (bytes.length);
					
				}
				
			});
			
		}));
		
		#end
		
		return promise.future;
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__assets_data_data_goes_here_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_background_csv extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_background_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_background2_csv extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_background3_csv extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_background4_csv extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_bars_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_battlebackground_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bookshelf_book_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bookshelf_l_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_chest_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_computer_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_computer_l_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_default_auto_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_demorobot_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_dialogpanel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_drawers_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_drawers_l_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_enemies_arm1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_enemies_arm2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_enemies_armsheet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_enemies_channel1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_enemies_channel2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_enemies_channelsheet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_enemies_cocoa1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_enemies_cocoa2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_enemies_cocoasheet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_enemies_curvea_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_enemies_enemies_7z extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_enemies_fobio1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_enemies_fobio2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_enemies_fobiosheet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_enemies_hm1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_enemies_hm2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_enemies_hmsheet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_enemies_kitsch1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_enemies_kitsch2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_enemies_kitschsheet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_enemies_lue1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_enemies_lue2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_enemies_luesheet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_enemies_prod1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_enemies_prod2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_enemies_prodsheet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_floor_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_gate_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_halo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_images_go_here_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_plant1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_plant2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprite_sheets_android_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprite_sheets_baymax_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprite_sheets_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprite_sheets_demorobot_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprite_sheets_kirisame_marisa_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprite_sheets_minion_bot_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprite_sheets_minion_bot_l_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprite_sheets_mondrian_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprite_sheets_mummy_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sprite_sheets_octobot_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_testasset_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_tile_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_tile_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_tilemap_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_tilemap2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_tilemap3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_titlepage_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_wall_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_music_battlemusic_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_music_bossmusic_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_music_culex_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_music_mainmenu_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_music_mapmusic_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_music_music_goes_here_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_attack_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_battle_start_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_menu_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_menu2_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_beep_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_flixel_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_beep_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_flixel_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_arial_ttf extends null { }


#elseif html5




















































































@:keep #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { super (); name = "Nokia Cellphone FC Small"; } } 
@:keep #if display private #end class __ASSET__assets_fonts_arial_ttf extends lime.text.Font { public function new () { super (); name = "Arial"; } } 


#else



#if (windows || mac || linux || cpp)


@:file("assets/data/data-goes-here.txt") #if display private #end class __ASSET__assets_data_data_goes_here_txt extends lime.utils.ByteArray {}
@:file("assets/images/Background.csv") #if display private #end class __ASSET__assets_images_background_csv extends lime.utils.ByteArray {}
@:file("assets/images/Background.txt") #if display private #end class __ASSET__assets_images_background_txt extends lime.utils.ByteArray {}
@:file("assets/images/Background2.csv") #if display private #end class __ASSET__assets_images_background2_csv extends lime.utils.ByteArray {}
@:file("assets/images/Background3.csv") #if display private #end class __ASSET__assets_images_background3_csv extends lime.utils.ByteArray {}
@:file("assets/images/Background4.csv") #if display private #end class __ASSET__assets_images_background4_csv extends lime.utils.ByteArray {}
@:image("assets/images/bars.png") #if display private #end class __ASSET__assets_images_bars_png extends lime.graphics.Image {}
@:image("assets/images/battlebackground.png") #if display private #end class __ASSET__assets_images_battlebackground_png extends lime.graphics.Image {}
@:image("assets/images/bookshelf_book.png") #if display private #end class __ASSET__assets_images_bookshelf_book_png extends lime.graphics.Image {}
@:image("assets/images/bookshelf_l.png") #if display private #end class __ASSET__assets_images_bookshelf_l_png extends lime.graphics.Image {}
@:image("assets/images/chest.png") #if display private #end class __ASSET__assets_images_chest_png extends lime.graphics.Image {}
@:image("assets/images/computer.png") #if display private #end class __ASSET__assets_images_computer_png extends lime.graphics.Image {}
@:image("assets/images/computer_l.png") #if display private #end class __ASSET__assets_images_computer_l_png extends lime.graphics.Image {}
@:file("assets/images/default_auto.txt") #if display private #end class __ASSET__assets_images_default_auto_txt extends lime.utils.ByteArray {}
@:image("assets/images/DemoRobot.png") #if display private #end class __ASSET__assets_images_demorobot_png extends lime.graphics.Image {}
@:image("assets/images/dialogPanel.png") #if display private #end class __ASSET__assets_images_dialogpanel_png extends lime.graphics.Image {}
@:image("assets/images/drawers.png") #if display private #end class __ASSET__assets_images_drawers_png extends lime.graphics.Image {}
@:image("assets/images/drawers_l.png") #if display private #end class __ASSET__assets_images_drawers_l_png extends lime.graphics.Image {}
@:image("assets/images/enemies/arm1.png") #if display private #end class __ASSET__assets_images_enemies_arm1_png extends lime.graphics.Image {}
@:image("assets/images/enemies/arm2.png") #if display private #end class __ASSET__assets_images_enemies_arm2_png extends lime.graphics.Image {}
@:image("assets/images/enemies/armSheet.png") #if display private #end class __ASSET__assets_images_enemies_armsheet_png extends lime.graphics.Image {}
@:image("assets/images/enemies/channel1.png") #if display private #end class __ASSET__assets_images_enemies_channel1_png extends lime.graphics.Image {}
@:image("assets/images/enemies/channel2.png") #if display private #end class __ASSET__assets_images_enemies_channel2_png extends lime.graphics.Image {}
@:image("assets/images/enemies/channelSheet.png") #if display private #end class __ASSET__assets_images_enemies_channelsheet_png extends lime.graphics.Image {}
@:image("assets/images/enemies/cocoa1.png") #if display private #end class __ASSET__assets_images_enemies_cocoa1_png extends lime.graphics.Image {}
@:image("assets/images/enemies/cocoa2.png") #if display private #end class __ASSET__assets_images_enemies_cocoa2_png extends lime.graphics.Image {}
@:image("assets/images/enemies/cocoaSheet.png") #if display private #end class __ASSET__assets_images_enemies_cocoasheet_png extends lime.graphics.Image {}
@:image("assets/images/enemies/curvea.png") #if display private #end class __ASSET__assets_images_enemies_curvea_png extends lime.graphics.Image {}
@:file("assets/images/enemies/enemies.7z") #if display private #end class __ASSET__assets_images_enemies_enemies_7z extends lime.utils.ByteArray {}
@:image("assets/images/enemies/fobio1.png") #if display private #end class __ASSET__assets_images_enemies_fobio1_png extends lime.graphics.Image {}
@:image("assets/images/enemies/fobio2.png") #if display private #end class __ASSET__assets_images_enemies_fobio2_png extends lime.graphics.Image {}
@:image("assets/images/enemies/fobioSheet.png") #if display private #end class __ASSET__assets_images_enemies_fobiosheet_png extends lime.graphics.Image {}
@:image("assets/images/enemies/hm1.png") #if display private #end class __ASSET__assets_images_enemies_hm1_png extends lime.graphics.Image {}
@:image("assets/images/enemies/hm2.png") #if display private #end class __ASSET__assets_images_enemies_hm2_png extends lime.graphics.Image {}
@:image("assets/images/enemies/hmSheet.png") #if display private #end class __ASSET__assets_images_enemies_hmsheet_png extends lime.graphics.Image {}
@:image("assets/images/enemies/kitsch1.png") #if display private #end class __ASSET__assets_images_enemies_kitsch1_png extends lime.graphics.Image {}
@:image("assets/images/enemies/kitsch2.png") #if display private #end class __ASSET__assets_images_enemies_kitsch2_png extends lime.graphics.Image {}
@:image("assets/images/enemies/kitschSheet.png") #if display private #end class __ASSET__assets_images_enemies_kitschsheet_png extends lime.graphics.Image {}
@:image("assets/images/enemies/lue1.png") #if display private #end class __ASSET__assets_images_enemies_lue1_png extends lime.graphics.Image {}
@:image("assets/images/enemies/lue2.png") #if display private #end class __ASSET__assets_images_enemies_lue2_png extends lime.graphics.Image {}
@:image("assets/images/enemies/lueSheet.png") #if display private #end class __ASSET__assets_images_enemies_luesheet_png extends lime.graphics.Image {}
@:image("assets/images/enemies/prod1.png") #if display private #end class __ASSET__assets_images_enemies_prod1_png extends lime.graphics.Image {}
@:image("assets/images/enemies/prod2.png") #if display private #end class __ASSET__assets_images_enemies_prod2_png extends lime.graphics.Image {}
@:image("assets/images/enemies/prodSheet.png") #if display private #end class __ASSET__assets_images_enemies_prodsheet_png extends lime.graphics.Image {}
@:image("assets/images/floor.png") #if display private #end class __ASSET__assets_images_floor_png extends lime.graphics.Image {}
@:image("assets/images/gate.png") #if display private #end class __ASSET__assets_images_gate_png extends lime.graphics.Image {}
@:image("assets/images/halo.png") #if display private #end class __ASSET__assets_images_halo_png extends lime.graphics.Image {}
@:file("assets/images/images-go-here.txt") #if display private #end class __ASSET__assets_images_images_go_here_txt extends lime.utils.ByteArray {}
@:image("assets/images/plant1.png") #if display private #end class __ASSET__assets_images_plant1_png extends lime.graphics.Image {}
@:image("assets/images/plant2.png") #if display private #end class __ASSET__assets_images_plant2_png extends lime.graphics.Image {}
@:image("assets/images/sprite_sheets/android.png") #if display private #end class __ASSET__assets_images_sprite_sheets_android_png extends lime.graphics.Image {}
@:image("assets/images/sprite_sheets/baymax.png") #if display private #end class __ASSET__assets_images_sprite_sheets_baymax_png extends lime.graphics.Image {}
@:image("assets/images/sprite_sheets/default.png") #if display private #end class __ASSET__assets_images_sprite_sheets_default_png extends lime.graphics.Image {}
@:image("assets/images/sprite_sheets/DemoRobot.png") #if display private #end class __ASSET__assets_images_sprite_sheets_demorobot_png extends lime.graphics.Image {}
@:image("assets/images/sprite_sheets/kirisame_marisa.png") #if display private #end class __ASSET__assets_images_sprite_sheets_kirisame_marisa_png extends lime.graphics.Image {}
@:image("assets/images/sprite_sheets/minion_bot.png") #if display private #end class __ASSET__assets_images_sprite_sheets_minion_bot_png extends lime.graphics.Image {}
@:image("assets/images/sprite_sheets/minion_bot_L.png") #if display private #end class __ASSET__assets_images_sprite_sheets_minion_bot_l_png extends lime.graphics.Image {}
@:image("assets/images/sprite_sheets/mondrian.png") #if display private #end class __ASSET__assets_images_sprite_sheets_mondrian_png extends lime.graphics.Image {}
@:image("assets/images/sprite_sheets/mummy.png") #if display private #end class __ASSET__assets_images_sprite_sheets_mummy_png extends lime.graphics.Image {}
@:image("assets/images/sprite_sheets/octobot.png") #if display private #end class __ASSET__assets_images_sprite_sheets_octobot_png extends lime.graphics.Image {}
@:image("assets/images/TestAsset.png") #if display private #end class __ASSET__assets_images_testasset_png extends lime.graphics.Image {}
@:image("assets/images/Tile 1.png") #if display private #end class __ASSET__assets_images_tile_1_png extends lime.graphics.Image {}
@:image("assets/images/Tile 2.png") #if display private #end class __ASSET__assets_images_tile_2_png extends lime.graphics.Image {}
@:image("assets/images/TileMap.png") #if display private #end class __ASSET__assets_images_tilemap_png extends lime.graphics.Image {}
@:image("assets/images/TileMap2.png") #if display private #end class __ASSET__assets_images_tilemap2_png extends lime.graphics.Image {}
@:image("assets/images/TileMap3.png") #if display private #end class __ASSET__assets_images_tilemap3_png extends lime.graphics.Image {}
@:image("assets/images/titlepage.png") #if display private #end class __ASSET__assets_images_titlepage_png extends lime.graphics.Image {}
@:image("assets/images/wall.png") #if display private #end class __ASSET__assets_images_wall_png extends lime.graphics.Image {}
@:file("assets/music/BattleMusic.wav") #if display private #end class __ASSET__assets_music_battlemusic_wav extends lime.utils.ByteArray {}
@:file("assets/music/BossMusic.wav") #if display private #end class __ASSET__assets_music_bossmusic_wav extends lime.utils.ByteArray {}
@:file("assets/music/Culex.wav") #if display private #end class __ASSET__assets_music_culex_wav extends lime.utils.ByteArray {}
@:file("assets/music/MainMenu.wav") #if display private #end class __ASSET__assets_music_mainmenu_wav extends lime.utils.ByteArray {}
@:file("assets/music/MapMusic.wav") #if display private #end class __ASSET__assets_music_mapmusic_wav extends lime.utils.ByteArray {}
@:file("assets/music/music-goes-here.txt") #if display private #end class __ASSET__assets_music_music_goes_here_txt extends lime.utils.ByteArray {}
@:file("assets/sounds/attack.wav") #if display private #end class __ASSET__assets_sounds_attack_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/battle_start.wav") #if display private #end class __ASSET__assets_sounds_battle_start_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/menu.wav") #if display private #end class __ASSET__assets_sounds_menu_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/menu2.wav") #if display private #end class __ASSET__assets_sounds_menu2_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/sounds-go-here.txt") #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/3,3,11/assets/sounds/beep.mp3") #if display private #end class __ASSET__assets_sounds_beep_mp3 extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/3,3,11/assets/sounds/flixel.mp3") #if display private #end class __ASSET__assets_sounds_flixel_mp3 extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/3,3,11/assets/sounds/beep.ogg") #if display private #end class __ASSET__assets_sounds_beep_ogg extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/3,3,11/assets/sounds/flixel.ogg") #if display private #end class __ASSET__assets_sounds_flixel_ogg extends lime.utils.ByteArray {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/3,3,11/assets/fonts/nokiafc22.ttf") #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends lime.text.Font {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/3,3,11/assets/fonts/arial.ttf") #if display private #end class __ASSET__assets_fonts_arial_ttf extends lime.text.Font {}



#end
#end

#if (openfl && !flash)
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__assets_fonts_nokiafc22_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_arial_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__assets_fonts_arial_ttf (); src = font.src; name = font.name; super (); }}

#end

#end