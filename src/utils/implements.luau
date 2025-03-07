local function implements(
	x: any,
	interface_name: string
): boolean
	return typeof(x) == "table" and typeof(x.implements) == "table" and x.implements[interface_name] == true
end

return implements