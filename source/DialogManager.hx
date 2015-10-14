package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.util.FlxRect;
import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText;

/**
 * ...
 * @author Andrew
 */
class DialogManager extends FlxSpriteGroup
{
	public var playState : PlayState;
	public var player : Player;
	public var npc : NPC;
	public var displayingDialog : Bool = false;
	public var dialogIndex : UInt = 0;
	
	public var graphicFade : FlxSprite;
	public var graphicBox : FlxSprite;
	public var graphicText : FlxText;
	public var graphicInput : FlxText;
	public var graphicLabel : FlxText;
	
	public var graphicPlayerHeadSprite : FlxSprite;
	public var graphicPlayerTorsoSprite : FlxSprite;
	public var graphicPlayerLegsSprite : FlxSprite;
	
	public var graphicNPCHeadSprite : FlxSprite;
	public var graphicNPCTorsoSprite : FlxSprite;
	public var graphicNPCLegsSprite : FlxSprite;
	
	public var graphicNPCSimple : FlxSprite;
	
	public var callbackFunction : Dynamic;	
	
	public function new(InPlayer : Player, InState : PlayState) 
	{
		super (0, 0); 
		
		x = 0;
		y = 0;
		scrollFactor.x = scrollFactor.y = 0;
		player = InPlayer;
		playState = InState;
		
		graphicFade = new FlxSprite();
		graphicFade.makeGraphic(1024, 768, 0x88000000);
		graphicFade.scrollFactor.x = 0;
		graphicFade.scrollFactor.y = 0;
		graphicFade.offset.x = 0;
		graphicFade.offset.y = 0;
		graphicFade.x = 0;
		graphicFade.y = 0;
		
		graphicBox = new FlxSprite();
		graphicBox.scrollFactor.x = 0;
		graphicBox.scrollFactor.y = 0;
		graphicBox.loadGraphic("assets/images/dialogPanel.png", false, 1024, 256);
		graphicBox.y = camera.height - 256;
		
		graphicLabel = new FlxText();
		graphicLabel.alignment = "left";
		graphicLabel.scrollFactor.x = 0;
		graphicLabel.scrollFactor.y = 0;
		graphicLabel.y = camera.height - (256 - 36);
		graphicLabel.text = "Default Text";
		graphicLabel.width = 1024 - 32;
		graphicLabel.color = 0xff000000;
		graphicLabel.size = 16;
		graphicLabel.x = 16;
		
		graphicText = new FlxText();
		graphicText.alignment = "left";
		graphicText.scrollFactor.x = 0;
		graphicText.scrollFactor.y = 0;
		graphicText.y = camera.height - (256 - 64);
		graphicText.text = "Default Text";
		graphicText.width = 1024 - 32;
		graphicText.color = 0xff000000;
		graphicText.size = 16;
		graphicText.x = 16;
		
		graphicInput = new FlxText();
		graphicInput.alignment = "left";
		graphicInput.scrollFactor.x = 0;
		graphicInput.scrollFactor.y = 0;
		graphicInput.y = camera.height - (256-4);
		graphicInput.text = "SPACE to Fight OR ENTER to Exit Dialog";
		graphicInput.width = 1024 - 32;
		graphicInput.color = 0xff992222;
		graphicInput.size = 16;
		graphicInput.x = 16;
	}
	
