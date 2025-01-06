local function isHatEquipped(slot)
  local item = player.equippedItem(slot)
  return item and item.name == "pat_heavyhat"
end

local function removeHatHandler(_, localMsg)
  if not localMsg then return end

  if isHatEquipped("head") then
    player.setEquippedItem("head", nil)
    return true
  end

  if isHatEquipped("headCosmetic") then
    player.setEquippedItem("headCosmetic", nil)
    return true
  end
end

function init()
  script.setUpdateDelta(15)
  message.setHandler("pat_heavyhatremove", removeHatHandler)
end

function update(dt)
  if isHatEquipped("headCosmetic") then
    status.addEphemeralEffect("pat_heavyhatgive", dt * 2)
  end
end
