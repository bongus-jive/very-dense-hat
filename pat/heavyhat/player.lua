function init()
	script.setUpdateDelta(12)
	
	message.setHandler("pat_heavyhatremove", function(_,isLocal)
		if isLocal then
			local head = player.equippedItem("head")
			if head and head.name == "pat_heavyhat" then
				player.setEquippedItem("head")
			end
			
			local headCos = player.equippedItem("headCosmetic")
			if headCos and headCos.name == "pat_heavyhat" then
				player.setEquippedItem("headCosmetic")
			end
		end
	end)
end

function update()
	local headCos = player.equippedItem("headCosmetic")
	if headCos and headCos.name == "pat_heavyhat" then
		status.addEphemeralEffect("pat_heavyhat")
	end
end