	public function startDialog( InNpc : NPC, InCallbackFunction : Dynamic )
	{
		//trace("start dialog");
		npc = InNpc;
		if ( player!=null && npc!=null)
		{
			callbackFunction = InCallbackFunction;
			
			displayingDialog = true;
			playState.playerInDialog = true;
			player.AllowMovement = false;
			
			var closeScale = 3;
			
			add( graphicFade);
			if (npc.IsMultipart)
			{
				graphicNPCHeadSprite = displayPart( npc.HeadSprite, closeScale, npc.HeadYOffset, camera.width - 128 );
				graphicNPCTorsoSprite = displayPart( npc.TorsoSprite, closeScale, npc.TorsoYOffset, camera.width - 128 );
				graphicNPCLegsSprite = displayPart( npc.LegsSprite, closeScale, npc.LegsYOffset, camera.width - 128 );
				
				graphicPlayerHeadSprite = displayPart( player.HeadSprite, closeScale, player.HeadYOffset, 128 );
				graphicPlayerTorsoSprite = displayPart( player.TorsoSprite, closeScale, player.TorsoYOffset, 128 );
				graphicPlayerLegsSprite = displayPart( player.LegsSprite, closeScale, player.LegsYOffset, 128 );
				
				graphicPlayerHeadSprite.scale.x = -closeScale;
				graphicPlayerTorsoSprite.scale.x = -closeScale;
				graphicPlayerLegsSprite.scale.x = -closeScale;
			}
			else
			{
				graphicNPCSimple = displayPart( npc.Sprite, closeScale, -128, camera.width - 192 );
			}
			
			add( graphicBox);
			add( graphicText);
			add(graphicLabel);
			
			graphicLabel.text = npc.name;
			graphicText.text = npc.Dialog[dialogIndex];
		}
	}
	
	public function displayPart( sourceSprite : FlxSprite, closeScale : Int, PartOffset : Float, xLocation : Float ) : FlxSprite
	{
		var newSprite : FlxSprite = sourceSprite.clone();
		newSprite.scale.x = closeScale;  
		newSprite.scale.y = closeScale;
		newSprite.x = xLocation;
		newSprite.y = camera.height + PartOffset * closeScale - 64;
		newSprite.scrollFactor.x = 0;
		newSprite.scrollFactor.y = 0;
		add(newSprite );
		return newSprite;
	}
	
	public override function update()
	{		
		if (displayingDialog)
		{
			if (FlxG.keys.anyJustPressed(["space"]))
			{
				//trace("dialog SPACE");
				dialogIndex++;
				if (dialogIndex < npc.Dialog.length)
				{
					graphicText.text = npc.Dialog[dialogIndex];
					if (dialogIndex == npc.Dialog.length - 1)
					{
						add(graphicInput);
					}
				}
				else
				{
					//trace ("dialog SPACE terminate");
					terminateDialog();
					playState.delayInteract = true;
				}
			}
			else if ((dialogIndex >= npc.Dialog.length-1) && (FlxG.keys.anyJustReleased(["enter"])))
			{
				terminateDialog();
				callbackFunction();
			}
		}
		super.update();
	}
	
	public function terminateDialog()
	{
		if (npc.IsMultipart)
		{
		remove(graphicNPCHeadSprite    );
		remove(graphicNPCTorsoSprite   );
		remove(graphicNPCLegsSprite    );
		remove(graphicPlayerHeadSprite );
		remove(graphicPlayerTorsoSprite);
		remove(graphicPlayerLegsSprite );
		
		    graphicNPCHeadSprite.destroy();
		   graphicNPCTorsoSprite.destroy();
		    graphicNPCLegsSprite.destroy();
		 graphicPlayerHeadSprite.destroy();
		graphicPlayerTorsoSprite.destroy();
		 graphicPlayerLegsSprite.destroy();
		 
		    graphicNPCHeadSprite = null;
		   graphicNPCTorsoSprite = null;
		    graphicNPCLegsSprite = null;
		 graphicPlayerHeadSprite = null;
		graphicPlayerTorsoSprite = null;
		 graphicPlayerLegsSprite = null;
		}
		else
		{
			remove(graphicNPCSimple);
			graphicNPCSimple.destroy();
			graphicNPCSimple = null;
		}
		
		remove(graphicBox );
		remove(graphicFade);
		remove(graphicText);
		remove(graphicInput);
		remove(graphicLabel);
		
		dialogIndex = 0;
		npc = null;
		
		displayingDialog = false;
		playState.playerInDialog = false;
		player.AllowMovement = true;
	}
}