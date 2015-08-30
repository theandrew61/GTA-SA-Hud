--[[
* Purpose of this file *
This is the GTA: SA styled HUD.

* Credits *
Scripting: theandrew61

* Notes *
- Stars should disappear after 20 seconds
- Refer to http://img1.wikia.nocookie.net/__cb20100216193151/gtawiki/images/7/76/HUD-GTASA.png

!! PLEASE DON'T STEAL THIS CODE !!
]]

surface.CreateFont("gtaFont", {
	font = "PricedownBl-Regular",
	size = 46,
	weight = 0,
	blursize = 0,
	scanlines = 0,
      antialias = true,
      underline = false,
      italic = false,
      strikeout = false,
      symbol = false,
      rotary = false,
      shadow = false,
      additive = false,
	outline = false
})
surface.CreateFont("mapFont", {
	font = "Beckett",
	size = 56,
	weight = 0,
	blursize = 0,
	scanlines = 0,
      antialias = true,
      underline = false,
      italic = false,
      strikeout = false,
      symbol = false,
      rotary = false,
      shadow = false,
      additive = false,
	outline = false
})
surface.CreateFont("ammoFont", {
	font = "Futura Condensed ExtraBold",
	size = 24,
	weight = 0,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false
})
surface.CreateFont("moneyFont", {
	font = "PricedownBl-Regular",
	size = 46,
	weight = 0,
	blursize = 0,
	scanlines = 0,
      antialias = true,
      underline = false,
      italic = false,
      strikeout = false,
      symbol = false,
      rotary = false,
      shadow = false,
      additive = false,
	outline = false
})
surface.CreateFont("moneyFont", {
  font = "PricedownBl-Regular",
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
  outline = false
})

local ply
local health = 100
local ammo
local ammo = "∞"
local weapon
local map
local p
local showMapTxt = false
local drawSAHUD = true
local drawHealthBar = true
activeStarsCount = 0
local hide = {
	CHudHealth = true,
  CHudBattery = true,
	CHudAmmo = true,
  CHudSecondaryAmmo = true
}
local hide2 = {
  CHudDamageIndicator = true
}
gtasaHud_enabled = CreateClientConVar("gtasaHud_enabled", 1)
gtasaHud_timeMode = CreateClientConVar("gtasaHud_timeMode", 3) 
-- 0 = none, 1 = 12hr, 2 = 24hr, 3 = server uptime
gtasaHud_starsenabled = CreateClientConVar("gtasaHud_starsenabled", 1)
gtasaHud_wastedenabled = CreateClientConVar("gtasaHud_wastedenabled", 1)

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
	if gtasaHud_enabled:GetInt() == 1 and LocalPlayer():Alive() and hide[name] then return false end
  if gtasaHud_enabled:GetInt() == 1 and hide2[name] then return false end
end)

