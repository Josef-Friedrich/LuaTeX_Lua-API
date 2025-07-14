local ReadWriteIntegerParameter = {
    'adjdemerits', 'binoppenalty', 'brokenpenalty', 'catcodetable',
    'clubpenalty', 'day', 'defaulthyphenchar', 'defaultskewchar',
    'delimiterfactor', 'displaywidowpenalty', 'doublehyphendemerits',
    'endlinechar', 'errorcontextlines', 'escapechar', 'exhyphenpenalty', 'fam',
    'finalhyphendemerits', 'floatingpenalty', 'globaldefs', 'hangafter',
    'hbadness', 'holdinginserts', 'hyphenpenalty', 'interlinepenalty',
    'language', 'lastlinefit', 'lefthyphenmin', 'linepenalty',
    'localbrokenpenalty', 'localinterlinepenalty', 'looseness', 'mag',
    'maxdeadcycles', 'month', 'newlinechar', 'outputpenalty', 'pausing',
    'postdisplaypenalty', 'predisplaydirection', 'predisplaypenalty',
    'pretolerance', 'relpenalty', 'righthyphenmin', 'savinghyphcodes',
    'savingvdiscards', 'showboxbreadth', 'showboxdepth', 'time', 'tolerance',
    'tracingassigns', 'tracingcommands', 'tracinggroups', 'tracingifs',
    'tracinglostchars', 'tracingmacros', 'tracingnesting', 'tracingonline',
    'tracingoutput', 'tracingpages', 'tracingparagraphs', 'tracingrestores',
    'tracingscantokens', 'tracingstats', 'uchyph', 'vbadness', 'widowpenalty',
    'year'
}

local ReadOnlyIntegerParameter = {
    'deadcycles', 'insertpenalties', 'parshape', 'interlinepenalties',
    'clubpenalties', 'widowpenalties', 'displaywidowpenalties', 'prevgraf',
    'spacefactor'
}

local ReadWriteDimensionParameter = {
    'boxmaxdepth', 'delimitershortfall', 'displayindent', 'displaywidth',
    'emergencystretch', 'hangindent', 'hfuzz', 'hoffset', 'hsize',
    'lineskiplimit', 'mathsurround', 'maxdepth', 'nulldelimiterspace',
    'overfullrule', 'pagebottomoffset', 'pageheight', 'pageleftoffset',
    'pagerightoffset', 'pagetopoffset', 'pagewidth', 'parindent',
    'predisplaysize', 'scriptspace', 'splitmaxdepth', 'vfuzz', 'voffset',
    'vsize', 'prevdepth', 'prevgraf', 'spacefactor'
}

local ReadOnlyDimensionParameter = {
    'pagedepth', 'pagefilllstretch', 'pagefillstretch', 'pagefilstretch',
    'pagegoal', 'pageshrink', 'pagestretch', 'pagetotal'
}

local DirectionParameter = {
    'bodydir', 'mathdir', 'pagedir', 'pardir', 'textdir'
}

local GlueParameter = {
    'abovedisplayshortskip', 'abovedisplayskip', 'baselineskip',
    'belowdisplayshortskip', 'belowdisplayskip', 'leftskip', 'lineskip',
    'parfillskip', 'parskip', 'rightskip', 'spaceskip', 'splittopskip',
    'tabskip', 'topskip', 'xspaceskip'
}

local MuglueParameter = {'medmuskip', 'thickmuskip', 'thinmuskip'}

local TokenlistParameter = {
    'errhelp', 'everycr', 'everydisplay', 'everyeof', 'everyhbox', 'everyjob',
    'everymath', 'everypar', 'everyvbox', 'output'
}

local InternalParameter = {
    ReadWriteIntegerParameter = ReadWriteIntegerParameter,
    ReadOnlyIntegerParameter = ReadOnlyIntegerParameter,
    ReadWriteDimensionParameter = ReadWriteDimensionParameter,
    ReadOnlyDimensionParameter = ReadOnlyDimensionParameter,
    DirectionParameter = DirectionParameter,
    GlueParameter = GlueParameter,
    MuglueParameter = MuglueParameter,
    TokenlistParameter = TokenlistParameter
}

for section, parameters in pairs(InternalParameter) do
    print()
    print(section)
    for _, parameter in pairs(parameters) do print('', parameter, tex.get(parameter)) end
end
