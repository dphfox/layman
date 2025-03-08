local Fusion = require("../lib/Fusion")
type Use = Fusion.Use
type UsedAs<T> = Fusion.UsedAs<T>

export type Axis = "x" | "y" | "z"


export type Extents = {
	implements: { Extents: true },
	min: vector,
	max: vector
}

export type LaidOut = {
	implements: { LaidOut: true },
	extents: UsedAs<Extents>
}

export type SuggestLength<Self = unknown> = {
	implements: { SuggestLength: true },
	suggest_length: (
		self: Self,
		use: Use,
		axis: Axis,
		container_size: vector
	) -> SuggestedLength
}

export type SuggestedLength<Self = unknown> = {
	implements: { SuggestedLength: true },
	natural: number,
	minimum: number,
	maximum: number,
	size_from_length: (
		self: Self,
		use: Use,
		length: number
	) -> vector
}

return nil