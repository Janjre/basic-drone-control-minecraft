function to_binary(n, bits)
    local binary = ""
    for i = bits - 1, 0, -1 do
        local bit = math.floor(n / 2^i) % 2
        binary = binary .. bit
    end
    return binary
end

while true do
    topReader = rs.getAnalogInput("top")
    bottomReader = rs.getAnalogInput("bottom")

    topInputs = to_binary(topReader, 2)
    bottomInputs = to_binary(bottomReader, 3)

    wKey = string.sub(topInputs, 1, 1)
    aKey = string.sub(topInputs, 2, 2)
    sKey = string.sub(bottomInputs, 1, 1)
    dKey = string.sub(bottomInputs, 2, 2)
    spaceKey = string.sub(bottomInputs, 3, 3)

   print(wKey .. aKey .. sKey ..  dKey .. spaceKey)


    wKey = wKey == "1"
    aKey = aKey == "1"
    sKey = sKey == "1"
    dKey = dKey == "1"
    spaceKey = spaceKey == "1"

    propellers = {10,10,10,10}

    if wKey then
        propellers[3] = 0
        propellers[4] = 0
        propellers[1] = 11
        propellers[2] = 11
        print("W - disabling 3 and 4")
    end
    if aKey then
        propellers[1] = 0
        propellers[4] = 0
        propellers[2] = 11
        propellers[3] = 11
        print("A - disabling 1 and 4")
    end
    if sKey then
        propellers[1] = 0
        propellers[2] = 0
        propellers[3] = 11
        propellers[4] = 11
        print("S - disabling 1 and 2")
    end
    if dKey then
        propellers[2] = 0
        propellers[3] = 0
        propellers[1] = 11
        propellers[4] = 11
        print("D - disabling 2 and 3")
    end
    if spaceKey then
        propellers[1] = 0
        propellers[2] = 0
        propellers[3] = 0
        propellers[4] = 0
        print("Space - disabling all")
    end

    print("Propellers: " .. propellers[1] .. " " .. propellers[2] .. " " .. propellers[3] .. " " .. propellers[4])

    rs.setAnalogOutput("front", propellers[1])
    rs.setAnalogOutput("left", propellers[2])
    rs.setAnalogOutput("back", propellers[3])
    rs.setAnalogOutput("right", propellers[4])
    sleep(1)

end