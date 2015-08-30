--[[
* Purpose of this file *
Initialize the files of GTA: SA HUD and do some serverside stuff.

* Credits *
Scripting: theandrew61

!! PLEASE DON'T STEAL THIS CODE !!
]]

-- scripts
AddCSLuaFile("../client/gtasahud.lua")
AddCSLuaFile("../client/gtasahud_wasted.lua")
-- fonts
resource.AddSingleFile("resource/fonts/beckett.ttf")
resource.AddSingleFile("resource/fonts/pricedown.ttf")
resource.AddSingleFile("resource/fonts/Futura-CondensedExtraBold.ttf")
resource.AddSingleFile("resource/fonts/Futura-Medium.ttf")

-- weapon icons
resource.AddSingleFile("materials/gtasahudMaterials/wepicons/vtfs/empty.vmt")
resource.AddSingleFile("materials/gtasahudMaterials/wepicons/vtfs/empty.vtf")
resource.AddSingleFile("materials/gtasahudMaterials/wepicons/vtfs/gmod_camera.vmt")
resource.AddSingleFile("materials/gtasahudMaterials/wepicons/vtfs/gmod_camera.vtf")
resource.AddSingleFile("materials/gtasahudMaterials/wepicons/vtfs/gmod_tool.vmt")
resource.AddSingleFile("materials/gtasahudMaterials/wepicons/vtfs/gmod_tool.vtf")
resource.AddSingleFile("materials/gtasahudMaterials/gtasahudMaterials/wepicons/vtfs/weapon_357.vmt")
resource.AddSingleFile("materials/gtasahudMaterials/wepicons/vtfs/weapon_357.vtf")
resource.AddSingleFile("materials/gtasahudMaterials/wepicons/vtfs/weapon_ar2.vmt")
resource.AddSingleFile("materials/gtasahudMaterials/wepicons/vtfs/weapon_ar2.vtf")
resource.AddSingleFile("materials/gtasahudMaterials/wepicons/vtfs/weapon_crossbow.vmt")
resource.AddSingleFile("materials/gtasahudMaterials/wepicons/vtfs/weapon_crossbow.vtf")
resource.AddSingleFile("materials/gtasahudMaterials/wepicons/vtfs/weapon_crowbar.vmt")
resource.AddSingleFile("materials/gtasahudMaterials/wepicons/vtfs/weapon_crowbar.vtf")
resource.AddSingleFile("materials/gtasahudMaterials/wepicons/vtfs/weapon_extinguisher.vmt")
resource.AddSingleFile("materials/gtasahudMaterials/wepicons/vtfs/weapon_extinguisher.vtf")
resource.AddSingleFile("materials/gtasahudMaterials/wepicons/vtfs/weapon_fists.vmt")
resource.AddSingleFile("materials/gtasahudMaterials/wepicons/vtfs/weapon_fists.vtf")
resource.AddSingleFile("materials/gtasahudMaterials/wepicons/vtfs/weapon_frag.vmt")
resource.AddSingleFile("materials/gtasahudMaterials/wepicons/vtfs/weapon_frag.vtf")
resource.AddSingleFile("materials/gtasahudMaterials/wepicons/vtfs/weapon_physgun.vmt")
resource.AddSingleFile("materials/gtasahudMaterials/wepicons/vtfs/weapon_physgun.vtf")
resource.AddSingleFile("materials/gtasahudMaterials/wepicons/vtfs/weapon_pistol.vmt")
resource.AddSingleFile("materials/gtasahudMaterials/wepicons/vtfs/weapon_pistol.vtf")
resource.AddSingleFile("materials/gtasahudMaterials/wepicons/vtfs/weapon_rpg.vmt")
resource.AddSingleFile("materials/gtasahudMaterials/wepicons/vtfs/weapon_rpg.vtf")
resource.AddSingleFile("materials/gtasahudMaterials/wepicons/vtfs/weapon_shotgun.vmt")
resource.AddSingleFile("materials/gtasahudMaterials/wepicons/vtfs/weapon_shotgun.vtf")
resource.AddSingleFile("materials/gtasahudMaterials/wepicons/vtfs/weapon_slam.vmt")
resource.AddSingleFile("materials/gtasahudMaterials/wepicons/vtfs/weapon_slam.vtf")
resource.AddSingleFile("materials/gtasahudMaterials/wepicons/vtfs/weapon_smg1.vmt")
resource.AddSingleFile("materials/gtasahudMaterials/wepicons/vtfs/weapon_smg1.vtf")
resource.AddSingleFile("materials/gtasahudMaterials/wepicons/vtfs/weapon_stunstick.vmt")
resource.AddSingleFile("materials/gtasahudMaterials/wepicons/vtfs/weapon_stunstick.vtf")

