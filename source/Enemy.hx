package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxColor;
import flixel.group.FlxSpriteGroup;


/**
 * ...
 * @author ...
 */
class Enemy extends FlxSpriteGroup
{
	var parent:Battle;
	public var speed:Int;
	public var hp:Int;
	public var mp:Int;
	var hpmax:Int;
	public var name:String;
	var hit:Bool = false;
	var hit2:Bool = false;
	var flashcount:Int = 0;
	public var poisoned = false;
	var poison_duration:Int = 0;
	public var burned:Bool = false;
	var burn_duration:Int = 0;
	public var health_text:FlxText;
	public var magic_text:FlxText;
	var random_number:Float;
	var waiting:Bool = false;
	public var enraged:Bool = false;
	var enraged_duration:Int = 0;
	public var protecting:Bool = false;
	public var blinded:Bool = false;
	var blinded_duration:Int = 0;
	
	public var sprite : FlxSprite;
	public var LegsSprite : FlxSprite;
	public var TorsoSprite : FlxSprite;
	public var HeadSprite : FlxSprite;
	
	var attack_sound:FlxSound;
	var robot_sound:FlxSound;
	var hallelujah:FlxSound;
	
	public function new(Position:Int, Total_Number:Int, Name:String, Parent:Battle) 
	{
		super();
		name = Name;
		
		attack_sound = new FlxSound();
		attack_sound.loadStream("assets/sounds/attack.wav", false, false);
		
		robot_sound = new FlxSound();
		robot_sound.loadStream("assets/sounds/robot_attack.wav", false, false);
		
		hallelujah = new FlxSound();
		hallelujah.loadStream("assets/sounds/hallelujah.wav", false, false);

		var EnemyIsComplex : Bool = false;
		
		sprite = new FlxSprite();
		
		if (Name == "") {
			return;
		}
		else if (Name == "Player") {
			
			var LegsYOffset  = -64;
			var TorsoYOffset = -64*2;
			var HeadYOffset  = -64 * 3 + 64*.25;
			
			EnemyIsComplex = true;
			sprite.kill();
			
			this.x = FlxG.width / 3;
			this.y = FlxG.height / 2;
			
			LegsSprite = Parent.playerObject.LegsSprite.clone();
			LegsSprite.x = 0; LegsSprite.scale.x = -1;
			LegsSprite.y = LegsYOffset;
			add(LegsSprite );
			
			TorsoSprite = Parent.playerObject.TorsoSprite.clone();
			TorsoSprite.x = 0; TorsoSprite.scale.x = -1;
			TorsoSprite.y = TorsoYOffset;
			add(TorsoSprite );
			
			HeadSprite = Parent.playerObject.HeadSprite.clone();
			HeadSprite.x = 0; HeadSprite.scale.x = -1;
			HeadSprite.y = HeadYOffset;
			add(HeadSprite);
			
			hp = hpmax = 20;
			speed = 2;
			mp = 10;
		}
		else if (Name.split(" ")[0] == "Basic"){
			sprite.makeGraphic(64, 128, FlxColor.GREEN);
			this.x = FlxG.width / 3 * 2;
			this.y = FlxG.height / (Total_Number + 2) * Position;
			hp = hpmax = 2;
			speed = 1;
		}
		else if (Name.split(" ")[0] == "Tough") {
			sprite.makeGraphic(64, 128, FlxColor.YELLOW);
			this.x = FlxG.width / 3 * 2;
			this.y = FlxG.height / (Total_Number + 2) * Position;
			hp = hpmax = 5;
			speed = 3;
		}
		else if (Name.split(" ")[0] == "Lu-E") {
			sprite.loadGraphic("assets/images/enemies/lueSheet.png", true, 192, 192);
			this.x = FlxG.width / 3 * 2;
			this.y = FlxG.height / (Total_Number + 2) * Position;
			hp = hpmax = 3;
			speed = 1;
		}
		else if (Name.split(" ")[0] == "Hertz") {
			sprite.loadGraphic("assets/images/enemies/hmSheet.png", true, 192, 192);
			this.x = FlxG.width / 3 * 2 - this.width / 2;
			this.y = FlxG.height / (Total_Number + 2) * Position;
			hp = hpmax = 7;
			speed = 0;
		}
		else if (Name.split(" ")[0] == "Arm-Many") {
			sprite.loadGraphic("assets/images/enemies/armSheet.png", true, 192, 192);
			this.x = FlxG.width / 3 * 2;
			this.y = FlxG.height / (Total_Number + 2) * Position;
			hp = hpmax = 5;
			speed = 1;
		}
		else if (Name.split(" ")[0] == "Prodder") {
			sprite.loadGraphic("assets/images/enemies/prodSheet.png", true, 192, 192);
			this.x = FlxG.width / 3 * 2;
			this.y = FlxG.height / (Total_Number + 2) * Position;
			hp = hpmax = 5;
			speed = 1;
		}
		else if (Name.split(" ")[0] == "Cocoa") {
			sprite.loadGraphic("assets/images/enemies/cocoaSheet.png", true, 192, 192);
			this.x = FlxG.width / 3 * 2;
			this.y = FlxG.height / (Total_Number + 2) * Position;
			hp = hpmax = 6;
			speed = 1;
		}
		else if (Name.split(" ")[0] == "Channel") {
			sprite.loadGraphic("assets/images/enemies/channelSheet.png", true, 192, 192);
			this.x = FlxG.width / 3 * 2;
			this.y = FlxG.height / (Total_Number + 2) * Position;
			hp = hpmax = 6;
			speed = 1;
		}
		else if (Name.split(" ")[0] == "Fobio") {
			sprite.loadGraphic("assets/images/enemies/fobioSheet.png", true, 192, 192);
			this.x = FlxG.width / 3 * 2;
			this.y = FlxG.height / (Total_Number + 2) * Position;
			hp = hpmax = 10;
			speed = 2;
		}
		else if (Name.split(" ")[0] == "Kitschy") {
			sprite.loadGraphic("assets/images/enemies/kitschSheet.png", true, 192, 192);
			this.x = FlxG.width / 3 * 2;
			this.y = FlxG.height / (Total_Number + 2) * Position;
			hp = hpmax = 15;
			speed = 0;
		}
		else if (Name.split(" ")[0] == "Curve-A") {
			sprite.loadGraphic("assets/images/enemies/curveaSheet.png", true, 192, 192);
			this.x = FlxG.width / 3 * 2;
			this.y = FlxG.height / (Total_Number + 2) * Position;
			hp = hpmax = 20;
			speed = 1;
		}
		else 
		{
			/// If the enemy is an NPC of multiple sprites.
			EnemyIsComplex = true;
			LegsSprite = new FlxSprite();
			TorsoSprite = new FlxSprite();
			HeadSprite = new FlxSprite();
			sprite.kill();
			if (Name.split(" ")[0] == "Android")
			{
				setNPCSpritesToSheet(20, 1, Position, Total_Number, "android");
			}
			else if (Name.split(" ")[0] == "Baymax")
			{
				setNPCSpritesToSheet(20, 1, Position, Total_Number, "baymax");
			}
			else if (Name.split(" ")[0] == "Kirimsame")
			{
				setNPCSpritesToSheet(20, 1, Position, Total_Number, "kirimsame_marisa");
			}
			else if (Name.split(" ")[0] == "Minion")
			{
				setNPCSpritesToSheet(20, 1, Position, Total_Number, "minion_bot");
			} 
			else if (Name.split(" ")[0] == "Mondrian")
			{
				setNPCSpritesToSheet(20, 1, Position, Total_Number, "mondrian");
			}
			else if (Name.split(" ")[0] == "Mummy")
			{
				setNPCSpritesToSheet(20, 1, Position, Total_Number, "mummy");
			}
			else if (Name.split(" ")[0] == "Octobot")
			{
				setNPCSpritesToSheet(20, 1, Position, Total_Number, "octobot");
			}
		}
		
		sprite.animation.add("idle", [0, 1], 2, true);
		sprite.animation.play("idle");
		add(sprite);
		
		health_text = new FlxText(0, 0, 64);
		health_text.size = 20;
		health_text.color = FlxColor.RED;
		health_text.text = hpmax + "";
		health_text.x = this.x + sprite.width;
		health_text.y = this.y + this.height / 2;
		health_text.scrollFactor.set(0, 0);
		
		if (EnemyIsComplex && name != "Player") {
			health_text.x = FlxG.width / 3 * 2 + 60;
			health_text.y = FlxG.height / (Total_Number + 1) * Position;
		}
	
		
		magic_text = new FlxText(0, 0, 64);
		magic_text.size = 20;
		magic_text.color = FlxColor.NAVY_BLUE;
		magic_text.text = mp + "";
		magic_text.x = this.x + sprite.width;
		magic_text.y = this.y + this.height / 2 - magic_text.size;
		magic_text.scrollFactor.set(0, 0);
		
	}
	
