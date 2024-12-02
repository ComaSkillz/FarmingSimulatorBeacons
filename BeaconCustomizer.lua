Lights.onLoadFinished = Utils.appendedFunction(Lights.onLoadFinished, function(self, ...)
    local spec = self.spec_lights
    if spec and spec.beaconLights then
        for _, beaconLight in pairs(spec.beaconLights) do
            -- Modify speed (with random variation)
            if beaconLight.speed and beaconLight.speed > 0 then
                local originalSpeed = beaconLight.speed
                -- Modify speed dynamically
                local speedModifier = math.random() / 250 - 0.002
                beaconLight.speed = beaconLight.speed + speedModifier
            end

            -- Set fixed intensity
            if beaconLight.staticLight then
                for _, light in pairs(beaconLight.staticLight) do
                    local originalIntensity = light.intensity
                    light.intensity = 50000 -- Set intensity to a fixed value (adjust as needed)

                    -- Modify intensity scale based on distance (optional)
                    if light.intensityScale then
                        local minDistance = 300  -- Example dynamic min distance
                        local maxDistance = 300  -- Example dynamic max distance
                        light.intensityScale.minDistance = minDistance
                        light.intensityScale.maxDistance = maxDistance
                    end
                end
            end

            -- Modify multiblink pattern (if applicable)
            if beaconLight.staticLight then
                for _, light in pairs(beaconLight.staticLight) do
                    if light.multiBlink then
                        local originalMultiBlinkParams = light.multiBlinkParameters
                        -- Set a dynamic multiblink pattern (can be based on input parameters)
                        light.multiBlinkParameters = "10 1 20 0"  -- Example pattern
                    end
                end
            end

            -- Modify brightness scale
            if beaconLight.device then
                local originalBrightnessScale = beaconLight.device.brightnessScale
                local brightnessScale = 200  -- Example dynamic brightness scale value
                beaconLight.device.brightnessScale = brightnessScale
            end

            -- Modify device RPM (if applicable)
            if beaconLight.device then
                local originalRpm = beaconLight.device.rpm
                local rpm = 1000  -- Example dynamic rpm value
                beaconLight.device.rpm = rpm
            end
        end
    end
end)
