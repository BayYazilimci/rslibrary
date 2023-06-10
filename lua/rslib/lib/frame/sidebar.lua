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
    btn:Dock(TOP)
    btn.id = i
    btn:DockMargin(0,15,0,0)
    btn.PerformLayout = function(pnl,w,h)
        btn:SizeToContentsX(100)
    end
    btn:SetText("")
    btn.Paint = function(pnl,w,h)
        if (self.active == pnl.id) then
            draw.SimpleText(name, "RsFont.H1", 15, 6, RsPostman.Theme.hoverbtn,TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
        else
            draw.SimpleText(name, "RsFont.H1", 15, 6, RsPostman.Theme.text,TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
        end
    end
    btn:SizeToContentsY(12)
    btn.DoClick = function(pnl)
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
        activeBtn:SetTextColor(RsLib.Theme.white)
        
        local activepanel = self.panels[self.active]
        if(IsValid(activepanel)) then
            activepanel:SetVisible(false)
        end
    end

    self.active = id

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
    draw.RoundedBoxEx(8,0,0,w,h,RsLib.Theme.Sidebar,false,false,true,false)
end

vgui.Register("RsLib.Sidebar",PANEL)