	public function setNPCSpritesToSheet(HP : Int, Speed : Int, Position : Int, Total_Number : Int ,fileName : String)
	{
		
		hp = hpmax = HP;
		speed = Speed;
		
		var LegsYOffset  = -64;
		var TorsoYOffset = -64*2;
		var HeadYOffset  = -64 * 3 + 64 * .25;
				
		var graphicX = FlxG.width / 3 * 2;
		var graphicY = FlxG.height / (Total_Number + 1) * Position + 50;
		
		TorsoSprite = new FlxSprite( graphicX, graphicY + TorsoYOffset);
		TorsoSprite.loadGraphic("assets/images/sprite_sheets/" + fileName + ".png", true, 64, 64);
		TorsoSprite.animation.add("Still", [1], 0, false);
		TorsoSprite.animation.play("Still");
		add( TorsoSprite);
		
		LegsSprite = new FlxSprite( graphicX, graphicY + LegsYOffset);
		LegsSprite.loadGraphic("assets/images/sprite_sheets/" + fileName + ".png",true,64,64);
		LegsSprite.animation.add("Still", [2]);
		LegsSprite.animation.play("Still");
		add( LegsSprite);
		
		HeadSprite = new FlxSprite( graphicX, graphicY + HeadYOffset);
		HeadSprite.loadGraphic("assets/images/sprite_sheets/" + fileName + ".png",true,64,64);
		HeadSprite.animation.add("Still", [0], 0, false);
		HeadSprite.animation.play("Still");
		add( HeadSprite);
	}
	
