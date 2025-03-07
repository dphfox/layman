-- TODO: hook up to Fusion
export type Use = <T>(UsedAs<T>) -> T
export type UsedAs<T> = T | { value: T }

return nil