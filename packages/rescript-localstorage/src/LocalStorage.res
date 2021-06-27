@val @scope("localStorage")
external removeItem: string => unit = "removeItem"

@val @scope("localStorage") @return(nullable)
external getItem: string => option<string> = "getItem"

@val @scope("localStorage")
external setItem: (string, string) => unit = "setItem"
