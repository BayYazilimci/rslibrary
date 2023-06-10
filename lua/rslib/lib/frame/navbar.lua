local PANEL = {}

AccessorFunc(PANEL, "m_body", "Body")

function PANEL:Init()
    self.buttons = {}
    self.panels = {}
end

function PANEL:AddTab(name,panel)
    local i = table.Count(self.buttons) +1
    self.buttons[i] = self:Add("DButton")
    local btn = self.buttons[i]
    btn:Dock(LEFT)
    btn.id = i
    btn:DockMargin(15,3,0,0)
    btn.PerformLayout = function(pnl,w,h)
        btn:SizeToContentsX(1)
    end
    btn:SetText(name)
    btn:SetFont("RsFont.H1")
    local speed = 3.5
    local barstatus = 0
    btn.Paint = function(pnl,w,h)
        if (self.active == pnl.id) then
            barstatus = math.Clamp(barstatus + speed * FrameTime(), 0,1)
            surface.SetDrawColor(RsLib.Theme.Blue)
            surface.DrawRect(0,h - 1,w * barstatus,2)
        end
    end
    btn:SetTextColor(RsLib.Theme.White)
    btn.DoClick = function(pnl)
        barstatus = 0
        self:SetActive(pnl.id)
    end
    self.panels[i] = self:GetBody():Add(panel or "DPanel")
    panel = self.panels[i]
    panel:Dock(FILL)
    panel:SetVisible(false)
end

function PANEL:SetActive(id)
    local btn = self.buttons[id]
    if(!IsValid(btn)) then return end
    
    local activeBtn = self.buttons[self.active]
    if(IsValid(activeBtn)) then
        activeBtn:SetTextColor(RsLib.Theme.White)
        
        local activepanel = self.panels[self.active]
        if(IsValid(activepanel)) then
            activepanel:SetVisible(false)
        end
    end
    self.active = id
    btn:SetTextColor(RsLib.Theme.Blue)
    local panel = self.panels[id]
    panel:SetVisible(true)
end

function PANEL:SetActiveName(name)
    for i, btn in pairs(self.buttons) do
        if(btn:GetText() == name) then
           self:SetActive(btn.id) 
           break
        end 
    end
end

function PANEL:Paint(w,h)
    surface.SetDrawColor(RsLib.Theme.Navbar)
    surface.DrawRect(0,0,w,h)

    surface.SetDrawColor(RsLib.Theme.Blue)
    surface.DrawRect(0,0,w,2)
end

vgui.Register("RsLib.Navbar",PANEL)