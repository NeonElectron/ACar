include("shared.lua")
AddCSLuaFile("shared.lua")

function ENT:Initialize()
self.CarModel = ClientsideModel("models/tdmcars/mclaren_f1.mdl",RENDERGROUP_BOTH)
self.MeshModel = ClientsideModel("models/tdmcars/mclaren_f1.mdl",RENDERGROUP_BOTH)
self.Wireframe = Material("models/wireframe")

self.CarScale = Vector(0.6,0.6,0.6)
self.MeshScale = Vector(0.6,0.6,0.6)
self.CarMat = Matrix()
self.MeshMat = Matrix()
self.CarMat:Scale( self.CarScale )
self.MeshMat:Scale( self.MeshScale )

	if IsValid(self.CarModel) then 
		self.CarModel:SetPos(self:GetPos()+Vector(0,0,10))
		self.CarModel:SetAngles(Angle(0,self:GetAngles().yaw,0))
	end
	
	if IsValid(self.MeshModel) then 
		self.MeshModel:SetPos(self:GetPos()+Vector(0,0,30))
		self.MeshModel:SetAngles(Angle(0,self:GetAngles().yaw,0))
	end


end
function ENT:Draw()
	self:DrawModel()
	
	if IsValid(self.CarModel) then 
		self.CarModel:SetPos(self:GetPos()+Vector(0,0,10))
		self.CarModel:SetAngles(Angle(0,self:GetAngles().yaw,0))
		self.CarModel:EnableMatrix( "RenderMultiply", self.CarMat )
	end
	
	if IsValid(self.MeshModel) then 
		self.MeshModel:SetPos(self.CarModel:GetPos())
		self.MeshModel:SetAngles(self.CarModel:GetAngles())
		self.MeshModel:EnableMatrix( "RenderMultiply", self.MeshMat )
		self.MeshModel:SetMaterial(tostring(self.Wireframe))
		self.MeshModel:SetColor(Color(200,255,200))
	end
	
end

function ENT:OnRemove()
	self.CarModel:Remove()
	self.MeshModel:Remove()
end

function ENT:SetCars(mdl)
	self.CarModel:SetModel(mdl)
	self.MeshModel:SetModel(mdl)
end

function ENT:SetCarTable(tbl)
	self.CarTable = tbl
end