	override public function update() {
		if (hit && hp > 0) {
			if (hit2) {
				set_alpha(alpha + 0.2);
				if (alpha >= 1) {
					alpha = 1;
					hit2 = false;
					flashcount += 1;
					if (flashcount >= 3) {
						hit = false;
						flashcount = 0;
					}
				}
			}
			else {
				set_alpha(alpha -= 0.2);
				if (alpha <= 0.2) {
					alpha = 0.2;
					hit2 = true;
				}
			}
		}
		else if (hp <= 0 && alpha > 0.1 && visible) {
			set_alpha(alpha -= 0.01);
			if (alpha <= 0.1) {
				visible = false;
			}
		}
		super.update();
	}
	
	
	public function attack(AttackName:String, Target:Enemy, PlayerObject:Enemy):String {
		var returner:String;
		if (name == "Player") {
			if (blinded && (Math.random() * 100) < 50) {
				return "The player couldn't see a thing!";
			}
			if (AttackName == "Attack") {
				attack_sound.play(true);
				returner = "Player attacks " + Target.name + "!";
				Target.damage(1, [], this);
				return returner;
			}
			else if (AttackName == "Double-Slap") {
				mp -= 2;
				magic_text.text = mp + "";
				returner = "Player slaps " + Target.name + " twice!";
				Target.damage(2, [], this);
				return returner;
			}
			else if (AttackName == "Heal") {
				mp -= 3;
				magic_text.text = mp + "";
				heal();
				return "You touch your make-up up carefully.";
			}
			else if (AttackName == "Poison") {
				mp -= 2;
				magic_text.text = mp + "";
				Target.damage(0, ["Poison"], this);
				return "You throw make-up remover at " + Target.name + "!";
			}
			else if (AttackName == "God") {
				hallelujah.play(true);
				Target.damage(9001, [], this);
				return "You introduce a seg fault into their code!";
			}
		}
		else if (name.split(" ")[0] == "Basic") {
			PlayerObject.damage(1, [], this);
			return name + " attacks the Player!";
		}
		else if (name.split(" ")[0] == "Tough") {
			PlayerObject.damage(3, [], this);
			return name + " bashes down the Player!";
		}
		else if (name.split(" ")[0] == "Lu-E") {
			random_number = Math.random() * 100;
			if (random_number < 25) {
				return name + " is too busy adjusting his purse-strap.";
			}
			else{
				PlayerObject.damage(1, [], this);
				return name + " charges in and ruffles your hair!";
			}
		}
		else if (name.split(" ")[0] == "Hertz") {
			random_number = Math.random() * 100;
			if (random_number < 10) {
				return name + " are too busy bickering over their style!";
			}
			else if (random_number < 40) {
				PlayerObject.damage(3, [], this);
				return name + " hit you with their matching covers!";
			}
			else {
				PlayerObject.damage(2, [], this);
				return name + " push you around as they pose!";
			}
		}
		else if (name.split(" ")[0] == "Arm-Many") {
			if (waiting) {
				waiting = false;
				return name + " is trying to untangle his arms...";
			}
			random_number = Math.random() * 100;
			if (random_number < 25) {
				PlayerObject.damage(3, [], this);
				return name + " does a twirl as he smacks you!";
			}
			else if (random_number < 50) {
				PlayerObject.damage(2, [], this);
				return name + " pulls your hair roughly!";
			}
			else if (random_number < 75) {
				PlayerObject.damage(1, [], this);
				return name + " smears your make-up with an arm!";
			}
			else {
				PlayerObject.damage(4, [], this);
				waiting = true;
				return name + " strikes a pose so fabulous, you are shamed!";
			}
		}
		else if (name.split(" ")[0] == "Prodder") {
			random_number = Math.random() * 100;
			if (random_number < 50 && PlayerObject.enraged == false) {
				PlayerObject.damage(0, ["Enrage"], this);
				return name + " insults yours fashion!";
			}
			else {
				PlayerObject.damage(2, [], this);
				return name + " drives her heel into your foot!";
			}
		}
		else if (name.split(" ")[0] == "Cocoa") {
			random_number = Math.random() * 100;
			if (random_number < 50 && PlayerObject.burned == false) {
				PlayerObject.damage(1, ["Burn"], this);
				return name + " scalds you with hot cocoa!";
			}
			else {
				PlayerObject.damage(1, [], this);
				return name + " blows a lot of steam at you!";
			}
		}
		else if (name.split(" ")[0] == "Channel") {
			random_number = Math.random() * 100;
			if (random_number < 25) {
				PlayerObject.damage(1, [], this);
				return name + " flashes an image of a bad makeover!";
			}
			else if (random_number < 50) {
				PlayerObject.damage(1, [], this);
				return name + " plays a clip of Tim Gunn being sassy!";
			}
			else {
				PlayerObject.damage(2, [], this);
				return name + " deletes your recordings of Runway America!";
			}
		}
		else if (name.split(" ")[0] == "Fobio") {
			if (waiting) {
				waiting = false;
				PlayerObject.damage(4, [], this);
				return name + "  completely stuns you with his beauty!";
			}
			random_number = Math.random() * 100;
			if (random_number < 20) {
				PlayerObject.damage(2, ["Burn"], this);
				return name + " burns you with his hotness!";
			}
			else if (random_number < 40) {
				waiting = true;
				return name + " is preparing for the big move!";
			}
			else if (random_number < 70) {
				PlayerObject.damage(2, [], this);
				return name + " hairwhips you. It smells amazing!";
			}
			else {
				PlayerObject.damage(2, [], this);
				return name + " flexes his circuits into your face!";
			}
		}
		else if (name.split(" ")[0] == "Kitschy") {
			if (protecting) {
				protecting = false;
				return name + " can finally stand looking at your face. Kind of.";
			}
			random_number = Math.random() * 100;
			if (random_number < 30) {
				protecting = true;
				return name + " prepares a defense for your next gaudy move!";
			}
			else if (random_number < 50) {
				PlayerObject.damage(2, ["Poison"], this);
				return name + " launches carbs at you! Carbs!";
			}
			else if (random_number < 75) {
				PlayerObject.damage(3, [], this);
				return name + " doesn't attack you. That outfit damages you enough!";
			}
			else {
				random_number = Math.round(Math.random() * 3 + 2);
				PlayerObject.damage(Math.round(random_number), [], this);
				return name + " rates you a " + random_number + " out of 10!";
			}
		}
		else if (name.split(" ")[0] == "Curve-A") {
			random_number = Math.random() * 100;
			if (random_number < 20) {
				PlayerObject.damage(2, ["Blind"], this);
				return name + " pulls the pins out of your hair!";
			}
			else if (random_number < 40) {
				PlayerObject.damage(2, ["Burn"], this);
				return name + " has nothing good to say about your fashion sense!";
			}
			else if (random_number < 80) {
				PlayerObject.damage(Math.round(Math.random() * 4 + 1), [], this);
				return name + " plies you with random online fashion articles!";
			}
			else {
				PlayerObject.damage(2, ["Enrage"], this);
				return name + " throws a lot of insults, and a rock!";
			}
		}
		else {
			random_number = Math.random() * 100;
			if (random_number < 50) {
				PlayerObject.damage(1, [], this);
				return name + " tries their best.";
			}
			else {
				PlayerObject.damage(2, [], this);
				return name + " shocks you with their fashion!";
			}
		}
		return "Error...";
	}
	
