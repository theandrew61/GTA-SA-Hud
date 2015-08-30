--[[
* Purpose of this file *
This is the Wasted screen from GTA: SA.

* Credits *
Scripting: theandrew61

* Notes *
- This file is clientside
- Refer to the video on the Mac desktop

!! PLEASE DON'T STEAL THIS CODE !!
]]

surface.CreateFont("wastedFont", {
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

local ply
local drawWastedOnHUD = false
local finishedDrawing = false
local respawnPly = false
local startTime = 0
local lifeTime = 3
local startVal = 0
local endVal = 500
local value = startVal
local CamData = {}
local hide = {
  CHudHealth = true,
  CHudBattery = true,
  CHudAmmo = true,
  CHudSecondaryAmmo = true,
  CHudDamageIndicator = true,
  CHudDeathNotice = true,
  CHudWeaponSelection = true,
  CHudZoom = true
}

hook.Add("HUDShouldDraw", "HideHUD", function(name)
if gtasaHud_enabled:GetInt() == 1 and name == "CHudHealth" then
    return false
  end
  if gtasaHud_enabled:GetInt() == 1 and name == "CHudBattery" then
    return false
  end
  if gtasaHud_enabled:GetInt() == 1 and name == "CHudAmmo" then
    return false
  end
  if gtasaHud_enabled:GetInt() == 1 and name == "CHudSecondaryAmmo" then
    return false
  end
  if gtasaHud_enabled:GetInt() == 1 and name == "CHudDamageIndicator" then
    return false
  end
end)

hook.Add("HUDPaint", "GTASAWasted", function()
  ply = client or LocalPlayer()
  local addBy = 250

  if gtasaHud_enabled:GetInt() == 0 or ply:Alive() or not drawWastedOnHUD then return end

  -- fade in text
  local fraction = (CurTime()-fadeInStartTime)/lifeTime
  fraction = math.Clamp(fraction,0,1)
  value = Lerp(fraction, fadeInStartTime, endVal)

  CamData.angles = Angle(90,ply:EyeAngles().y,0)
  if IsValid(ply:GetRagdollEntity()) then
    if ply:GetRagdollEntity():GetPos().z > value+addBy then
      addBy = addBy+ply:GetRagdollEntity():GetPos().z
    end
    CamData.origin = Vector(ply:GetRagdollEntity():GetPos().x,ply:GetRagdollEntity():GetPos().y,value+addBy)
  else
    CamData.origin = Vector(ply:GetPos().x,ply:GetPos().y,value+200)
  end
  CamData.x = 0
  CamData.y = 0
  CamData.w = ScrW()
  CamData.h = ScrH()
  render.RenderView(CamData)

  if not finishedDrawing then
    draw.SimpleTextOutlined("Wasted", "wastedFont", ScrW()/2-(10), 100, Color(255,255,255,value), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 3, Color(0,0,0,value))
  end
end)

concommand.Add("startwastedscreen", function(ply)
  if ply:GetNWInt("wastedenabled") == 0 then return end

  timer.Simple(0.5, function()
    RunConsoleCommand("beginhealthflash")
    fadeInStartTime = CurTime()
    drawWastedOnHUD = true
    finishedDrawing = false
    timer.Simple(3.5, function()
      respawnPly = false
      RunConsoleCommand("toggleSAHUD")
      RunConsoleCommand("fadeout")
      finishedDrawing = true
      RunConsoleCommand("endhealthflash")
      timer.Simple(2, function()
        RunConsoleCommand("respawnplayer")
        timer.Simple(0.5, function()
          RunConsoleCommand("toggleSAHUD")
        end)
        -- timer.Simple(1, function()
          -- RunConsoleCommand("fadein")
          respawnPly = true
        -- end)
      end)
    end)
  end)
end)