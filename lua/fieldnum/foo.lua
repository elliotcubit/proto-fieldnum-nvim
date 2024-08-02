local api = vim.api

local lineRegex = "^([^=]+=[^%d]*)(%d+)(.*;)$"

local function renumber(args)
	local s = args.line1-1
	local e = args.line2
	local lines = api.nvim_buf_get_lines(0, s, e, false)

	local start = -1;
	local thisline = 0;

	if #args.fargs ~= 0 then
		local argS = args.fargs[1]
		local n = tonumber(argS)
		if n ~= nil then
			start = n
		end
	end

	for i,v in ipairs(lines) do
		local a, _, _, number = string.find(v, lineRegex)
		if a ~= nil then
			if start == -1 then
				local n = tonumber(number)
				if n ~= nil then
					start = n
				end
			end

			local fmt = "%1" .. tostring(start+thisline) .. "%3"
			lines[i] = string.gsub(v, lineRegex, fmt)
			thisline = thisline + 1
		end
	end

	api.nvim_buf_set_lines(0, s, e, false, lines)
end


return {["renumber"] = renumber}
