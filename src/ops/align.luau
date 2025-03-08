local Fusion = require("../../lib/Fusion")
type Use = Fusion.Use
type UsedAs<T> = Fusion.UsedAs<T>

local types = require("../types")
type Extents = types.Extents

local Extents = require("../structs/extents")

local function align(
	use: Use,
	options: {
		input: UsedAs<Extents>,
		within: UsedAs<Extents>,
		align: {
			x: UsedAs<number?>,
			y: UsedAs<number?>,
			z: UsedAs<number?>
		},
		group_bounds: UsedAs<Extents?>
	}
): Extents
	local input = use(options.input)
	local within = use(options.within)
	local x = use(options.align.x)
	local y = use(options.align.y)
	local z = use(options.align.z)
	local extents_to_align = use(options.group_bounds) or input

	local anchor = vector.create(x or 0, y or 0, z or 0)
	local mask = vector.create(if x == nil then 0 else 1, if y == nil then 0 else 1, if z == nil then 0 else 1)

	local min_offset = within.min - extents_to_align.min
	local max_offset = within.max - extents_to_align.max
	local offset = mask * (min_offset + anchor * (max_offset - min_offset))

	return Extents.fromOffset(input, offset)
end

return align