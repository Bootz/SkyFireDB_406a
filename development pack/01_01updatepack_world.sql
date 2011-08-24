
SET @GUID = 208787; -- creature.guid (need 2)

SET @Diver=31689; -- Gnome Diver
UPDATE `creature_template` SET `AIName`='SmartAI',`vehicleid`=0,`InhabitType`=4 WHERE `entry`=@Diver; -- Gnome Diver
UPDATE `creature_template` SET `InhabitType`=7 WHERE `entry` IN (31719,31768,31769); -- Cosmetic Frenzy, Stabled Hunter Pet -- flying
-- Model data
UPDATE `creature_model_info` SET `bounding_radius`=0.3519,`combat_reach`=1,`gender`=0 WHERE `modelid`=27657; -- Gnome Diver
UPDATE `creature_model_info` SET `bounding_radius`=0.09,`combat_reach`=1,`gender`=2 WHERE `modelid`=23514; -- Stabled Hunter Pet
UPDATE `creature_model_info` SET `bounding_radius`=0.245,`combat_reach`=1,`gender`=2 WHERE `modelid`=23513; -- Stabled Hunter Pet
UPDATE `creature_model_info` SET `bounding_radius`=0.35,`combat_reach`=0,`gender`=2 WHERE `modelid`=2955; -- Cosmetic Albino Snake
UPDATE `creature_model_info` SET `bounding_radius`=0.374,`combat_reach`=0,`gender`=2 WHERE `modelid`=27718; -- Cosmetic Smolderweb Hatchling
UPDATE `creature_model_info` SET `bounding_radius`=0.35,`combat_reach`=0,`gender`=2 WHERE `modelid`=2954; -- Cosmetic Ribbon Snake
UPDATE `creature_model_info` SET `bounding_radius`=0.25,`combat_reach`=0,`gender`=2 WHERE `modelid`=5555; -- Cosmetic Cat Set 2/2
UPDATE `creature_model_info` SET `bounding_radius`=0.35,`combat_reach`=0,`gender`=2 WHERE `modelid`=1206; -- Cosmetic Black Kingsnake
UPDATE `creature_model_info` SET `bounding_radius`=0.3519,`combat_reach`=1,`gender`=1 WHERE `modelid`=25791; -- Breanni
UPDATE `creature_model_info` SET `bounding_radius`=0.35,`combat_reach`=0,`gender`=2 WHERE `modelid`=2957; -- Cosmetic Brown Snake
UPDATE `creature_model_info` SET `bounding_radius`=0.15,`combat_reach`=1,`gender`=2 WHERE `modelid`=3233; -- Cosmetic Cockroach
UPDATE `creature_model_info` SET `bounding_radius`=0.3,`combat_reach`=0,`gender`=2 WHERE `modelid`=27719; -- Cosmetic Worg Pup
UPDATE `creature_model_info` SET `bounding_radius`=0,`combat_reach`=1,`gender`=2 WHERE `modelid`=1141; -- Cosmetic Rat
UPDATE `creature_model_info` SET `bounding_radius`=0.6,`combat_reach`=0,`gender`=2 WHERE `modelid`=27682; -- Cosmetic Pig
UPDATE `creature_model_info` SET `bounding_radius`=0.25,`combat_reach`=0,`gender`=2 WHERE `modelid`=5586; -- Cosmetic Cat Set 1/2
UPDATE `creature_model_info` SET `bounding_radius`=0.2,`combat_reach`=0,`gender`=2 WHERE `modelid`=27881; -- Cosmetic Turtle
UPDATE `creature_model_info` SET `bounding_radius`=0.2749995,`combat_reach`=0,`gender`=2 WHERE `modelid`=23519; -- Stabled Hunter Pet
UPDATE `creature_model_info` SET `bounding_radius`=0.28,`combat_reach`=0,`gender`=2 WHERE `modelid`=27690; -- Stabled Hunter Pet
UPDATE `creature_model_info` SET `bounding_radius`=0.45,`combat_reach`=1,`gender`=2 WHERE `modelid`=4636; -- Stabled Hunter Pet
UPDATE `creature_model_info` SET `bounding_radius`=1.122,`combat_reach`=0,`gender`=2 WHERE `modelid`=2540; -- Stabled Hunter Pet
UPDATE `creature_model_info` SET `bounding_radius`=0.383,`combat_reach`=1,`gender`=1 WHERE `modelid`=25607; -- Tassia Whisperglen

-- Addon data
DELETE FROM `creature_template_addon` WHERE `entry` IN (@Diver,28951,28690,31719,31742,31709,31795,31714,31729,31710,31711,31733,31796,31732,31735,31728,31740,31741,31755,31756,31757,31758,31768,31769);
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@Diver,0,33554432,1,0, '59562 0'), -- Gnome Diver
(28951,0,0,257,0, '60913 0 61354 0'), -- Breanni
(28690,0,0,257,0, NULL), -- Tassia Whisperglen
(31719,0,0,1,0, NULL), -- Cosmetic Frenzy
(31742,0,0,1,0, NULL), -- Cosmetic Prairie Dog
(31709,0,0,1,0, NULL), -- Cosmetic Albino Snake
(31795,0,0,1,0, NULL), -- Cosmetic Smolderweb Hatchling
(31714,0,0,1,0, NULL), -- Cosmetic Ribbon Snake
(31729,0,0,1,0, NULL), -- Cosmetic Cat Set 2/2
(31710,0,0,1,0, NULL), -- Cosmetic Black Kingsnake
(31711,0,0,1,0, NULL), -- Cosmetic Brown Snake
(31733,0,0,1,0, NULL), -- Cosmetic Cockroach
(31796,0,0,1,0, NULL), -- Cosmetic Worg Pup
(31732,0,0,1,0, NULL), -- Cosmetic Rat
(31735,0,0,1,0, NULL), -- Cosmetic Pig
(31728,0,0,1,0, NULL), -- Cosmetic Cat Set 1/2
(31740,0,0,1,0, NULL), -- Cosmetic Turtle
(31741,0,0,1,0, NULL), -- Cosmetic Rabbit
(31755,0,0,1,0, NULL), -- Stabled Hunter Pet
(31756,0,0,1,0, NULL), -- Stabled Hunter Pet
(31757,0,0,1,0, NULL), -- Stabled Hunter Pet
(31758,0,0,1,0, NULL), -- Stabled Hunter Pet
(31768,0,0,1,0, NULL), -- Stabled Hunter Pet
(31769,0,0,1,0, NULL); -- Stabled Hunter Pet

-- Random movement for two of the Stabled Hunter Pets
UPDATE `creature` SET `spawndist`=5, `MovementType`=1 WHERE `guid` IN (97556,97653);

-- Aura used by all Cosmetic* npcs in Dalaran
-- DELETE FROM `spell_dbc` WHERE `Id`=28782;
-- INSERT INTO `spell_dbc` (`Id`,`Comment`) VALUES (28782, 'Dalaran Cosmetic Aura - Unknown effect');

