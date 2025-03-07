local types = require("../types")
type Alignment = types.Alignment

local struct_maker = require("../utils/struct_maker")("Alignment")

local Alignment = {}

Alignment.cast = struct_maker.cast

function Alignment.new(
	x: number?,
	y: number?,
	z: number?
): Alignment
	return struct_maker.new {
		anchor = vector.create(
			x or 0, 
			y or 0, 
			z or 0
		),
		mask = vector.create(
			if x == nil then 0 else 1,
			if y == nil then 0 else 1, 
			if z == nil then 0 else 1
		)
	}
end

Alignment.X_START = Alignment.new(0, nil, nil)
Alignment.X_MID = Alignment.new(0.5, nil, nil)
Alignment.X_END = Alignment.new(1, nil, nil)

Alignment.Y_START = Alignment.new(nil, 0, nil)
Alignment.Y_MID = Alignment.new(nil, 0.5, nil)
Alignment.Y_END = Alignment.new(nil, 1, nil)

Alignment.Z_START = Alignment.new(nil, nil, 0)
Alignment.Z_MID = Alignment.new(nil, nil, 0.5)
Alignment.Z_END = Alignment.new(nil, nil, 1)

Alignment.XY_CENTRE = Alignment.new(0.5, 0.5, nil)
Alignment.XYZ_CENTRE = Alignment.new(0.5, 0.5, 0.5)

return Alignment