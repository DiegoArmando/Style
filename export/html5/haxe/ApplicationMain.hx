#if !macro


@:access(lime.app.Application)
@:access(lime.Assets)
@:access(openfl.display.Stage)


class ApplicationMain {
	
	
	public static var config:lime.app.Config;
	public static var preloader:openfl.display.Preloader;
	
	
	public static function create ():Void {
		
		var app = new openfl.display.Application ();
		app.create (config);
		
		var display = new flixel.system.FlxPreloader ();
		
		preloader = new openfl.display.Preloader (display);
		app.setPreloader (preloader);
		preloader.onComplete.add (init);
		preloader.create (config);
		
		#if (js && html5)
		var urls = [];
		var types = [];
		
		
		urls.push ("assets/data/data-goes-here.txt");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/Background.csv");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/Background.txt");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/Background2.csv");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/Background3.csv");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/Background4.csv");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/bars.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/battlebackground.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/bookshelf_book.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/bookshelf_l.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/chest.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/computer.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/computer_l.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/default_auto.txt");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/DemoRobot.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/dialogPanel.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/drawers.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/drawers_l.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/enemies/arm1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/enemies/arm2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/enemies/armSheet.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/enemies/channel1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/enemies/channel2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/enemies/channelSheet.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/enemies/cocoa1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/enemies/cocoa2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/enemies/cocoaSheet.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/enemies/curvea.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/enemies/enemies.7z");
		types.push (lime.Assets.AssetType.BINARY);
		
		
		urls.push ("assets/images/enemies/fobio1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/enemies/fobio2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/enemies/fobioSheet.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/enemies/hm1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/enemies/hm2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/enemies/hmSheet.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/enemies/kitsch1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/enemies/kitsch2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/enemies/kitschSheet.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/enemies/lue1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/enemies/lue2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/enemies/lueSheet.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/enemies/prod1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/enemies/prod2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/enemies/prodSheet.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/floor.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/gate.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/halo.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/images-go-here.txt");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/plant1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/plant2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprite_sheets/android.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprite_sheets/baymax.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprite_sheets/default.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprite_sheets/DemoRobot.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprite_sheets/kirisame_marisa.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprite_sheets/minion_bot.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprite_sheets/minion_bot_L.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprite_sheets/mondrian.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprite_sheets/mummy.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sprite_sheets/octobot.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/TestAsset.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Tile 1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Tile 2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/TileMap.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/TileMap2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/TileMap3.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/titlepage.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/wall.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/music/BattleMusic.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/music/BossMusic.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/music/Culex.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/music/MainMenu.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/music/MapMusic.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/music/music-goes-here.txt");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/sounds/attack.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/battle_start.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/menu.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/menu2.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/sounds-go-here.txt");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/sounds/beep.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/flixel.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/beep.ogg");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/flixel.ogg");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("Nokia Cellphone FC Small");
		types.push (lime.Assets.AssetType.FONT);
		
		
		urls.push ("Arial");
		types.push (lime.Assets.AssetType.FONT);
		
		
		
		if (config.assetsPrefix != null) {
			
			for (i in 0...urls.length) {
				
				if (types[i] != lime.Assets.AssetType.FONT) {
					
					urls[i] = config.assetsPrefix + urls[i];
					
				}
				
			}
			
		}
		
		preloader.load (urls, types);
		#end
		
		var result = app.exec ();
		
		#if (sys && !nodejs && !emscripten)
		Sys.exit (result);
		#end
		
	}
	
	
	public static function init ():Void {
		
		var loaded = 0;
		var total = 0;
		var library_onLoad = function (__) {
			
			loaded++;
			
			if (loaded == total) {
				
				start ();
				
			}
			
		}
		
		preloader = null;
		
		
		
		if (total == 0) {
			
			start ();
			
		}
		
	}
	
	
	public static function main () {
		
		config = {
			
			build: "1",
			company: "HaxeFlixel",
			file: "Stylish Combat",
			fps: 60,
			name: "Stylish Combat",
			orientation: "portrait",
			packageName: "com.example.myapp",
			version: "0.0.1",
			windows: [
				
				{
					antialiasing: 0,
					background: 0,
					borderless: false,
					depthBuffer: false,
					display: 0,
					fullscreen: false,
					hardware: true,
					height: 768,
					parameters: "{}",
					resizable: true,
					stencilBuffer: true,
					title: "Stylish Combat",
					vsync: true,
					width: 1024,
					x: null,
					y: null
				},
			]
			
		};
		
		#if hxtelemetry
		var telemetry = new hxtelemetry.HxTelemetry.Config ();
		telemetry.allocations = true;
		telemetry.host = "localhost";
		telemetry.app_name = config.name;
		Reflect.setField (config, "telemetry", telemetry);
		#end
		
		#if (js && html5)
		#if (munit || utest)
		openfl.Lib.embed (null, 1024, 768, "000000");
		#end
		#else
		create ();
		#end
		
	}
	
	
	public static function start ():Void {
		
		var hasMain = false;
		var entryPoint = Type.resolveClass ("Main");
		
		for (methodName in Type.getClassFields (entryPoint)) {
			
			if (methodName == "main") {
				
				hasMain = true;
				break;
				
			}
			
		}
		
		lime.Assets.initialize ();
		
		if (hasMain) {
			
			Reflect.callMethod (entryPoint, Reflect.field (entryPoint, "main"), []);
			
		} else {
			
			var instance:DocumentClass = Type.createInstance (DocumentClass, []);
			
			/*if (Std.is (instance, openfl.display.DisplayObject)) {
				
				openfl.Lib.current.addChild (cast instance);
				
			}*/
			
		}
		
		openfl.Lib.current.stage.dispatchEvent (new openfl.events.Event (openfl.events.Event.RESIZE, false, false));
		
	}
	
	
	#if neko
	@:noCompletion @:dox(hide) public static function __init__ () {
		
		var loader = new neko.vm.Loader (untyped $loader);
		loader.addPath (haxe.io.Path.directory (Sys.executablePath ()));
		loader.addPath ("./");
		loader.addPath ("@executable_path/");
		
	}
	#end
	
	
}


@:build(DocumentClass.build())
@:keep class DocumentClass extends Main {}


#else


import haxe.macro.Context;
import haxe.macro.Expr;


class DocumentClass {
	
	
	macro public static function build ():Array<Field> {
		
		var classType = Context.getLocalClass ().get ();
		var searchTypes = classType;
		
		while (searchTypes.superClass != null) {
			
			if (searchTypes.pack.length == 2 && searchTypes.pack[1] == "display" && searchTypes.name == "DisplayObject") {
				
				var fields = Context.getBuildFields ();
				
				var method = macro {
					
					openfl.Lib.current.addChild (this);
					super ();
					dispatchEvent (new openfl.events.Event (openfl.events.Event.ADDED_TO_STAGE, false, false));
					
				}
				
				fields.push ({ name: "new", access: [ APublic ], kind: FFun({ args: [], expr: method, params: [], ret: macro :Void }), pos: Context.currentPos () });
				
				return fields;
				
			}
			
			searchTypes = searchTypes.superClass.t.get ();
			
		}
		
		return null;
		
	}
	
	
}


#end