-- SAI/Gnome Diver: reply to emotes
DELETE FROM `smart_scripts` WHERE `entryorguid`=@Diver AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`)VALUES
(@Diver,0,0,0,22,0,100,0,78,5000,5000,0,5,66,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Gnome Diver: Salute - Salute'),
(@Diver,0,1,0,22,0,100,0,21,5000,5000,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Gnome Diver: Cheer - Bow'),
(@Diver,0,2,0,22,0,100,0,101,5000,5000,0,5,3,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Gnome Diver: Wave - Wave'),
(@Diver,0,3,0,22,0,100,0,34,5000,5000,0,5,94,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Gnome Diver: Dance - Dance'),
(@Diver,0,4,0,22,0,100,0,328,5000,5000,0,5,11,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Gnome Diver: Flirt - Laugh'),
(@Diver,0,5,0,22,0,100,0,58,5000,5000,0,5,23,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Gnome Diver: Kiss - Flex'),
(@Diver,0,6,0,22,0,100,0,77,5000,5000,0,5,14,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Gnome Diver: Rude - Rude');

-- Waypoints for flying birds
DELETE FROM `creature_addon` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id` IN (31768,31769));
DELETE FROM `creature` WHERE `id` IN (31768,31769);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(@GUID+0,31768,571,1,1,0,0,5864.76025,561.5035,656.350159,3.38593864,120,0,0,1,0,0,2,0,0,0),
(@GUID+1,31769,571,1,1,0,0,5871.1377,556.659363,660.738953,1.44698894,120,0,0,1,0,0,2,0,0,0);
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES
(@GUID+0,(@GUID+0)*10),
(@GUID+1,(@GUID+1)*10);
DELETE FROM `waypoint_data`  WHERE `id` IN ((@GUID+0)*10,(@GUID+1)*10);
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`) VALUES	
((@GUID+0)*10,00,5865.73,561.7454,656.3502),
((@GUID+0)*10,01,5864.76,561.5035,656.3502),
((@GUID+0)*10,02,5865.858,545.6048,657.8221),
((@GUID+0)*10,03,5856.59,546.2563,657.8221),
((@GUID+0)*10,04,5851.967,553.7063,657.8221),
((@GUID+0)*10,05,5848.848,559.3509,657.8221),
((@GUID+0)*10,06,5855.463,567.5033,657.8221),
((@GUID+0)*10,07,5861.43,566.0272,657.8221),
((@GUID+0)*10,08,5870.177,562.2965,657.8221),
((@GUID+0)*10,09,5872.478,553.6407,657.8221),
((@GUID+0)*10,10,5864.64,545.9483,657.8221),
((@GUID+0)*10,11,5856.267,546.3598,657.8221),
((@GUID+0)*10,12,5851.878,553.7315,657.8221),
((@GUID+0)*10,13,5848.888,559.2279,657.8221),
((@GUID+0)*10,14,5848.888,559.2279,657.8221),
((@GUID+1)*10,0,5856.941,550.4024,656.2946),
((@GUID+1)*10,1,5856.993,551.4011,656.2946),
((@GUID+1)*10,2,5852.679,558.0845,660.739),
((@GUID+1)*10,3,5852.628,548.4319,660.739),
((@GUID+1)*10,4,5862.95,547.2537,660.739),
((@GUID+1)*10,5,5871.105,556.4464,660.739),
((@GUID+1)*10,6,5866.302,565.8504,660.739),
((@GUID+1)*10,7,5857.606,565.6177,660.739),
((@GUID+1)*10,8,5857.606,565.6177,660.739);

-- positions for Dalaran 'Trespasser!' spell
DELETE FROM `spell_target_position` WHERE `id` IN (54028,54029);
INSERT INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES
(54028, 571, 5758.79, 678.359, 642.726, 5.572),
(54029, 571, 5849.16, 602.093, 651.13, 2.364);

-- Some Dalran and Area Updates (sniff)
-- Template updates 
UPDATE `creature_template` SET `exp`=0,`npcflag`=`npcflag`|640 WHERE `entry`=32415; -- Hamaka
UPDATE `creature_template` SET `exp`=0,`npcflag`=`npcflag`|130 WHERE `entry`=31031; -- Misensi
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|768 WHERE `entry`=35826; -- Kaye Toogie
UPDATE `creature_template` SET `dynamicflags`=`dynamicflags`|4 WHERE `entry`=32428; -- Underbelly Rat
UPDATE `creature_template` SET `npcflag`=`npcflag`|3 WHERE `entry`=36670; -- Magister Hathorel
UPDATE `creature_template` SET `exp`=2,`minlevel`=82,`maxlevel`=82,`baseattacktime`=2000,`unit_flags`=`unit_flags`|33555200 WHERE `entry`=37858; -- Razorscale Image
UPDATE `creature_template` SET `exp`=0 WHERE `entry`=32328; -- [DND] Dalaran Sewer Arena - Controller - Death
UPDATE `creature_template` SET `exp`=0 WHERE `entry`=32339; -- [DND] Dalaran Sewer Arena - Controller
UPDATE `creature_template` SET `minlevel`=75,`maxlevel`=75,`npcflag`=`npcflag`|4224,`unit_flags`=`unit_flags`|768 WHERE `entry`=33938; -- Zom Bocom
UPDATE `creature_template` SET `minlevel`=75,`maxlevel`=75,`npcflag`=`npcflag`|4224,`unit_flags`=`unit_flags`|768 WHERE `entry`=33937; -- Xazi Smolderpipe
UPDATE `creature_template` SET `minlevel`=75,`maxlevel`=75,`npcflag`=`npcflag`|4224,`unit_flags`=`unit_flags`|512 WHERE `entry`=33936; -- Nargle Lashcord
UPDATE `creature_template` SET `npcflag`=`npcflag`|4224,`unit_flags`=`unit_flags`|512 WHERE `entry`=34095; -- Trapjaw Rix
UPDATE `creature_template` SET `baseattacktime`=2000,`unit_flags`=`unit_flags`|33544 WHERE `entry`=42078; -- Mini Thor
UPDATE `creature_template` SET `exp`=0 WHERE `entry`=32322; -- Gold Warrior
UPDATE `creature_template` SET `exp`=0 WHERE `entry`=32325; -- Gold Priest

-- Model data 
UPDATE `creature_model_info` SET `bounding_radius`=1.05,`combat_reach`=1.05,`gender`=0 WHERE `modelid`=10957; -- Dappled Stag
UPDATE `creature_model_info` SET `bounding_radius`=0.236,`combat_reach`=1.5,`gender`=0 WHERE `modelid`=27957; -- Hamaka
UPDATE `creature_model_info` SET `bounding_radius`=1,`combat_reach`=1,`gender`=2 WHERE `modelid`=1141; -- Underbelly Rat
UPDATE `creature_model_info` SET `bounding_radius`=0.5,`combat_reach`=0.75,`gender`=0 WHERE `modelid`=4449; -- Imp
UPDATE `creature_model_info` SET `bounding_radius`=0.09,`combat_reach`=1.5,`gender`=1 WHERE `modelid`=30806; -- Razorscale Image
UPDATE `creature_model_info` SET `bounding_radius`=0.75,`combat_reach`=1.5,`gender`=0 WHERE `modelid`=27766; -- [DND] Dalaran Sewer Arena - Controller
UPDATE `creature_model_info` SET `bounding_radius`=0.09,`combat_reach`=0,`gender`=2 WHERE `modelid`=32670; -- Mini Thor

-- Addon data
DELETE FROM `creature_template_addon` WHERE `entry` IN (417,31233,31228,33778,34244,31236,29631,32692,32687,30352,31085,30755,31081,28671,28160,31031,28674,31238,29238,31229,
32596,32415,32419,32418,32253,32412,32602,32732,31439,35826,32428,36670,32251,32252,32420,30659,32730,28991,32470,27047,29497,29534,31851,29493,28989,29533,32686,32683,
29325,31080,20735,28742,29496,32265,31517,29499,37858,29156,29476,28993,32691,32675,30885,32328,32339,32743,23472,33938,33937,33936,34095,29527,28956,28691,28332,28994,28692,
42078,29494,35497,29523,35500,28992,32683,29763,29764,29765,29766,37776,32509,29529,29529,28776,30726,28774,29528,32601,32710,32752,
32322,32325);
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(32322,0,0,1,0, NULL), -- Gold Warrior
(32325,0,0,1,0, NULL), -- Gold Priest
(32752,0,0,1,0, NULL), -- Tabitha
(32710,0,0,1,0, NULL), -- Garl Grimgrizzle
(29763,0,0,1,0, NULL), -- Cosmetic Totem Alliance Air
(29764,0,0,1,0, NULL), -- Cosmetic Totem Alliance Earth
(29765,0,0,1,0, NULL), -- Cosmetic Totem Alliance Fire
(29766,0,0,1,0, NULL), -- Cosmetic Totem Alliance Water
(37776,0,0,1,0, NULL), -- Apprentice Nelphi
(32509,0,0,257,0, NULL), -- Brammold Deepmine
(29528,0,0,257,0, NULL), -- Debbi Moore
(29529,0,0,257,0, NULL), -- Ninsianna
(28776,0,0,257,0, NULL), -- Elizabeth Ross
(30726,0,0,257,0, NULL), -- Archivist Betha
(28774,0,0,257,0, NULL), -- Andrew Matthews
(42078,0,0,1,0, NULL), -- Mini Thor
(29494,0,0,257,0, NULL), -- Shen Kang Cheng
(35497,0,0,257,0, NULL), -- Rafael Langrom
(29523,0,0,257,0, NULL), -- Bragund Brightlink
(35500,0,0,257,0, NULL), -- Matilda Brightlink
(28992,0,0,257,0, NULL), -- Valerie Langrom
(32683,0,0,257,0, NULL), -- Grezla the Hag
(32686,0,0,257,0, NULL), -- Crafticus Mindbender
(28692,0,0,257,0, NULL), -- "Red" Jack Findle
(28994,0,0,257,0, NULL), -- Abra Cadabra
(28332,0,0,1,0, NULL), -- Generic Trigger LAB (Large AOI)
(28691,0,0,257,0, NULL), -- Susana Averoy
(30885,0,0,1,0, NULL), -- Blazik Fireclaw
(32328,0,0,1,0, NULL), -- [DND] Dalaran Sewer Arena - Controller - Death
(32339,0,0,1,0, NULL), -- [DND] Dalaran Sewer Arena - Controller
(32743,0,1,1,0, NULL), -- Willard Blauvelt
(23472,0,0,1,0, NULL), -- World Trigger (Large AOI, Not Immune PC/NPC)
(33938,0,0,1,0, NULL), -- Zom Bocom
(33937,0,0,1,0, NULL), -- Xazi Smolderpipe
(33936,0,0,1,0, NULL), -- Nargle Lashcord
(34095,0,0,1,0, NULL), -- Trapjaw Rix
(29527,0,0,257,0, NULL), -- Orton Bennet
(28956,0,0,257,0, NULL), -- Warcaster Fanoraithe
(29534,0,0,1,0, NULL), -- "Baroness" Llana
(31851,0,65536,1,0, NULL), -- Wooly Mammoth
(29493,0,0,257,0, NULL), -- Jarold Puller
(28989,0,0,258,0, NULL), -- Aemara
(29533,0,0,1,0, NULL), -- Schembari "Uncle Sal" Shearbolt
(32675,0,0,257,0, NULL), -- Babagahnoosh the Grumpy
(32691,0,0,257,0, NULL), -- Magus Fansy Goodbringer
(28993,0,0,1,0, NULL), -- Aerith Primrose
(29476,0,0,258,0, NULL), -- Dagna Flintlock
(29156,0,0,257,0, NULL), -- Archmage Celindra
(37858,0,50331648,0,0, NULL), -- Razorscale Image
(32265,0,50331648,1,0, NULL), -- Northrend Daily Dungeon Image Bunny
(31517,0,0,1,0, NULL), -- Dalaran Fountain Invis Stalker
(29499,0,0,257,0, NULL), -- Bartram Haller
(31228,0,0,1,0, NULL), -- Grove Walker
(33778,0,1,1,0, NULL), -- Tournament Hippogryph
(34244,0,0,1,0, NULL), -- Jean Pierre Poulain
(31236,0,0,1,0, NULL), -- Dappled Stag
(29631,0,0,1,0, NULL), -- Awilo Lon'gomba
(32692,0,0,257,0, NULL), -- Arcanist Alec
(32687,0,0,257,0, NULL), -- Linda Ann Kastinglow
(30352,0,0,256,0, NULL), -- Skybreaker Marine
(31085,0,0,1,0, NULL), -- Sky-Reaver Klum
(30755,0,0,256,0, NULL), -- Kor'kron Reaver
(31081,0,0,1,0, NULL), -- Officer Van Rossem
(28160,0,0,257,0, NULL), -- Archmage Pentarus
(28674,0,0,257,0, NULL), -- Aludane Whitecloud
(31031,0,0,1,69, NULL), -- Misensi
(31238,27525,0,257,0, NULL), -- Hira Snowdawn
(29238,0,0,1,0, NULL), -- Scourge Haunt
(31229,0,0,1,0, NULL), -- Ancient Watcher
(32596,0,0,257,0, NULL), -- Dalaran Visitor
(32602,25833,0,257,0, NULL), -- Dalaran Visitor
(32601,22471,0,257,0, NULL), -- Dalaran Visitor
(32415,0,0,1,0, NULL), -- Hamaka
(32419,0,0,1,0, NULL), -- Umbiwa
(32418,0,0,1,0, NULL), -- Abohba
(32253,0,0,2,0, NULL), -- Kyunghee
(32412,0,0,1,0, NULL), -- Mato
(32732,0,0,257,0, NULL), -- Dorfus Alphamage
(31439,0,0,1,0, NULL), -- Archmage Timear
(35826,0,1,1,0, NULL), -- Kaye Toogie
(32428,0,0,1,0, NULL), -- Underbelly Rat
(36670,0,0,1,0, NULL), -- Magister Hathorel
(32251,0,0,2,0, NULL), -- Shokavis
(32252,0,0,2,0, NULL), -- Wanathan
(32420,0,0,1,10, NULL), -- Mimbihi
(30659,0,0,1,333, NULL), -- Violet Hold Guard
(32730,0,0,257,0, NULL), -- Goldlilly Gleamingfell
(28991,0,0,257,0, NULL), -- Valaden Silverblade
(32470,0,0,1,0, NULL), -- Sewer Frog
(27047,0,0,1,0, NULL), -- Invisible Stalker (Floating Only)
(29497,0,0,257,0, NULL), -- Walther Whiteford
(29325,0,0,1,379, NULL), -- Torgo the Younger
(31080,0,0,1,0, NULL), -- Warden Alturas
(20735,0,0,1,0, NULL), -- Archmage Lan'dalock
(28742,0,0,257,0, NULL), -- Marcia Chase
(29496,0,0,257,0, NULL); -- Kerta the Bold

-- Template updates for gameobject 
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=35591; -- Fishing Bobber

-- SAI for Marcella Bloom
SET @ENTRY := 32421;
UPDATE `creature` SET `spawndist`=0,`MovementType`=0,`position_x`=5717.51,`position_y`=688.2948,`position_z`=645.7512 WHERE `guid`=111385;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY; 
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY; 
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,0,0,0,11,0,100,0,0,0,0,0,53,0,@ENTRY,1,0,0,0,1,0,0,0,0,0,0,0, 'Marcella Bloom - On spawn - Start WP movement'),
(@ENTRY,0,1,0,40,0,100,0,1,@ENTRY,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Marcella Bloom - Reach wp 1 - pause path'),
(@ENTRY,0,2,0,40,0,100,0,6,@ENTRY,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Marcella Bloom - Reach wp 6 - pause path'),
(@ENTRY,0,3,4,40,0,100,0,11,@ENTRY,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Marcella Bloom - Reach wp 11 - pause path'),
(@ENTRY,0,4,0,61,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,3.577925, 'Marcella Bloom - Reach wp 11 - turm to'),
(@ENTRY,0,5,0,40,0,100,0,19,@ENTRY,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Marcella Bloom - Reach wp 19 - pause path'),
(@ENTRY,0,6,7,40,0,100,0,23,@ENTRY,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Marcella Bloom - Reach wp 23 - pause path'),
(@ENTRY,0,7,0,61,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,1.710423, 'Marcella Bloom - Reach wp 23 - turm to'),
(@ENTRY,0,8,0,40,0,100,0,28,@ENTRY,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Marcella Bloom - Reach wp 28 - pause path'),
(@ENTRY,0,9,10,40,0,100,0,29,@ENTRY,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Marcella Bloom - Reach wp 29 - pause path'),
(@ENTRY,0,10,0,61,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,5.689773, 'Marcella Bloom - Reach wp 29 - turm to');

-- Waypoints for Marcella Bloom from sniff
DELETE FROM `waypoints` WHERE `entry`=@ENTRY;
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(@ENTRY,1,5716.89,687.1589,645.7512, 'Marcella Bloom'),
(@ENTRY,2,5718.788,687.6731,645.7512, 'Marcella Bloom'),
(@ENTRY,3,5720.209,685.3612,645.7512, 'Marcella Bloom'),
(@ENTRY,4,5719.699,682.4218,645.7512, 'Marcella Bloom'),
(@ENTRY,5,5717.591,679.3567,645.7512, 'Marcella Bloom'),
(@ENTRY,6,5720.298,678.0955,646.5342, 'Marcella Bloom'),
(@ENTRY,7,5718.915,679.5812,645.7512, 'Marcella Bloom'),
(@ENTRY,8,5719.611,681.8755,645.7512, 'Marcella Bloom'),
(@ENTRY,9,5722.21,685.3296,645.7512, 'Marcella Bloom'),
(@ENTRY,10,5724.167,689.1262,645.7512, 'Marcella Bloom'),
(@ENTRY,11,5721.995,691.3812,645.7512, 'Marcella Bloom'),
(@ENTRY,12,5722.081,690.9567,645.7512, 'Marcella Bloom'),
(@ENTRY,13,5723.241,689.3571,645.7512, 'Marcella Bloom'),
(@ENTRY,14,5722.383,687.1551,645.7512, 'Marcella Bloom'),
(@ENTRY,15,5720.378,686.7902,645.7512, 'Marcella Bloom'),
(@ENTRY,16,5718.554,688.1351,645.7512, 'Marcella Bloom'),
(@ENTRY,17,5716.704,689.7863,645.7512, 'Marcella Bloom'),
(@ENTRY,18,5714.546,691.0844,645.7512, 'Marcella Bloom'),
(@ENTRY,19,5712.564,690.2685,645.7512, 'Marcella Bloom'),
(@ENTRY,20,5712.319,692.1107,645.7512, 'Marcella Bloom'),
(@ENTRY,21,5710.912,694.2338,645.7512, 'Marcella Bloom'),
(@ENTRY,22,5707.329,693.1917,645.7512, 'Marcella Bloom'),
(@ENTRY,23,5705.615,695.2361,645.7512, 'Marcella Bloom'),
(@ENTRY,24,5706.731,693.772,645.7512, 'Marcella Bloom'),
(@ENTRY,25,5708.21,694.3374,645.7512, 'Marcella Bloom'),
(@ENTRY,26,5709.226,695.5887,645.7512, 'Marcella Bloom'),
(@ENTRY,27,5711.422,696.0734,645.7512, 'Marcella Bloom'),
(@ENTRY,28,5713.526,695.2763,645.7512, 'Marcella Bloom'),
(@ENTRY,29,5713.636,691.7002,645.7512, 'Marcella Bloom'),
(@ENTRY,30,5716.311,690.1725,645.7512, 'Marcella Bloom'),
(@ENTRY,31,5717.51,688.2948,645.7512, 'Marcella Bloom');

-- SAI for Inzi Charmlight
SET @ENTRY := 28682;
UPDATE `creature` SET `spawndist`=0,`MovementType`=0,`position_x`=5715.564,`position_y`=678.4122,`position_z`=645.7512 WHERE `guid`=97343;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY; 
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY; 
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,0,0,0,11,0,100,0,0,0,0,0,53,0,@ENTRY,1,0,0,0,1,0,0,0,0,0,0,0, 'Marcella Bloom - On spawn - Start WP movement'),
(@ENTRY,0,1,0,40,0,100,0,6,@ENTRY,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Marcella Bloom - Reach wp 6 - pause path'),
(@ENTRY,0,2,0,40,0,100,0,18,@ENTRY,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Marcella Bloom - Reach wp 18 - pause path'),
(@ENTRY,0,3,4,40,0,100,0,21,@ENTRY,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Marcella Bloom - Reach wp 21 - pause path'),
(@ENTRY,0,4,0,61,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,2.426008, 'Marcella Bloom - Reach wp 21 - turm to'),
(@ENTRY,0,5,0,40,0,100,0,22,@ENTRY,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Marcella Bloom - Reach wp 22 - pause path'),
(@ENTRY,0,6,0,40,0,100,0,27,@ENTRY,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Marcella Bloom - Reach wp 27 - pause path');

-- Waypoints for Inzi Charmlight from sniff
DELETE FROM `waypoints` WHERE `entry`=@ENTRY;
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(@ENTRY,1,5719.897,682.5544,645.7512, 'Inzi Charmlight'),
(@ENTRY,2,5719.891,686.0665,645.7512, 'Inzi Charmlight'),
(@ENTRY,3,5717.111,689.0646,645.7512, 'Inzi Charmlight'),
(@ENTRY,4,5711.454,694.7701,645.7512, 'Inzi Charmlight'),
(@ENTRY,5,5711.846,699.7839,645.7512, 'Inzi Charmlight'),
(@ENTRY,6,5709.633,700.0297,645.7512, 'Inzi Charmlight'),
(@ENTRY,7,5711.143,699.2699,645.7512, 'Inzi Charmlight'),
(@ENTRY,8,5712.436,694.9948,645.7512, 'Inzi Charmlight'),
(@ENTRY,9,5714.122,692.908,645.7512, 'Inzi Charmlight'),
(@ENTRY,10,5716.777,690.9016,645.7512, 'Inzi Charmlight'),
(@ENTRY,11,5718.896,688.1526,645.7512, 'Inzi Charmlight'),
(@ENTRY,12,5720.531,686.9282,645.7512, 'Inzi Charmlight'),
(@ENTRY,13,5722.85,687.8686,645.7512, 'Inzi Charmlight'),
(@ENTRY,14,5726.107,690.4207,645.7512, 'Inzi Charmlight'),
(@ENTRY,15,5727.03,694.2952,645.7512, 'Inzi Charmlight'),
(@ENTRY,16,5711.432,707.4515,653.6919, 'Inzi Charmlight'),
(@ENTRY,17,5708.918,708.4698,653.7011, 'Inzi Charmlight'),
(@ENTRY,18,5708.552,708.3618,653.7029, 'Inzi Charmlight'),
(@ENTRY,19,5709.459,706.2948,653.7265, 'Inzi Charmlight'),
(@ENTRY,20,5707.508,704.3312,653.7484, 'Inzi Charmlight'),
(@ENTRY,21,5705.197,703.1964,653.7423, 'Inzi Charmlight'),
(@ENTRY,22,5702.96,703.35,653.7493, 'Inzi Charmlight'),
(@ENTRY,23,5703.561,701.5987,653.7566, 'Inzi Charmlight'),
(@ENTRY,24,5703,699.5547,653.7488, 'Inzi Charmlight'),
(@ENTRY,25,5700.375,698.8538,653.7443, 'Inzi Charmlight'),
(@ENTRY,26,5697.52,698.8721,653.7496, 'Inzi Charmlight'),
(@ENTRY,27,5697.274,696.8895,653.7393, 'Inzi Charmlight'),
(@ENTRY,28,5697.476,697.3153,653.7394, 'Inzi Charmlight'),
(@ENTRY,29,5699.13,698.1936,653.7425, 'Inzi Charmlight'),
(@ENTRY,30,5700.803,696.9131,653.7471, 'Inzi Charmlight'),
(@ENTRY,31,5700.124,694.2091,653.7356, 'Inzi Charmlight'),
(@ENTRY,32,5698.897,690.7084,653.7178, 'Inzi Charmlight'),
(@ENTRY,33,5715.564,678.4122,645.7512, 'Inzi Charmlight');

-- SAI for Katherine Lee
SET @ENTRY := 28705;
UPDATE `creature` SET `spawndist`=0,`MovementType`=0,`position_x`=5707.611,`position_y`=715.5347,`position_z`=642.4725 WHERE `guid`=98952;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY; 
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY; 
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,0,0,0,11,0,100,0,0,0,0,0,53,0,@ENTRY,1,0,0,0,1,0,0,0,0,0,0,0, 'Katherine Lee - On spawn - Start WP movement'),
(@ENTRY,0,1,2,40,0,100,0,5,@ENTRY,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Katherine Lee - Reach wp 5 - pause path'),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0.8377581, 'Katherine Lee - Reach wp 5 - turm to'),
(@ENTRY,0,3,4,40,0,100,0,10,@ENTRY,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Katherine Lee - Reach wp 10 - pause path'),
(@ENTRY,0,4,0,61,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,2.408554, 'Katherine Lee - Reach wp 10 - turm to');

-- Waypoints for Katherine Lee from sniff
DELETE FROM `waypoints` WHERE `entry`=@ENTRY;
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(@ENTRY,1,5708.027,715.2877,642.4726, 'Katherine Lee'),
(@ENTRY,2,5707.466,713.4067,642.4758, 'Katherine Lee'),
(@ENTRY,3,5705.038,713.5079,642.4757, 'Katherine Lee'),
(@ENTRY,4,5702.446,715.9288,642.4717, 'Katherine Lee'),
(@ENTRY,5,5700.928,718.1786,642.4681, 'Katherine Lee'),
(@ENTRY,6,5702.446,715.9288,642.4717, 'Katherine Lee'),
(@ENTRY,7,5705.038,713.5079,642.4757, 'Katherine Lee'),
(@ENTRY,8,5707.466,713.4067,642.4758, 'Katherine Lee'),
(@ENTRY,9,5708.027,715.2877,642.4726, 'Katherine Lee'),
(@ENTRY,10,5707.611,715.5347,642.4725, 'Katherine Lee');

-- SAI for Laire Brewgold
SET @ENTRY := 32424;
UPDATE `creature` SET `spawndist`=0,`MovementType`=0,`position_x`=5639.154,`position_y`=728.4048,`position_z`=641.61 WHERE `guid`=111730;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY; 
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY; 
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,0,0,0,11,0,100,0,0,0,0,0,53,0,@ENTRY,1,0,0,0,1,0,0,0,0,0,0,0, 'Laire Brewgold - On spawn - Start WP movement'),
(@ENTRY,0,1,2,40,0,100,0,1,@ENTRY,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Laire Brewgold - Reach wp 1 - pause path'),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0.8377581, 'Laire Brewgold - Reach wp 1 - turm to'),
(@ENTRY,0,3,4,40,0,100,0,2,@ENTRY,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Laire Brewgold - Reach wp 2 - pause path'),
(@ENTRY,0,4,0,61,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0.122173, 'Laire Brewgold - Reach wp 2 - turm to'),
(@ENTRY,0,5,6,40,0,100,0,10,@ENTRY,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Laire Brewgold - Reach wp 10 - pause path'),
(@ENTRY,0,6,0,61,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,2.583087, 'Laire Brewgold - Reach wp 10 - turm to');

-- Waypoints for Laire Brewgold from sniff
DELETE FROM `waypoints` WHERE `entry`=@ENTRY;
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(@ENTRY,1,5635.932,732.4274,641.7092, 'Laire Brewgold'),
(@ENTRY,2,5633.13,729.802,641.7224, 'Laire Brewgold'),
(@ENTRY,3,5632.857,730.7568,641.7197, 'Laire Brewgold'),
(@ENTRY,4,5638.495,728.9272,641.6107, 'Laire Brewgold'),
(@ENTRY,5,5642.401,730.9983,641.6825, 'Laire Brewgold'),
(@ENTRY,6,5645.889,733.0624,641.682, 'Laire Brewgold'),
(@ENTRY,7,5655.076,730.4822,641.6819, 'Laire Brewgold'),
(@ENTRY,8,5661.111,726.7043,641.6643, 'Laire Brewgold'),
(@ENTRY,9,5663.163,728.8862,641.6496, 'Laire Brewgold'),
(@ENTRY,10,5661.848,731.7643,641.6437, 'Laire Brewgold'),
(@ENTRY,11,5661.233,732.0867,641.6819, 'Laire Brewgold'),
(@ENTRY,12,5661.178,729.5889,641.6537, 'Laire Brewgold'),
(@ENTRY,13,5659.352,724.879,641.6767, 'Laire Brewgold'),
(@ENTRY,14,5656.774,721.9439,641.6959, 'Laire Brewgold'),
(@ENTRY,15,5653.122,721.5146,641.6296, 'Laire Brewgold'),
(@ENTRY,16,5649.408,722.6322,641.5455, 'Laire Brewgold'),
(@ENTRY,17,5645.466,725.3781,641.6395, 'Laire Brewgold'),
(@ENTRY,18,5639.154,728.4048,641.61, 'Laire Brewgold');

-- SAI for Coira Longrifle
SET @ENTRY := 32426;
UPDATE `creature` SET `spawndist`=0,`MovementType`=0,`position_x`=5644.824,`position_y`=730.5149,`position_z`=641.6822 WHERE `guid`=111940;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY; 
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY; 
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,0,0,0,11,0,100,0,0,0,0,0,53,0,@ENTRY,1,0,0,0,1,0,0,0,0,0,0,0, 'Coira Longrifle - On spawn - Start WP movement'),
(@ENTRY,0,1,2,40,0,100,0,5,@ENTRY,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Coira Longrifle - Reach wp 5 - pause path'),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,2.740167, 'Coira Longrifle - Reach wp 5 - turm to'),
(@ENTRY,0,3,4,40,0,100,0,14,@ENTRY,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Coira Longrifle - Reach wp 14 - pause path'),
(@ENTRY,0,4,0,61,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,3.996804, 'Coira Longrifle - Reach wp 14 - turm to'),
(@ENTRY,0,5,6,40,0,100,0,20,@ENTRY,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Coira Longrifle - Reach wp 20 - pause path'),
(@ENTRY,0,6,0,61,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,5.864306, 'Coira Longrifle - Reach wp 20 - turm to');

-- Waypoints for Coira Longrifle from sniff
DELETE FROM `waypoints` WHERE `entry`=@ENTRY;
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(@ENTRY,1,5643.844,727.0675,641.6488, 'Coira Longrifle'),
(@ENTRY,2,5650.929,722.0482,641.5745, 'Coira Longrifle'),
(@ENTRY,3,5656.711,719.6259,641.5991, 'Coira Longrifle'),
(@ENTRY,4,5658.714,721.329,641.6793, 'Coira Longrifle'),
(@ENTRY,5,5658.198,724.0913,641.6834, 'Coira Longrifle'),
(@ENTRY,6,5658.953,723.9452,641.6814, 'Coira Longrifle'),
(@ENTRY,7,5661.61,728.0839,641.6577, 'Coira Longrifle'),
(@ENTRY,8,5664.91,733.9921,641.6255, 'Coira Longrifle'),
(@ENTRY,9,5663.366,736.1543,641.5908, 'Coira Longrifle'),
(@ENTRY,10,5660.653,736.6083,641.6053, 'Coira Longrifle'),
(@ENTRY,11,5659.226,737.1793,641.6076, 'Coira Longrifle'),
(@ENTRY,12,5656.145,740.5176,641.5779, 'Coira Longrifle'),
(@ENTRY,13,5652.403,743.0245,641.5914, 'Coira Longrifle'),
(@ENTRY,14,5648.907,746.6327,641.6072, 'Coira Longrifle'),
(@ENTRY,15,5648.699,746.1017,641.6102, 'Coira Longrifle'),
(@ENTRY,16,5648.634,743.4974,641.6179, 'Coira Longrifle'),
(@ENTRY,17,5647.743,739.7487,641.6585, 'Coira Longrifle'),
(@ENTRY,18,5645.861,735.217,641.6819, 'Coira Longrifle'),
(@ENTRY,19,5644.097,732.8497,641.6823, 'Coira Longrifle'),
(@ENTRY,20,5645.18,730.3257,641.6822, 'Coira Longrifle'),
(@ENTRY,21,5644.824,730.5149,641.6822, 'Coira Longrifle');

-- Spawn & Pathing for Apprentice Nelphi <Kirin Tor>, Dalaran "Tested"
SET @ID := 1190; -- Waypoint script id 3 required "Set by Malcrom"
SET @WPSGUID := 770; -- Waypoint Script guid 3 required "Set by Malcrom"
SET @NPC := 101236; -- 1 Guid required "Set by Malcrom"
SET @PATH := @NPC*10;
DELETE FROM `creature` WHERE `guid`=@NPC;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(@NPC,37776,571,1,1,0,0,5689.764,671.0834,646.0803,0.2443461,120,0,0,1,0,0,2);
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`) VALUES (@NPC,@PATH,2);
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,5709.616,661.0955,646.2664,0,0,0,100,0),
(@PATH,2,5727.091,658.6996,645.9513,0,0,0,100,0),
(@PATH,3,5730.016,664.0084,645.8687,0,0,0,100,0),
(@PATH,4,5729.302,667.2706,645.765,84000,0,@ID,100,0),
(@PATH,5,5730.86,661.1558,645.6806,0,0,0,100,0),
(@PATH,6,5723.399,655.868,646.1857,0,0,0,100,0),
(@PATH,7,5707.258,654.8297,646.2093,0,0,0,100,0),
(@PATH,8,5695.099,655.981,646.3283,0,0,0,100,0),
(@PATH,9,5683.588,661.2706,646.6083,0,0,0,100,0),
(@PATH,10,5673.713,666.8453,649.4561,0,0,0,100,0),
(@PATH,11,5662.683,674.7064,652.0303,0,0,0,100,0),
(@PATH,12,5648.2,678.5623,651.9928,0,0,0,100,0),
(@PATH,13,5641.686,670.1909,651.9928,96000,0,@ID+1,100,0),
(@PATH,14,5645.71,678.6177,651.9928,0,0,0,100,0),
(@PATH,15,5663.272,678.5135,652.0291,0,0,0,100,0),
(@PATH,16,5668.562,681.6807,652.0439,95000,0,@ID+2,100,0),
(@PATH,17,5677.158,677.9859,649.807,0,0,0,100,0),
(@PATH,18,5689.764,671.0834,646.0803,0,0,0,100,0);
DELETE FROM `waypoint_scripts` WHERE `id` IN (@ID,@ID+1,@ID+2);
INSERT INTO `waypoint_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`,`guid`) VALUES
(@ID,1,30,0,0,0,0,0,0,5.427974,@WPSGUID),
(@ID+1,1,30,0,0,0,0,0,0,1.48353,@WPSGUID+1),
(@ID+2,1,30,0,0,0,0,0,0,5.77704,@WPSGUID+2);
-- Pathing for Defias Messenger, yes finally!
SET @ID := 1188; -- Waypoint script id 2 required "Set by Malcrom"
SET @WPSGUID := 768; -- Waypoint Script guid 2 required "Set by Malcrom"
SET @NPC := 45525;
SET @PATH := @NPC*10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-11025.09,`position_y`=1459.742,`position_z`=43.08614,`orientation`=5.287858 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`) VALUES (@NPC,@PATH,1);
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-11024.27,1458.482,42.98629,0,0,0,100,0),
(@PATH,2,-11018.26,1434.539,43.11129,0,0,0,100,0),
(@PATH,3,-10999.92,1416.515,43.10312,0,0,0,100,0),
(@PATH,4,-10983.12,1410.913,42.97812,0,0,0,100,0),
(@PATH,5,-10965.85,1418.474,43.16774,0,0,0,100,0),
(@PATH,6,-10933.54,1423.929,43.04274,0,0,0,100,0),
(@PATH,7,-10915.58,1419.701,42.87889,0,0,0,100,0),
(@PATH,8,-10910.076,1432.672,42.5049,0,0,0,100,0),
(@PATH,9,-10900.05,1445.112,41.7178,0,0,0,100,0),
(@PATH,10,-10885.255,1457.353,40.7271,0,0,0,100,0),
(@PATH,11,-10866.93,1466.69,41.79894,0,0,0,100,0),
(@PATH,12,-10833.42,1477.933,44.43209,0,0,0,100,0),
(@PATH,13,-10799.86,1489.473,46.82558,0,0,0,100,0),
(@PATH,14,-10766.52,1498.049,47.711,0,0,0,100,0),
(@PATH,15,-10732.97,1502.483,48.06318,0,0,0,100,0),
(@PATH,16,-10700.07,1502.661,47.18818,0,0,0,100,0),
(@PATH,17,-10666.69,1507.088,46.54454,0,0,0,100,0),
(@PATH,18,-10633.32,1539.863,47.31448,0,0,0,100,0),
(@PATH,19,-10600.15,1555.273,47.43948,0,0,0,100,0),
(@PATH,20,-10566.94,1562.479,46.88277,0,0,0,100,0),
(@PATH,21,-10533.58,1587.418,44.49374,0,0,0,100,0),
(@PATH,22,-10508.87,1614.238,41.90456,0,0,0,100,0),
(@PATH,23,-10481.19,1648.125,37.46867,0,0,0,100,0),
(@PATH,24,-10461.66,1666.647,35.59121,0,0,0,100,0),
(@PATH,25,-10462.7,1691.475,35.59572,3000,1,0,100,0),
(@PATH,26,-10460.43,1693.594,35.59572,1000,1,@ID+1,100,0),
(@PATH,27,-10449.05,1708.79,35.24935,0,1,0,100,0),
(@PATH,28,-10426.5,1743.918,33.7402,0,1,0,100,0),
(@PATH,29,-10416.58,1777.677,28.78753,0,1,0,100,0),
(@PATH,30,-10412.37,1810.253,24.37137,0,1,0,100,0),
(@PATH,31,-10403.96,1849.802,18.62272,0,1,0,100,0),
(@PATH,32,-10403.16,1873.641,14.95012,0,1,0,100,0),
(@PATH,33,-10413.99,1899.893,9.325117,0,1,0,100,0),
(@PATH,34,-10439.02,1920.274,10.58264,0,1,0,100,0),
(@PATH,35,-10458.12,1931.104,9.11068,0,1,0,100,0),
(@PATH,36,-10472.48,1938.235,7.897566,0,1,0,100,0),
(@PATH,37,-10463.96,1955.49,8.939394,0,1,0,100,0),
(@PATH,38,-10477.59,1976.318,9.244427,0,1,0,100,0),
(@PATH,39,-10501.44,1972.825,10.7568,0,1,0,100,0),
(@PATH,40,-10511.7,1961.354,7.416626,0,1,0,100,0),
(@PATH,41,-10523.64,1943.457,4.230742,0,1,0,100,0),
(@PATH,42,-10548.23,1951.474,-0.4602337,0,1,0,100,0),
(@PATH,43,-10570.66,1980.201,-5.699253,2000,1,@ID,100,0);
DELETE FROM `waypoint_scripts` WHERE `id` IN (@ID,@ID+1);
INSERT INTO `waypoint_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`,`guid`) VALUES
(@ID,1,18,1000,0,0,0,0,0,0,@WPSGUID), -- Despawn
(@ID+1,0,0,0,0,2000005408,0,0,0,0,@WPSGUID+1); -- Say text-- Add text
DELETE FROM `db_script_string` WHERE `entry`=2000005408;
INSERT INTO `db_script_string` (`entry`,`content_default`) VALUES
(2000005408, 'Stonemasons. . .errr. . Defias be warned:  The rusty anchor sinks tonight.');
-- Pathing for Geffon the Unruly, Dalaran "Tested"
SET @ID := 1188; -- Waypoint script id 1 required "Set by Malcrom"
SET @WPSGUID := 768; -- Waypoint Script guid 1 required "Set by Malcrom"
SET @NPC := 118064;
SET @PATH := @NPC*10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=5929.332,`position_y`=570.9189,`position_z`=609.7578,`orientation`=3.546899 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`) VALUES (@NPC,@PATH,1);
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,5928.923,570.7436,609.6712,0,0,0,100,0),
(@PATH,2,5921.985,567.0912,609.894,0,0,0,100,0),
(@PATH,3,5915.107,573.1284,610.5243,0,0,0,100,0),
(@PATH,4,5908.997,578.255,611.5927,0,0,0,100,0),
(@PATH,5,5886.999,595.4758,614.1428,0,0,0,100,0),
(@PATH,6,5869.888,609.1395,615.5826,0,0,0,100,0),
(@PATH,7,5861.474,614.1213,616.9615,0,0,0,100,0),
(@PATH,8,5851.43,623.7424,617.1535,0,0,0,100,0),
(@PATH,9,5841.306,618.5762,618.7531,0,0,0,100,0),
(@PATH,10,5836.796,617.1152,620.0811,0,0,0,100,0),
(@PATH,11,5832.833,617.9141,619.5575,0,0,0,100,0),
(@PATH,12,5831.347,624.6552,615.9009,0,0,0,100,0),
(@PATH,13,5826.497,630.1097,613.9959,0,0,0,100,0),
(@PATH,14,5824.471,637.0106,610.535,0,0,0,100,0),
(@PATH,15,5824.35,641.6344,609.7383,0,0,0,100,0),
(@PATH,16,5825.757,647.4879,609.1575,0,0,0,100,0),
(@PATH,17,5826.711,653.1107,609.1575,0,0,0,100,0),
(@PATH,18,5835.112,657.9628,609.8859,0,0,0,100,0),
(@PATH,19,5843.994,662.7811,609.8859,0,0,0,100,0),
(@PATH,20,5853.274,672.6777,609.1575,0,0,0,100,0),
(@PATH,21,5859.68,673.9138,609.1575,0,0,0,100,0),
(@PATH,22,5862.186,676.0421,610.2632,0,0,0,100,0),
(@PATH,23,5868.098,679.6662,610.6595,0,0,0,100,0),
(@PATH,24,5874.04,685.126,610.7192,0,0,0,100,0),
(@PATH,25,5874.479,687.267,610.5302,0,0,0,100,0),
(@PATH,26,5874.948,691.4247,609.1575,0,0,0,100,0),
(@PATH,27,5871.4,696.7339,609.1575,0,0,0,100,0),
(@PATH,28,5864.309,702.2258,609.1575,0,0,0,100,0),
(@PATH,29,5858.741,709.2857,609.1575,0,0,0,100,0),
(@PATH,30,5859.229,713.9041,609.1575,0,0,0,100,0),
(@PATH,31,5861.487,716.5183,609.1575,2000,0,@ID,100,0);
DELETE FROM `waypoint_scripts` WHERE `id` IN (@ID);
INSERT INTO `waypoint_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`,`guid`) VALUES
(@ID,1,18,1000,0,0,0,0,0,0,@WPSGUID);
-- Spawn & Pathing for Dark Ranger Vorel, Dalaran "Tested"
SET @ID := 1185; -- Waypoint script id 3 required "Set by Malcrom"
SET @WPSGUID := 765; -- Waypoint Script guid 3 required "Set by Malcrom"
SET @NPC := 133649; -- 1 Guid required "Set by Malcrom"
SET @PATH := @NPC*10;
DELETE FROM `creature` WHERE `guid`=@NPC;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(@NPC,37780,571,1,1,0,0,5915.752,626.7446,645.9962,0.2443461,120,0,0,1,0,0,2);
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`) VALUES (@NPC,@PATH,2);
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,5895.236,638.5573,646.4966,0,0,0,100,0),
(@PATH,2,5884.248,635.6078,646.9809,0,0,0,100,0),
(@PATH,3,5872.448,623.5383,648.746,0,0,0,100,0),
(@PATH,4,5860.91,613.9648,650.4137,0,0,0,100,0),
(@PATH,5,5861.747,607.5361,651.093,67000,0,@ID,100,0),
(@PATH,6,5863.308,615.8246,650.0507,0,0,0,100,0),
(@PATH,7,5874.454,626.5311,648.181,0,0,0,100,0),
(@PATH,8,5886.512,637.1473,647.123,0,0,0,100,0),
(@PATH,9,5902.886,637.8958,645.8411,0,0,0,100,0),
(@PATH,10,5922.111,634.8177,645.3596,0,0,0,100,0),
(@PATH,11,5931.565,631.6282,647.5243,0,0,0,100,0),
(@PATH,12,5938.581,628.139,650.6555,0,0,0,100,0),
(@PATH,13,5948.707,623.6092,650.5901,0,0,0,100,0),
(@PATH,14,5960.953,620.1525,650.627,0,0,0,100,0),
(@PATH,15,5964.637,631.1576,650.627,83000,0,@ID+1,100,0),
(@PATH,16,5960.452,620.8175,650.627,0,0,0,100,0),
(@PATH,17,5945.708,621.1544,650.5566,0,0,0,100,0),
(@PATH,18,5939.563,618.3193,650.5789,130000,0,@ID+2,100,0),
(@PATH,19,5930.35,622.3714,648.2888,0,0,0,100,0),
(@PATH,20,5915.752,626.7446,645.9962,0,0,0,100,0);
DELETE FROM `waypoint_scripts` WHERE `id` IN (@ID,@ID+1,@ID+2);
INSERT INTO `waypoint_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`,`guid`) VALUES
(@ID,1,30,0,0,0,0,0,0,2.844887,@WPSGUID),
(@ID+1,1,30,0,0,0,0,0,0,4.729842,@WPSGUID+1),
(@ID+2,1,30,0,0,0,0,0,0,2.495821,@WPSGUID+2);

-- Stormwind Harbour Guard Pathing
SET @NPC := 120617;
SET @PATH := @NPC*10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8291.17,`position_y`=1243.53,`position_z`=5.23 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`) VALUES (@NPC,@PATH,257);
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8328.55,1246.44,5.23,0,0,0,100,0),
(@PATH,2,-8349.13,1245.73,5.23,0,0,0,100,0),
(@PATH,3,-8366.87,1240.36,5.23,0,0,0,100,0),
(@PATH,4,-8376.34,1239.75,5.23,0,0,0,100,0),
(@PATH,5,-8376.08,1245.29,5.23,1000,0,0,100,0),
(@PATH,6,-8376.34,1239.75,5.23,0,0,0,100,0),
(@PATH,7,-8366.87,1240.36,5.23,0,0,0,100,0),
(@PATH,8,-8349.13,1245.73,5.23,0,0,0,100,0),
(@PATH,9,-8328.55,1246.44,5.23,0,0,0,100,0),
(@PATH,10,-8291.17,1243.53,5.23,0,0,0,100,0),
(@PATH,11,-8272.9,1236.22,5.23,0,0,0,100,0),
(@PATH,12,-8244.25,1232.46,5.23,0,0,0,100,0),
(@PATH,13,-8236.87,1235.23,5.23,1000,0,0,100,0),
(@PATH,14,-8244.25,1232.46,5.23,0,0,0,100,0),
(@PATH,15,-8272.9,1236.22,5.23,0,0,0,100,0),
(@PATH,16,-8291.17,1243.53,5.23,0,0,0,100,0);
SET @NPC := 120622;
SET @PATH := @NPC*10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8298.2,`position_y`=1215.46,`position_z`=5.27 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`) VALUES (@NPC,@PATH,257,2410);
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8337.4,1215.52,5.28,0,0,0,100,0),
(@PATH,2,-8361.7,1214.24,5.16,1000,0,0,100,0),
(@PATH,3,-8337.4,1215.52,5.28,0,0,0,100,0),
(@PATH,4,-8298.2,1215.46,5.27,0,0,0,100,0),
(@PATH,5,-8251.52,1215.4,5.17,0,0,0,100,0),
(@PATH,6,-8208.68,1208.9,6.53,1000,0,0,100,0),
(@PATH,7,-8251.52,1215.4,5.17,0,0,0,100,0),
(@PATH,8,-8298.2,1215.46,5.27,0,0,0,100,0);
SET @NPC := 120613;
SET @PATH := @NPC*10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8448.24,`position_y`=1039.04,`position_z`=53.32 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`) VALUES (@NPC,@PATH,257);
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8456.49,1033.04,59.47,0,0,0,100,0),
(@PATH,2,-8464.14,1029.03,59.49,0,0,0,100,0),
(@PATH,3,-8483.15,1027.79,59.72,1000,0,0,100,0),
(@PATH,4,-8464.14,1029.03,59.49,0,0,0,100,0),
(@PATH,5,-8456.49,1033.04,59.47,0,0,0,100,0),
(@PATH,6,-8448.24,1039.04,53.32,0,0,0,100,0),
(@PATH,7,-8431.49,1055.91,40.76,0,0,0,100,0),
(@PATH,8,-8416.41,1066.16,31.63,0,0,0,100,0),
(@PATH,9,-8400.79,1075.95,31.63,0,0,0,100,0),
(@PATH,10,-8399.03,1080.638,31.59,0,0,0,100,0),
(@PATH,11,-8397.67,1086.55,28.94,0,0,0,100,0),
(@PATH,12,-8395.96,1107.98,19.4,0,0,0,100,0),
(@PATH,13,-8395.86,1112.03,17.9447,0,0,0,100,0),
(@PATH,14,-8395.935,1116.135,17.97,1000,0,0,100,0),
(@PATH,15,-8395.86,1112.03,17.9447,0,0,0,100,0),
(@PATH,16,-8395.96,1107.98,19.4,0,0,0,100,0),
(@PATH,17,-8397.67,1086.55,28.94,0,0,0,100,0),
(@PATH,18,-8399.03,1080.638,31.59,0,0,0,100,0),
(@PATH,19,-8400.79,1075.95,31.63,0,0,0,100,0),
(@PATH,20,-8416.41,1066.16,31.63,0,0,0,100,0),
(@PATH,21,-8431.49,1055.91,40.76,0,0,0,100,0),
(@PATH,22,-8448.24,1039.04,53.32,0,0,0,100,0);
SET @NPC := 120616;
SET @PATH := @NPC*10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8490.95,`position_y`=951.47,`position_z`=96.31 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`) VALUES (@NPC,@PATH,257);
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8510.51,949.25,96.45,0,0,0,100,0),
(@PATH,2,-8535.31,952.05,96.63,0,0,0,100,0),
(@PATH,3,-8545.02,962.06,96.57,0,0,0,100,0),
(@PATH,4,-8564.38,983.89,96.39,0,0,0,100,0),
(@PATH,5,-8571.52,993.63,96.22,0,0,0,100,0),
(@PATH,6,-8580.67,1005.54,96.2,0,0,0,100,0),
(@PATH,7,-8586.88,1019.08,96.04,0,0,0,100,0),
(@PATH,8,-8604.85,1039.21,96.05,0,0,0,100,0),
(@PATH,9,-8586.88,1019.08,96.04,0,0,0,100,0),
(@PATH,10,-8580.67,1005.54,96.2,0,0,0,100,0),
(@PATH,11,-8571.52,993.63,96.22,0,0,0,100,0),
(@PATH,12,-8564.38,983.89,96.39,0,0,0,100,0),
(@PATH,13,-8545.02,962.06,96.57,0,0,0,100,0),
(@PATH,14,-8535.38,952.13,96.61,0,0,0,100,0),
(@PATH,15,-8510.51,949.25,96.45,0,0,0,100,0),
(@PATH,16,-8490.95,951.47,96.31,0,0,0,100,0),
(@PATH,17,-8481.77,955.3,96.27,0,0,0,100,0),
(@PATH,18,-8458.89,977.15,96.26,0,0,0,100,0),
(@PATH,19,-8436.07,996.32,96.26,0,0,0,100,0),
(@PATH,20,-8458.89,977.15,96.26,0,0,0,100,0),
(@PATH,21,-8481.77,955.3,96.27,0,0,0,100,0),
(@PATH,22,-8490.95,951.47,96.31,0,0,0,100,0);
SET @NPC := 120619;
SET @PATH := @NPC*10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8419.69,`position_y`=1043.19,`position_z`=68.38 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`) VALUES (@NPC,@PATH,257);
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8420.55,1036.33,68.38,0,0,0,100,0),
(@PATH,2,-8418.05,1024.27,68.38,0,0,0,100,0),
(@PATH,3,-8420.99,1021.89,68.38,0,0,0,100,0),
(@PATH,4,-8430.96,1014.58,74.8,0,0,0,100,0),
(@PATH,5,-8437.31,1009.11,79.17,0,0,0,100,0),
(@PATH,6,-8448.76,999.75,79.17,0,0,0,100,0),
(@PATH,7,-8466.76,986,79.02,0,0,0,100,0),
(@PATH,8,-8448.76,999.75,79.17,0,0,0,100,0),
(@PATH,9,-8437.31,1009.11,79.17,0,0,0,100,0),
(@PATH,10,-8430.96,1014.58,74.8,0,0,0,100,0),
(@PATH,11,-8420.99,1021.89,68.38,0,0,0,100,0),
(@PATH,12,-8418.05,1024.27,68.38,0,0,0,100,0),
(@PATH,13,-8420.55,1036.33,68.38,0,0,0,100,0),
(@PATH,14,-8419.69,1043.19,68.38,0,0,0,100,0),
(@PATH,15,-8416.56,1047.09,68.38,0,0,0,100,0),
(@PATH,16,-8412.03,1049.24,68.38,0,0,0,100,0),
(@PATH,17,-8406.39,1049.46,68.38,0,0,0,100,0),
(@PATH,18,-8399.66,1046.97,68.38,0,0,0,100,0),
(@PATH,19,-8390.37,1043.12,68.38,0,0,0,100,0),
(@PATH,20,-8388.63,1044.37,68.38,0,0,0,100,0),
(@PATH,21,-8371.84,1056.58,57.63,0,0,0,100,0),
(@PATH,22,-8366.22,1061.28,57.62,0,0,0,100,0),
(@PATH,23,-8344.17,1080.1,57.26,0,0,0,100,0),
(@PATH,24,-8331.26,1091.61,57.26,0,0,0,100,0),
(@PATH,25,-8344.17,1080.1,57.26,0,0,0,100,0),
(@PATH,26,-8366.22,1061.28,57.62,0,0,0,100,0),
(@PATH,27,-8371.84,1056.58,57.63,0,0,0,100,0),
(@PATH,28,-8388.63,1044.37,68.38,0,0,0,100,0),
(@PATH,29,-8390.37,1043.12,68.38,0,0,0,100,0),
(@PATH,30,-8399.66,1046.97,68.38,0,0,0,100,0),
(@PATH,31,-8406.39,1049.46,68.38,0,0,0,100,0),
(@PATH,32,-8412.03,1049.24,68.38,0,0,0,100,0),
(@PATH,33,-8416.56,1047.09,68.38,0,0,0,100,0),
(@PATH,34,-8419.69,1043.19,68.38,0,0,0,100,0);
SET @NPC := 203485;
SET @PATH := @NPC*10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8549.76,`position_y`=1245.42,`position_z`=5.23 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`) VALUES (@NPC,@PATH,257);
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8526.58,1246.12,5.23,0,0,0,100,0),
(@PATH,2,-8521.27,1234.52,5.23,0,0,0,100,0),
(@PATH,3,-8503.14,1233.86,5.23,0,0,0,100,0),
(@PATH,4,-8473.28,1244.65,5.23,0,0,0,100,0),
(@PATH,5,-8473.54,1248.15,5.23,1000,0,0,100,0),
(@PATH,6,-8473.28,1244.65,5.23,0,0,0,100,0),
(@PATH,7,-8503.14,1233.86,5.23,0,0,0,100,0),
(@PATH,8,-8521.27,1234.52,5.23,0,0,0,100,0),
(@PATH,9,-8526.58,1246.12,5.23,0,0,0,100,0),
(@PATH,10,-8549.76,1245.42,5.23,0,0,0,100,0),
(@PATH,11,-8558.99,1239.22,5.23,0,0,0,100,0),
(@PATH,12,-8582.41,1238.09,5.23,0,0,0,100,0),
(@PATH,13,-8595.61,1236.79,5.23,0,0,0,100,0),
(@PATH,14,-8597.21,1240.04,5.23,1000,0,0,100,0),
(@PATH,15,-8595.61,1236.79,5.23,0,0,0,100,0),
(@PATH,16,-8582.41,1238.09,5.23,0,0,0,100,0),
(@PATH,17,-8558.99,1239.22,5.23,0,0,0,100,0),
(@PATH,18,-8549.76,1245.42,5.23,0,0,0,100,0);
SET @NPC := 120615;
SET @PATH := @NPC*10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8301.7,`position_y`=1170.13,`position_z`=17.69 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`) VALUES (@NPC,@PATH,257);
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8278.6,1171.05,17.69,0,0,0,100,0),
(@PATH,2,-8229.29,1170.03,17.66,0,0,0,100,0),
(@PATH,3,-8205.96,1172.4,17.69,1000,0,0,100,0),
(@PATH,4,-8229.29,1170.03,17.66,0,0,0,100,0),
(@PATH,5,-8278.6,1171.05,17.69,1000,0,0,100,0),
(@PATH,6,-8301.7,1170.13,17.69,0,0,0,100,0);
SET @NPC := 120618;
SET @PATH := @NPC*10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8583.41,`position_y`=1071.97,`position_z`=36.96 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`) VALUES (@NPC,@PATH,257,2410);
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8593.22,1090.8,32.43,0,0,0,100,0),
(@PATH,2,-8584.05,1114.95,19.35,0,0,0,100,0),
(@PATH,3,-8577.76,1124.46,17.95,1000,0,0,100,0),
(@PATH,4,-8584.05,1114.95,19.35,0,0,0,100,0),
(@PATH,5,-8593.22,1090.8,32.43,0,0,0,100,0),
(@PATH,6,-8583.41,1071.97,36.96,0,0,0,100,0),
(@PATH,7,-8567.09,1050.52,49.71,0,0,0,100,0),
(@PATH,8,-8552.77,1036.75,59.45,0,0,0,100,0),
(@PATH,9,-8535.63,1034.67,59.71,1000,0,0,100,0),
(@PATH,10,-8552.77,1036.75,59.45,0,0,0,100,0),
(@PATH,11,-8567.04,1050.44,49.76,0,0,0,100,0),
(@PATH,12,-8583.41,1071.97,36.96,0,0,0,100,0);
-- Not Spawned
DELETE FROM `creature` WHERE `guid` IN (207172,207173);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(207172,29712,0,1,1,0,0,-8581.93,1169.02,17.71,3.1,120,0,0,1,0,0,2),
(207173,29712,0,1,1,0,0,-8475.85,1209.42,5.320,2.4,120,0,0,1,0,0,2);
SET @NPC := 207172;
SET @PATH := @NPC*10;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`) VALUES (@NPC,@PATH,257);
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8547.19,1170.83,17.71,1000,0,0,100,0),
(@PATH,2,-8581.93,1169.02,17.71,0,0,0,100,0),
(@PATH,3,-8508.55,1169.44,17.71,0,0,0,100,0),
(@PATH,4,-8477.48,1169.95,17.71,1000,0,0,100,0),
(@PATH,5,-8508.55,1169.44,17.71,0,0,0,100,0),
(@PATH,6,-8581.93,1169.02,17.71,0,0,0,100,0);
SET @NPC := 207173;
SET @PATH := @NPC*10;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`) VALUES (@NPC,@PATH,257,2410);
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8444.61,1208.33,5.25,0,0,0,100,0),
(@PATH,2,-8419.29,1208.16,5.28,1000,0,0,100,0),
(@PATH,3,-8444.61,1208.33,5.25,0,0,0,100,0),
(@PATH,4,-8475.85,1209.42,5.32,0,0,0,100,0),
(@PATH,5,-8510.79,1214.56,5.19,1000,0,0,100,0),
(@PATH,6,-8475.85,1209.42,5.32,0,0,0,100,0);



