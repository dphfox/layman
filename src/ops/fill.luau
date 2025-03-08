local Fusion = require("../../lib/Fusion")
type Use = Fusion.Use
type UsedAs<T> = Fusion.UsedAs<T>

local types = require("../types")
type Extents = types.Extents

local Extents = require("../structs/extents")

local function fill(
	use: Use,
	options: {
		input: UsedAs<Extents>,
		fill_to: UsedAs<Extents>,
		fill: {
			x_min: UsedAs<number?>,
			x_max: UsedAs<number?>,
			y_min: UsedAs<number?>,
			y_max: UsedAs<number?>,
			z_min: UsedAs<number?>,
			z_max: UsedAs<number?>,
		} | {
			x: UsedAs<number?>,
			y: UsedAs<number?>,
			z: UsedAs<number?>,
		} | {
			all: UsedAs<number?>
		}
	}
): Extents
	local input = use(options.input)
	local fill_to = use(options.fill_to)
	local fill: any = options.fill -- the below code intentionally indexes fields that may not be there
	local x_min = use(fill.x_min or fill.x or fill.all)
	local x_max = use(fill.x_max or fill.x or fill.all)
	local y_min = use(fill.y_min or fill.y or fill.all)
	local y_max = use(fill.y_max or fill.y or fill.all)
	local z_min = use(fill.z_min or fill.z or fill.all)
	local z_max = use(fill.z_max or fill.z or fill.all)
	return Extents.new(
		input.min + (fill_to.min - input.min) * vector.create(x_min or 0, y_min or 0, z_min or 0),
		input.max + (fill_to.max - input.max) * vector.create(x_max or 0, y_max or 0, z_max or 0)
	)
end

return fill