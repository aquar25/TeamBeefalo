
local MakePlayerCharacter = require "prefabs/player_common"


local assets = {

        Asset( "ANIM", "anim/player_basic.zip" ),
        Asset( "ANIM", "anim/player_idles_shiver.zip" ),
        Asset( "ANIM", "anim/player_actions.zip" ),
        Asset( "ANIM", "anim/player_actions_axe.zip" ),
        Asset( "ANIM", "anim/player_actions_pickaxe.zip" ),
        Asset( "ANIM", "anim/player_actions_shovel.zip" ),
        Asset( "ANIM", "anim/player_actions_blowdart.zip" ),
        Asset( "ANIM", "anim/player_actions_eat.zip" ),
        Asset( "ANIM", "anim/player_actions_item.zip" ),
        Asset( "ANIM", "anim/player_actions_uniqueitem.zip" ),
        Asset( "ANIM", "anim/player_actions_bugnet.zip" ),
        Asset( "ANIM", "anim/player_actions_fishing.zip" ),
        Asset( "ANIM", "anim/player_actions_boomerang.zip" ),
        Asset( "ANIM", "anim/player_bush_hat.zip" ),
        Asset( "ANIM", "anim/player_attacks.zip" ),
        Asset( "ANIM", "anim/player_idles.zip" ),
        Asset( "ANIM", "anim/player_rebirth.zip" ),
        Asset( "ANIM", "anim/player_jump.zip" ),
        Asset( "ANIM", "anim/player_amulet_resurrect.zip" ),
        Asset( "ANIM", "anim/player_teleport.zip" ),
        Asset( "ANIM", "anim/wilson_fx.zip" ),
        Asset( "ANIM", "anim/player_one_man_band.zip" ),
        Asset( "ANIM", "anim/shadow_hands.zip" ),
        Asset( "SOUND", "sound/sfx.fsb" ),
        Asset( "SOUND", "sound/wilson.fsb" ),
        Asset( "ANIM", "anim/beard.zip" ),

                -- Don't forget to include your character's custom assets!
        Asset( "ANIM", "anim/zenel.zip" ),
}
local prefabs = {}


local function onFreezingChange(inst, data)
        local freezing = false
        if (inst.components.temperature.current < 0) then
                freezing = true
        end
        -- If actually freezing, make super cold
        if (freezing) then
                inst.components.combat.damagemultiplier = .25
        else 
                inst.components.combat.damagemultiplier = 1
        end

end

local fn = function(inst)
        
        -- choose which sounds this character will play
        inst.soundsname = "wilson"

        -- a minimap icon must be specified
        inst.MiniMapEntity:SetIcon( "wilson.png" )

        -- Double the cold resistance, equivalent to about a puffy vest and a little bit.
        -- inst.components.temperature.inherentinsulation = TUNING.INSULATION_LARGE + 10 -- 250

        inst:ListenForEvent("temperaturedelta", onFreezingChange)


end


-- strings! Any "WOD" below would have to be replaced by the prefab name of your character.

-- First up, the character select screen lines 
-- note: these are lower-case character name
STRINGS.CHARACTER_TITLES.zenel = "The Coder"
STRINGS.CHARACTER_NAMES.zenel = "Zenel"
STRINGS.CHARACTER_DESCRIPTIONS.zenel = "* I am one with the demons.\n* More resistant to the cold.\n* Very weak when cold."
STRINGS.CHARACTER_QUOTES.zenel = "\"¡A la chingada!\""

