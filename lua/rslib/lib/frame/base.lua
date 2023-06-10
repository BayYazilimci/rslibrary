local PANEL = {}

function PANEL:Init()
    self.header = self:Add("DPanel")
    self.header:Dock(TOP)
    self.header.Paint = function(pnl,w,h)
        draw.RoundedBoxEx(8,0,0,w,h,RsLib.Theme.Header,true,true,false,false)
    end

    //Close btn
    self.header.closebutton = self.header:Add("DButton")
    self.header.closebutton:Dock(RIGHT)
    self.header.closebutton:SetText("")
    self.header.closebutton.DoClick = function()
        self:Remove()
    end
    self.header.closebutton.Alpha = 70
    self.header.closebutton.margin = 16
    self.header.closebutton.Paint = function(self,w,h)
        surface.SetDrawColor(RsLib.Theme.Button)
        if self:IsHovered() then
            self.Alpha = Lerp(FrameTime() * 2, self.Alpha, self:IsHovered() && 255 || 70)
            draw.SimpleText("X","RsFont.H1", w - (self.margin * 2), h - (self.margin * 1.2), Color(RsLib.Theme.Blue.r,RsLib.Theme.Blue.g,RsLib.Theme.Blue.b,self.Alpha),TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
        else
            self.Alpha = Lerp(FrameTime() / 1, self.Alpha, self:IsHovered() && 255 || 70)
            draw.SimpleText("X","RsFont.H1", w - (self.margin * 2), h - (self.margin * 1.2), Color(RsLib.Theme.Blue.r,RsLib.Theme.Blue.g,RsLib.Theme.Blue.b,self.Alpha),TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)   
        end
    end

    //Header Title
    self.header.title =self.header:Add("DLabel")
    self.header.title:Dock(LEFT)
    self.header.title:SetFont("RsFont.H1")
    self.header.title:SetTextColor(RsLib.Theme.White)
    self.header.title:SetTextInset(16,0)
end

function PANEL:SetTitle(text)
    self.header.title:SetText(text)
    self.header.title:SizeToContents()
end

function PANEL:PerformLayout(w,h)
    self.header:SetTall(40)
    self.header.closebutton:SetWide(self.header:GetTall())
end

function PANEL:Paint(w,h)
    draw.RoundedBox(8,0,0,w,h,RsLib.Theme.Background)
end

vgui.Register("RsLib.Frame",PANEL,"EditablePanel")