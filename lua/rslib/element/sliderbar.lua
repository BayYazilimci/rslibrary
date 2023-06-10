local circles = include("RsLib/thirdparty/circle.lua")

local PANEL = {}
function PANEL:Init()
    self:SetSize(260, 12)
    self:SetDecimals(0)
    self.Wang:SetVisible(false)
    self.Label:SetVisible(false)
    self.TextArea:SetFont("RsFont.H1")
    self.TextArea:SetDrawLanguageID(false)
    self.Circle = circles.New(CIRCLE_FILLED, 6, 6, 6)
    self.Circle:SetDistance(2)
    self.TextArea:SetTextColor(color_white)
    self.Slider.Knob.Paint = function(this)
        draw.NoTexture()
        surface.SetDrawColor(color_white)
        self.Circle()
    end
    self.Slider.Paint = nil
end

function PANEL:Paint(intW, intH)
    draw.RoundedBox(6, 0, 0, intW - self.TextArea:GetSize() - 4, 12, Color(52,52,52))
end
vgui.Register("RsLib.Slider", PANEL, "DNumSlider")