-- You can also add any kind of custom dialogue that you would like. Don't forget to make
-- categores that don't exist yet using = {}
-- note: these are UPPER-CASE charcacter name
STRINGS.CHARACTERS.ZENEL = {}
STRINGS.CHARACTERS.ZENEL.DESCRIBE =
        {
                SLURPER = "Ew. What the fuck that is.?",
                ORANGEAMULET = "Your forcefield's good, but my teleporting is better.",
                YELLOWSTAFF = "I cast Fireball rank 5!",
                YELLOWGEM = "It looks like a topaz... Almost.",
                ORANGEGEM = "It's the color of amber.",
                TELEBASE = 
                {
                        VALID = "Yep, base.ready = true;",
                        GEMS = "Error: Base is not valid. Requires more purple gems.",
                },
                GEMSOCKET = 
                {
                        VALID = "socket.ready = true;",
                        GEMS = "socket.ready = false;",
                },
                STAFFLIGHT = "That's gonna...break something.",
                RESEARCHLAB4 = "What is this?",
        
        ANCIENT_ALTAR = "I wonder if Cthulu crashed here once or twice.",
                CAVE_BANANA = "BANANAAAAAAA!",
                CAVE_BANANA_COOKED = "Cooked... BANANAAAAAAA",
                CAVE_BANANA_TREE = "Hory shet. They MAKE TREES OF THESE.",
                ROCKY = "It has terrifying claws.",
                
                COMPASS =
                {
                        GENERIC="I can't get a reading",
                        N = "North",
                        S = "South",
                        E = "East",
                        W = "West",
                        NE = "Northeast",
                        SE = "Southeast",
                        NW = "Northwest",
                        SW = "Southwest",
                },
                HOUNDSTOOTH="You'd be more threatening in a hound's mouth.",
                ARMORSNURTLESHELL="I can't believe that I'm thinking of wearing this.",
                BAT="Fuck you, I'm Batman.",
                BATBAT = "Shouldn't it be called (Bat)^2?",
                BATWING="Better dead. Fuck bats.",
                BATWING_COOKED="It smells worse when cooked...",
                BEDROLL_FURRY="It's disgustingly warm.",
                BUNNYMAN="Crikey! Look a random furry in it's natural habitat!",
                FLOWER_CAVE="Is that flower glowing?",
                FLOWER_CAVE_DOUBLE="Is that flower glowing?",
                FLOWER_CAVE_TRIPLE="Is that flower glowing?",
                GUANO="That's batshit... crazy.",
                LANTERN="I feel like a Tonberry is nearby.",
                LIGHTBULB="I wonder if you can use this as a lightbulb?",
                MANRABBIT_TAIL="Ooh, furry tail!",
                MUSHTREE_TALL  ="DUDE. DO YOU WANT TO DO SOME SHROOMS?",
                MUSHTREE_MEDIUM="That's a moderately large shroom.",
                MUSHTREE_SMALL ="It's \"magic\"",
                RABBITHOUSE="It's like Spongebob. But not at all.",
                SLURTLE="Ah, hello shell eel.",
                SLURTLE_SHELLPIECES="Now how do you go back together?",
                SLURTLEHAT="Please don't put this on.",
                SLURTLEHOLE="How about no?",
                SLURTLESLIME="Why did you pick this up? It's got the consistency of cum...",
                SNURTLE="Ah, a snail...eel.",
                SPIDER_HIDER="Oh good, they hide now.",
                SPIDER_SPITTER="Pthew, I spit on you.",
                SPIDERHOLE="That's a whole lot of nope.",
                STALAGMITE="Pointy and vertical. Perfect.",
                STALAGMITE_FULL="Woo. More damn rocks.",
                STALAGMITE_LOW="Woo. More damn rocks.",
                STALAGMITE_MED="Woo. More damn rocks.",
                STALAGMITE_TALL="Ooh these ones are as tall as me!",
                STALAGMITE_TALL_FULL="Ooh these ones are as tall as me!",
                STALAGMITE_TALL_LOW="Ooh these ones are as tall as me!",
                STALAGMITE_TALL_MED="Ooh these ones are as tall as me!",
                TURF_FUNGUS="Ground. That is all.",
                TURF_MUD="Ground. That is all.",
                TURF_SINKHOLE="Ground. That is all.",
                TURF_UNDERROCK="Ground. That is all.",      

                POWCAKE = "Why would I bother eating this?",
        CAVE_ENTRANCE = 
        {
            GENERIC="I bet I could move that rock.",
            OPEN = "I really don't want to go down there. It's dark.",
        },
        CAVE_EXIT = "Fuck that dark, dank hole.",
                MAXWELLPHONOGRAPH = "Ah, the source of the music.",
                BOOMERANG = "Looks like I'm going down under. That means two things.",
                PIGGUARD = "Hey it's just another prick at the door.",
                ABIGAIL = "Holy shit. My dad was right. Ghosts exist.",
                ADVENTURE_PORTAL = "Good, good. Another portal.",
                AMULET = "I bet that I put this on my neck. Just a thought.",
                ANIMAL_TRACK = "Ooh, an animal print. Doesn't look like any animal I know.",
                ARMORGRASS = "Looks like almost... Hawaiian.",
                ARMORMARBLE = "I am a PALADIN.",
                ARMORWOOD = "Hey look, I'm woody.",
                ARMOR_SANITY = "I don't know if I'm strong enough mentally for this armor.",
                ASH =
                {
                        GENERIC = "All that's left after fire has done its job.",
                        REMAINS_EYE_BONE = "The eyebone was consumed by fire when I teleported!",
                        REMAINS_THINGIE = "This was once some thing before it got burned...",
                },
                AXE = "It's my trusty axe.",
                BABYBEEFALO = "Awwww. So cute!",
                BACKPACK = "It's for me to put my stuff in.",
                BACONEGGS = "I cooked it myself!",
                BANDAGE = "Seems sterile enough.",
                BASALT = "That's too strong to break through!",
                BATBAT = "I bet I could fly if I held two of these.",
                BEARDHAIR = "I made them with my face.",
                BEDROLL_STRAW = "It smells like wet.",
                BEE =
                {
                        GENERIC = "To bee or not to bee.",
                        HELD = "Careful!",
                },
                BEEBOX =
                {
                        FULLHONEY = "It's full of honey.",
                        GENERIC = "Bees!",
                        NOHONEY = "It's empty.",
                        SOMEHONEY = "I should wait a bit.",
                },
                BEEFALO =
                {
                        FOLLOWER = "He's coming along peacefully.",
                        GENERIC = "It's a beefalo!",
                        NAKED = "Aww, he's so sad.",
                        SLEEPING = "These guys are really heavy sleepers.",
                },
                BEEFALOHAT = "What a nice hat.",
                BEEFALOWOOL = "It smells like beefalo tears.",
                BEEHAT = "This should keep me protected.",
                BEEHIVE = "It's buzzing with activity.",
                BEEMINE = "It buzzes when I shake it.",
                BEEMINE_MAXWELL = "Bottled mosquito rage!",
                BERRIES = "Red berries taste the best.",
                BERRIES_COOKED = "I don't think heat improved them.",
                BERRYBUSH =
                {
                        BARREN = "I think it needs to be fertilized.",
                        GENERIC = "Red berries taste the best.",
                        PICKED = "Maybe they'll grow back?",
                },
                BIRDCAGE =
                {
                        GENERIC = "I should put a bird in it.",
                        OCCUPIED = "That's my bird!",
                        SLEEPING = "Awwww, he's asleep.",
                },
                BIRDTRAP = "Gives me a net advantage!",
                BIRD_EGG = "A small, normal egg.",
                BIRD_EGG_COOKED = "Sunny side yum!",
                BISHOP = "Back off, preacherman!",
                BLOWDART_FIRE = "This seems fundamentally unsafe.",
                BLOWDART_SLEEP = "Just don't breathe in.",
                BLUEAMULET = "Cool as ice!",
                BLUEGEM = "It sparkles with cold energy.",
                BLUEPRINT = "It's scientific!",
                BLUE_CAP = "It's weird and gooey.",
                BLUE_CAP_COOKED = "It's different now...",
                BLUE_MUSHROOM =
                {
                        GENERIC = "It's a mushroom.",
                        INGROUND = "It's sleeping",
                        PICKED = "I wonder if it will come back?",
                },
                BOARDS = "Boards",
                BOAT = "Is that how I got here?",
                BONESTEW = "I cooked it myself!",
                BUGNET = "For catching bugs.",
                BUSHHAT = "It's kind of scratchy.",
                BUTTER = "I can't believe it's butter!",
                BUTTERFLY =
                {
                        GENERIC = "Butterfly, flutter by.",
                        HELD = "Now I have you!",
                },
                BUTTERFLYMUFFIN = "I cooked it myself!",
                BUTTERFLYWINGS = "Without these, it's just a butter.",
                CAMPFIRE =
                {
                        EMBERS = "I should put something on the fire before it goes out.",
                        GENERIC = "Sure beats darkness.",
                        HIGH = "That fire is getting out of hand!",
                        LOW = "The fire's getting a bit low.",
                        NORMAL = "Nice and comfy.",
                        OUT = "Well, that's over.",
                },
                CANE = "It makes walking seem much easier!",
                CARROT = "Yuck. It's all vegetabley.",
                CARROT_COOKED = "Mushy.",
                CARROT_PLANTED = "The earth is making plantbabies.",
                CARROT_SEEDS = "It's a seed.",
                CAVE_FERN = "It's a fern.",
                CHARCOAL = "It's small, dark and smells like burnt wood.",
        CHESSJUNK1 = "A pile of broken chess pieces",
        CHESSJUNK2 = "Another pile of broken chess pieces",
        CHESSJUNK3 = "Even more broken chess pieces",
                CHESTER = "Otto von Chesterfield, Esq.",
                CHESTER_EYEBONE =
                {
                        GENERIC = "It's looking at me.",
                        WAITING = "It went to sleep.",
                },
                COOKEDMANDRAKE = "Poor little guy.",
                COOKEDMEAT = "Char broiled to perfection.",
                COOKEDMONSTERMEAT = "That's only somewhat more appetizing than when it was raw.",
                COOKEDSMALLMEAT = "Now I don't have to worry about getting worms!",
                COOKPOT =
                {
                        COOKING_LONG = "This is going to take a while.",
                        COOKING_SHORT = "It's almost done!",
                        DONE = "Mmmmm! It's ready to eat!",
                        EMPTY = "It makes me hungry just to look at it.",
                },
                CORN = "High in fructose!",
                CORN_COOKED = "High in fructose!",
                CORN_SEEDS = "It's a seed.",
                CROW =
                {
                        GENERIC = "Creepy!",
                        HELD = "He's not very happy in there.",
                },
                CUTGRASS = "Cut grass, ready for arts and crafts.",
                CUTREEDS = "Cut reeds, ready for crafting and hobbying.",
                CUTSTONE = "I've made them seductively smooth.",
                DEERCLOPS = "It's enormous!!",
                DEERCLOPS_EYEBALL = "This is really gross.",
                DEPLETED_GRASS =
                {
                        GENERIC = "It's probably a tuft of grass.",
                },
                DEVTOOL = "It smells of bacon!",
                DEVTOOL_NODEV = "I'm not strong enough to wield it.",
                DIRTPILE = "It's a pile of dirt... or IS it?",
                DIVININGROD =
                {
                        COLD = "The signal is very faint.",
                        GENERIC = "It's some kind of homing device.",
                        HOT = "This thing's going crazy!",
                        WARM = "I'm headed in the right direction.",
                        WARMER = "I must be getting pretty close.",
                },
                DIVININGRODBASE =
                {
                        GENERIC = "I wonder what it does.",
                        READY = "It looks like it needs a large key.",
                        UNLOCKED = "Now my machine can work!",
                },
                DIVININGRODSTART = "That rod looks useful!",
                DRAGONFRUIT = "What a weird fruit.",
                DRAGONFRUIT_COOKED = "Still weird.",
                DRAGONFRUIT_SEEDS = "It's a seed.",
                DRAGONPIE = "I cooked it myself!",
                DRUMSTICK = "I should gobble it.",
                DRUMSTICK_COOKED = "Now it's even tastier.",
                DUG_BERRYBUSH = "I should plant this.",
                DUG_GRASS = "I should plant this.",
                DUG_MARSH_BUSH = "I should plant this.",
                DUG_SAPLING = "I should plant this.",
                DURIAN = "Oh it smells!",
                DURIAN_COOKED = "Now it smells even worse!",
                DURIAN_SEEDS = "It's a seed.",
                EARMUFFSHAT = "At least my ears won't get cold...",
                EGGPLANT = "It doesn't look like an egg.",
                EGGPLANT_COOKED = "It's even less eggy.",
                EGGPLANT_SEEDS = "It's a seed.",
                EVERGREEN =
                {
                        BURNING = "What a waste of wood.",
                        BURNT = "I feel like I could have prevented that.",
                        CHOPPED = "Take that, nature!",
                        GENERIC = "It's all Piney.",
                },
                EVERGREEN_SPARSE =
                {
                        BURNING = "What a waste of wood.",
                        BURNT = "I feel like I could have prevented that.",
                        CHOPPED = "Take that, nature!",
                        GENERIC = "This sad tree has no cones.",
                },
                EYEPLANT = "I think I'm being watched.",
                FARMPLOT =
                {
                        GENERIC = "I should try planting some crops",
                        GROWING = "Go plants go!",
                        NEEDSFERTILIZER = "I think it needs to be fertilized.",
                },
                FEATHERHAT = "I AM A BIRD!",
                FEATHER_CROW = "A crow feather.",
                FEATHER_ROBIN = "A redbird feather.",
                FEATHER_ROBIN_WINTER = "A snowbird feather.",
                FEM_PUPPET = "She's trapped!",
                FIREFLIES =
                {
                        GENERIC = "If only I could catch them!",
                        HELD = "They make my pocket glow!",
                },
                FIREHOUND = "That one is glowy.",
                FIREPIT =
                {
                        EMBERS = "I should put something on the fire before it goes out.",
                        GENERIC = "Sure beats darkness.",
                        HIGH = "Good thing it's contained!",
                        LOW = "The fire's getting a bit low.",
                        NORMAL = "Nice and comfy.",
                        OUT = "At least I can start it up again",
                },
                FIRESTAFF = "I don't want to set the world on fire.",
                FISH = "Now I shall eat for a day.",
                FISHINGROD = "Hook, line and stick!",
                FISHSTICKS = "I cooked it myself!",
                FISHTACOS = "I cooked it myself!",
                FISH_COOKED = "Grilled to perfection.",
                FLINT = "It's a very sharp rock.",
                FLOWER = "It's pretty but it smells like a common labourer.",
                FLOWERHAT = "It smells like prettiness.",
                FLOWER_EVIL = "Augh! It's so evil!",
                FOLIAGE = "Some leafy greens.",
                FOOTBALLHAT = "I don't like sports.",
                FROG =
                {
                        DEAD = "He's croaked it.",
                        GENERIC = "He's so cute!",
                        SLEEPING = "Aww, look at him sleep!",
                },
                FROGGLEBUNWICH = "I cooked it myself!",
                FROGLEGS = "I've heard it's a delicacy.",
                FROGLEGS_COOKED = "Tastes like chicken.",
                FRUITMEDLEY = "I cooked it myself!",
                GEARS = "A pile of mechanical parts.",
                GHOST = "That offends me as a Scientist.",
                GOLDENAXE = "That's one fancy axe.",
                GOLDENPICKAXE = "Hey, isn't gold really soft?",
                GOLDENPITCHFORK = "Why did I even make a pitchfork this fancy?",
                GOLDENSHOVEL = "I can't wait to dig holes.",
                GOLDNUGGET = "I can't eat it, but it sure is shiny.",
                GRASS =
                {
                        BARREN = "It needs poop.",
                        BURNING = "That's burning fast!",
                        GENERIC = "It's a tuft of grass.",
                        PICKED = "I cut it down in the prime of its life.",
                },
                GREEN_CAP = "It seems pretty normal.",
                GREEN_CAP_COOKED = "It's different now...",
                GREEN_MUSHROOM =
                {
                        GENERIC = "It's a mushroom.",
                        INGROUND = "It's sleeping",
                        PICKED = "I wonder if it will come back?",
                },
                GUNPOWDER = "It looks like pepper.",
                HAMBAT = "This seems unsanitary.",
                HAMMER = "Stop! It's time! To hammer things!",
                HEALINGSALVE = "The stinging means that it's working.",
                HEATROCK =
                {
                        COLD = "It's stone cold.",
                        GENERIC = "I could heat this up near the fire.",
                        HOT = "Nice and toasty hot!",
                        WARM = "It's warm and cuddly... for a rock!",
                },
                HOME = "Someone must live here.",
                HOMESIGN = "It says 'You are here'.",
                HONEY = "Looks delicious!",
                HONEYCOMB = "Bees used to live in this.",
                HONEYHAM = "I cooked it myself!",
                HONEYNUGGETS = "I cooked it myself!",
                HORN = "It sounds like a beefalo field in there.",
                HOUND = "You ain't nothing, hound dog!",
                HOUNDBONE = "Creepy.",
                HOUNDMOUND = "I wouldn't want to pick a bone with the owner.",
                ICEBOX = "I have harnessed the power of cold!",
                ICEHOUND = "Are there hounds for every season?",
                INSANITYROCK =
                {
                        ACTIVE = "TAKE THAT, SANE SELF!",
                        INACTIVE = "It's more of a pyramid than an obelisk.",
                },
                JAMMYPRESERVES = "I cooked it myself!",
                KABOBS = "I cooked it myself!",
                KILLERBEE =
                {
                        GENERIC = "Oh no! It's a killer bee!",
                        HELD = "This seems dangerous.",
                },
                KNIGHT = "Check it out!",
                KOALEFANT_SUMMER = "Adorably delicious.",
                KOALEFANT_WINTER = "It looks warm and full of meat.",
                KRAMPUS = "He's going after my stuff!",
                KRAMPUS_SACK = "Ew. It has Krampus slime all over it.",
                LEIF = "He's huge!",
                LEIF_SPARSE = "He's huge!",
                LIGHTNING_ROD =
                {
                        CHARGED = "The power is mine!",
                        GENERIC = "I can harness the heavens!",
                },
                LITTLE_WALRUS = "He won't be cute and cuddly forever.",
                LIVINGLOG = "It looks worried.",
                LOCKEDWES = "Maxwell's statues are trapping him.",
                LOG =
                {
                        BURNING = "That's some hot wood!",
                        GENERIC = "It's big, it's heavy, and it's wood.",
                },
                LUREPLANT = "It's so alluring.",
                LUREPLANTBULB = "Now I can start my very own meat farm.",
                MALE_PUPPET = "He's trapped!",
                MANDRAKE =
                {
                        DEAD = "A mandrake root has strange powers.",
                        GENERIC = "I've heard strange things about those plants.",
                        PICKED = "Stop following me!",
                },
                MANDRAKESOUP = "I cooked it myself!",
                MANDRAKE_COOKED = "It doesn't seem so strange anymore.",
                MARBLE = "Fancy!",
                MARBLEPILLAR = "I think I could use that.",
                MARBLETREE = "I don't think an axe will cut it.",
                MARSH_BUSH =
                {
                        BURNING = "That's burning fast!",
                        GENERIC = "It looks thorny.",
                        PICKED = "That hurt.",
                },
                MARSH_PLANT = "It's a plant.",
                MARSH_TREE =
                {
                        BURNING = "Spikes and fire!",
                        BURNT = "Now it's burnt and spiky",
                        CHOPPED = "Not so spiky now!",
                        GENERIC = "Those spikes look sharp!",
                },
                MAXWELL = "I hate that guy",
                MAXWELLHEAD = "I can see into his pores.",
                MAXWELLLIGHT = "I wonder how they work.",
                MAXWELLLOCK = "Looks almost like a key hole.",
                MAXWELLTHRONE = "That doesn't look very comfortable.",
                MEAT = "It's a bit gamey, but it'll do.",
                MEATBALLS = "I cooked it myself!",
                MEATRACK =
                {
                        DONE = "Jerky time!",
                        DRYING = "Meat takes a while to dry.",
                        GENERIC = "I should dry some meats.",
                },
                MEAT_DRIED = "Just jerky enough",
                MERM = "Smells fishy!",
                MERMHEAD = "The stinkiest thing I'll smell all day.",
                MERMHOUSE = "Who would live here?",
                MINERHAT = "This will keep my hands free.",
                MONKEY = "Curious little guy.",
                MONKEYBARREL = "Did that barrel just move?",
                MONSTERLASAGNA = "I cooked it myself!",
                MONSTERMEAT = "Ugh. I don't think I should eat that.",
                MONSTERMEAT_DRIED = "Strange-smelling jerky",
                MOSQUITO =
                {
                        GENERIC = "Disgusting little bloodsucker.",
                        HELD = "Hey, is that my blood?",
                },
                MOUND =
                {
                        DUG = "I should probably feel bad about that.",
                        GENERIC = "I bet there's all sorts of good stuff down there!",
                },
                NIGHTLIGHT = "It gives off a spooky light.",
                NIGHTMAREFUEL = "This stuff is crazy!",
                NIGHTSWORD = "I dreamed it myself!",
                NITRE = "I'm not a geologist.",
                ONEMANBAND = "I should have added a beefalo bell.",
                PANDORASCHEST = "It may contain something fantastic! Or horrible.",
                PANFLUTE = "I can serenade the animals.",
                PAPYRUS = "Some sheets of paper.",
                PENGUIN = "Must be breeding season.",
                PERD = "Stupid bird! Stay away from my berries!",
                PEROGIES = "I cooked it myself!",
                PETALS = "I showed those flowers who's boss!",
                PETALS_EVIL = "I'm not sure I want to hold these.",
                PICKAXE = "Iconic, isn't it?",
                PIGGYBACK = "I feel kinda bad for that.",
                PIGHEAD = "Looks like an offering to the beast.",
                PIGHOUSE =
                {
                        FULL = "I can see a snout pressed up against the window.",
                        GENERIC = "These pigs have pretty fancy houses.",
                        LIGHTSOUT = "Come ON! I know you're home!",
                },
                PIGKING = "Ewwww, he smells!",
                PIGMAN =
                {
                        DEAD = "Someone should tell his family.",
                        FOLLOWER = "He's part of my entourage.",
                        GENERIC = "They kind of creep me out.",
                        GUARD = "He looks serious.",
                        WEREPIG = "He's not friendly!",
                },
                PIGSKIN = "It still has the tail on it.",
                PIGTENT = "Smells like bacon.",
                PIGTORCH = "Sure looks cozy.",
                PINECONE = 
                {
                    GENERIC = "I can hear a tiny tree inside it, trying to get out.",
                    PLANTED = "It'll be a tree soon!",
                },
                PITCHFORK = "Maxwell might be looking for this",
                PLANTMEAT = "That doesn't look very appealing.",
                PLANTMEAT_COOKED = "At least it's warm now.",
                PLANT_NORMAL =
                {
                        GENERIC = "Leafy!",
                        GROWING = "Guh! It's growing so slowly!",
                        READY = "Mmmm. Ready to harvest.",
                },
                POMEGRANATE = "It looks like the inside of an alien's brain.",
                POMEGRANATE_COOKED = "Haute Cuisine!",
                POMEGRANATE_SEEDS = "It's a seed.",
                POND = "I can't see the bottom!",
                POOP = "I should fill my pockets!",
                PUMPKIN = "It's as big as my head!",
                PUMPKINCOOKIE = "I cooked it myself!",
                PUMPKIN_COOKED = "How did it turn into a pie...",
                PUMPKIN_LANTERN = "Spooky!",
                PUMPKIN_SEEDS = "It's a seed.",
                PURPLEAMULET = "It's whispering to me.",
                PURPLEGEM = "It contains the mysteries of the universe.",
                RABBIT =
                {
                        GENERIC = "He's looking for carrots.",
                        HELD = "Do you like science?",
                },
                RABBITHOLE = "That must lead to the Kingdom of the Bunnymen.",
                RAINOMETER = "It measures cloudiness.",
                RATATOUILLE = "I cooked it myself!",
                RAZOR = "A sharpened rock tied to a stick. Hygienic!",
                REDGEM = "It sparkles with inner warmth.",
                RED_CAP = "It smells funny.",
                RED_CAP_COOKED = "It's different now...",
                RED_MUSHROOM =
                {
                        GENERIC = "It's a mushroom.",
                        INGROUND = "It's sleeping",
                        PICKED = "I wonder if it will come back?",
                },
                REEDS =
                {
                        BURNING = "That's really burning!",
                        GENERIC = "It's a clump of reeds.",
                        PICKED = "I picked all the useful reeds.",
                },
                RESEARCHLAB = "It breaks down objects into their scientific components.",
                RESEARCHLAB2 = "It's even more science-y than the last one!",
                RESEARCHLAB3 = "What have I created?",
                RESEARCHLAB4 = "Who would name something that?",
                RESURRECTIONSTATUE = "What a handsome devil!",
                RESURRECTIONSTONE = "What an odd looking stone.",
                ROBIN =
                {
                        GENERIC = "Does that mean spring is coming?",
                        HELD = "He likes my pocket.",
                },
                ROBIN_WINTER =
                {
                        GENERIC = "Life in the frozen wastes.",
                        HELD = "It's so soft.",
                },
                ROBOT_PUPPET = "It's trapped!",
                ROCK_LIGHT =
                {
                        GENERIC = "A crusted over lava pit.",
                        OUT = "Looks fragile",
                        LOW = "The lava's crusting over.",
                        NORMAL = "Nice and comfy.",
                },
                ROCK = "It wouldn't fit in my pocket.",
                ROCKS = "I can make stuff with these.",
        ROOK = "Storm the castle!",
                ROPE = "Some short lengths of rope.",
                ROTTENEGG = "Ew! It stinks!",
                SANITYROCK =
                {
                        ACTIVE = "That's a CRAZY looking rock!",
                        INACTIVE = "Where did the rest of it go?",
                },
                SAPLING =
                {
                        BURNING = "That's burning fast!",
                        GENERIC = "Baby trees are so cute!",
                        PICKED = "That'll teach him.",
                },
                SEEDS = "Each one is a tiny mystery.",
                SEEDS_COOKED = "I cooked all the life out of 'em",
                SEWING_KIT = "Darn it! Darn it all to heck!",
                SHOVEL = "There's a lot going on underground.",
                SILK = "It comes from a spider's butt.",
                SKELETON = "Better him than me.",
                SKULLCHEST = "I'm not sure if I want to open it.",
                SMALLBIRD =
                {
                        GENERIC = "That's a rather small bird.",
                        HUNGRY = "It looks hungry.",
                        STARVING = "It must be starving.",
                },
                SMALLMEAT = "A tiny chunk of dead animal.",
                SMALLMEAT_DRIED = "A little jerky.",
                SPEAR = "That's one pointy stick",
                SPIDER =
                {
                        DEAD = "Ewwww!",
                        GENERIC = "I hate spiders.",
                        SLEEPING = "I'd better not be here when he wakes up.",
                },
                SPIDERDEN = "Sticky!",
                SPIDEREGGSACK = "I hope these don't hatch in my pocket.",
                SPIDERGLAND = "It has a tangy, antiseptic smell.",
                SPIDERHAT = "I hope I got all of the spider goo out of it.",
                SPIDERQUEEN = "AHHHHHHHH! That spider is huge!",
                SPIDER_WARRIOR =
                {
                        DEAD = "Good riddance!",
                        GENERIC = "Looks even meaner than usual.",
                        SLEEPING = "I should keep my distance.",
                },
                SPOILED_FOOD = "It's a furry ball of rotten food.",
                STATUEHARP = "What has happened to the head?",
                STATUEMAXWELL = "It really captures his personality.",
                STINGER = "Looks sharp!",
                STRAWHAT = "What a nice hat.",
                STUFFEDEGGPLANT = "I cooked it myself!",
                SUNKBOAT = "It's no use to me out there!",
                TAFFY = "I cooked it myself!",
                TALLBIRD = "That's a tall bird!",
                TALLBIRDEGG = "Will it hatch?",
                TALLBIRDEGG_COOKED = "Delicious and nutritional.",
                TALLBIRDEGG_CRACKED =
                {
                        COLD = "Brrrr!",
                        GENERIC = "Looks like it's hatching.",
                        HOT = "Are eggs supposed to sweat?",
                        LONG = "I have a feeling this is going to take a while...",
                        SHORT = "It should hatch any time now.",
                },
                TALLBIRDNEST =
                {
                        GENERIC = "That's quite an egg!",
                        PICKED = "The nest is empty.",
                },
                TEENBIRD =
                {
                        GENERIC = "Not a very tall bird.",
                        HUNGRY = "I'd better find it some food.",
                        STARVING = "It has a dangerous look in it's eye.",
                },
                TELEBASE =
                {
                        VALID = "It's ready to go.",
                        GEMS = "It needs more purple gems.",
                },
                GEMSOCKET = 
                {
                        VALID = "Looks ready.",
                        GEMS = "It needs a gem.",
                },
                TELEPORTATO_BASE =
                {
                        ACTIVE = "With this I can surely pass through space and time!",
                        GENERIC = "This appears to be a nexus to another world!",
                        LOCKED = "There's still something missing.",
                        PARTIAL = "Soon, my invention will be complete!",
                },
                TELEPORTATO_BOX = "This may control the polarity of the whole universe.",
                TELEPORTATO_CRANK = "Tough enough to handle the most intense experiments.",
                TELEPORTATO_POTATO = "This metal potato contains great and fearful power...",
                TELEPORTATO_RING = "A ring that could focus dimensional energies.",
                TELESTAFF = "It can show me the world.",
                TENT = "I get crazy when I don't sleep.",
                TENTACLE = "That looks dangerous.",
                TENTACLESPIKE = "It's pointy and slimy.",
                TENTACLESPOTS = "I think these were its genitalia.",
                TENTACLE_PILLAR = "A slimy pole.",
                TENTACLE_PILLAR_ARM = "Little slippery arms.",
                TENTACLE_GARDEN = "Yet another slimy pole.",
                TOPHAT = "What a nice hat.",
                TORCH = "Something to hold back the night.",
                TRAP = "I wove it real tight.",
                TRAP_TEETH = "This is a nasty surprise.",
                TRAP_TEETH_MAXWELL = "I'll want to avoid stepping on that!",
                TREASURECHEST = "It's my tickle trunk!",
                TREASURECHEST_TRAP = "How convenient!",
                TREECLUMP = "It's almost like someone is trying to prevent me from going somewhere",
                TRINKET_1 = "They are all melted together.",
                TRINKET_10 = "I hope I get out of here before I need these",
                TRINKET_11 = "He whispers beautiful lies to me.",
                TRINKET_12 = "I'm not sure what I should do with a dessicated tentacle.",
                TRINKET_2 = "It's just a cheap replica",
                TRINKET_3 = "The knot is stuck. Forever.",
                TRINKET_4 = "It must be some kind of religious artifact.",
                TRINKET_5 = "Sadly, it's too small for me to escape on.",
                TRINKET_6 = "Their electricity carrying days are over.",
                TRINKET_7 = "I have no time for fun and games!",
                TRINKET_8 = "Great. All of my tub stopping needs are met.",
                TRINKET_9 = "I'm more of a zipper person, myself.",
                TRUNKVEST_SUMMER = "Wilderness casual.",
                TRUNKVEST_WINTER = "Winter survival gear.",
                TRUNK_COOKED = "Somehow even more nasal than before.",
                TRUNK_SUMMER = "A light breezy trunk.",
                TRUNK_WINTER = "A thick, hairy trunk.",
                TURF_CARPETFLOOR = "It's surprisingly scratchy.",
                TURF_CHECKERFLOOR = "These are pretty snazzy.",
                TURF_DIRT = "A chunk of ground.",
                TURF_FOREST = "A chunk of ground.",
                TURF_GRASS = "A chunk of ground.",
                TURF_MARSH = "A chunk of ground.",
                TURF_ROAD = "Hastily Cobbled Stones",
                TURF_ROCKY = "A chunk of ground.",
                TURF_SAVANNA = "A chunk of ground.",
                TURF_WOODFLOOR = "These are floorboards.",
                TURKEYDINNER = "Mmmm.",
                TWIGS = "It's a bunch of small twigs.",
                UMBRELLA = "This will keep my hair dry, at least.",
                UNIMPLEMENTED = "It doesn't look finished! It could be dangerous.",
                WAFFLES = "I cooked it myself!",
                WALL_HAY = "Hmmmm. I guess that'll have to do.",
                WALL_HAY_ITEM = "This seems like a bad idea.",
                WALL_STONE = "That's a nice wall",
                WALL_STONE_ITEM = "They make me feel so safe.",
                WALL_RUINS = "That's a nice wall",
                WALL_RUINS_ITEM = "They make me feel so safe.",
                WALL_WOOD = "Pointy!",
                WALL_WOOD_ITEM = "Pickets!",
                WALRUS = "Walruses are natural predators.",
                WALRUSHAT = "It's covered with walrus hairs.",
                WALRUS_CAMP =
                {
                        EMPTY = "Looks like somebody was camping here.",
                        GENERIC = "It looks warm and cozy inside.",
                },
                WALRUS_TUSK = "I'm sure I'll find a use for it eventually.",
                WASPHIVE = "I think those bees are mad.",
                WETGOOP = "I cooked it myself!",
                WINTERHAT = "It'll be good for when winter comes.",
                WINTEROMETER = "I am one heck of a scientist.",
                WORMHOLE =
                {
                        GENERIC = "Soft and undulating.",
                        OPEN = "Science compels me to jump in.",
                },
                WORMHOLE_LIMITED = "Guh, that thing looks worse off than usual.",
        },
        DESCRIBE_GENERIC = "It's a... thing.",
        DESCRIBE_TOODARK = "It's too dark to see!",
        EAT_FOOD =
        {
                TALLBIRDEGG_CRACKED = "Mmm. Beaky.",
        },


return MakePlayerCharacter("zenel", prefabs, assets, fn)
