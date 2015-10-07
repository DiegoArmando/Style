package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxColor;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class Battle extends FlxState
{
	
	var player:Enemy;
	var enemy1:Enemy;
	var enemy2:Enemy;
	var enemy3:Enemy;
	var enemy_counter:Int = 1;
	var message_box:FlxSprite;
	var message_text:FlxText;
	var action_box:FlxSprite;
	var attack_text:FlxText;
	var special_attack_text:FlxText;
	var flee_text:FlxText;
	var pointer:FlxSprite;
	var pointer_option:Int = 1;
	var target_box:FlxSprite;
	var enemy_texts:Array<FlxText>;
	var temp_enemy_text1:FlxText;
	var temp_enemy_text2:FlxText;
	var temp_enemy_text3:FlxText;
	var ability_box:FlxSprite;
	var ability_text1:FlxText;
	var ability_text2:FlxText;
	var ability_text3:FlxText;
	var ability_number:Int = 3;
	var attack_type:String;
	var target:Enemy;
	var attack_order:Array<Enemy>;
	var attacking:Bool;
	var whose_turn:Int;
	var enemy1_health:FlxText;
	var enemy2_health:FlxText;
	var enemy3_health:FlxText;
	var player_health:FlxText;
	var player_style:FlxText;
	static public var second_message:Array<String>;
	var relaying_damage:Bool;
	
	var fight_state = "Intro";
	var previous_fight_state:String;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		
		enemy1 = new Enemy(1, MenuState.ENEMIES.length, MenuState.ENEMIES[0], this);
		enemy2 = new Enemy(2, MenuState.ENEMIES.length, MenuState.ENEMIES[1], this);
		enemy3 = new Enemy(3, MenuState.ENEMIES.length, MenuState.ENEMIES[2], this);
		
		add(enemy1);
		add(enemy2);
		add(enemy3);
		add(enemy1_health = enemy1.health_text);
		add(enemy2_health = enemy2.health_text);
		add(enemy3_health = enemy3.health_text);
		
		player = new Enemy(0, 0, "Player", this);
		add(player);
		add(player_health = player.health_text);
		add(player_style = player.magic_text);
		
		message_box = new FlxSprite(0, 0);
		message_box.makeGraphic(FlxG.width, Math.round(FlxG.height / 6), FlxColor.WHITE);
		message_box.x = 0;
		message_box.y = FlxG.height / 10 * 8;
		add(message_box);
		
		message_text = new FlxText(0, 0, FlxG.width);
		message_text.text = "An enemy has appeared!";
		message_text.size = 32;
		message_text.x = 40;
		message_text.y = message_box.y + (message_box.height / 2) - (message_text.size / 2);
		message_text.color = FlxColor.BLACK;
		add(message_text);
		
		action_box = new FlxSprite(0, 0);
		action_box.makeGraphic(Math.round(FlxG.width / 2), Math.round(FlxG.height / 6), FlxColor.GRAY);
		action_box.x = FlxG.width / 2;
		action_box.y = message_box.y;
		add(action_box);
		action_box.visible = false;
		
		attack_text = new FlxText(0, 0, FlxG.width / 2);
		attack_text.text = "Attack";
		attack_text.size = 24;
		attack_text.x = action_box.x + 40;
		attack_text.y = message_box.y + (message_box.height / 4) - (attack_text.size / 2);
		attack_text.color = FlxColor.BLACK;
		add(attack_text);
		attack_text.visible = false;
		
		special_attack_text = new FlxText(0, 0, FlxG.width / 2);
		special_attack_text.text = "Ability";
		special_attack_text.size = 24;
		special_attack_text.x = action_box.x + 40;
		special_attack_text.y = message_box.y + (message_box.height / 4 * 2) - (special_attack_text.size / 2);
		special_attack_text.color = FlxColor.BLACK;
		add(special_attack_text);
		special_attack_text.visible = false;
		
		flee_text = new FlxText(0, 0, FlxG.width / 2);
		flee_text.text = "Flee";
		flee_text.size = 24;
		flee_text.x = action_box.x + 40;
		flee_text.y = message_box.y + (message_box.height / 4 * 3) - (flee_text.size / 2);
		flee_text.color = FlxColor.BLACK;
		add(flee_text);
		flee_text.visible = false;
		
		target_box = new FlxSprite(0, 0);
		target_box.makeGraphic(Math.round(FlxG.width / 4), Math.round(FlxG.height / 6), FlxColor.SILVER);
		target_box.x = FlxG.width / 4 * 3;
		target_box.y = message_box.y;
		add(target_box);
		target_box.visible = false;
		
		
		temp_enemy_text1 = new FlxText(0, 0, FlxG.width / 4);
		temp_enemy_text1.text = MenuState.ENEMIES[0];
		temp_enemy_text1.size = 24;
		temp_enemy_text1.x = target_box.x + 40;
		temp_enemy_text1.y = message_box.y + (message_box.height / 4) - (temp_enemy_text1.size / 2);
		temp_enemy_text1.color = FlxColor.BLACK;
		temp_enemy_text1.visible = false;
		
		if (MenuState.ENEMIES.length > 1) {
			temp_enemy_text2 = new FlxText(0, 0, FlxG.width / 4);
			temp_enemy_text2.text = MenuState.ENEMIES[1];
			temp_enemy_text2.size = 24;
			temp_enemy_text2.x = target_box.x + 40;
			temp_enemy_text2.y = message_box.y + (message_box.height / 4 * 2) - (temp_enemy_text2.size / 2);
			temp_enemy_text2.color = FlxColor.BLACK;
			temp_enemy_text2.visible = false;
		}
		else {
			temp_enemy_text2 = new FlxText(0, 0, 0);
			temp_enemy_text2.text = "";
		}
		
		if (MenuState.ENEMIES.length > 2) {
			temp_enemy_text3 = new FlxText(0, 0, FlxG.width / 4);
			temp_enemy_text3.text = MenuState.ENEMIES[2];
			temp_enemy_text3.size = 24;
			temp_enemy_text3.x = target_box.x + 40;
			temp_enemy_text3.y = message_box.y + (message_box.height / 4 * 3) - (temp_enemy_text3.size / 2);
			temp_enemy_text3.color = FlxColor.BLACK;
			temp_enemy_text3.visible = false;
			add(temp_enemy_text3);
		}
		else {
			temp_enemy_text3 = new FlxText(0, 0, 0);
			temp_enemy_text3.text = "";
		}
		
		add(temp_enemy_text1);
		add(temp_enemy_text2);
		add(temp_enemy_text3);
		
		ability_box = new FlxSprite(0, 0);
		ability_box.makeGraphic(Math.round(FlxG.width / 4), Math.round(FlxG.height / 6), FlxColor.HOT_PINK);
		ability_box.x = FlxG.width / 4 * 3;
		ability_box.y = message_box.y;
		add(ability_box);
		ability_box.visible = false;
		
		ability_text1 = new FlxText(0, 0, FlxG.width / 4);
		ability_text1.text = "Double-Slap";
		ability_text1.size = 16;
		ability_text1.x = ability_box.x + 40;
		ability_text1.y = message_box.y + (message_box.height / 5) - (ability_text1.size / 2);
		ability_text1.color = FlxColor.BLACK;
		ability_text1.visible = false;
		
		ability_text2 = new FlxText(0, 0, FlxG.width / 4);
		ability_text2.text = "Heal";
		ability_text2.size = 16;
		ability_text2.x = ability_box.x + 40;
		ability_text2.y = message_box.y + (message_box.height / 5 * 2) - (ability_text2.size / 2);
		ability_text2.color = FlxColor.BLACK;
		ability_text2.visible = false;
		
		ability_text3 = new FlxText(0, 0, FlxG.width / 4);
		ability_text3.text = "Poison";
		ability_text3.size = 16;
		ability_text3.x = ability_box.x + 40;
		ability_text3.y = message_box.y + (message_box.height / 5 * 3) - (ability_text3.size / 2);
		ability_text3.color = FlxColor.BLACK;
		ability_text3.visible = false;
		
		add(ability_text1);
		add(ability_text2);
		add(ability_text3);
		
		pointer = new FlxSprite(0, 0);
		pointer.makeGraphic(10, 10);
		pointer.x = action_box.x + 10;
		pointer.color = FlxColor.BLACK;
		add(pointer);
		pointer.visible = false;
		updatePointer();
		
		second_message = new Array<String>();
		
		super.create();
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}
	
	public function updatePointer():Void
	{
		if (pointer_option == 1) {
			pointer.y = attack_text.y + (attack_text.height / 2) - (pointer.height / 2);
		}
		else if (pointer_option == 2) {
			pointer.y = special_attack_text.y + (special_attack_text.height / 2) - (pointer.height / 2);
		}
		else {
			pointer.y = flee_text.y + (flee_text.height / 2) - (pointer.height / 2);
		}
	}
	
	public function updatePointer2():Void 
	{
		if (pointer_option == 1) {
			pointer.y = ability_text1.y + (ability_text1.height / 2) - (pointer.height / 2);
		}
		else if (pointer_option == 2) {
			pointer.y = ability_text2.y + (ability_text2.height / 2) - (pointer.height / 2);
		}
		else if (pointer_option == 3) {
			pointer.y = ability_text3.y + (ability_text3.height / 2) - (pointer.height / 2);
		}
	}
	
	public function findNewTarget() {
		if (enemy1.name != "") {
			target = enemy1;
		}
		else if (enemy2.name != "") {
			target = enemy2;
		}
		else if (enemy3.name != "") {
			target = enemy3;
		}
	}
	
	public function checkForVictory():Bool {
		return (temp_enemy_text1.text == "" && temp_enemy_text2.text == "" && temp_enemy_text3.text == "" && player.hp > 0);
	}
	
	public function sortAttackOrder(){
		attack_order = new Array<Enemy>();
		attack_order.push(player);
		if (MenuState.ENEMIES[0] != "") {
			attack_order.push(enemy1);
		}
		if (MenuState.ENEMIES[1] != "") {
			attack_order.push(enemy2);
		}
		if (MenuState.ENEMIES[2] != "") {
			attack_order.push(enemy3);
		}
		var sorter:Int = 0;
		while (sorter != attack_order.length - 2) {
			if (attack_order[sorter].speed < attack_order[sorter + 1].speed) {
				var temp_enemy = attack_order[sorter + 1];
				attack_order[sorter + 1] = attack_order[sorter];
				attack_order[sorter] = temp_enemy;
				sorter = 0;
				continue;
			}
			sorter += 1;
		}
	}
	
	public function actionBoxAppear() {
		updatePointer();
		message_text.text = "What will you do?";
		action_box.visible = true;
		attack_text.visible = true;
		special_attack_text.visible = true;
		flee_text.visible = true;
		pointer.x = action_box.x + 10;
		pointer.visible = true;
		pointer_option = 1;
		updatePointer();
	}
	
	public function actionBoxDisappear() {
		action_box.visible = false;
		attack_text.visible = false;
		special_attack_text.visible = false;
		flee_text.visible = false;
		pointer.visible = false;
		pointer_option = 1;
		updatePointer();
	}
	
	public function targetBoxAppear() {
		message_text.text = "Who will you target?";
		target_box.visible = true;
		temp_enemy_text1.visible = true;
		temp_enemy_text2.visible = true;
		temp_enemy_text3.visible = true;
		pointer.x = target_box.x + 10;
		pointer_option = 1;
		if (temp_enemy_text1.text == "") {
			if (temp_enemy_text2.text == "") {
				pointer_option = 3;
			}
			else {
				pointer_option = 2;
			}
		}
		updatePointer();
	}
	
	public function targetBoxDisappear() {
		target_box.visible = false;
		temp_enemy_text1.visible = false;
		temp_enemy_text2.visible = false;
		temp_enemy_text3.visible = false;
	}
	
	public function abilityBoxAppear() {
		message_text.text = "Which ability?";
		ability_box.visible = true;
		ability_text1.visible = true;
		ability_text2.visible = true;
		ability_text3.visible = true;
		if (player.mp < 2) {
			ability_text1.color = FlxColor.GRAY;
			ability_text3.color = FlxColor.GRAY;
		}
		if (player.mp < 3) {
			ability_text2.color = FlxColor.GRAY;
		}
		pointer.x = ability_box.x + 10;
		pointer_option = 1;
		updatePointer2();
	}
	
	public function abilityBoxDisappear() {
		message_text.text = "What will you do?";
		ability_box.visible = false;
		ability_text1.visible = false;
		ability_text2.visible = false;
		ability_text3.visible = false;
		pointer.x = action_box.x + 10;
		pointer_option = 1;
		updatePointer();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		if (fight_state == "Intro") {
			if (FlxG.keys.anyJustPressed(["ENTER", "SPACE"])) {
				fight_state = "Player Choice";
				actionBoxAppear();
			}
		}
		
		else if (fight_state == "Player Choice") {
			if (FlxG.keys.anyJustPressed(["UP", "W"])) {
				switch(pointer_option) {
					case 1: pointer_option = 3;
					
					case 2: pointer_option = 1;
					
					case 3: pointer_option = 2;
				}
				updatePointer();
			}
			if (FlxG.keys.anyJustPressed(["DOWN", "S"])) {
				switch(pointer_option) {
					case 1: pointer_option = 2;
					
					case 2: pointer_option = 3;
					
					case 3: pointer_option = 1;
				}
				updatePointer();
			}
			if (FlxG.keys.anyJustPressed(["SPACE", "ENTER"])) {
				switch(pointer_option) {
					case 1: targetBoxAppear();
							previous_fight_state = fight_state;
							attack_type = "Attack";
							fight_state = "Choose Target";
					case 2: abilityBoxAppear();
							previous_fight_state = fight_state;
							fight_state = "Choose Ability";
							updatePointer2();
					case 3: message_text.text = "Escaped successfully";
							actionBoxDisappear();
							fight_state = "Victory";
				}
			}
		}
		
		else if (fight_state == "Choose Target") {
			if (FlxG.keys.anyJustPressed(["UP", "W"])) {
				switch(pointer_option) {
					case 1:	if (temp_enemy_text3.text != "") {
								pointer_option = 3;
							}
							else if (temp_enemy_text2.text != "") {
								pointer_option = 2;
							}
					
					case 2: if (temp_enemy_text1.text != "") {
								pointer_option = 1;
							}
							else if (temp_enemy_text3.text != "") {
								pointer_option = 3;
							}
					
					case 3: if (temp_enemy_text2.text != "") {
								pointer_option = 2;
							}
							else if (temp_enemy_text1.text != "") {
								pointer_option = 1;
							}
				}
				updatePointer();
			}
			if (FlxG.keys.anyJustPressed(["DOWN", "S"])) {
				switch(pointer_option) {
					case 1: if (temp_enemy_text2.text != ""){
								pointer_option = 2;
							}
							else if (temp_enemy_text3.text != ""){
								pointer_option = 3;
							}
					
					case 2: if (temp_enemy_text3.text != "") {
								pointer_option = 3;
							}
							else if (temp_enemy_text1.text != "") {
								pointer_option = 1;
							}
					
					case 3: if (temp_enemy_text1.text != "") {
								pointer_option = 1;
							}
							else if (temp_enemy_text2.text != "") {
								pointer_option = 2;
							}
				}
				updatePointer();
			}
			if (FlxG.keys.anyJustPressed(["ENTER", "SPACE"])) {
				targetBoxDisappear();
				pointer.visible = false;
				if (pointer_option == 1) {
					target = enemy1;
				}
				else if (pointer_option == 2) {
					target = enemy2;
				}
				else if (pointer_option == 3) {
					target = enemy3;
				}
				fight_state = "Fighting_Planning";
				actionBoxDisappear();				
			}
			if (FlxG.keys.justPressed.BACKSPACE) {
				targetBoxDisappear();
				if (previous_fight_state == "Player Choice"){
					pointer.x = action_box.x + 10;
					pointer_option = 1;
					fight_state = "Player Choice";
					updatePointer();
				}
				else if (previous_fight_state == "Choose Ability"){
					abilityBoxAppear();
					fight_state = "Choose Ability";
				}
			}
		}
		
		else if (fight_state == "Choose Ability") {
			if (FlxG.keys.anyJustPressed(["UP", "W"])) {
				pointer_option -= 1;
				if (pointer_option < 1) {
					pointer_option = ability_number;
				}
				updatePointer2();
			}
			if (FlxG.keys.anyJustPressed(["DOWN", "S"])) {
				pointer_option += 1;
				if (pointer_option > ability_number) {
					pointer_option = 1;
				}
				updatePointer2();
			}
			if (FlxG.keys.justPressed.BACKSPACE) {
				abilityBoxDisappear();
				fight_state = "Player Choice";
			}
			if (FlxG.keys.anyJustPressed(["ENTER", "SPACE"])) {
				if (pointer_option == 1 && player.mp < 2) {
					message_text.text = "Not enough style!";
					return;
				}
				else if (pointer_option == 2 && player.mp < 3) {
					message_text.text = "Not enough style!";
					return;
				}
				else if (pointer_option == 3 && player.mp < 2) {
					message_text.text = "Not enough style!";
					return;
				}
				if (pointer_option == 2) {
					attack_type = "Heal";
					fight_state = "Fighting_Planning";
					target = player;
					pointer_option = 1;
					abilityBoxDisappear();
					actionBoxDisappear();
					pointer.visible = false;
					updatePointer();
					return;
				}
				previous_fight_state = fight_state;
				if (pointer_option == 1) {
					attack_type = "Double-Slap";
				}
				else if (pointer_option == 3) {
					attack_type = "Poison";
				}
				abilityBoxDisappear();
				targetBoxAppear();
				if (temp_enemy_text1.text == "") {
					if (temp_enemy_text2.text == "") {
						pointer_option = 3;
					}
					else {
						pointer_option = 2;
					}
				}
				fight_state = "Choose Target";
				updatePointer();
			}
		}
		else if (fight_state == "Fighting_Planning") {
			sortAttackOrder();
			fight_state = "Fighting";
			whose_turn = -1;
			attacking = false;
			relaying_damage = false;
		}
		else if (fight_state == "Fighting") {
			if (whose_turn == -1) {
				message_text.text = "Here goes nothing...";
				relaying_damage = true;
			}
			if (FlxG.keys.anyJustPressed(["ENTER", "SPACE"]) && attacking) {
				if (second_message.length != 0){
					message_text.text = second_message[0];
					second_message.remove(message_text.text);
					return;
				}
				attacking = false;
				relaying_damage = true;
			}
			if (FlxG.keys.anyJustPressed(["ENTER", "SPACE"]) && relaying_damage) {
				if (player.hp <= 0) {
					fight_state = "Game Over";
					message_text.text = "Game Over...";
					return;
				}
				temp_enemy_text1.text = enemy1.name;
				temp_enemy_text2.text = enemy2.name;
				temp_enemy_text3.text = enemy3.name;
				if (checkForVictory()) {
					fight_state = "Victory";
					message_text.text = "Player has won!";
					return;
				}
				whose_turn += 1;
				relaying_damage = false;
				if (whose_turn > attack_order.length - 1) {
					fight_state = "Player Choice";
					actionBoxAppear();
					attacking = false;
					return;
				}
			}
			if (!attacking && !relaying_damage) {
				if (attack_order[whose_turn].name == "") {
					whose_turn += 1;
					if (whose_turn > attack_order.length - 1) {
						fight_state = "Player Choice";
						actionBoxAppear();
						attacking = false;
						return;
					}
					return;
				}
				if (target.name == "" && attack_order[whose_turn].name == "Player") {
					findNewTarget();
				}
				message_text.text = attack_order[whose_turn].attack(attack_type, target, player);
				attack_order[whose_turn].statusDamage();
				attacking = true;
			}
		}
		else if (fight_state == "Game Over") {
			if (FlxG.keys.justPressed.ESCAPE) {
				FlxG.switchState(new MenuState());
				FlxG.sound.pause();
			}
		}
		else if (fight_state == "Victory") {
			if (FlxG.keys.justPressed.ESCAPE) {
				FlxG.switchState(new MenuState());
				FlxG.sound.pause();
			}
		}
		
		super.update();
	}
}