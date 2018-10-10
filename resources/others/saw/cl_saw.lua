local sawconfig = {
	sawmodel = "prop_tool_consaw",
	holdingSaw = false,
	usingSaw = false, 
	saw = nil,
	anim_dic = "weapons@heavy@minigun",
	anim_name = "idle_2_aim_right_med",
	anim_name2 = "idle_2_aim_fwd_med",
	particle_dic = "des_fib_floor",
	particle_name = "ent_ray_fbi5a_ramp_metal_imp",
	time = 10,
}

RegisterNetEvent("getSaw")
AddEventHandler("getSaw", function()
	Citizen.CreateThread(function()
		if sawconfig.holdingSaw == false and sawconfig.usingSaw == false then

			-- Requesting Saw Model Load --
			RequestModel(GetHashKey(sawconfig.sawmodel))
			while not HasModelLoaded(GetHashKey(sawconfig.sawmodel)) do
				RequestModel(GetHashKey(sawconfig.sawmodel))
				Citizen.Wait(100)
			end

			-- Requesting Animation Dict Load --
			RequestAnimDict(sawconfig.anim_dic)
			while not HasAnimDictLoaded(sawconfig.anim_dic) do
				RequestAnimDict(sawconfig.anim_dic)
				Citizen.Wait(100)
			end

			-- Getting Coords for saw and player --
			local plyCoords = GetOffsetFromEntityGivenWorldCoords(GetPlayerPed(PlayerId()), 0.0, 1.0, 0.0)
			local sawobject = CreateObject(GetHashKey(sawconfig.sawmodel), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)

			-- Attach saw -- [X --> up - down] [Y --> roll left - right] [Z --> left - right]
			AttachEntityToEntity(sawobject, GetPlayerPed(PlayerId()), GetPedBoneIndex(GetPlayerPed(PlayerId()), 28422), 0.095, 0.0, 0.0, 270.0, 170.0, 0.0, 1, 1, 0, 1, 0, 1)
																									   --X       --Y      --Z
			-- Play Animation --
			TaskPlayAnim(GetPlayerPed(PlayerId()), sawconfig.anim_dic, sawconfig.anim_name, 1.0, -1, -1, 2 + 16 + 32, 0, 0, 0, 0)

			-- End Vars --
			sawconfig.saw = sawobject
			sawconfig.holdingSaw = true
			SetNetworkIdExistsOnAllMachines(NetworkGetNetworkIdFromEntity(sawconfig.saw), true)
		else
			ClearPedSecondaryTask(GetPlayerPed(-1))
			ClearPedTasks(GetPlayerPed(-1))
			DetachEntity(sawconfig.saw, 1, 1)
			DeleteEntity(sawconfig.saw)
			CancelEvent("getSaw")
			--FreezeEntityPosition(GetPlayerPed(-1), )
			sawconfig.saw = nil
			sawconfig.holdingSaw = false
		end
	end)
end)

RegisterNetEvent("cutdoor")
AddEventHandler("cutdoor", function(vehicle, doorindex)
	Citizen.CreateThread(function()
		if sawconfig.usingSaw == false and sawconfig.holdingSaw == true then
			local networksaw = NetworkGetNetworkIdFromEntity(sawconfig.saw)

			sawconfig.usingSaw = true
			Citizen.Wait(0)
			timer(vehicle, doorindex) -- Starting saw timer
			while sawconfig.usingSaw == true do
				Citizen.Wait(5)
				TriggerServerEvent("sv_saw:startsawparticles", networksaw)
			end
		end
	end)
end)

RegisterNetEvent("cl_saw:startsawparticles")
AddEventHandler("cl_saw:startsawparticles", function(sawid)
	Citizen.CreateThread(function()
		local sawentity = NetworkGetEntityFromNetworkId(sawid)
		RequestNamedPtfxAsset(sawconfig.particle_dic)
		while not HasNamedPtfxAssetLoaded(sawconfig.particle_dic) do
			RequestNamedPtfxAsset(sawconfig.particle_dic)
			Citizen.Wait(5)
		end

		UseParticleFxAssetNextCall(sawconfig.particle_dic)
		--StartParticleFxNonLoopedOnEntity(sawconfig.particle_name, sawentity, -0.715, 0.005, 0.0, 0.0, 25.0, 25.0, 0.75, 0.0, 0.0, 0.0)
		StartParticleFxNonLoopedOnEntity_2(sawconfig.particle_name, sawentity, -0.715, 0.005, 0.0, 0.0, 25.0, 25.0, 0.75, 0.0, 0.0, 0.0)
	end)
end)

RegisterNetEvent("cl_saw:stopsawparticles")
AddEventHandler("cl_saw:stopsawparticles", function(sawid)
	local sawentity = NetworkGetEntityFromNetworkId(sawid)
	RemoveParticleFxFromEntity(sawentity)
	sawconfig.usingSaw = false
	sawconfig.particle = nil
end)

