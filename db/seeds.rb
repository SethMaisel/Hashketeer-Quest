Encounter.destroy_all
CharacterGear.destroy_all
VillainGear.destroy_all
Gear.destroy_all
Character.destroy_all
Villain.destroy_all

knight = Character.create(name: "Knight", attack_power: 2, health: 200, origin: "As a lord and noble Hashketeer, you are obliged by your oath to defend the realm.  Position comes with a few advantages.  Your training allows you to do double damage and you carry a devastating array of weapons.  You wear shiny, shiny armor that grants a huge resistance to damage.  You are also much cleaner than those around you, free from plague, but do have an occasional bout of gout.", winning_text: "You Won!")
peasant = Character.create(name: "Peasant", attack_power: 1, health: 100, origin: "", winning_text: "")
monster = Character.create(name: "Monster", attack_power: 3, health: 100, origin: "", winning_text: "")
    
broadsword = Gear.create(name: "Broadsword", damage: 2, add_health: 0)
claymore = Gear.create(name: "Claymore", damage: 3, add_health: 0)
lance = Gear.create(name: "Lance", damage: 1, add_health: 0)
axe = Gear.create(name: "Wood Axe", damage: 3, add_health: 0)
herbal_suppliment = Gear.create(name: "Herbal Suppliment", damage: 0, add_health: 50)
warhammer = Gear.create(name: "Warhammer", damage: 2, add_health: 0)
rage_frenzy = Gear.create(name: "Rage Frenzy", damage: 3, add_health: 0)

knight_broadsword = CharacterGear.create(character_id: knight.id, gear_id: broadsword.id)
knight_claymore = CharacterGear.create(character_id: knight.id, gear_id: claymore.id)
knight_lance = CharacterGear.create(character_id: knight.id, gear_id: lance.id)
peasant_axe = CharacterGear.create(character_id: peasant.id, gear_id: axe.id)
peasant_herbal_suppliment = CharacterGear.create(character_id: peasant.id, gear_id: herbal_suppliment.id)
monster_warhammer = CharacterGear.create(character_id: monster.id, gear_id: warhammer.id)
monster_rage_frenzy = CharacterGear.create(character_id: monster.id, gear_id: rage_frenzy.id)

orc = Villain.create(name:"Evil Orc", attack_power: 2, health: 100, winning_text: "You have been eaten.  Womp, womp.")
orc_warhammer = VillainGear.create(villain_id: orc.id, gear_id: warhammer.id)

knight_orc = Encounter.create(character_id: knight.id, villain_id: orc.id, setting: "mountains")
peasant_orc = Encounter.create(character_id: peasant.id, villain_id: orc.id, setting: "mountains")
monster_orc = Encounter.create(character_id: monster.id, villain_id: orc.id, setting: "mountains")

