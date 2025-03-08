local Fusion = require("../../lib/Fusion")
type Use = Fusion.Use
type UsedAs<T> = Fusion.UsedAs<T>

local types = require("../types")
type Extents = types.Extents
type Alignment = types.Alignment

local Extents = require("../structs/extents")

local function fill(
	use: Use,
	options: {
		input: UsedAs<Extents>,
		fill_to: UsedAs<Extents>,
		x_min: UsedAs<number?>,
		x_max: UsedAs<number?>,
		y_min: UsedAs<number?>,
		y_max: UsedAs<number?>,
		z_min: UsedAs<number?>,
		z_max: UsedAs<number?>,
	}
): Extents
	local input = use(options.input)
	local fill_to = use(options.fill_to)
	local x_min = use(options.x_min)
	local x_max = use(options.x_max)
	local y_min = use(options.y_min)
	local y_max = use(options.y_max)
	local z_min = use(options.z_min)
	local z_max = use(options.z_max)
	return Extents.new(
		input.min + (fill_to.min - input.min) * vector.create(x_min or 0, y_min or 0, z_min or 0),
		input.max + (fill_to.max - input.max) * vector.create(x_max or 0, y_max or 0, z_max or 0)
	)
end

return fill