function timer(vehicle, doorindex)
	Citizen.CreateThread(function()
		local networksaw = NetworkGetNetworkIdFromEntity(sawconfig.saw)
		local sawsound = PlaySoundFromEntity(-1, "POWERTOOL_GRINDER_GRINDING_MT7", sawconfig.saw, 0, 0, 0)
		local soundId = GetSoundId(sawsound)
		Citizen.Trace("DOOR ANGLE1: " .. GetVehicleDoorAngleRatio(vehicle, doorindex))

		while sawconfig.time > 0 do
			local doorCoord = GetWorldPositionOfEntityBone(vehicle, doorindex)
			local plyCoord = GetEntityCoords(GetPlayerPed(PlayerId()), 1)
			local distance = GetDistanceBetweenCoords(plyCoord.x, plyCoord.y, plyCoord.z, doorCoord.x, doorCoord.y, doorCoord.z, 1)
			Citizen.Trace("DISTANCE: " .. tostring(distance)) --debug info

			if distance > 4.0 then
				Citizen.Trace("TIMER STOPPED")
				sawconfig.time = 10
				RemoveParticleFxFromEntity(sawconfig.saw)
				TriggerServerEvent("sv_saw:stopsawparticles", networksaw)
				sawconfig.usingSaw = false
				sawconfig.particle = nil
				return
			end
			Citizen.Wait(1000)
			sawconfig.time = sawconfig.time - 1
		end

		sawconfig.time = 10
		SetVehicleDoorBroken(vehicle, doorindex, false)
		Citizen.Trace("DOOR ANGLE2: " .. GetVehicleDoorAngleRatio(vehicle, doorindex))
		StopSound(soundId)
		RemoveParticleFxFromEntity(sawconfig.saw)
		TriggerServerEvent("sv_saw:stopsawparticles", networksaw)
		sawconfig.usingSaw = false
		sawconfig.particle = nil
	end)
end


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if sawconfig.holdingSaw == true then

			if sawconfig.usingSaw == true then
				drawTxt(0.66, 1.44, 1.0,1.0,0.4, "Cutting Door: ~r~" .. tostring(sawconfig.time) .. "~w~ seconds remaining", 255, 255, 255, 255)
			end

			local plyCoords = GetEntityCoords(GetPlayerPed(PlayerId()), false)
			local coordB = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.0, 5.0, 0.0)
			local vehicle = getVehicleInDirection(plyCoords, coordB)
			local vehHead = GetEntityHeading(vehicle)

			local frontleft = GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, "door_dside_f"))
			local frontright = GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, "door_pside_f"))
			local backleft = GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, "door_dside_r"))
			local backright = GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, "door_pside_r"))

			local fldistance = GetDistanceBetweenCoords(frontleft['x'], frontleft['y'], frontleft['z'], plyCoords.x, plyCoords.y, plyCoords.z, 1)
			local frdistance = GetDistanceBetweenCoords(frontright['x'], frontright['y'], frontright['z'], plyCoords.x, plyCoords.y, plyCoords.z, 1)
			local bldistance = GetDistanceBetweenCoords(backleft['x'], backleft['y'], backleft['z'], plyCoords.x, plyCoords.y, plyCoords.z, 1)
			local brdistance = GetDistanceBetweenCoords(backright['x'], backright['y'], backright['z'], plyCoords.x, plyCoords.y, plyCoords.z, 1)

			if (fldistance < frdistance and fldistance < bldistance and fldistance < brdistance and not sawconfig.usingSaw) then
				DisplayHelpText("Press ~INPUT_CONTEXT~ cut the vehicles front left door off.")
			elseif (frdistance < fldistance and frdistance < bldistance and frdistance < brdistance and not sawconfig.usingSaw) then
				DisplayHelpText("Press ~INPUT_CONTEXT~ cut the vehicles front right door off.")
			elseif (bldistance < fldistance and bldistance < frdistance and bldistance < brdistance and not sawconfig.usingSaw) then
				DisplayHelpText("Press ~INPUT_CONTEXT~ cut the vehicles back left door off.")
			elseif(brdistance < fldistance and brdistance < frdistance and brdistance < bldistance and not sawconfig.usingSaw) then
				DisplayHelpText("Press ~INPUT_CONTEXT~ cut the vehicles back right door off.")
			end

			if (fldistance < frdistance and fldistance < bldistance and fldistance < brdistance and IsControlJustPressed(1, 51)) then
				--TaskGoToCoordAnyMeans(GetPlayerPed(PlayerId()), frontleft['x'], frontleft['y'], frontleft['z'], 5.0, 0, 0, 786603, 0xbf800000)
				Citizen.Wait(3000)
				TaskPlayAnim(GetPlayerPed(PlayerId()), sawconfig.anim_dic, sawconfig.anim_name2, 1.0, -1, -1, 2 + 16 + 32, 0, 0, 0, 0)
				TaskAchieveHeading(GetPlayerPed(PlayerId()), vehHead - 90, -1)
				TriggerEvent("cutdoor", vehicle, 0)

			elseif (frdistance < fldistance and frdistance < bldistance and frdistance < brdistance and IsControlJustPressed(1, 51)) then
				--TaskGoToCoordAnyMeans(GetPlayerPed(PlayerId()), frontright['x'], frontright['y'], frontright['z'], 5.0, 0, 0, 786603, 0xbf800000)
				Citizen.Wait(3000)
				TaskPlayAnim(GetPlayerPed(PlayerId()), sawconfig.anim_dic, sawconfig.anim_name2, 1.0, -1, -1, 2 + 16 + 32, 0, 0, 0, 0)
				TaskAchieveHeading(GetPlayerPed(PlayerId()), vehHead - 270, -1)
				TriggerEvent("cutdoor", vehicle, 1)

			elseif (bldistance < fldistance and bldistance < frdistance and bldistance < brdistance and IsControlJustPressed(1, 51)) then
				--TaskGoToCoordAnyMeans(GetPlayerPed(PlayerId()), backleft['x'], backleft['y'], backleft['z'], 5.0, 0, 0, 786603, 0xbf800000)
				Citizen.Wait(3000)
				TaskPlayAnim(GetPlayerPed(PlayerId()), sawconfig.anim_dic, sawconfig.anim_name2, 1.0, -1, -1, 2 + 16 + 32, 0, 0, 0, 0)
				TaskAchieveHeading(GetPlayerPed(PlayerId()), vehHead - 90, -1)
				TriggerEvent("cutdoor", vehicle, 2)

			elseif(brdistance < fldistance and brdistance < frdistance and brdistance < bldistance and IsControlJustPressed(1, 51)) then
				--TaskGoToCoordAnyMeans(GetPlayerPed(PlayerId()), backright['x'], backright['y'], backright['z'], 5.0, 0, 0, 786603, 0xbf800000)
				Citizen.Wait(3000)
				TaskPlayAnim(GetPlayerPed(PlayerId()), sawconfig.anim_dic, sawconfig.anim_name2, 1.0, -1, -1, 2 + 16 + 32, 0, 0, 0, 0)
				TaskAchieveHeading(GetPlayerPed(PlayerId()), vehHead - 270, -1)
				TriggerEvent("cutdoor", vehicle, 3)
			end
		end
	end
