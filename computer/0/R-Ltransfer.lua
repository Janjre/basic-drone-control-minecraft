while true do
    right = rs.getAnalogInput("right")
    left = rs.setAnalogOutput("left",right)
    sleep(0.1)
end