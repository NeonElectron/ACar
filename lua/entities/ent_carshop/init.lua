AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include("shared.lua")

function ENT:Initialize()

	self:SetModel( "models/hunter/plates/plate3x5.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	self:SetUseType(SIMPLE_USE)

    local Phys = self:GetPhysicsObject()
	if Phys:IsValid() then
		Phys:Wake()
		Phys:SetMass(1000)
	end
end

function ENT:Think()

end

function ENT:OnTakeDamage()

end

function ENT:Use( activator,caller, useType, value )
	if caller:IsPlayer() then
		net.Start("ACAR_Begin")
		net.WriteBool(true)
		net.WriteEntity(self)
		net.WriteTable(ACar.Vehicles[1])

		caller:SetCarShop(self)
		caller:SetCarID(1)
		net.Send(caller)
	end
end
