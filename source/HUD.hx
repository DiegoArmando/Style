package;

import flixel.FlxSprite;
import flixel.FlxBasic;
import flixel.FlxG;
import flixel.group.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;
using flixel.util.FlxSpriteUtil;

class HUD extends FlxTypedGroup<FlxSprite>
{
	private var _background:FlxSprite;
	private var _backHead1:FlxSprite; private var _backHead2:FlxSprite; private var _backHead3:FlxSprite; private var _backEquippedHead:FlxSprite;
	private var _backBody1:FlxSprite; private var _backBody2:FlxSprite; private var _backBody3:FlxSprite; private var _backEquippedBody:FlxSprite;
	private var _backLegs1:FlxSprite; private var _backLegs2:FlxSprite; private var _backLegs3:FlxSprite; private var _backEquippedLegs:FlxSprite;
	
	public function new()
	{
		super();
		_background = new FlxSprite().makeGraphic(265, 196, FlxColor.WHITE);
		_background.drawRect(1, 1, 262, 194, FlxColor.BLACK);
		_background.x = 864;
		
		add(_background);
		forEach(function(spr:FlxSprite)
		{
			spr.scrollFactor.set();
		});
	}
	
	public function updateHUD():Void
	{
		
	}
}