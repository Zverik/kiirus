function way_function()
	local highway  = Find("highway")

	-- Roads
	if highway~="" then

    local class = 0
		if highway=="unclassified" or highway=="residential"
      or highway=="tertiary" or highway=="living_street"
      or highway=="tertiary_link" or highway=="secondary_link"
      then class = 1
    elseif highway=="secondary" or highway=="primary_link"
      or highway=="primary" or highway=="trunk_link" or highway=="trunk"
      or highway=="motorway_link" or highway=="motorway"
      then class = 2
    end

    if class > 0 then
      Layer("road", false)
      AttributeNumeric("class", class)

      local maxspeed = Find("maxspeed")
      local ms_back = Find("maxspeed:backward")
      local ms_forward = Find("maxspeed:forward")
      if maxspeed=="" then
        if ms_back~="" then maxspeed = ms_back
        elseif ms_forward~="" then maxspeed = ms_forward
        elseif highway=="living_street" then maxspeed = "20"
        end
      end
      AttributeNumeric("maxspeed", tonumber(maxspeed) or 0)

      -- ...and road names
      local name = Find("name")
      if name~="" then
        Layer("road_name", false)
        AttributeNumeric("class", class)
        Attribute("name", name)
      end
    end
	end
end
