require("lualibs")
-- ?
assert(string.containsws(" ", 0) == true)
assert(string.containsws(" ", 1) == true)
assert(string.containsws(" ", 2) == false)
