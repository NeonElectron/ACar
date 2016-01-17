local mysql_hostname = 'fi.apex.gs'
local mysql_username = 'billhackweb'
local mysql_password = '#^_g4B5djAvCeggAkuG41ejIC46t27ZUc5K8Xy63zkV4wB5hlBwQGPHgQogzBqRwB5hlBwQGPHg'
local mysql_database = 'billhackweb_ghettogarb'
local mysql_port = 3306

require('mysqloo')

local DatabaseConnected = false
local Database = mysqloo.connect(mysql_hostname, mysql_username, mysql_password, mysql_database, mysql_port)

function Database:onConnected()
    MsgN('ACar MySQL: Connected!')
    DatabaseConnected = true
end

function Database:onConnectionFailed(err)
    MsgN('ACar MySQL: Connection Failed, please check your settings: ' .. err)
end

Database:connect()

local Player = FindMetaTable("Player")

function Player:GetVehicles()
	local Vehicles = {}

	if DatabaseConnected then
		local QueryString = "SELECT * FROM ACarData WHERE uniqueid = '"..self:UniqueID().."'"
	end

	return Vehicles
end

function Player:AddVehicle(Vehicle)
end

function Player:RemoveVehicle(Vehicle)
end
