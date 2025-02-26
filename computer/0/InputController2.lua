function binary_to_number(binary)
    local number = 0
    local length = #binary
    for i = 1, length do
        local bit = tonumber(binary:sub(i, i))
        number = number + bit * 2^(length - i)
    end
    return number
end

while true do

    sKey = rs.getInput("left")
    dKey = rs.getInput("right")
    spaceKey = rs.getInput("bottom")

    sKey = sKey and "1" or "0"
    dKey = dKey and "1" or "0"
    spaceKey = spaceKey and "1" or "0"

    local binary_input = sKey .. dKey .. spaceKey
    out = binary_to_number(binary_input)
    
    print("converting " .. sKey .. dKey .. spaceKey .. " to " .. out)
    
    rs.setAnalogOutput("top", out)
    sleep(0.1)
end 