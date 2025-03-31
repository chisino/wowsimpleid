SimpleID = SimpleID or {}

local mainFrame = CreateFrame("Frame", "SimpleIDMainFrame", UIParent, "BasicFrameTemplateWithInset")
mainFrame:SetSize(300, 350)
mainFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
mainFrame.TitleBg:SetHeight(30)
mainFrame.title = mainFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
mainFrame.title:SetPoint("TOPLEFT", mainFrame.TitleBg, "TOPLEFT", 5, -3)
mainFrame.title:SetText(UnitName("player") .. "'s ID")
mainFrame:Hide()
mainFrame:EnableMouse(true)
mainFrame:SetMovable(true)
mainFrame:RegisterForDrag("LeftButton")
mainFrame:SetScript("OnDragStart", function(self)
	self:StartMoving()
end)
mainFrame:SetScript("OnDragStop", function(self)
	self:StopMovingOrSizing()
end)

mainFrame:SetScript("OnHide", function()
        PlaySound(808)
end)

local _,race = UnitRace("player")
local faction = (race == "Tauren" or race == "Orc" or race == "Troll" or race == "Undead" or race == "BloodElf" or race == "Goblin") and FACTION_HORDE or FACTION_ALLIANCE

mainFrame.playerName = mainFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
mainFrame.playerName:SetPoint("TOPLEFT", mainFrame, "TOPLEFT", 15, -35)
mainFrame.playerName:SetText("Name: " .. UnitName("player"))
mainFrame.playerName:SetFont("Fonts\\FRIZQT__.TTF", 30)

mainFrame.playerLevel = mainFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
mainFrame.playerLevel:SetPoint("TOPLEFT", mainFrame.playerName, "BOTTOMLEFT", 0, -10)
mainFrame.playerLevel:SetText("Level: " .. UnitLevel("player"))
mainFrame.playerLevel:SetFont("Fonts\\FRIZQT__.TTF", 20)

mainFrame.playerRace = mainFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
mainFrame.playerRace:SetPoint("TOPLEFT", mainFrame.playerLevel, "BOTTOMLEFT", 0, -10)
mainFrame.playerRace:SetText("Race: " .. race)
mainFrame.playerRace:SetFont("Fonts\\FRIZQT__.TTF", 20)

mainFrame.playerFaction = mainFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
mainFrame.playerFaction:SetPoint("TOPLEFT", mainFrame.playerRace, "BOTTOMLEFT", 0, -10)
mainFrame.playerFaction:SetText("Faction: " .. faction)
mainFrame.playerFaction:SetFont("Fonts\\FRIZQT__.TTF", 20)

mainFrame:SetScript("OnShow", function()
    PlaySound(808)
end)

SLASH_SimpleID1 = "/id"
SlashCmdList["SimpleID"] = function()
    if mainFrame:IsShown() then
        mainFrame:Hide()
    else
        mainFrame:Show()
    end
end

table.insert(UISpecialFrames, "SimpleIDMainFrame")
