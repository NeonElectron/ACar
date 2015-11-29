 local PlyMeta = FindMetaTable("Player")

function PlyMeta:IsInCarShop()
	return self.IICS
end

function PlyMeta:SetInCarShop(bool)
	 self.IICS = bool
end
function PlyMeta:SetCarShop(ent)
	self.CarShop = ent
end
function PlyMeta:GetCarShop()
	return self.CarShop
end


local myscrw, myscrh = 1920,	1080
local function SW(width)
	local screenwidth = myscrw
	return width*ScrW()/screenwidth
end

local function SH(height)
	local screenheight = myscrh
	return height*ScrH()/screenheight
end

local  function SWH(width, height)
	local screenwidth = myscrw
	local screenheight = myscrh
	return width*ScrW()/screenwidth, height*ScrH()/screenheight
end


function ACar_OpenShop()
	LocalPlayer():SetInCarShop(net.ReadBool())
	LocalPlayer():SetCarShop(net.ReadEntity())
		local tb = net.ReadTable()
	LocalPlayer():GetCarShop():SetCars(tb.Model)
	if(LocalPlayer().ACarGUI) then
		LocalPlayer().ACarGUI:Remove()
		LocalPlayer().ACarGUI = vgui.Create("ACar_Shop")
	else
		LocalPlayer().ACarGUI = vgui.Create("ACar_Shop")
	end
end
net.Receive("ACAR_Begin",ACar_OpenShop)


function ACar_ReceiveInfo()
	local tb = net.ReadTable()
	LocalPlayer():GetCarShop():SetCars(tb.Model)
	print("lol")

end
net.Receive("ACar_SendVehicleInfo",ACar_ReceiveInfo)


function MyCalcView( ply, pos, angles, fov )
if not LocalPlayer():GetCarShop() then return end
	local view = {}

	view.origin = LocalPlayer():GetCarShop():GetPos()-( LocalPlayer():GetCarShop():GetAngles():Up()*-100  ) + Vector(math.cos(CurTime()*0.5)*200,math.sin(CurTime()*0.5)*200,0)
	view.angles = (LocalPlayer():GetCarShop():GetPos()-view.origin):Angle()
	view.fov = fov

	return view
end

hook.Add( "CalcView", "Hunduras", MyCalcView )