	public function damage(Damage:Int, Status:Array<String>, Attacker:Enemy) {
		if (protecting && Attacker.protecting == false) {
			Attacker.damage(Damage, [], this);
			Battle.second_message.push(name + " turns that tacky pose back around on you!");
			return;
		}
		hp = hp - Damage;
		if (Damage == 0 && Status.length == 0) {
			Battle.second_message.push(Attacker.name + " dealt no damage to " + name + "!");
		}
		else if (Damage != 0){
			Battle.second_message.push(name + " took " + Damage + " damage from " + Attacker.name + "!");
			if (name == "Player") {
				robot_sound.play(true);
			}
		}
		hit = true;
		health_text.text = hp + "";
		for (effect in Status) {
			if (effect == "Poison") {
				if (poisoned && Damage == 0) {
					Battle.second_message.push("But " + name + " is already poisoned!");
				}
				else if (poisoned && Damage != 0) {
					continue;
				}
				else{
					poisoned = true;
					poison_duration = Math.round(Math.random() * 5);
					Battle.second_message.push(name + " is poisoned!");
				}
			}
			else if (effect == "Burn") {
				if (burned && Damage == 0) {
					Battle.second_message.push("But " + name + " is already burned!");
				}
				else if (burned && Damage != 0) {
					continue;
				}
				else{
					burned = true;
					burn_duration = Math.round(Math.random() * 5);
					Battle.second_message.push(name + " is burned!");
				}
			}
			else if (effect == "Enrage") {
				if (enraged && Damage == 0) {
					Battle.second_message.push("But " + name + " is already annoyed!");
				}
				else if (enraged && Damage != 0) {
					continue;
				}
				else{
					enraged = true;
					enraged_duration = Math.round(Math.random() * 5);
					Battle.second_message.push(name + " got too annoyed to focus!");
				}
			}
			else if (effect == "Blind") {
				if (blinded && Damage == 0) {
					Battle.second_message.push("But " + name + " is already blinded!");
				}
				else if (blinded && Damage != 0) {
					continue;
				}
				else{
					blinded = true;
					blinded_duration = Math.round(Math.random() * 5);
					Battle.second_message.push(name + " was badly blinded!");
				}
			}
		}
		if (hp <= 0 && name != "Player") {
			Battle.second_message.push(name + " has been defeated!");
			color = 0xFFFF0000;
			//visible = false;
			
			//trace("Before conditional");
			if (name == "Fobio A" || name == "Fobio B" || name == "Fobio C")
			{
				StateManager.BOSSBOOLS[0] = true;
				//trace("Player beat Fobio");
				//trace("Statemanager bool: " + StateManager.BOSSBOOLS[0]);
			}
			else if (name == "Curve-A A" || name == "Curve-A B" || name == "Curve-A C")
			{
				StateManager.BOSSBOOLS[1] = true;
			}
			else if(name == "Kitschy A" || name == "Kitschy B" || name == "Kitschy C")
			{
				FlxG.switchState(new EndState());
			}
			//trace("After conditional");
			
			
			name = "";
			health_text.visible = false;
		}
	}
	
