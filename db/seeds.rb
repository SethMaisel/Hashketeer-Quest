Encounter.destroy_all
CharacterGear.destroy_all
VillainGear.destroy_all
Gear.destroy_all
Character.destroy_all
Villain.destroy_all

knight = Character.create(name: "Knight", attack_power: 2, health: 100, origin: "As a lord and noble Hashketeer, you are obliged by your oath to defend the realm.  Position comes with a few advantages.  Your training allows you to do double damage and you carry a devastating array of weapons.  You wear shiny, shiny armor that grants a huge resistance to damage.  You are also much cleaner than those around you, free from plague, but do have an occasional bout of gout.", winning_text: "You Won!")
orc = Villain.create(name:"Evil Orc", attack_power: 1, health: 100, winning_text: "You have been eaten.  Womp, womp.")
broadsword = Gear.create(name: "Broadsword", damage: 15, add_health: 0)
claymore = Gear.create(name: "Claymore", damage: 20, add_health: 0)
warhammer = Gear.create(name: "Warhammer", damage: 17, add_health: 0)
knight_broadsword = CharacterGear.create(character_id: knight.id, gear_id: broadsword.id)
knight_claymore = CharacterGear.create(character_id: knight.id, gear_id: claymore.id)
orc_warhammer = VillainGear.create(villain_id: orc.id, gear_id: warhammer.id)
knight_orc = Encounter.create(character_id: knight.id, villain_id: orc.id, setting: "mountains")

