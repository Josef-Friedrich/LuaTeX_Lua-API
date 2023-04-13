local function print_table(t)
    local iterate = true
    local counter = -1
    while iterate do
        if t[counter] ~= nil then
            print('', counter, t[counter])
        elseif counter ~= -1 then
            iterate = false
        end
        counter = counter + 1
    end

end

return function(id, subtype)
    print('\n')
    print('id', node.id(id), id)
    local fields
    if subtype ~= nil then
        fields = node.fields(node.id(id), node.subtype(subtype))
        print('subtype', node.subtype(subtype), subtype)
    else
        fields = node.fields(node.id(id), node.subtype(subtype))
    end

    local subtypes = node.subtypes(id)

    if subtypes ~= nil then
        print('\nsubtypes:')
        print_table(subtypes)
    end

    print('\nfields:')
    print_table(fields)
end
