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
	
	public var graphicPlayerHeadSprite : FlxSprite;
	public var graphicPlayerTorsoSprite : FlxSprite;
	public var graphicPlayerLegsSprite : FlxSprite;
	
	public var graphicNPCHeadSprite : FlxSprite;
	public var graphicNPCTorsoSprite : FlxSprite;
	public var graphicNPCLegsSprite : FlxSprite;
	
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
		graphicFade.offset.x = 0;
		graphicFade.offset.y = 0;
		graphicFade.x = 0;
		graphicFade.y = 0;
		
		graphicBox = new FlxSprite();
		graphicBox.makeGraphic(1024, 128, 0xffffffff);
		graphicBox.y = camera.height - 128;
	}
	
	public function startDialog(InNpc : NPC )
	{
		trace("start dialog");
		npc = InNpc;
		if (player!=null && npc!=null)
		{
			displayingDialog = true;
			playState.playerInDialog = true;
			player.AllowMovement = false;
			
			var closeScale = 3;
			
			add(graphicFade);
			graphicFade.scrollFactor.x = 0;
			graphicFade.scrollFactor.y = 0;
			
			graphicNPCHeadSprite = displayPart( npc.HeadSprite, closeScale, npc.HeadYOffset, camera.width - 128 );
			graphicNPCTorsoSprite = displayPart( npc.TorsoSprite, closeScale, npc.TorsoYOffset, camera.width - 128 );
			graphicNPCLegsSprite = displayPart( npc.LegsSprite, closeScale, npc.LegsYOffset, camera.width - 128 );
			
			graphicPlayerHeadSprite = displayPart( player.HeadSprite, closeScale, player.HeadYOffset, 128 );
			graphicPlayerTorsoSprite = displayPart( player.TorsoSprite, closeScale, player.TorsoYOffset, 128 );
			graphicPlayerLegsSprite = displayPart( player.LegsSprite, closeScale, player.LegsYOffset, 128 );
			
			add(graphicBox);
			graphicBox.scrollFactor.x = 0;
			graphicBox.scrollFactor.y = 0;
		}
	}
	
	public function displayPart( sourceSprite : FlxSprite, closeScale : Int, PartOffset : Float, xLocation : Float ) : FlxSprite
	{
		var newSprite : FlxSprite = sourceSprite.clone();
		newSprite.scale.x = closeScale;  
		newSprite.scale.y = closeScale;
		newSprite.x = xLocation;
		newSprite.y = camera.height + PartOffset * closeScale;
		newSprite.scrollFactor.x = 0;
		newSprite.scrollFactor.y = 0;
		add(newSprite );
		return newSprite;
	}
	
	public override function update()
	{		
		if (displayingDialog)
		{
			if (FlxG.keys.anyJustPressed(["a"]))
			{
				terminateDialog();
			}
		}
		super.update();
	}
	
	public function terminateDialog()
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
		
		remove(graphicBox );
		remove(graphicFade);
		
		npc = null;
		
		displayingDialog = false;
		playState.playerInDialog = false;
		player.AllowMovement = true;
	}
}