-- stars
resource.AddSingleFile("materials/gtasahudMaterials/stars/active.vmt")
resource.AddSingleFile("materials/gtasahudMaterials/stars/active.vtf")
resource.AddSingleFile("materials/gtasahudMaterials/stars/inactive.vmt")
resource.AddSingleFile("materials/gtasahudMaterials/stars/inactive.vtf")

-- menu icons
resource.AddSingleFile("materials/gtasahudMaterials/vgui/cog.png")

-- models
resource.AddSingleFile("materials/gtasahudMaterials/models/player/elis/po/police.mdl")

-- sounds
resource.AddSingleFile("sound/siren.wav")
resource.AddSingleFile("sound/underarrest.wav")
-- npcs
resource.AddSingleFile("../npc_gtasa_police.lua")

-- hook.Add("EntityTakeDamage", "Ouch", function(target, dmginfo)
--   if target:IsNPC() then
--   end
-- end)

-- no stars onspawn
hook.Add("PlayerSpawn", "WelcomeBack", function(ply)
  ply:ConCommand("nogtasastars")
end)

-- inflictor is what weapon was used to kill the player

hook.Add("OnNPCKilled", "Noo", function(npc, attacker, inflictor)
  if npc:IsNPC() and attacker:IsPlayer() then
    -- if not npc:GetClass() == "npc_combine_camera" or not npc:GetClass() == "npc_cscanner" or not npc:GetClass() == "npc_combinedropship" or not npc:GetClass() == "npc_combinegunship" or not npc:GetClass() == "npc_combine_s" or not npc:GetClass() == "npc_helicopter" or not npc:GetClass() == "npc_manhack" or not npc:GetClass() == "npc_metropolice" or not npc:GetClass() == "npc_rollermine" or not npc:GetClass() == "npc_clawscanner" or not npc:GetClass() == "npc_stalker" or not npc:GetClass() == "npc_strider" or not npc:GetClass() == "npc_turret_floor" or not npc:GetClass() == "npc_antlion" or not npc:GetClass() == "npc_antlionguard" or not npc:GetClass() == "npc_barnacle" or not npc:GetClass() == "npc_headcrab_fast" or not npc:GetClass() == "npc_fastzombie" or not npc:GetClass() == "npc_fastzombie_torso" or not npc:GetClass() == "npc_headcrab" or not npc:GetClass() == "npc_headcrab_black" or not npc:GetClass() == "npc_poisonzombie" or not npc:GetClass() == "npc_poisonzombie" or not npc:GetClass() == "npc_zombie" or not npc:GetClass() == "npc_zombie_torso" then
    -- print(attacker:GetNWInt("starsenabled"))
    addStar(attacker)
    -- end
  end
end)

hook.Add("PlayerDeath", "WhyMan", function(victim, inflictor, attacker)
  if victim:IsPlayer() and attacker:IsPlayer() and not victim == at
   then
    addStar(attacker)
  end
  victim:Lock()
  victim:ConCommand("startwastedscreen")
end)

function addStar(killer)
  local activeStarsCount = killer:GetNWInt("wantedlevel")
  killer:SetNWInt("killcounter", killer:GetNWInt("killcounter") + 1)
  if killer:GetNWInt("killcounter") % 3 == 0 then
    killer:ConCommand("gaingtasastar")
    -- spawn police
    -- local po = ents.Create("npc_combine_s")
    -- po:AddRelationship("player D_HT 99")
    -- po:SetPos(killer:GetPos()+Vector(100,0,100))
    -- po:SetMaxHealth(99999)
    -- po:SetHealth(99999)
    -- po:Spawn()
    -- po:EmitSound(Sound("underarrest.wav"))
  end

  -- print(killer:GetName() .. " has killed " .. killer.GetNWInt("killcounter") .. " NPCs and Players.")

  -- timer.Create("DoStuffWithStars", 5, 0, function()
  --   activeStarsCount = killer.GetNWInt("killcounter")
  --   -- kill the attacker, because he's a meanie
  --   if killer:GetNWInt("killcounter") >= 18 then
  --     if killer:IsPlayer() then
  --       killer:Kill()
  --       killer:PrintMessage(HUD_PRINTCENTER, "WASTED")
  --      end
  --    else
  --     -- RunConsoleCommand("lowergtasastars")
  --   end
  -- end)
end

-- respawn
concommand.Add("respawnplayer", function(ply)
  timer.Simple(0.5, function()
    ply:Spawn()
    ply:UnLock()
  end)
end)