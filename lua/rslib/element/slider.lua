local PANEL = {}
AccessorFunc(PANEL, "value", "Value")
function PANEL:Init()
    self.slider = self:Add("RsLib.Slider")
    self.slider:SetSize(256, 12)
    self.slider:SetPos(8, 100 - 6 - 24)
end

function PANEL:RefreshValue()
    self.slider:SetValue(self:GetValue())
end

function PANEL:Think()
    self:SetValue(self.slider:GetValue())
end
vgui.Register("RsLib.Sliderbar", PANEL, "EditablePanel")