hook.Add( "ShouldDrawLocalPlayer", "MyShouldDrawLocalPlayer", function( ply )
	if not LocalPlayer():GetCarShop() then return end
	return true
end )

	   local Colors = {}
        local PANEL = {}
 
        local function OnBuy()
        end
 
        local function OnSell()
        end
 
        local function OnSpawn()
        end
 
        local function OnStore()
        end
 
        local function OnNext()
		net.Start("ACar_SendCommand")
			net.WriteString("OnNext")
		net.SendToServer()
		print("2")
        end
 
        local function OnPrevious()
		net.Start("ACar_SendCommand")
			net.WriteString("OnPrevious")
		net.SendToServer()
        end
 
        surface.CreateFont("VMedFont", {font = "Roboto", size = 32})
        surface.CreateFont("VBigFont", {font = "Robot", size = 48})
 
        function PANEL:Init()
                self:SetSize(SWH(ScrW()*0.58,200))
                self:SetPos(SWH(0,ScrH()-205))
                self:SetVisible(true)
                self:MakePopup()
 
                self.BuyButton = vgui.Create("DButton", self)
                self.BuyButton:SetText("Buy")
                self.BuyButton:SetFont("VMedFont")
                self.BuyButton:SetColor(Color(255, 255, 255, 200))
                self.BuyButton:SetPos(SWH(35,25))
                self.BuyButton:SetSize(SWH(150, 44))
                self.BuyButton.DoClick = function() OnBuy() end
 
                function self.BuyButton:Paint(w, h)
                        surface.SetDrawColor(Color(255, 0, 0, 150))
                        surface.DrawRect(1, 1, w - 2, h - 2)
 
                        surface.SetDrawColor(Color(48, 48, 48, 255))
                        surface.DrawOutlinedRect(0, 0, w, h)
                end
 
                self.SellButton = vgui.Create("DButton", self)
                self.SellButton:SetText("Sell")
                self.SellButton:SetFont("VMedFont")
                self.SellButton:SetColor(Color(255, 255, 255, 200))
                self.SellButton:SetPos(SWH(35, 75))
                self.SellButton:SetSize(SWH(150, 44))
                self.SellButton.DoClick = function() OnSell() end
 
                function self.SellButton:Paint(w, h)
                        surface.SetDrawColor(Color(0, 255, 0, 150))
                        surface.DrawRect(1, 1, w - 2, h - 2)
 
                        surface.SetDrawColor(Color(48, 48, 48, 255))
                        surface.DrawOutlinedRect(0, 0, w, h)
                end
 
                self.SpawnButton = vgui.Create("DButton", self)
                self.SpawnButton:SetText("Spawn")
                self.SpawnButton:SetFont("VMedFont")
                self.SpawnButton:SetColor(Color(255, 255, 255, 200))
                self.SpawnButton:SetPos(SWH(205, 25))
                self.SpawnButton:SetSize(SWH(200, 44))
                self.SpawnButton.DoClick = function() OnSpawn() end
 
                function self.SpawnButton:Paint(w, h)
                        surface.SetDrawColor(Color(220, 20, 60, 200))
                        surface.DrawRect(1, 1, w - 2, h - 2)
 
                        surface.SetDrawColor(Color(48, 48, 48, 255))
                        surface.DrawOutlinedRect(0, 0, w, h)
                end
 
                self.StoreButton = vgui.Create("DButton", self)
                self.StoreButton:SetText("Store")
                self.StoreButton:SetFont("VMedFont")
                self.StoreButton:SetColor(Color(255, 255, 255, 200))
                self.StoreButton:SetPos(SWH(205, 75))
                self.StoreButton:SetSize(SWH(200, 44))
                self.StoreButton.DoClick = function() OnStore() end
 
                function self.StoreButton:Paint(w, h)
                        surface.SetDrawColor(Color(100, 100, 170, 150))
                        surface.DrawRect(1, 1, w - 2, h - 2)
 
                        surface.SetDrawColor(Color(48, 48, 48, 255))
                        surface.DrawOutlinedRect(0, 0, w, h)
                end
 
                self.PrevButton = vgui.Create("DButton", self)
                self.PrevButton:SetText("◄")
                self.PrevButton:SetTextInset(0, -5)
                self.PrevButton:SetFont("VBigFont")
                self.PrevButton:SetColor(Color(255, 255, 255, 200))
                self.PrevButton:SetPos(SWH(425, 50))
                self.PrevButton:SetSize(SWH(60, 40))
                self.PrevButton.DoClick = function() OnPrevious() end
 
                function self.PrevButton:Paint(w, h)
                        surface.SetDrawColor(Color(0, 0, 255, 150))
                        surface.DrawRect(1, 1, w - 2, h - 2)
 
                        surface.SetDrawColor(Color(48, 48, 48, 255))
                        surface.DrawOutlinedRect(0, 0, w, h)
                end
 
                self.NextButton = vgui.Create("DButton", self)
                self.NextButton:SetText("►")
                self.NextButton:SetTextInset(0, -5)
                self.NextButton:SetFont("VBigFont")
                self.NextButton:SetColor(Color(255, 255, 255, 200))
                self.NextButton:SetPos(SWH(495, 50))
                self.NextButton:SetSize(SWH(60, 40))
                self.NextButton.DoClick = function() print("boy") OnNext() end
 
                function self.NextButton:Paint(w, h)
                        surface.SetDrawColor(Color(0, 0, 255, 150))
                        surface.DrawRect(1, 1, w - 2, h - 2)
 
                        surface.SetDrawColor(Color(48, 48, 48, 255))
                        surface.DrawOutlinedRect(0, 0, w, h)
                end
 
                self.ColorPanel = vgui.Create("DPanel", self)
                self.ColorPanel:SetPos(SWH(575, 35))
                self.ColorPanel:SetSize(SWH(270, 90))
                function self.ColorPanel:Paint(w, h)
                        surface.SetDrawColor(Color(100, 100, 100, 50))
                        surface.DrawRect(1, 1, w , h)
                end
 
                self.RedLabel = vgui.Create("DLabel", self.ColorPanel)
                self.RedLabel:SetText("Red")
                self.RedLabel:SetPos(SWH(10, 5))
 
                self.GreenLabel = vgui.Create("DLabel", self.ColorPanel)
                self.GreenLabel:SetText("Green")
                self.GreenLabel:SetPos(SWH(10, 35))
 
                self.BlueLabel = vgui.Create("DLabel", self.ColorPanel)
                self.BlueLabel:SetText("Blue")
                self.BlueLabel:SetPos(SWH(10, 65))
 
                self.ColorRed = vgui.Create("DNumSlider", self.ColorPanel)
                self.ColorRed:SetMin(0)
                self.ColorRed:SetMax(255)
                self.ColorRed:SetPos(SWH(-90, 5))
                self.ColorRed:SetSize(SWH(350, 20))
 
                self.ColorGreen = vgui.Create("DNumSlider", self.ColorPanel)
                self.ColorGreen:SetMin(0)
                self.ColorGreen:SetMax(255)
                self.ColorGreen:SetPos(SWH(-90, 35))
                self.ColorGreen:SetSize(SWH(350, 20))
 
                self.ColorBlue = vgui.Create("DNumSlider", self.ColorPanel)
                self.ColorBlue:SetMin(0)
                self.ColorBlue:SetMax(255)
                self.ColorBlue:SetPos(SWH(-90, 65))
                self.ColorBlue:SetSize(SWH(350, 20))
 
                local function GetPreviewColors()
                        return self.ColorRed:GetValue(), self.ColorGreen:GetValue(), self.ColorBlue:GetValue(), 150
                end
 
                self.ColorPreviewPanel = vgui.Create("DPanel", self)
                self.ColorPreviewPanel:SetPos(SWH(865, 30))
                self.ColorPreviewPanel:SetSize(SWH(200, 100))
 
                function self.ColorPreviewPanel:Paint(w, h)
                        surface.SetDrawColor(Color(GetPreviewColors()))
                        surface.DrawRect(1, 1, w - 2, h - 2)
 
                        surface.SetDrawColor(Color(0, 0, 0, 150))
                        surface.DrawOutlinedRect(0, 0, w, h)
                end
 
                self:CenterHorizontal()
        end
 
        function PANEL:Paint(w, h)
                surface.SetDrawColor(0, 0, 0, 125)
                surface.DrawRect(0, 0, w, h)
        end
        vgui.Register("ACar_Shop", PANEL)
 
        concommand.Add("vehicleactions",
                function ()
                        if BasePanel then
                                BasePanel:Remove()
                        end
                        BasePanel = vgui.Create("ACar_Shop")
                end
        )