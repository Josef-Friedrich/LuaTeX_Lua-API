require("lualibs")

assert(table.serialize({ a = 2 }) == [[t={
 ["a"]=2,
}]])

assert(table.serialize({ a = 2 }, "name") == [[name={
 ["a"]=2,
}]])

assert(table.serialize({ a = 2 }, true) == [[return {
 ["a"]=2,
}]])

assert(table.serialize({ a = 2 }, false) == [[{
 ["a"]=2,
}]])

assert(table.serialize({ a = 2 }, "return") == [[return {
 ["a"]=2,
}]])

assert(table.serialize({ a = 2 }, 12) == [[["12"]={
 ["a"]=2,
}]])

assert(table.serialize({ a = 2, [3] = "b", [true] = "6" }, nil, true) == [[t={
 [3]="b",
 ["a"]=2,
 [true]="6",
}]])
