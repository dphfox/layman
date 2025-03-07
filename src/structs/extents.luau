local types = require("../types")
type Extents = types.Extents

local struct_maker = require("../utils/struct_maker")("Extents")

local Extents = {}

Extents.cast = struct_maker.cast

function Extents.new(
	min: vector,
	max: vector
): Extents
	return struct_maker.new {
		min = min,
		max = max
	}
end

function Extents.fromOffset(
	original: Extents,
	offset: vector
): Extents
	return struct_maker.new {
		min = original.min + offset,
		max = original.max + offset
	}
end

return Extents