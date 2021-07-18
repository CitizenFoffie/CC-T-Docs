local function getOrientation()
    loc1 = vector.new(gps.locate(2, false))
    if not turtle.forward() then
        for j=1,6 do
                if not turtle.forward() then
                        turtle.dig()
             else break end
        end
    end
    loc2 = vector.new(gps.locate(2, false))
    heading = loc2 - loc1
    return ((heading.x + math.abs(heading.x) * 2) + (heading.z + math.abs(heading.z) * 3))
    end

local function move(n)
    for x = 1, n, 1 do
        while(turtle.detect()) do
            turtle.dig()
        end
        turtle.forward() 
    end
    return("done")
end
local function moveup(n)
    for x = 1, n, 1 do
        while(turtle.detect()) do
            turtle.dig()
        end
        turtle.up() 
    end
    return("done")
end
local function movedown(n)
    for x = 1, n, 1 do
        while(turtle.detect()) do
            turtle.dig()
        end
        turtle.down() 
    end
    return("done")
end
local function FaceHeading(go,dh)
   if (go + 1) % 4 == dh then
        turtle.turnRight()
   elseif (go - 1) % 4 == dh then
        turtle.turnLeft()
   else
        turtle.turnLeft()
        turtle.turnLeft()
   end
end
local function gpsgoto(x,y,z)
    local go = getOrientation()
    local currX, currY, currZ = gps.locate()
    local xDiff, yDiff, zDiff = x - currX, y - currY, z - currZ
    if zDiff > 0 then
        FaceHeading(go,4)
    elseif zDiff < 0 then
        FaceHeading(go,2)
    end
    move(math.abs(zDiff))
    if xDiff > 0 then
        FaceHeading(go,3)
    elseif xDiff < 0 then
        FaceHeading(go,1)
    end
    move(math.abs(xDiff))
    if yDiff < 0 then
        movedown(math.abs(yDiff))
    elseif yDiff > 0 then
        moveup(math.abs(yDiff))
    end
    --    -x = 1
    --    -z = 2
    --    +x = 3
    --    +z = 4

end
return {
    gpsgoto = gpsgoto,
}
