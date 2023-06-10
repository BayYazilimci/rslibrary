local PANEL = {}

AccessorFunc(PANEL, "m_ButtonText", "TextButton", FORCE_STRING)
AccessorFunc(PANEL, "m_Font", "Font", FORCE_STRING)
AccessorFunc(PANEL, "m_TextColor", "TextColor", FORCE_COLOR)
AccessorFunc(PANEL, "m_BackgroundColor", "BackgroundColor", FORCE_COLOR)
AccessorFunc(PANEL, "m_VerifyColor", "VerifyColor", FORCE_COLOR)
AccessorFunc(PANEL, "m_MaterialColor", "MaterialColor", FORCE_COLOR)
AccessorFunc(PANEL, "m_SetCompletedColor", "CompletedColor", FORCE_COLOR)
AccessorFunc(PANEL, "m_Callback", "Callback", FORCE_FUNCTION)

function PANEL:Init()
    self.Point = 0
    self.Anim = 0
    self.Alpha = 255
    self:SetText("")
end

function PANEL:Paint(w, h)
    draw.RoundedBox(8, 0, 0, w, h, self:GetBackgroundColor())
    draw.SimpleText(self:GetTextButton(), self:GetFont(), w / 2, h / 2, Color(self:GetTextColor().r, self:GetTextColor().g, self:GetTextColor().b,self.Alpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    if self.Anim == 1 then
        self.Point = self.Point +0.15  
        self.Alpha = self.Alpha - 0.5
        if self.Point >= w + 25 then self.Point = 0 end
        draw.RoundedBoxEx(10, self.Point - 20, h / 1.2, self.Point, 7, Color(self:GetCompletedColor().r, self:GetCompletedColor().g, self:GetCompletedColor().b),true,true ,true,true )
        surface.SetMaterial(RsLib.Material.Save)
        surface.SetDrawColor(self:GetMaterialColor())
        surface.DrawTexturedRectRotated(30,h/2.3,20,20,CurTime() * 85 % 360)
    end
    
    if self.Anim == 2 then
        draw.RoundedBox(8, 0, 0, w, h, self:GetCompletedColor())
        surface.SetMaterial(RsLib.Material.Verify)
        surface.SetDrawColor(self:GetVerifyColor()) 
        surface.DrawTexturedRect(w/2.1,h/3,20,20)
    end
end

function PANEL:DoClick()
    timer.Simple(3, function()
        self.Anim = 2
    end)
    self.Anim = 1
    self.Alpha = 255
    if self.m_Callback then
        self.m_Callback()
    end
end

vgui.Register("RsLib.Button2", PANEL, "DButton")