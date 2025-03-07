local Fusion = require("../../lib/Fusion")
type Use = Fusion.Use
type UsedAs<T> = Fusion.UsedAs<T>

local types = require("../types")
type Extents = types.Extents
type Alignment = types.Alignment

local Extents = require("../structs/extents")

local function align(
	use: Use,
	input: Extents,
	options: {
		within: UsedAs<Extents>,
		group_bounds: UsedAs<Extents?>,
		alignment: UsedAs<Alignment>
	}
): Extents
	local extents_to_align = use(options.group_bounds) or input
	local within = use(options.within)
	local alignment = use(options.alignment)

	local min_offset = within.min - extents_to_align.min
	local max_offset = within.max - extents_to_align.max
	local offset = alignment.mask * (min_offset + alignment.anchor * (max_offset - min_offset))

	return Extents.fromOffset(input, offset)
end

return align