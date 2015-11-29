ACar = {}
ACar.Vehicles = {}

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

util.AddNetworkString("ACAR_Begin")
util.AddNetworkString("ACAR_End")
util.AddNetworkString("ACar_SendCommand")
util.AddNetworkString("ACar_SendVehicleInfo")

function ACar_ClientCommand(ln,ply)
	print(ply,ply:GetCarShop())
	if not ply:GetCarShop() then return end
	if net.ReadString() == "OnNext" then
		net.Start("ACar_SendVehicleInfo")
		net.WriteTable(ACar.Vehicles[6])
		net.Send(ply)
	end
end
net.Receive("ACar_SendCommand",ACar_ClientCommand)


ACar.Vehicles[1] = {Name = 'Audi TT 07',VehicleScript = 'scripts/vehicles/TDMCars/auditt.txt',Model='models/tdmcars/auditt.mdl',Class='prop_vehicle_jeep', Price = 40000}

ACar.Vehicles[2] = {Name = 'Lamborghini Gallardo LP570-4 Spyder Performante',VehicleScript = 'scripts/vehicles/tdmcars/gallardospyd.txt',Model='models/tdmcars/lam_gallardospyd.mdl',Class='prop_vehicle_jeep', Price = 40000}

ACar.Vehicles[3] = {Name = 'Audi R8 Plus',VehicleScript = 'scripts/vehicles/TDMCars/audir8plus.txt',Model='models/tdmcars/audi_r8_plus.mdl',Class='prop_vehicle_jeep', Price = 40000}

ACar.Vehicles[4] = {Name = 'Lamborghini Murcielago LP 670-4 SV',VehicleScript = 'scripts/vehicles/tdmcars/murcielagosv.txt',Model='models/tdmcars/lambo_murcielagosv.mdl',Class='prop_vehicle_jeep', Price = 40000}

ACar.Vehicles[5] = {Name = 'Lamborghini Gallardo',VehicleScript = 'scripts/vehicles/TDMCars/gallardo.txt',Model='models/tdmcars/gallardo.mdl',Class='prop_vehicle_jeep', Price = 40000}

ACar.Vehicles[6] = {Name = 'Audi S5',VehicleScript = 'scripts/vehicles/TDMCars/s5.txt',Model='models/tdmcars/s5.mdl',Class='prop_vehicle_jeep', Price = 40000}

ACar.Vehicles[7] = {Name = 'Audi R8',VehicleScript = 'scripts/vehicles/TDMCars/audir8.txt',Model='models/tdmcars/audir8.mdl',Class='prop_vehicle_jeep', Price = 40000}

ACar.Vehicles[8] = {Name = 'W Motors Lykan Hypersport',VehicleScript = 'scripts/vehicles/LWCars/lykan_hypersport.txt',Model='models/LoneWolfie/lykan_hypersport.mdl',Class='prop_vehicle_jeep', Price = 40000}

ACar.Vehicles[9] = {Name = 'Volkswagen Camper 1965',VehicleScript = 'scripts/vehicles/TDMCars/vwcamper.txt',Model='models/tdmcars/vw_camper65.mdl',Class='prop_vehicle_jeep', Price = 40000}

ACar.Vehicles[10] = {Name = 'Audi S4',VehicleScript = 'scripts/vehicles/TDMCars/aud_s4.txt',Model='models/tdmcars/aud_s4.mdl',Class='prop_vehicle_jeep', Price = 40000}

ACar.Vehicles[11] = {Name = 'Lamborghini Miura Concept',VehicleScript = 'scripts/vehicles/tdmcars/miuracon.txt',Model='models/tdmcars/lambo_miuracon.mdl',Class='prop_vehicle_jeep', Price = 40000}

ACar.Vehicles[12] = {Name = 'Scion tC',VehicleScript = 'scripts/vehicles/TDMCars/sciontc.txt',Model='models/tdmcars/scion_tc.mdl',Class='prop_vehicle_jeep', Price = 40000}

ACar.Vehicles[13] = {Name = 'Mini Cooper Coupe',VehicleScript = 'scripts/vehicles/TDMCars/minicoupe.txt',Model='models/tdmcars/mini_coupe.mdl',Class='prop_vehicle_jeep', Price = 40000}

ACar.Vehicles[14] = {Name = 'Audi R8 GT Spyder',VehicleScript = 'scripts/vehicles/TDMCars/audir8spyd.txt',Model='models/tdmcars/audi_r8_spyder.mdl',Class='prop_vehicle_jeep', Price = 40000}

ACar.Vehicles[15] = {Name = 'Volkswagen Golf MKII',VehicleScript = 'scripts/vehicles/TDMCars/golfmk2.txt',Model='models/tdmcars/golf_mk2.mdl',Class='prop_vehicle_jeep', Price = 40000}

