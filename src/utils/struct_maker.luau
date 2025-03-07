local implements = require("./implements")

local function struct_maker<Struct>(
	struct_name: string
)
	local metatable = {
		__index = table.freeze {
			implements = table.freeze { Alignment = true }
		}
	}
	metatable.__metatable = metatable

	function metatable.__eq(
		self: {},
		other: any
	): boolean
		if not implements(other, struct_name) then
			return false
		end
		for name, value in self do
			if other[name] ~= value then
				return false
			end
		end
		return true
	end

	function metatable.__tostring(
		self: {}
	): string
		local fields = {}
		for name, value in self do
			table.insert(fields, `{name}: {value}`)
		end
		table.sort(fields)
		return `{struct_name} ({table.concat(fields, ", ")})`
	end

	table.freeze(metatable)

	return {
		new = function(data: any): Struct
			return table.freeze(setmetatable(data, metatable)) :: any
		end,
		cast = function(data: any): Struct?
			return if implements(data, struct_name) then data else nil
		end
	}
end

return struct_maker