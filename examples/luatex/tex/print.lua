tex.print(1, '\\par From lua, arg-1', 'arg-2')

tex.print('\\par boolean (true)', true)
tex.print('\\par boolean (false)', false)
tex.print('\\par integer', 1)
tex.print('\\par number', 1.123)
tex.print({1, 2, 3})

tex.print('\\par nil', nil)
tex.print('\\par table', {})
tex.print('\\par function', function() end)

tex.print({
    '\\par  Table with different data types:', 1, 1.23, true, 1, 'string again',
    false, 'nil', 1.23
})