ACar.Vehicles[16] = {Name = 'Audi RS4 Avant',VehicleScript = 'scripts/vehicles/TDMCars/rs4avant.txt',Model='models/tdmcars/aud_rs4avant.mdl',Class='prop_vehicle_jeep', Price = 40000}

ACar.Vehicles[17] = {Name = 'McLaren GT MP4-12C GT3',VehicleScript = 'scripts/vehicles/TDMCars/mclmp412cgt3.txt',Model='models/tdmcars/mclaren_mp412cgt3.mdl',Class='prop_vehicle_jeep', Price = 40000}

ACar.Vehicles[18] = {Name = 'Volkswagen Scirocco R',VehicleScript = 'scripts/vehicles/TDMCars/sciroccor.txt',Model='models/tdmcars/vw_sciroccor.mdl',Class='prop_vehicle_jeep', Price = 40000}

ACar.Vehicles[19] = {Name = 'Subaru Impreza WRX STi',VehicleScript = 'scripts/vehicles/TDMCars/subimpreza08.txt',Model='models/tdmcars/sub_wrxsti08.mdl',Class='prop_vehicle_jeep', Price = 40000}

ACar.Vehicles[29] = {Name = 'Volkswagen Golf R32',VehicleScript = 'scripts/vehicles/TDMCars/vw_golfr32.txt',Model='models/tdmcars/vw_golfr32.mdl',Class='prop_vehicle_jeep', Price = 40000}

ACar.Vehicles[30] = {Name = 'Volkswagen New Beetle Convertible',VehicleScript = 'scripts/vehicles/TDMCars/vwbeetleconv.txt',Model='models/tdmcars/vw_beetleconv.mdl',Class='prop_vehicle_jeep', Price = 40000}

ACar.Vehicles[31] = {Name = 'Volkswagen Beetle 1968',VehicleScript = 'scripts/vehicles/TDMCars/beetle68.txt',Model='models/tdmcars/beetle.mdl',Class='prop_vehicle_jeep', Price = 40000}

ACar.Vehicles[32] = {Name = 'Lamborghini Murcielago',VehicleScript = 'scripts/vehicles/TDMCars/murcielago.txt',Model='models/tdmcars/murcielago.mdl',Class='prop_vehicle_jeep', Price = 40000}

ACar.Vehicles[33] = {Name = 'Scion FR-S',VehicleScript = 'scripts/vehicles/TDMCars/scionfrs.txt',Model='models/tdmcars/scion_frs.mdl',Class='prop_vehicle_jeep', Price = 40000}

ACar.Vehicles[34] = {Name = 'Lamborghini Miura P400',VehicleScript = 'scripts/vehicles/tdmcars/lam_miura_p400.txt',Model='models/tdmcars/lam_miura_p400.mdl',Class='prop_vehicle_jeep', Price = 40000}

ACar.Vehicles[35] = {Name = 'Lamborghini Diablo',VehicleScript = 'scripts/vehicles/TDMCars/diablo.txt',Model='models/tdmcars/lambo_diablo.mdl',Class='prop_vehicle_jeep', Price = 40000}

ACar.Vehicles[36] = {Name = 'McLaren F1',VehicleScript = 'scripts/vehicles/TDMCars/mclarenf1.txt',Model='models/tdmcars/mclaren_f1.mdl',Class='prop_vehicle_jeep', Price = 40000}

ACar.Vehicles[37] = {Name = 'McLaren P1',VehicleScript = 'scripts/vehicles/TDMCars/mclarenp1.txt',Model='models/tdmcars/mclaren_p1.mdl',Class='prop_vehicle_jeep', Price = 40000}

ACar.Vehicles[38] = {Name = 'Lamborghini Reventon Roadster',VehicleScript = 'scripts/vehicles/TDMCars/reventonr.txt',Model='models/tdmcars/reventon_roadster.mdl',Class='prop_vehicle_jeep', Price = 40000}

ACar.Vehicles[39] = {Name = 'Mini Cooper Clubman',VehicleScript = 'scripts/vehicles/TDMCars/miniclubman.txt',Model='models/tdmcars/mini_clubman.mdl',Class='prop_vehicle_jeep', Price = 40000}

ACar.Vehicles[40] = {Name = 'Subaru Legacy GT 2010',VehicleScript = 'scripts/vehicles/TDMCars/subleggt10.txt',Model='models/tdmcars/sub_legacygt10.mdl',Class='prop_vehicle_jeep', Price = 40000}

ACar.Vehicles[41] = {Name = 'Subaru Impreza WRX STi 05',VehicleScript = 'scripts/vehicles/TDMCars/subimpreza05.txt',Model='models/tdmcars/sub_wrxsti05.mdl',Class='prop_vehicle_jeep', Price = 40000}

ACar.Vehicles[42] = {Name = 'Mini Cooper S 2011',VehicleScript = 'scripts/vehicles/TDMCars/minicoopers11.txt',Model='models/tdmcars/mini_coopers11.mdl',Class='prop_vehicle_jeep', Price = 40000}