hook.Add("HUDPaint", "GTASAHud", function()
  if gtasaHud_enabled:GetInt() == 0 or !drawSAHUD then return end

  ply = client or LocalPlayer()
  health = ply:Health()
  armor = LocalPlayer():Armor()
  air = 100

  -- if !ply:Alive() then return end

  if IsValid(ply:GetActiveWeapon()) and ply:Alive() then
    if ply:GetActiveWeapon():Clip1() > 0 then
      ammo = ply:GetActiveWeapon():Clip1() .. "/" .. ply:GetAmmoCount(ply:GetActiveWeapon():GetPrimaryAmmoType())
    elseif weapon == "weapon_extinguisher" then
      ammo = ply:GetAmmoCount(ply:GetActiveWeapon():GetPrimaryAmmoType())
    else
      ammo = ply:GetAmmoCount(ply:GetActiveWeapon():GetPrimaryAmmoType())
      if weapon == "gmod_camera" or weapon == "gmod_tool" or weapon == "weapon_extinguisher" or weapon == "weapon_fists" or weapon == "weapon_crowbar" or weapon == "weapon_stunstick" or weapon == "weapon_physcannon" or weapon == "weapon_physgun" then
          ammo = ""
      elseif weapon == "weapon_frag" then
          ammo = ply:GetAmmoCount(ply:GetActiveWeapon():GetPrimaryAmmoType())
      end
    end
   -- other weapons' secondary fire support
    if ply:GetActiveWeapon():Clip2() > 0 then
      ammo = ammo .. "/" .. ply:GetAmmoCount(ply:GetActiveWeapon():GetSecondaryAmmoType()) 
   end
    -- ar2 (pulse rifle) support
    if weapon == "weapon_ar2" and ply:GetAmmoCount(ply:GetActiveWeapon():GetSecondaryAmmoType()) > 0 then
      ammo = ammo .. "/" .. ply:GetAmmoCount(ply:GetActiveWeapon():GetSecondaryAmmoType()) 
   end
  end
  if IsValid(ply:GetActiveWeapon()) then
    weapon = ply:GetActiveWeapon():GetClass()
  else
    weapon = ""
  end
  map = game.GetMap()
  -- time
  local t
  if gtasaHud_timeMode:GetInt() != 0 then
    if gtasaHud_timeMode:GetInt() == 2 then
      t = os.date("%H:%M")
    elseif gtasaHud_timeMode:GetInt() == 1 then
      t = os.date("%I:%M")
    elseif gtasaHud_timeMode:GetInt() == 3 then
      t = secs2clock(math.Round(CurTime())), "gtaFont", tx, ty, Color(196,194,197,255), TEX
    end
    draw.SimpleTextOutlined(t, "gtaFont", ScrW()-100, 18, Color(196,194,197,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT, 3, Color(0,0,0,255))
  end

  -- armor
  surface.SetDrawColor(Color(150,150,150,255))
  surface.DrawRect(ScrW()-98,68,91,10)
  surface.SetDrawColor(Color(227,227,227,255))
  surface.DrawRect(ScrW()-98,68, armor/1.1,10)
  draw.OutlinedBox(ScrW()-101,66, 94, 14, 3, Color(0,0,0))
  -- air
  -- surface.SetDrawColor(Color(95,156,227,255))
  -- surface.DrawRect(ScrW()-98,88,91,10)
  -- surface.SetDrawColor(Color(177,207,241,255))
  -- surface.DrawRect(ScrW()-98,88, air/1.1,10)
  -- draw.OutlinedBox(ScrW()-101,86, 94, 14, 3, Color(0,0,0))
  -- health
  if drawHealthBar then
    surface.SetDrawColor(Color(85,0,0,255))
    surface.DrawRect(ScrW()-98,108,91,10)
    surface.SetDrawColor(Color(184,29,33,255))
    surface.DrawRect(ScrW()-98,108, health/1.1,10)
    draw.OutlinedBox(ScrW()-101,106, 94, 14, 3, Color(0,0,0))
  end
  -- money "$00000000"
  local m = "$"
  local mCt
  if gmod.GetGamemode().Name == "DarkRP" or gmod.GetGamemode().Name == "darkrp" then
    if ply:getDarkRPVar("money") then
      mCt = string.len(ply:getDarkRPVar("money"))
      for i=1, 8-mCt do
        m = m .. "0"
      end
      m = m .. ply:getDarkRPVar("money")
    end
  else
    m = "$00000000"
  end
  draw.SimpleTextOutlined(m, "moneyFont", ScrW()-7, 116, Color(52,95,42,255), TEXT_ALIGN_RIGHT, TEXT_ALIGN_LEFT, 3, Color(0,0,0,255))
  -- weapon box
  surface.SetDrawColor(Color(255,255,255,255))
  if weapon == "gmod_camera" or weapon == "gmod_tool" or weapon == "weapon_357" or weapon == "weapon_ar2" or weapon == "weapon_crossbow" or weapon == "weapon_crowbar" or weapon == "weapon_extinguisher" or weapon == "weapon_fists" or weapon == "weapon_frag" or weapon == "weapon_pistol" or weapon == "weapon_physgun" or weapon == "weapon_rpg" or weapon == "weapon_shotgun" or weapon == "weapon_slam" or weapon == "weapon_smg1" or weapon == "weapon_stunstick" then
     surface.SetTexture(surface.GetTextureID("gtasahudMaterials/wepicons/vtfs/" .. weapon))
  else
    surface.SetTexture(surface.GetTextureID("gtasahudMaterials/wepicons/vtfs/empty"))
    if string.find(string.lower(weapon), "fists") then
      surface.SetTexture(surface.GetTextureID("gtasahudMaterials/vgui/wepicons/weapon_fists"))
    elseif weapon == "weapon_physcannon" then
      surface.SetTexture(surface.GetTextureID("gtasahudMaterials/wepicons/vtfs/weapon_physgun"))
    elseif string.find(string.lower(weapon), "bugbait") then
      surface.SetTexture(surface.GetTextureID("gtasahudMaterials/wepicons/vtfs/empty"))
    end
    ammo = ""
  end
  surface.DrawTexturedRect(ScrW()-200,20,96,104) --122

  surface.SetTexture(0)
  draw.NoTexture()

  -- ammo
  if ammo != -1 then
    draw.SimpleTextOutlined(ammo, "ammoFont", ScrW()-152, 99, Color(151,182,214,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_LEFT, 1, Color(0,0,0,255))
  end
  -- map
  if showMapTxt then
    draw.SimpleTextOutlined(map, "mapFont", ScrW()-10, ScrH()-100, Color(142,175,216,255), TEXT_ALIGN_RIGHT, TEXT_ALIGN_LEFT, 1, Color(0,0,0,255))
  end
  -- stars
  if gtasaHud_starsenabled:GetInt() == 1 then
    activeStarsCount = ply:GetNWInt("wantedlevel")
    if activeStarsCount > 0 then
      local starMat
      surface.SetDrawColor(255,255,255,255)
      for i=1, activeStarsCount do
        local x = ScrW()-(10+(i*30))
        starMat = surface.GetTextureID("gtasahudMaterials/stars/active")
        surface.SetDrawColor(255,255,255,255)
        surface.SetTexture(starMat)
        surface.DrawTexturedRect(x,160,36,36)
      end
      local inActiveStarsCount = 6-activeStarsCount
      for i=1, inActiveStarsCount do
        local x = ScrW()-(activeStarsCount*30+(i*30)+10)
        starMat = surface.GetTextureID("gtasahudMaterials/stars/inactive")
        surface.SetDrawColor(255,255,255,255)
        surface.SetTexture(starMat)
        surface.DrawTexturedRect(x,160,36,36)
      end
    end
  end

  surface.SetTexture(0)
  draw.NoTexture()

end)

-- control client's stars
concommand.Add("getgtasastars", function(ply)
  activeStarsCount = ply:GetNWInt("wantedlevel")
  -- print("You have a Wanted Level " .. activeStarsCount .. ".")
end)
concommand.Add("gaingtasastar", function(ply)
  activeStarsCount = ply:GetNWInt("wantedlevel")
  if activeStarsCount <= 5 and activeStarsCount > -1 then
    ply:SetNWInt("wantedlevel", activeStarsCount+1)
    activeStarsCount = ply:GetNWInt("wantedlevel")
    -- print("You have a Wanted Level " .. activeStarsCount .. ".")
  else
    RunConsoleCommand("kill")
  end
end)
concommand.Add("lowergtasastars", function(ply)
  activeStarsCount = ply:GetNWInt("wantedlevel")
  if activeStarsCount <= 5 and activeStarsCount > -1 then
    ply:SetNWInt("wantedlevel", activeStarsCount-1)
    activeStarsCount = ply:GetNWInt("wantedlevel")
    -- print("You have a Wanted Level " .. activeStarsCount .. ".")
  end
end)
concommand.Add("nogtasastars", function(ply)
  ply:SetNWInt("wantedlevel", 0)
  activeStarsCount = ply:GetNWInt("wantedlevel")
  -- print("You have a Wanted Level " .. activeStarsCount .. ".")
end)

hook.Add("Think", "UpdateFunction", function()
  -- if LocalPlayer():WaterLevel() == 3 then
  --   air = air - 1
  -- end
  LocalPlayer():SetNWInt("starsenabled", gtasaHud_starsenabled:GetInt())
  LocalPlayer():SetNWInt("wastedenabled", gtasaHud_wastedenabled:GetInt())
end)

-- toggle the HUD
concommand.Add("toggleSAHUD", function(ply)
  drawSAHUD = !drawSAHUD
end)

-- flash client's health bar
concommand.Add("beginhealthflash", function(ply)
  timer.Create("FlashHealth", 0.5, 0, flashHealth)
end)
function flashHealth()
  drawHealthBar = !drawHealthBar
end
concommand.Add("endhealthflash", function(ply)
  timer.Stop("FlashHealth")
  timer.Destroy("FlashHealth")
  drawHealthBar = true
end)

-- our own menubar entry!
hook.Add("PopulateMenuBar", "GTASAHUD_MenuBar", function(mb)
  local m = mb:AddOrGetMenu("GTA: SA HUD")
  m:AddOption("Show Settings", function()
    p = vgui.Create("DFrame")
    p:SetTitle("GTA: San Andreas HUD - Settings")
    p:SetSize(300, 330)
    p:SetPos(ScrW()/2-(300/2), ScrH()/2-(p:GetTall()/2))
    p:SetDraggable(false)
    p:SetBackgroundBlur(true)
    p:MakePopup()
    p.OnClose = function()
      -- RunConsoleCommand("reload")
    end

    local logo = vgui.Create("DImage", p)
    logo:SetImage("gtasahudMaterials/wepicons/gtsahud-tp.png")
    logo:SetSize(150, 150)
    logo:SetPos(300/2-(150/2), 26)

    local ver = vgui.Create("DLabel", p)
    ver:SetPos(124, 176)
    ver:SetText("Version 2.5")
    ver:SetTextColor(Color(230,230,230,255))

    local form = vgui.Create("DForm", p)
    form:SetSize(300, p:GetTall()-130)
    form:SetPos(0, p:GetTall()-130)
    form:SetName("Settings")
    form.Paint = function()
      surface.SetDrawColor(0,0,0,0)
      surface.DrawOutlinedRect(0,0,form:GetWide(),form:GetTall()) 
    end

    local hd = vgui.Create("DCheckBoxLabel")
    hd:SetText("Draw HUD?")
    hd:SetConVar("gtasaHud_enabled")
    hd:SetValue(1)
    hd:SizeToContents()
    form:AddItem(hd)

    local sd = vgui.Create("DCheckBoxLabel")
    sd:SetText("Become Wanted?")
    sd:SetConVar("gtasaHud_starsenabled")
    sd:SetValue(1)
    sd:SizeToContents()
    form:AddItem(sd)

    local wd = vgui.Create("DCheckBoxLabel")
    wd:SetText("Enable Wasted Screen?")
    wd:SetConVar("gtasaHud_wastedenabled")
    wd:SetValue(1)
    wd:SizeToContents()
    form:AddItem(wd)

    local tm = form:ComboBox("Time Mode", "gtasaHud_timeMode")
    tm:AddChoice("12 hour", 1)
    tm:AddChoice("24 hour", 2)
    tm:AddChoice("Server runtime", 3)

  end):SetImage("gtasahudMaterials/vgui/cog.png")
end)

function draw.OutlinedBox(x, y, w, h, thickness, clr)
	surface.SetDrawColor( clr )
	for i=0, thickness - 1 do
    surface.DrawOutlinedRect( x + i, y + i, w - i * 2, h - i * 2 )
  end
end

function secs2clock(secs)
  local secs = tonumber(secs)
  if secs == 0 then
    return "00:00:00"
  else
    local hours = string.format("%02.f", math.floor(secs/3600))
    local minutes = string.format("%02.f", math.floor(secs/60 - (hours * 60)))
    local seconds = string.format("%02.f", math.floor(secs - hours * 3600 - minutes * 60))
    local totaltime = minutes .. ":" .. seconds
    return totaltime
  end
end