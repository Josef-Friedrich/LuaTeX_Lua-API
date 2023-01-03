---% language=uk
---
---\environment luatex-style
---
---\startcomponent luatex-harfbuzz
---
---\definelayer
---  [hbpage]
---  [width=\paperwidth,
---   height=\paperheight]
---
---\setupbackgrounds
---  [page]
---  [background=hbpage,
---   state=start]
---
---# The HarfBuzz libraries
---
---# The `luaharfbuzz` library[library=luaharfbuzz]
---
---At the moment the documentation of the library is a raw "html-to-pdf" 
---rendering of the `index.html` file under `luaharfbuzz/docs` 
---folder of the source code. The example is almost the verbatim copy
---of the file under `luaharfbuzz/examples`.
---\page
---
---\dorecurse{17}{%
---\setlayer[hbpage][x=0mm,y=0mm,]{\externalfigure[graphics/luaharfbuzz.pdf][page=\recurselevel]}
---\blank
---\page[empty]
---}
---
---# Example
---
---The example is (a small modification of)  the file `core_types.lua`
---and it requires the file `harfbuzz.lua`; both are 
---under `luaharfbuzz`  folder of the source code.
---The fonts `notonastaliq.ttf` and `amiri-regular.ttf'` are under 
---`luaharfbuzz/fonts`.
---
---\blank[3*big]
---
---\startbuffer[hbmod]
---local hb = require("luaharfbuzz")
---
----- special tags
---hb.Tag.NONE = hb.Tag.new()
---
----- special script codes (ISO 15924)
---hb.Script.COMMON    = hb.Script.new("Zyyy")
---hb.Script.INHERITED = hb.Script.new("Zinh")
---hb.Script.UNKNOWN   = hb.Script.new("Zzzz")
---hb.Script.INVALID   = hb.Script.from_iso15924_tag(hb.Tag.NONE)
---
----- directions
---hb.Direction.INVALID = hb.Direction.new("invalid")
---hb.Direction.LTR = hb.Direction.new("ltr")
---hb.Direction.RTL = hb.Direction.new("rtl")
---hb.Direction.TTB = hb.Direction.new("ttb")
---hb.Direction.BTT = hb.Direction.new("btt")
---
----- special languages
---hb.Language.INVALID = hb.Language.new()
---
---hb.shape = function(font, buf, options)
---  options = options or { }
---
---  -- Apply options to buffer if they are set.
---  if options.language then buf:set_language(options.language) end
---  if options.script then buf:set_script(options.script) end
---  if options.direction then buf:set_direction(options.direction) end
---
---  -- Guess segment properties, in case all steps above have failed
---  -- to set the right properties.
---  buf:guess_segment_properties()
---
---  local features = {}
---
---  -- Parse features
---  if type(options.features) == "string" then
---    for fs in string.gmatch(options.features, '([^,]+)') do
---      local feature = hb.Feature.new(fs)
---      if feature then
---        table.insert(features, hb.Feature.new(fs))
---      else
---        error(string.format("Invalid feature string: '%s'", fs))
---      end
---    end
---  elseif type(options.features) == "table" then
---    features = options.features
---  elseif options.features then -- non-nil but not a string or table
---    error("Invalid features option")
---  end
---
---  return hb.shape_full(font,buf,features,options.shapers or {})
---end
---
----- For backward compatibility
---hb.Buffer.HB_BUFFER_CLUSTER_LEVEL_MONOTONE_GRAPHEMES  = hb.Buffer.CLUSTER_LEVEL_MONOTONE_GRAPHEMES
---hb.Buffer.HB_BUFFER_CLUSTER_LEVEL_MONOTONE_CHARACTERS = hb.Buffer.CLUSTER_LEVEL_MONOTONE_CHARACTERS
---hb.Buffer.HB_BUFFER_CLUSTER_LEVEL_CHARACTERS          = hb.Buffer.CLUSTER_LEVEL_CHARACTERS
---hb.Buffer.HB_BUFFER_CLUSTER_LEVEL_DEFAULT             = hb.Buffer.CLUSTER_LEVEL_DEFAULT
---
---hb.Tag.HB_TAG_NONE = hb.Tag.NONE
---
---hb.Script.HB_SCRIPT_COMMON    = hb.Script.COMMON
---hb.Script.HB_SCRIPT_INHERITED = hb.Script.INHERITED
---hb.Script.HB_SCRIPT_UNKNOWN   = hb.Script.UNKNOWN
---hb.Script.HB_SCRIPT_INVALID   = hb.Script.INVALID
---
---hb.Language.HB_LANGUAGE_INVALID = hb.Language.INVALID
---
---hb.Direction.HB_DIRECTION_INVALID = hb.Direction.INVALID
---hb.Direction.HB_DIRECTION_LTR = hb.Direction.LTR
---hb.Direction.HB_DIRECTION_RTL = hb.Direction.RTL
---hb.Direction.HB_DIRECTION_TTB = hb.Direction.TTB
---hb.Direction.HB_DIRECTION_BTT = hb.Direction.BTT
---
---hb.Direction.HB_DIRECTION_IS_VALID = hb.Direction.is_valid
---hb.Direction.HB_DIRECTION_IS_HORIZONTAL = hb.Direction.is_horizontal
---hb.Direction.HB_DIRECTION_IS_VERTICAL = hb.Direction.is_vertical
---hb.Direction.HB_DIRECTION_IS_FORWARD = hb.Direction.is_forward
---hb.Direction.HB_DIRECTION_IS_BACKWARD = hb.Direction.is_backward
---
---hb.Buffer.get_glyph_infos_and_positions = hb.Buffer.get_glyphs
---
---return hb
---
---\stopbuffer
---
---\blank[3*big]
---
---The file `harfbuzz.lua`:
---\typebuffer[hbmod]
---
---\startbuffer[hbex]
---local harfbuzz = require('harfbuzz')
---
----- Harfbuzz API Version
---print("Harfbuzz API version", harfbuzz.version())
---
----- Shapers available
---print("Shapers:", harfbuzz.shapers())
---
----- harfbuzz.Face
---local face = harfbuzz.Face.new('notonastaliq.ttf')
---print('\nFace upem = '..face:get_upem())
---
----- harfbuzz.Font
---local font = harfbuzz.Font.new(face)
---local xs, xy = font:get_scale()
---print("\nDefault font scale = X: "..xs..", Y: "..xy)
---
----- harfbuzz.Buffer
---local text = "یہ" -- U+06CC U+06C1
---local buf = harfbuzz.Buffer.new()
---buf:add_utf8(text)
---
----- harfbuzz.shape (Shapes text)
---print("\nShaping '"..text.."' set with Noto Nastaliq Urdu")
---harfbuzz.shape(font, buf, { language = harfbuzz.Language.new("urd"), 
---script = harfbuzz.Script.new("Arab"), direction = harfbuzz.Direction.RTL})
---
---local glyphs = buf:get_glyphs()
---print("No. of glyphs", #glyphs)
---for k,v in pairs(glyphs) do 
---  print(k) 
---  for k1,v1 in pairs(v) do 
---   print("",k1,v1) 
---  end 
---end 
---
---local opts = { language = harfbuzz.Language.new("eng"), 
---script = harfbuzz.Script.new("Latn"), direction = harfbuzz.Direction.LTR }
---
---local amiri_face = harfbuzz.Face.new('amiri-regular.ttf')
---local amiri_font = harfbuzz.Font.new(amiri_face)
---
----- shaping '123' w/o features
---print("\nShaping '123' set with Amiri Regular and no features")
---buf= harfbuzz.Buffer.new()
---buf:add_utf8("123")
---harfbuzz.shape(amiri_font, buf, opts)
---glyphs = buf:get_glyphs()
---for k,v in pairs(glyphs) do 
---  print(k) 
---  for k1,v1 in pairs(v) do 
---   print("",k1,v1) 
---  end 
---end 
---
----- shaping '123' with '+numr' (numerators)
---print("\nShaping '123' set with Amiri Regular with 'numr' feature turned on")
---buf= harfbuzz.Buffer.new()
---buf:add_utf8("123")
---opts.features = "+numr"
---harfbuzz.shape(amiri_font, buf, opts)
---glyphs = buf:get_glyphs()
---for k,v in pairs(glyphs) do 
---  print(k) 
---  for k1,v1 in pairs(v) do 
---   print("",k1,v1) 
---  end 
---end 
---\stopbuffer
---
---The example:
---\typebuffer[hbex]
---
---\startbuffer[hbout]
---Harfbuzz API version	2.6.4
---Shapers:	graphite2	ot	fallback
---
---Face upem = 2048
---
---Default font scale = X: 2048, Y: 2048
---
---Shaping 'یہ' set with Noto Nastaliq Urdu
---No. of glyphs	4
---1
---    flags	1.0
---    cluster	2
---    codepoint	277
---    x_advance	472.0
---    y_advance	0.0
---    x_offset	0.0
---    y_offset	0.0
---2
---    cluster	0
---    codepoint	19
---    x_advance	0.0
---    y_advance	0.0
---    x_offset	310.0
---    y_offset	-383.0
---3
---    cluster	0
---    codepoint	985
---    x_advance	0.0
---    y_advance	0.0
---    x_offset	0.0
---    y_offset	0.0
---4
---    cluster	0
---    codepoint	316
---    x_advance	731.0
---    y_advance	0.0
---    x_offset	0.0
---    y_offset	-68.0
---
---Shaping '123' set with Amiri Regular and no features
---1
---    cluster	0
---    codepoint	20
---    x_advance	1090.0
---    y_advance	0.0
---    x_offset	0.0
---    y_offset	0.0
---2
---    cluster	1
---    codepoint	21
---    x_advance	1090.0
---    y_advance	0.0
---    x_offset	0.0
---    y_offset	0.0
---3
---    cluster	2
---    codepoint	22
---    x_advance	1090.0
---    y_advance	0.0
---    x_offset	0.0
---    y_offset	0.0
---
---Shaping '123' set with Amiri Regular with 'numr' feature turned on
---1
---    cluster	0
---    codepoint	6673
---    x_advance	600.0
---    y_advance	0.0
---    x_offset	0.0
---    y_offset	0.0
---2
---    cluster	1
---    codepoint	6674
---    x_advance	600.0
---    y_advance	0.0
---    x_offset	0.0
---    y_offset	0.0
---3
---    cluster	2
---    codepoint	6675
---    x_advance	600.0
---    y_advance	0.0
---    x_offset	0.0
---    y_offset	0.0
---
---\stopbuffer
---
---\blank[3*big]
---The result:
---\typebuffer[hbout]
---
----------------------------------------------------------------


----------------------------------------------------------------


---
---\stopchapter
---\stopcomponent
---