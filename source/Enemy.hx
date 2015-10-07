package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxColor;


/**
 * ...
 * @author ...
 */
class Enemy extends FlxSprite
{
	var parent:Battle;
	public var speed:Int;
	public var hp:Int;
	public var mp:Int;
	var hpmax:Int;
	public var name:String;
	public var poisoned = false;
	var poison_duration:Int = 0;
	public var health_text:FlxText;
	public var magic_text:FlxText;
	
	public function new(Position:Int, Total_Number:Int, Name:String, Parent:Battle) 
	{
		super();
		name = Name;
		if (Name == "") {
			return;
		}
		else if (Name == "Player"){
			makeGraphic(64, 128, FlxColor.WHITE);
			this.x = FlxG.width / 3;
			this.y = FlxG.height / 2;
			hp = hpmax = 10;
			speed = 2;
			mp = 10;
		}
		else if (Name.split(" ")[0] == "Basic"){
			makeGraphic(64, 128, FlxColor.GREEN);
			this.x = FlxG.width / 3 * 2;
			this.y = FlxG.height / (Total_Number + 2) * Position;
			hp = hpmax = 2;
			speed = 1;
		}
		else if (Name.split(" ")[0] == "Tough") {
			makeGraphic(64, 128, FlxColor.YELLOW);
			this.x = FlxG.width / 3 * 2;
			this.y = FlxG.height / (Total_Number + 2) * Position;
			hp = hpmax = 5;
			speed = 3;
		}
		health_text = new FlxText(0, 0, 64);
		health_text.size = 20;
		health_text.color = FlxColor.BLACK;
		health_text.text = hpmax + "";
		health_text.x = this.x;
		health_text.y = this.y + this.height / 2;
		
		magic_text = new FlxText(0, 0, 64);
		magic_text.size = 20;
		magic_text.color = FlxColor.NAVY_BLUE;
		magic_text.text = mp + "";
		magic_text.x = this.x;
		magic_text.y = this.y + this.height / 2 - magic_text.size;
		
	}
	
	public function attack(AttackName:String, Target:Enemy, PlayerObject:Enemy):String {
		var returner:String;
		if (name == "Player") {
			if (AttackName == "Attack") {
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
				return "Player takes the turn to heal herself!";
			}
			else if (AttackName == "Poison") {
				mp -= 2;
				magic_text.text = mp + "";
				Target.damage(0, ["Poison"], this);
				return "Player envelops " + Target.name + " in a poisonous gas!";
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
		return "Error...";
	}
	
	public function damage(Damage:Int, Status:Array<String>, Attacker:Enemy) {
		hp = hp - Damage;
		if (Damage == 0 && Status.length == 0) {
			Battle.second_message.push(Attacker.name + " dealt no damage to " + name + "!");
		}
		else if (Damage != 0){
			Battle.second_message.push(name + " took " + Damage + " damage from " + Attacker.name + "!");
		}
		health_text.text = hp + "";
		for (effect in Status) {
			if (effect == "Poison") {
				poisoned = true;
				poison_duration = Math.round(Math.random() * 5);
				Battle.second_message.push(name + " is poisoned!");
			}
		}
		if (hp <= 0 && name != "Player") {
			Battle.second_message.push(name + " has been defeated!");
			visible = false;
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
			if (hp <= 0 && name != "Player") {
			Battle.second_message.push(name + " has been defeated!");
			visible = false;
			name = "";
			health_text.visible = false;
		}
		}
	}
	
}