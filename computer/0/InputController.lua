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

    wKey = rs.getInput("left")
    aKey = rs.getInput("right")

    wKey = wKey and "1" or "0"
    aKey = aKey and "1" or "0"

    out = binary_to_number(wKey..aKey)
    print("converting "..wKey..aKey.." to "..out)
    rs.setAnalogOutput("bottom", out)
    sleep(0.1)
end