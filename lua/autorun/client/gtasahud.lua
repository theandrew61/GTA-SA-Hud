--[[
* Purpose of this file *
This is the GTA SA styled HUD.

* Credits *
Scripting: theandrew61

!! PLEASE DON'T STEAL THIS CODE !!
]]

surface.CreateFont("gtaFont", {
	font = "Pricedown Bl",
	size = 46,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = false,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = true,
	additive = false,
	outline = true
})
surface.CreateFont("mapFont", {
	font = "Beckett",
	size = 56,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = false,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = true,
	additive = false,
	outline = true
})
surface.CreateFont("ammoFont", {
	font = "Arial",
	size = 26,
	weight = 1000,
	blursize = 0,
	scanlines = 0,
	antialias = false,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = true,
	additive = false,
	outline = true
})
surface.CreateFont("moneyFont", {
	font = "Pricedown Bl",
	size = 46,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = false,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = true,
	additive = false,
	outline = true
})

local ply
local health = 100
local ammo = 0
local weapon
local map
local showMapTxt = false
local hide = {
	CHudHealth = true,
	CHudAmmo = true
}
gtasaHud_timeMode = CreateClientConVar("gtasaHud_timeMode", 1) -- 0 = none, 1 = 24hr, 2 = 12hr, 3 = server uptime

-- INIT
local initDone = false
hook.Add("Initialize", "GTASAHudInit", function()
  if initDone == false then
    MsgC(Color(255, 0, 255), "---------------\n! GTA SA HUD loaded !\n---------------\n")
    initDone = true
    showMapTxt = true
    timer.Simple(5, function()
      showMapTxt = false
    end)
  end
end)

hook.Add("HUDShouldDraw", "HideHUD", function(name)
	if hide[name] then return false end
end)

hook.Add("HUDPaint", "GTASAHud", function()
  ply = client or LocalPlayer()
  health = ply:Health()
  if ply:GetActiveWeapon():Clip1() != -1 then
    ammo = ply:GetActiveWeapon():Clip1()
  end
  weapon = ply:GetActiveWeapon():GetClass()
  map = game.GetMap()
  -- time
  if gtasaHud_timeMode:GetInt() != 0 then
    if gtasaHud_timeMode:GetInt() == 1 then
      draw.DrawText(os.date("%H:%M"), "gtaFont", ScrW()-98,20, Color(196,194,197,255), TEXT_ALIGN_LEFT)
    elseif gtasaHud_timeMode:GetInt() == 2 then
      draw.DrawText(os.date("%I:%M"), "gtaFont", ScrW()-98,20, Color(196,194,197,255), TEXT_ALIGN_LEFT)
    elseif gtasaHud_timeMode:GetInt() == 3 then
      draw.DrawText(math.Round(CurTime()), "gtaFont", ScrW()-98,20, Color(196,194,197,255), TEXT_ALIGN_LEFT)
    end
  end
  -- health
  surface.SetDrawColor(Color(175,30,36,255))
  surface.DrawRect(ScrW()-98,142, health/1.1,10)
  draw.OutlinedBox(ScrW()-101,140, 94, 14, 3, Color(0,0,0))
  -- weapon box
  surface.SetDrawColor(Color(255,255,255,255))
  if weapon == "gmod_camera" or weapon == "gmod_tool" or weapon == "weapon_357" or weapon == "weapon_ar2" or weapon == "weapon_crossbow" or weapon == "weapon_crowbar" or weapon == "weapon_extinguisher" or weapon == "weapon_fists" or weapon == "weapon_frag" or weapon == "weapon_pistol" or weapon == "weapon_rpg" or weapon == "weapon_shotgun" or weapon == "weapon_slam" or weapon == "weapon_smg1" or weapon == "weapon_stunstick" then
     surface.SetMaterial(Material("vgui/entities/" .. weapon .. ".png"))
  else
  surface.SetMaterial(Material("vgui/entities/empty.png"))
    if string.find(string.lower(weapon), "fists") then
      surface.SetMaterial(Material("vgui/entities/weapon_fists.png"))
    elseif string.find(string.lower(weapon), "phys") then
      surface.SetMaterial(Material("vgui/entities/empty.png"))
    elseif string.find(string.lower(weapon), "bugbait") then
      surface.SetMaterial(Material("vgui/entities/empty.png"))
    end
  end
  surface.DrawTexturedRect(ScrW()-200,20,96,122)
  -- ammo
  if ammo != -1 then
    draw.DrawText(ammo, "ammoFont", ScrW()-152, 114, Color(142,175,216,255), TEXT_ALIGN_CENTER)
  end
  if showMapTxt then
    draw.DrawText(map, "mapFont", ScrW()-10, ScrH()-100, Color(142,175,216,255), TEXT_ALIGN_RIGHT)
  end
  -- money
  draw.DrawText("$00000000", "moneyFont", ScrW()-7, 150, Color(48,91,38,255), TEXT_ALIGN_RIGHT)
end)

function draw.OutlinedBox(x, y, w, h, thickness, clr)
	surface.SetDrawColor( clr )
	for i=0, thickness - 1 do
    surface.DrawOutlinedRect( x + i, y + i, w - i * 2, h - i * 2 )
  end
end