end)

--[[ OTHER FUNCTIONS ]]--
function getVehicleInDirection(coordFrom, coordTo)
	local rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, GetPlayerPed(-1), 0)
	local a, b, c, d, vehicle = GetRaycastResult(rayHandle)
	return vehicle
end

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function drawTxt(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if(outline)then
	    SetTextOutline()
	end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

Citizen.CreateThread(function()
	local debug = false
	while true do
		Citizen.Wait(1)
		if IsControlJustPressed(1, 47) then
			local sawid = NetworkGetNetworkIdFromEntity(sawconfig.saw)
			Citizen.Trace("SAW MODEL NETWORK ID: " .. tostring(NetworkGetNetworkIdFromEntity(sawconfig.saw)))
			Citizen.Trace("SAW MODEL USING ID: " .. tostring(NetworkGetEntityFromNetworkId(sawid)))
			Citizen.Trace("SAW MODEL: " .. tostring(sawconfig.saw))
		end
	end
end)

--====================================================--|
--[[SHIT THAT WAS THROWN AWAY BUT KEPT FOR NO REASON]]--|
--====================================================--|

--[[function CancelEvent()
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(0)
			CancelEvent("getSaw")
			ClearPedProp(GetPlayerPed(-1), sawconfig.sawmodel)
			ClearPedSecondaryTask(GetPlayerPed(-1))
		end
	end)]]


-- PUT IN DAMAGE SCRIPT, 

--[[
			SetVehicleDoorsLocked(GetVehiclePedIsUsing(GetPlayerPed(-1)), 4)
			DrawNotification("Driver door is jammed shut, the door will not open anymore", 5000)
]]

  
  ---DOESN'T WORK, JUST AN IDEA HOW TO ADD TO CURRENT DAMAGE SCRIPT---
--[[Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsVehicleDoorDamaged(GetVehiclePedIsUsing(GetPlayerPed(-1)), 0) then
			SetVehicleDoorsLocked(GetVehiclePedIsUsing(GetPlayerPed(-1)), 4)
			DrawNotification("Driver door is jammed shut, the door will not open anymore", 5000)
		end
	end
end)]]
