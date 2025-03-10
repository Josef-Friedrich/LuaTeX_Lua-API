---@type boolean
local rotate
local image = img.copy({height = 12, filename= "sdsd"})
if rotate then
    if rotate == -90 or rotate == 270 then
        image.transform = 1
        image.height, image.width = image.width, image.height
    elseif rotate == 90 or rotate == -270 then
        image.transform = 3
        image.height, image.width = image.width, image.height
    elseif rotate == 180 or rotate == -180 then
        image.transform = 2
    elseif rotate == 0 or rotate == 360 or rotate == 360 then
        image.transform = 0
    else
        err("Image/rotate: rotation must be between -360 and 360 and given in multiple of 90")
    end
end