	public function heal() {
		hp = hpmax;
		health_text.text = hpmax + "";
	}
	
	public function statusDamage() {
		if (poisoned) {
			hp -= 1;
			health_text.text = hp + "";
			Battle.second_message.push("The poison in " + name + " has dealt 1 damage!");
			poison_duration -= 1;
			if (poison_duration == 0) {
				poisoned = false;
				Battle.second_message.push("The poison in " + name + " has worn off!");
			}
		}
		if (burned) {
			hp -= 1;
			health_text.text = hp + "";
			Battle.second_message.push(name + "'s burn has dealt 1 damage!");
			burn_duration -= 1;
			if (burn_duration == 0) {
				burned = false;
				Battle.second_message.push(name + "'s burn has healed!");
			}
		}
		if (enraged) {
			enraged_duration -= 1;
			if (enraged_duration == 0) {
				enraged = false;
				Battle.second_message.push(name + " has cooled down enough to think!");
			}
			else {
				Battle.second_message.push(name + " is still fuming!");
			}
		}
		if (blinded) {
			blinded_duration -= 1;
			if (blinded_duration == 0) {
				blinded = false;
				Battle.second_message.push(name + " can see clearly now! (The rain has gone).");
			}
			else {
				Battle.second_message.push(name + " is still blind as a bat.");
			}
		}
		if (hp <= 0 && name != "Player") {
			Battle.second_message.push(name + " has been defeated!");
			visible = false;
			name = "";
			health_text.visible = false;
		}
	}
	
}