local extra = {
    switchA = 0,
    switchB = 1,
    switchC = 2,
    switchD = 3,
    switchE = 4,
    switchF = 5,
}

local outerBlinkerSwitch = extra.switchE -- change switches here
local centerLightSwitch = extra.switchF -- change switches here
local yourGThreshold = 1 --G threshold for extra switch activation
local brakeLightBlinkSeconds = 0.2 -- blinking interval of the brakelights, in seconds
local brakeLightBlinkAfterStoppedSeconds = 3 -- How long the brakelights blink after it's done braking, in seconds
local switchOn = true
local wasHardBraking = false
local isHardBraking = false

-- Hard braking conditions:
--  * G's surpass 1
--  * Brake pedal is pressed
local function isCarHardBraking()
    if car.brake ~= 0 then
        if math.abs(car.acceleration.z) > yourGThreshold then
            isHardBraking = true
        end
    else
        isHardBraking = false
    end
    return isHardBraking
end

local function wasCarHardBraking()
    setInterval(
        function ()
            wasHardBraking = isHardBraking
        end, brakeLightBlinkAfterStoppedSeconds, "key")
        clearInterval("key")
end

local function blinkCenterBrakeLight()
    ac.setExtraSwitch(centerLightSwitch, switchOn)

    setInterval(
        function ()
            switchOn = not switchOn
        end, brakeLightBlinkSeconds, "key2")
    clearInterval("key2")
end

local function centerBrakeLightBehaviour()
    if isHardBraking or wasHardBraking then
        blinkCenterBrakeLight()
    elseif car.brake ~= 0 and not isHardBraking then
        ac.setExtraSwitch(centerLightSwitch, true)
    elseif not isHardBraking then
        ac.setExtraSwitch(centerLightSwitch, false)
    end
end

local function controlOuterBlinkers(active)
    ac.setExtraSwitch(outerBlinkerSwitch, active)
end

local function outerBlinkersBehaviour()
    controlOuterBlinkers(isHardBraking)
end

--Behaviour:
-- ON HARD BRAKING: 
--   * The center brakelight flashes
--   * The outer blinkers act as a second set of brakelights 
function script.update(dt)
    wasCarHardBraking()
    isCarHardBraking()
    outerBlinkersBehaviour()
    centerBrakeLightBehaviour()
    -- DEBUG : ac.log(wasHardBraking, isHardBraking, car.extraE, car.extraF, switchOn)
end
