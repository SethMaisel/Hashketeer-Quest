Encounter.destroy_all
CharacterGear.destroy_all
VillainGear.destroy_all
Gear.destroy_all
Character.destroy_all
Villain.destroy_all

knight = Character.create(name: "Knight", attack_power: 2, health: 150, 
    origin: "As a lord and noble Hashketeer, you are obliged by your oath to defend the realm. Position comes with a few advantages.\nYour training allows you to do increased damage and you carry a devastating array of weapons. You wear shiny, shiny armor that grants a huge resistance to damage. \nYou are also much cleaner than those around you, free from plague, but do have an occasional bout of gout.", 
    winning_text: "With a final thrust, the Orc topples lifelessly to the dust! \nThe ravening hordes shriek in terror, blinded by your puissance.  You stand astride your fallen foe and shout to the sky: 'victorycry'\nThe remainder of the terrorized swarm melt into the hills, never to be seen again.\nYou return to King Kyle bearing the orcish head. The court and all people of Cohort line the great hall and cheer lustily until King Kyle bellows a hearty, “Shut Up!”.  
    \nAs you kneel before him, the King thanks you profusely and makes you heir to the realm! All bow their thanks and the banquet begins on Three.  King Kyle shouts, “One, Two…”")
peasant = Character.create(name: "Peasant", attack_power: 1, health: 100, 
    origin: "You have an inner drive to do what’s right and defend what’s yours. No stinking monster is going to despoil your farm and family honor!\nYou carry your grandfather’s massive axe, mostly used for chopping firewood, but you’ve kept it very sharp. \nWhile you have no armor other than your integrity, you do have some basic herbology and can make a potion which restores your health. It also produces a sense of euphoria.\nDo not overuse.", 
    winning_text: "The horrible beast is cleaved in twain!  The senseless halves topple to the ground. You step back a pace from the horrible stench.\nAnd you thought they smelled bad on the outside!\nAs you look up from your defeated foe, you see more knobbly green heads peering over rocks and from behind trees. You look at them and scream your defiance: “victorycry”\nYou ready your family’s axe for another bout. You drink a draught of your restorative and can’t repress a giggle.\nYour laughter is the final straw.\nGreen bodies streak away, howling in terror at the name of username!\nAs you wend along the long path to your hovel, an entourage of King Kyle rides to meet you! Before you can say 'victorycry', you are swept into the presence of the Lord of the Cohort.\nAs you begin to kneel, King Kyle stops you with a hearty, “Shut Up!”. Then, he and all of the cohort kneel before you.\nThe mighty lord intones, “Thou hast saved the Cohort-dom, username. You kneel to no one.”
    \nWith that, you are made a lord in your own right! What remains of your family is moved to the palace to live in comfort forever more. You dubbed reader of the sacred promises and live happily ever after.")
monster = Character.create(name: "Monster", attack_power: 3, health: 100, 
    origin: "Outcast by your clan for witchcraft (you once counted all the way to four), you have wandered the hills alone.\nNow it is time to reclaim your land, your clan, and your birthright.\nIn the time-honored Orc tradition, you must now slaughter your way to the top.  \nYou carry a massive warhammer you have fashioned yourself from the bones of your enemies... and a big rock.\nIn the heat of battle you also can enter into a mindless frenzy of claws and teeth, decimating opponents and any landscape nearby.",
    winning_text: "Your opponent falls and you take a severed arm with you as a nourishing snack for later.\nThe clan retreats as you roar, 'victorycry' You lounge in the stone seat of power as all around the clan chants, 'username! username!'
    \nThe assembled horde gasps as you confidently count, not just to four, but all the way to FIVE! They come groveling to their mighty WitchKing, username.\nYou establish schools for counting rocks and introduce yearly baths.
    \nThe age of username ushers in an orc renaissance of counting, art, and, of course, bloody  conquest. Shouting “victorycry”, your armies sweep across the plains, devouring all in their path. The kingdoms of man never stood a chance.")
    
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

orc = Villain.create(name:"Evil Orc", attack_power: 2, health: 100, 
    winning_text: "You have been defeated!\nAs the slavering beast stands gloating over your broken frame, you gasp out: “lastwords”\nThe last thing you see is a grinning saw-toothed maw approaching. \nThe world goes dark accompanied by the music of your own snapping bones.")
orc_warhammer = VillainGear.create(villain_id: orc.id, gear_id: warhammer.id)

knight_orc = Encounter.create(character_id: knight.id, villain_id: orc.id, setting: "mountains")
peasant_orc = Encounter.create(character_id: peasant.id, villain_id: orc.id, setting: "mountains")
monster_orc = Encounter.create(character_id: monster.id, villain_id: orc.id, setting: "mountains")

