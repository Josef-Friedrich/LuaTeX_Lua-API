local options = {
  default = "An African or European swallow?",
  other = { "http://www.style.org/unladenswallow/", "42" },
}
local someanswer = io.ask(
  "What is the air speed velocity of an unladen swallow?",
  options.default,
  options.other
)

print(
  someanswer == options.default
      and "I don't know that! /He is thrown into the chasm./"
    or "OK, off you go!"
)
