--
--  This is file `luamplib.lua',
--  generated with the docstrip utility.
--
--  The original source files were:
--
--  luamplib.dtx  (with options: `lua')
--
--  See source file 'luamplib.dtx' for licencing and contact information.
--

luatexbase.provides_module {
  name          = "luamplib",
  version       = "2.24.0",
  date          = "2023/04/04",
  description   = "Lua package to typeset Metapost with LuaTeX's MPLib.",
}

local format, abs = string.format, math.abs

local err  = function(...)
  return luatexbase.module_error  ("luamplib", select("#",...) > 1 and format(...) or ...)
end
local warn = function(...)
  return luatexbase.module_warning("luamplib", select("#",...) > 1 and format(...) or ...)
end
local info = function(...)
  return luatexbase.module_info   ("luamplib", select("#",...) > 1 and format(...) or ...)
end

luamplib          = luamplib or { }
local luamplib    = luamplib

luamplib.showlog  = luamplib.showlog or false

local tableconcat   = table.concat
local texsprint     = tex.sprint
local textprint     = tex.tprint

local texget      = tex.get
local texgettoks  = tex.gettoks
local texgetbox   = tex.getbox
local texruntoks  = tex.runtoks

if not texruntoks then
  err("Your LuaTeX version is too old. Please upgrade it to the latest")
end

local mplib = require ('mplib')
local kpse  = require ('kpse')
local lfs   = require ('lfs')

local lfsattributes = lfs.attributes
local lfsisdir      = lfs.isdir
local lfsmkdir      = lfs.mkdir
local lfstouch      = lfs.touch
local ioopen        = io.open

local file = file or { }
local replacesuffix = file.replacesuffix or function(filename, suffix)
  return (filename:gsub("%.[%a%d]+$","")) .. "." .. suffix
end
local stripsuffix = file.stripsuffix or function(filename)
  return (filename:gsub("%.[%a%d]+$",""))
end

local is_writable = file.is_writable or function(name)
  if lfsisdir(name) then
    name = name .. "/_luam_plib_temp_file_"
    local fh = ioopen(name,"w")
    if fh then
      fh:close(); os.remove(name)
      return true
    end
  end
end
local mk_full_path = lfs.mkdirs or function(path)
  local full = ""
  for sub in path:gmatch("(/*[^\\/]+)") do
    full = full .. sub
    lfsmkdir(full)
  end
end

local luamplibtime = kpse.find_file("luamplib.lua")
luamplibtime = luamplibtime and lfsattributes(luamplibtime,"modification")

local currenttime = os.time()

local outputdir
if lfstouch then
  local texmfvar = kpse.expand_var('$TEXMFVAR')
  if texmfvar and texmfvar ~= "" and texmfvar ~= '$TEXMFVAR' then
    for _,dir in next, texmfvar:explode(os.type == "windows" and ";" or ":") do
      if not lfsisdir(dir) then
        mk_full_path(dir)
      end
      if is_writable(dir) then
        local cached = format("%s/luamplib_cache",dir)
        lfsmkdir(cached)
        outputdir = cached
        break
      end
    end
  end
end
if not outputdir then
  outputdir = "."
  for _,v in ipairs(arg) do
    local t = v:match("%-output%-directory=(.+)")
    if t then
      outputdir = t
      break
    end
  end
end

function luamplib.getcachedir(dir)
  dir = dir:gsub("##","#")
  dir = dir:gsub("^~",
    os.type == "windows" and os.getenv("UserProfile") or os.getenv("HOME"))
  if lfstouch and dir then
    if lfsisdir(dir) then
      if is_writable(dir) then
        luamplib.cachedir = dir
      else
        warn("Directory '%s' is not writable!", dir)
      end
    else
      warn("Directory '%s' does not exist!", dir)
    end
  end
end

local noneedtoreplace = {
  ["boxes.mp"] = true, --  ["format.mp"] = true,
  ["graph.mp"] = true, ["marith.mp"] = true, ["mfplain.mp"] = true,
  ["mpost.mp"] = true, ["plain.mp"] = true, ["rboxes.mp"] = true,
  ["sarith.mp"] = true, ["string.mp"] = true, -- ["TEX.mp"] = true,
  ["metafun.mp"] = true, ["metafun.mpiv"] = true, ["mp-abck.mpiv"] = true,
  ["mp-apos.mpiv"] = true, ["mp-asnc.mpiv"] = true, ["mp-bare.mpiv"] = true,
  ["mp-base.mpiv"] = true, ["mp-blob.mpiv"] = true, ["mp-butt.mpiv"] = true,
  ["mp-char.mpiv"] = true, ["mp-chem.mpiv"] = true, ["mp-core.mpiv"] = true,
  ["mp-crop.mpiv"] = true, ["mp-figs.mpiv"] = true, ["mp-form.mpiv"] = true,
  ["mp-func.mpiv"] = true, ["mp-grap.mpiv"] = true, ["mp-grid.mpiv"] = true,
  ["mp-grph.mpiv"] = true, ["mp-idea.mpiv"] = true, ["mp-luas.mpiv"] = true,
  ["mp-mlib.mpiv"] = true, ["mp-node.mpiv"] = true, ["mp-page.mpiv"] = true,
  ["mp-shap.mpiv"] = true, ["mp-step.mpiv"] = true, ["mp-text.mpiv"] = true,
  ["mp-tool.mpiv"] = true,
}
luamplib.noneedtoreplace = noneedtoreplace

local function replaceformatmp(file,newfile,ofmodify)
  local fh = ioopen(file,"r")
  if not fh then return file end
  local data = fh:read("*all"); fh:close()
  fh = ioopen(newfile,"w")
  if not fh then return file end
  fh:write(
    "let normalinfont = infont;\n",
    "primarydef str infont name = rawtextext(str) enddef;\n",
    data,
    "vardef Fmant_(expr x) = rawtextext(decimal abs x) enddef;\n",
    "vardef Fexp_(expr x) = rawtextext(\"$^{\"&decimal x&\"}$\") enddef;\n",
    "let infont = normalinfont;\n"
  ); fh:close()
  lfstouch(newfile,currenttime,ofmodify)
  return newfile
end

local name_b = "%f[%a_]"
local name_e = "%f[^%a_]"
local btex_etex = name_b.."btex"..name_e.."%s*(.-)%s*"..name_b.."etex"..name_e
local verbatimtex_etex = name_b.."verbatimtex"..name_e.."%s*(.-)%s*"..name_b.."etex"..name_e

local function replaceinputmpfile (name,file)
  local ofmodify = lfsattributes(file,"modification")
  if not ofmodify then return file end
  local cachedir = luamplib.cachedir or outputdir
  local newfile = name:gsub("%W","_")
  newfile = cachedir .."/luamplib_input_"..newfile
  if newfile and luamplibtime then
    local nf = lfsattributes(newfile)
    if nf and nf.mode == "file" and
      ofmodify == nf.modification and luamplibtime < nf.access then
      return nf.size == 0 and file or newfile
    end
  end

  if name == "format.mp" then return replaceformatmp(file,newfile,ofmodify) end

  local fh = ioopen(file,"r")
  if not fh then return file end
  local data = fh:read("*all"); fh:close()

  local count,cnt = 0,0
  data, cnt = data:gsub(btex_etex, "btex %1 etex ") -- space
  count = count + cnt
  data, cnt = data:gsub(verbatimtex_etex, "verbatimtex %1 etex;") -- semicolon
  count = count + cnt

  if count == 0 then
    noneedtoreplace[name] = true
    fh = ioopen(newfile,"w");
    if fh then
      fh:close()
      lfstouch(newfile,currenttime,ofmodify)
    end
    return file
  end

  fh = ioopen(newfile,"w")
  if not fh then return file end
  fh:write(data); fh:close()
  lfstouch(newfile,currenttime,ofmodify)
  return newfile
end

local mpkpse
do
  local exe = 0
  while arg[exe-1] do
    exe = exe-1
  end
  mpkpse = kpse.new(arg[exe], "mpost")
end

local special_ftype = {
  pfb = "type1 fonts",
  enc = "enc files",
}

local function finder(name, mode, ftype)
  if mode == "w" then
    if name and name ~= "mpout.log" then
      kpse.record_output_file(name) -- recorder
    end
    return name
  else
    ftype = special_ftype[ftype] or ftype
    local file = mpkpse:find_file(name,ftype)
    if file then
      if lfstouch and ftype == "mp" and not noneedtoreplace[name] then
        file = replaceinputmpfile(name,file)
      end
    else
      file = mpkpse:find_file(name, name:match("%a+$"))
    end
    if file then
      kpse.record_input_file(file) -- recorder
    end
    return file
  end
end
luamplib.finder = finder

if tonumber(mplib.version()) <= 1.50 then
  err("luamplib no longer supports mplib v1.50 or lower. "..
  "Please upgrade to the latest version of LuaTeX")
end

local preamble = [[
  boolean mplib ; mplib := true ;
  let dump = endinput ;
  let normalfontsize = fontsize;
  input %s ;
]]

local logatload
local function reporterror (result, indeed)
  if not result then
    err("no result object returned")
  else
    local t, e, l = result.term, result.error, result.log
    local log = l or t or "no-term"
    log = log:gsub("%(Please type a command or say `end'%)",""):gsub("\n+","\n")
    if result.status > 0 then
      warn(log)
      if result.status > 1 then
        err(e or "see above messages")
      end
    elseif indeed then
      local log = logatload..log
      if log:find"\n>>" then
        warn(log)
      elseif log:find"%g" then
        if luamplib.showlog then
          info(log)
        elseif not result.fig then
          info(log)
        end
      end
      logatload = ""
    else
      logatload = log
    end
    return log
  end
end

local function luamplibload (name)
  local mpx = mplib.new {
    ini_version = true,
    find_file   = luamplib.finder,
    make_text   = luamplib.maketext,
    run_script  = luamplib.runscript,
    math_mode   = luamplib.numbersystem,
    random_seed = math.random(4095),
    extensions  = 1,
  }
  local preamble = preamble .. luamplib.mplibcodepreamble
  if luamplib.legacy_verbatimtex then
    preamble = preamble .. luamplib.legacyverbatimtexpreamble
  end
  if luamplib.textextlabel then
    preamble = preamble .. luamplib.textextlabelpreamble
  end
  local result
  if not mpx then
    result = { status = 99, error = "out of memory"}
  else
    result = mpx:execute(format(preamble, replacesuffix(name,"mp")))
  end
  reporterror(result)
  return mpx, result
end

local currentformat = "plain"

local function setformat (name)
  currentformat = name
end
luamplib.setformat = setformat

local function process_indeed (mpx, data)
  local converted, result = false, {}
  if mpx and data then
    result = mpx:execute(data)
    local log = reporterror(result, true)
    if log then
      if result.fig then
        converted = luamplib.convert(result)
      else
        warn("No figure output. Maybe no beginfig/endfig")
      end
    end
  else
    err("Mem file unloadable. Maybe generated with a different version of mplib?")
  end
  return converted, result
end

luamplib.codeinherit = false
local mplibinstances = {}

local function process (data, instancename)
  local defaultinstancename = currentformat .. (luamplib.numbersystem or "scaled")
    .. tostring(luamplib.textextlabel) .. tostring(luamplib.legacy_verbatimtex)
  local currfmt = instancename or defaultinstancename
  if #currfmt == 0 then
    currfmt = defaultinstancename
  end
  local mpx = mplibinstances[currfmt]
  local standalone = false
  if currfmt == defaultinstancename then
    standalone = not luamplib.codeinherit
  end
  if mpx and standalone then
    mpx:finish()
  end
  if standalone or not mpx then
    mpx = luamplibload(currentformat)
    mplibinstances[currfmt] = mpx
  end
  return process_indeed(mpx, data)
end

local catlatex = luatexbase.registernumber("catcodetable@latex")
local catat11  = luatexbase.registernumber("catcodetable@atletter")

local function run_tex_code (str, cat)
  cat = cat or catlatex
  texruntoks(function() texsprint(cat, str) end)
end

local tex_box_id = 2047
local factor = 65536*(7227/7200)

local textext_fmt = [[image(addto currentpicture doublepath unitsquare ]]..
  [[xscaled %f yscaled %f shifted (0,-%f) ]]..
  [[withprescript "mplibtexboxid=%i:%f:%f")]]

local function process_tex_text (str)
  if str then
    tex_box_id = tex_box_id + 1
    local global = luamplib.globaltextext and "\\global" or ""
    run_tex_code(format("%s\\setbox%i\\hbox{%s}", global, tex_box_id, str))
    ---@type HlistNode
    local box = texgetbox(tex_box_id)
    local wd  = box.width  / factor
    local ht  = box.height / factor
    local dp  = box.depth  / factor
    return textext_fmt:format(wd, ht+dp, dp, tex_box_id, wd, ht+dp)
  end
  return ""
end

local mplibcolor_fmt = [[\begingroup\let\XC@mcolor\relax]]..
  [[\def\set@color{\global\mplibtmptoks\expandafter{\current@color}}]]..
  [[\color %s \endgroup]]

local function process_color (str)
  if str then
    if not str:find("{.-}") then
      str = format("{%s}",str)
    end
    run_tex_code(mplibcolor_fmt:format(str), catat11)
    return format('1 withprescript "MPlibOverrideColor=%s"', texgettoks"mplibtmptoks")
  end
  return ""
end

local function process_dimen (str)
  if str then
    str = str:gsub("{(.+)}","%1")
    run_tex_code(format([[\mplibtmptoks\expandafter{\the\dimexpr %s\relax}]], str))
    return format("begingroup %s endgroup", texgettoks"mplibtmptoks")
  end
  return ""
end

local function process_verbatimtex_text (str)
  if str then
    run_tex_code(str)
  end
  return ""
end

local tex_code_pre_mplib = {}
luamplib.figid = 1
luamplib.in_the_fig = false

local function legacy_mplibcode_reset ()
  tex_code_pre_mplib = {}
  luamplib.figid = 1
end

local function process_verbatimtex_prefig (str)
  if str then
    tex_code_pre_mplib[luamplib.figid] = str
  end
  return ""
end

local function process_verbatimtex_infig (str)
  if str then
    return format('special "postmplibverbtex=%s";', str)
  end
  return ""
end

local runscript_funcs = {
  luamplibtext    = process_tex_text,
  luamplibcolor   = process_color,
  luamplibdimen   = process_dimen,
  luamplibprefig  = process_verbatimtex_prefig,
  luamplibinfig   = process_verbatimtex_infig,
  luamplibverbtex = process_verbatimtex_text,
}

mp = mp or {}
local mp = mp
mp.mf_path_reset = mp.mf_path_reset or function() end
mp.mf_finish_saving_data = mp.mf_finish_saving_data or function() end

catcodes = catcodes or {}
local catcodes = catcodes
catcodes.numbers = catcodes.numbers or {}
catcodes.numbers.ctxcatcodes = catcodes.numbers.ctxcatcodes or catlatex
catcodes.numbers.texcatcodes = catcodes.numbers.texcatcodes or catlatex
catcodes.numbers.luacatcodes = catcodes.numbers.luacatcodes or catlatex
catcodes.numbers.notcatcodes = catcodes.numbers.notcatcodes or catlatex
catcodes.numbers.vrbcatcodes = catcodes.numbers.vrbcatcodes or catlatex
catcodes.numbers.prtcatcodes = catcodes.numbers.prtcatcodes or catlatex
catcodes.numbers.txtcatcodes = catcodes.numbers.txtcatcodes or catlatex

local function mpprint(buffer,...)
  for i=1,select("#",...) do
    local value = select(i,...)
    if value ~= nil then
      local t = type(value)
      if t == "number" then
        buffer[#buffer+1] = format("%.16f",value)
      elseif t == "string" then
        buffer[#buffer+1] = value
      elseif t == "table" then
        buffer[#buffer+1] = "(" .. tableconcat(value,",") .. ")"
      else -- boolean or whatever
        buffer[#buffer+1] = tostring(value)
      end
    end
  end
end

function luamplib.runscript (code)
  local id, str = code:match("(.-){(.*)}")
  if id and str then
    local f = runscript_funcs[id]
    if f then
      local t = f(str)
      if t then return t end
    end
  end
  local f = loadstring(code)
  if type(f) == "function" then
    local buffer = {}
    function mp.print(...)
      mpprint(buffer,...)
    end
    f()
    buffer = tableconcat(buffer)
    if buffer and buffer ~= "" then
      return buffer
    end
    buffer = {}
    mpprint(buffer, f())
    return tableconcat(buffer)
  end
  return ""
end

local function protecttexcontents (str)
  return str:gsub("\\%%", "\0PerCent\0")
            :gsub("%%.-\n", "")
            :gsub("%%.-$",  "")
            :gsub("%zPerCent%z", "\\%%")
            :gsub("%s+", " ")
end

luamplib.legacy_verbatimtex = true

function luamplib.maketext (str, what)
  if str and str ~= "" then
    str = protecttexcontents(str)
    if what == 1 then
      if not str:find("\\documentclass"..name_e) and
         not str:find("\\begin%s*{document}") and
         not str:find("\\documentstyle"..name_e) and
         not str:find("\\usepackage"..name_e) then
        if luamplib.legacy_verbatimtex then
          if luamplib.in_the_fig then
            return process_verbatimtex_infig(str)
          else
            return process_verbatimtex_prefig(str)
          end
        else
          return process_verbatimtex_text(str)
        end
      end
    else
      return process_tex_text(str)
    end
  end
  return ""
end

local mplibcodepreamble = [[
texscriptmode := 2;
def rawtextext (expr t) = runscript("luamplibtext{"&t&"}") enddef;
def mplibcolor (expr t) = runscript("luamplibcolor{"&t&"}") enddef;
def mplibdimen (expr t) = runscript("luamplibdimen{"&t&"}") enddef;
def VerbatimTeX (expr t) = runscript("luamplibverbtex{"&t&"}") enddef;
if known context_mlib:
  defaultfont := "cmtt10";
  let infont = normalinfont;
  let fontsize = normalfontsize;
  vardef thelabel@#(expr p,z) =
    if string p :
      thelabel@#(p infont defaultfont scaled defaultscale,z)
    else :
      p shifted (z + labeloffset*mfun_laboff@# -
        (mfun_labxf@#*lrcorner p + mfun_labyf@#*ulcorner p +
        (1-mfun_labxf@#-mfun_labyf@#)*llcorner p))
    fi
  enddef;
  def graphictext primary filename =
    if (readfrom filename = EOF):
      errmessage "Please prepare '"&filename&"' in advance with"&
      " 'pstoedit -ssp -dt -f mpost yourfile.ps "&filename&"'";
    fi
    closefrom filename;
    def data_mpy_file = filename enddef;
    mfun_do_graphic_text (filename)
  enddef;
else:
  vardef textext@# (text t) = rawtextext (t) enddef;
fi
def externalfigure primary filename =
  draw rawtextext("\includegraphics{"& filename &"}")
enddef;
def TEX = textext enddef;
]]
luamplib.mplibcodepreamble = mplibcodepreamble

local legacyverbatimtexpreamble = [[
def specialVerbatimTeX (text t) = runscript("luamplibprefig{"&t&"}") enddef;
def normalVerbatimTeX  (text t) = runscript("luamplibinfig{"&t&"}") enddef;
let VerbatimTeX = specialVerbatimTeX;
extra_beginfig := extra_beginfig & " let VerbatimTeX = normalVerbatimTeX;"&
  "runscript(" &ditto& "luamplib.in_the_fig=true" &ditto& ");";
extra_endfig := extra_endfig & " let VerbatimTeX = specialVerbatimTeX;"&
  "runscript(" &ditto&
  "if luamplib.in_the_fig then luamplib.figid=luamplib.figid+1 end "&
  "luamplib.in_the_fig=false" &ditto& ");";
]]
luamplib.legacyverbatimtexpreamble = legacyverbatimtexpreamble

local textextlabelpreamble = [[
primarydef s infont f = rawtextext(s) enddef;
def fontsize expr f =
  begingroup
  save size; numeric size;
  size := mplibdimen("1em");
  if size = 0: 10pt else: size fi
  endgroup
enddef;
]]
luamplib.textextlabelpreamble = textextlabelpreamble

luamplib.verbatiminput = false

local function protect_expansion (str)
  if str then
    str = str:gsub("\\","!!!Control!!!")
             :gsub("%%","!!!Comment!!!")
             :gsub("#", "!!!HashSign!!!")
             :gsub("{", "!!!LBrace!!!")
             :gsub("}", "!!!RBrace!!!")
    return format("\\unexpanded{%s}",str)
  end
end

local function unprotect_expansion (str)
  if str then
    return str:gsub("!!!Control!!!", "\\")
              :gsub("!!!Comment!!!", "%%")
              :gsub("!!!HashSign!!!","#")
              :gsub("!!!LBrace!!!",  "{")
              :gsub("!!!RBrace!!!",  "}")
  end
end

luamplib.everymplib    = { [""] = "" }
luamplib.everyendmplib = { [""] = "" }

local function process_mplibcode (data, instancename)
  legacy_mplibcode_reset()

  local everymplib    = luamplib.everymplib[instancename] or
                        luamplib.everymplib[""]
  local everyendmplib = luamplib.everyendmplib[instancename] or
                        luamplib.everyendmplib[""]
  data = format("\n%s\n%s\n%s\n",everymplib, data, everyendmplib)
  data = data:gsub("\r","\n")

  data = data:gsub("\\mpcolor%s+(.-%b{})","mplibcolor(\"%1\")")
  data = data:gsub("\\mpdim%s+(%b{})", "mplibdimen(\"%1\")")
  data = data:gsub("\\mpdim%s+(\\%a+)","mplibdimen(\"%1\")")

  data = data:gsub(btex_etex, function(str)
    return format("btex %s etex ", -- space
      luamplib.verbatiminput and str or protect_expansion(str))
  end)
  data = data:gsub(verbatimtex_etex, function(str)
    return format("verbatimtex %s etex;", -- semicolon
      luamplib.verbatiminput and str or protect_expansion(str))
  end)

  if not luamplib.verbatiminput then
    data = data:gsub("\".-\"", protect_expansion)

    data = data:gsub("\\%%", "\0PerCent\0")
    data = data:gsub("%%.-\n","")
    data = data:gsub("%zPerCent%z", "\\%%")

    run_tex_code(format("\\mplibtmptoks\\expanded{{%s}}",data))
    data = texgettoks"mplibtmptoks"
    data = data:gsub("##", "#")
    data = data:gsub("\".-\"", unprotect_expansion)
    data = data:gsub(btex_etex, function(str)
      return format("btex %s etex", unprotect_expansion(str))
    end)
    data = data:gsub(verbatimtex_etex, function(str)
      return format("verbatimtex %s etex", unprotect_expansion(str))
    end)
  end

  process(data, instancename)
end
luamplib.process_mplibcode = process_mplibcode

local further_split_keys = {
  mplibtexboxid = true,
  sh_color_a    = true,
  sh_color_b    = true,
}

local function script2table(s)
  local t = {}
  for _,i in ipairs(s:explode("\13+")) do
    local k,v = i:match("(.-)=(.*)") -- v may contain = or empty.
    if k and v and k ~= "" then
      if further_split_keys[k] then
        t[k] = v:explode(":")
      else
        t[k] = v
      end
    end
  end
  return t
end

local function getobjects(result,figure,f)
  return figure:objects()
end

local function convert(result, flusher)
  luamplib.flush(result, flusher)
  return true -- done
end
luamplib.convert = convert

local function pdf_startfigure(n,llx,lly,urx,ury)
  texsprint(format("\\mplibstarttoPDF{%f}{%f}{%f}{%f}",llx,lly,urx,ury))
end

local function pdf_stopfigure()
  texsprint("\\mplibstoptoPDF")
end

local function pdf_literalcode(fmt,...) -- table
  textprint({"\\mplibtoPDF{"},{-2,format(fmt,...)},{"}"})
end

local function pdf_textfigure(font,size,text,width,height,depth)
  text = text:gsub(".",function(c)
    return format("\\hbox{\\char%i}",string.byte(c)) -- kerning happens in metapost
  end)
  texsprint(format("\\mplibtextext{%s}{%f}{%s}{%s}{%f}",font,size,text,0,-( 7200/ 7227)/65536*depth))
end

local bend_tolerance = 131/65536

local rx, sx, sy, ry, tx, ty, divider = 1, 0, 0, 1, 0, 0, 1

local function pen_characteristics(object)
  local t = mplib.pen_info(object)
  rx, ry, sx, sy, tx, ty = t.rx, t.ry, t.sx, t.sy, t.tx, t.ty
  divider = sx*sy - rx*ry
  return not (sx==1 and rx==0 and ry==0 and sy==1 and tx==0 and ty==0), t.width
end

local function concat(px, py) -- no tx, ty here
  return (sy*px-ry*py)/divider,(sx*py-rx*px)/divider
end

local function curved(ith,pth)
  local d = pth.left_x - ith.right_x
  if abs(ith.right_x - ith.x_coord - d) <= bend_tolerance and abs(pth.x_coord - pth.left_x - d) <= bend_tolerance then
    d = pth.left_y - ith.right_y
    if abs(ith.right_y - ith.y_coord - d) <= bend_tolerance and abs(pth.y_coord - pth.left_y - d) <= bend_tolerance then
      return false
    end
  end
  return true
end

local function flushnormalpath(path,open)
  local pth, ith
  for i=1,#path do
    pth = path[i]
    if not ith then
      pdf_literalcode("%f %f m",pth.x_coord,pth.y_coord)
    elseif curved(ith,pth) then
      pdf_literalcode("%f %f %f %f %f %f c",ith.right_x,ith.right_y,pth.left_x,pth.left_y,pth.x_coord,pth.y_coord)
    else
      pdf_literalcode("%f %f l",pth.x_coord,pth.y_coord)
    end
    ith = pth
  end
  if not open then
    local one = path[1]
    if curved(pth,one) then
      pdf_literalcode("%f %f %f %f %f %f c",pth.right_x,pth.right_y,one.left_x,one.left_y,one.x_coord,one.y_coord )
    else
      pdf_literalcode("%f %f l",one.x_coord,one.y_coord)
    end
  elseif #path == 1 then -- special case .. draw point
    local one = path[1]
    pdf_literalcode("%f %f l",one.x_coord,one.y_coord)
  end
end

local function flushconcatpath(path,open)
  pdf_literalcode("%f %f %f %f %f %f cm", sx, rx, ry, sy, tx ,ty)
  local pth, ith
  for i=1,#path do
    pth = path[i]
    if not ith then
      pdf_literalcode("%f %f m",concat(pth.x_coord,pth.y_coord))
    elseif curved(ith,pth) then
      local a, b = concat(ith.right_x,ith.right_y)
      local c, d = concat(pth.left_x,pth.left_y)
      pdf_literalcode("%f %f %f %f %f %f c",a,b,c,d,concat(pth.x_coord, pth.y_coord))
    else
      pdf_literalcode("%f %f l",concat(pth.x_coord, pth.y_coord))
    end
    ith = pth
  end
  if not open then
    local one = path[1]
    if curved(pth,one) then
      local a, b = concat(pth.right_x,pth.right_y)
      local c, d = concat(one.left_x,one.left_y)
      pdf_literalcode("%f %f %f %f %f %f c",a,b,c,d,concat(one.x_coord, one.y_coord))
    else
      pdf_literalcode("%f %f l",concat(one.x_coord,one.y_coord))
    end
  elseif #path == 1 then -- special case .. draw point
    local one = path[1]
    pdf_literalcode("%f %f l",concat(one.x_coord,one.y_coord))
  end
end

local pdfoutput = tonumber(texget("outputmode")) or tonumber(texget("pdfoutput"))
local pdfmode = pdfoutput > 0

local function start_pdf_code()
  if pdfmode then
    pdf_literalcode("q")
  else
    texsprint("\\special{pdf:bcontent}") -- dvipdfmx
  end
end
local function stop_pdf_code()
  if pdfmode then
    pdf_literalcode("Q")
  else
    texsprint("\\special{pdf:econtent}") -- dvipdfmx
  end
end

local function put_tex_boxes (object,prescript)
  local box = prescript.mplibtexboxid
  local n,tw,th = box[1],tonumber(box[2]),tonumber(box[3])
  if n and tw and th then
    local op = object.path
    local first, second, fourth = op[1], op[2], op[4]
    local tx, ty = first.x_coord, first.y_coord
    local sx, rx, ry, sy = 1, 0, 0, 1
    if tw ~= 0 then
      sx = (second.x_coord - tx)/tw
      rx = (second.y_coord - ty)/tw
      if sx == 0 then sx = 0.00001 end
    end
    if th ~= 0 then
      sy = (fourth.y_coord - ty)/th
      ry = (fourth.x_coord - tx)/th
      if sy == 0 then sy = 0.00001 end
    end
    start_pdf_code()
    pdf_literalcode("%f %f %f %f %f %f cm",sx,rx,ry,sy,tx,ty)
    texsprint(format("\\mplibputtextbox{%i}",n))
    stop_pdf_code()
  end
end

local pdf_objs = {}
local token, getpageres, setpageres = newtoken or token
local pgf = { bye = "pgfutil@everybye", extgs = "pgf@sys@addpdfresource@extgs@plain" }

if pdfmode then -- repect luaotfload-colors
  getpageres = pdf.getpageresources or function() return pdf.pageresources end
  setpageres = pdf.setpageresources or function(s) pdf.pageresources = s end
else
  texsprint("\\special{pdf:obj @MPlibTr<<>>}",
            "\\special{pdf:obj @MPlibSh<<>>}")
end

local function update_pdfobjs (os)
  local on = pdf_objs[os]
  if on then
    return on,false
  end
  if pdfmode then
    on = pdf.immediateobj(os)
  else
    on = pdf_objs.cnt or 0
    pdf_objs.cnt = on + 1
  end
  pdf_objs[os] = on
  return on,true
end

local transparancy_modes = { [0] = "Normal",
  "Normal",       "Multiply",     "Screen",       "Overlay",
  "SoftLight",    "HardLight",    "ColorDodge",   "ColorBurn",
  "Darken",       "Lighten",      "Difference",   "Exclusion",
  "Hue",          "Saturation",   "Color",        "Luminosity",
  "Compatible",
}

local function update_tr_res(res,mode,opaq)
  local os = format("<</BM /%s/ca %.3f/CA %.3f/AIS false>>",mode,opaq,opaq)
  local on, new = update_pdfobjs(os)
  if new then
    if pdfmode then
      res = format("%s/MPlibTr%i %i 0 R",res,on,on)
    else
      if pgf.loaded then
        texsprint(format("\\csname %s\\endcsname{/MPlibTr%i%s}", pgf.extgs, on, os))
      else
        texsprint(format("\\special{pdf:put @MPlibTr<</MPlibTr%i%s>>}",on,os))
      end
    end
  end
  return res,on
end

local function tr_pdf_pageresources(mode,opaq)
  if token and pgf.bye and not pgf.loaded then
    pgf.loaded = token.create(pgf.bye).cmdname == "assign_toks"
    pgf.bye    = pgf.loaded and pgf.bye
  end
  local res, on_on, off_on = "", nil, nil
  res, off_on = update_tr_res(res, "Normal", 1)
  res, on_on  = update_tr_res(res, mode, opaq)
  if pdfmode then
    if res ~= "" then
      if pgf.loaded then
        texsprint(format("\\csname %s\\endcsname{%s}", pgf.extgs, res))
      else
        local tpr, n = getpageres() or "", 0
        tpr, n = tpr:gsub("/ExtGState<<", "%1"..res)
        if n == 0 then
          tpr = format("%s/ExtGState<<%s>>", tpr, res)
        end
        setpageres(tpr)
      end
    end
  else
    if not pgf.loaded then
      texsprint(format("\\special{pdf:put @resources<</ExtGState @MPlibTr>>}"))
    end
  end
  return on_on, off_on
end

local shading_res

local function shading_initialize ()
  shading_res = {}
  if pdfmode and luatexbase.callbacktypes.finish_pdffile then -- ltluatex
    local shading_obj = pdf.reserveobj()
    setpageres(format("%s/Shading %i 0 R",getpageres() or "",shading_obj))
    luatexbase.add_to_callback("finish_pdffile", function()
      pdf.immediateobj(shading_obj,format("<<%s>>",tableconcat(shading_res)))
      end, "luamplib.finish_pdffile")
    pdf_objs.finishpdf = true
  end
end

local function sh_pdfpageresources(shtype,domain,colorspace,colora,colorb,coordinates)
  if not shading_res then shading_initialize() end
  local os = format("<</FunctionType 2/Domain [ %s ]/C0 [ %s ]/C1 [ %s ]/N 1>>",
                    domain, colora, colorb)
  local funcobj = pdfmode and format("%i 0 R",update_pdfobjs(os)) or os
  os = format("<</ShadingType %i/ColorSpace /%s/Function %s/Coords [ %s ]/Extend [ true true ]/AntiAlias true>>",
              shtype, colorspace, funcobj, coordinates)
  local on, new = update_pdfobjs(os)
  if pdfmode then
    if new then
      local res = format("/MPlibSh%i %i 0 R", on, on)
      if pdf_objs.finishpdf then
        shading_res[#shading_res+1] = res
      else
        local pageres = getpageres() or ""
        if not pageres:find("/Shading<<.*>>") then
          pageres = pageres.."/Shading<<>>"
        end
        pageres = pageres:gsub("/Shading<<","%1"..res)
        setpageres(pageres)
      end
    end
  else
    if new then
      texsprint(format("\\special{pdf:put @MPlibSh<</MPlibSh%i%s>>}",on,os))
    end
    texsprint(format("\\special{pdf:put @resources<</Shading @MPlibSh>>}"))
  end
  return on
end

local function color_normalize(ca,cb)
  if #cb == 1 then
    if #ca == 4 then
      cb[1], cb[2], cb[3], cb[4] = 0, 0, 0, 1-cb[1]
    else -- #ca = 3
      cb[1], cb[2], cb[3] = cb[1], cb[1], cb[1]
    end
  elseif #cb == 3 then -- #ca == 4
    cb[1], cb[2], cb[3], cb[4] = 1-cb[1], 1-cb[2], 1-cb[3], 0
  end
end

local prev_override_color

local function do_preobj_color(object,prescript)
  local opaq = prescript and prescript.tr_transparency
  local tron_no, troff_no
  if opaq then
    local mode = prescript.tr_alternative or 1
    mode = transparancy_modes[tonumber(mode)]
    tron_no, troff_no = tr_pdf_pageresources(mode,opaq)
    pdf_literalcode("/MPlibTr%i gs",tron_no)
  end
  local override = prescript and prescript.MPlibOverrideColor
  if override then
    if pdfmode then
      pdf_literalcode(override)
      override = nil
    else
      texsprint(format("\\special{color push %s}",override))
      prev_override_color = override
    end
  else
    local cs = object.color
    if cs and #cs > 0 then
      pdf_literalcode(luamplib.colorconverter(cs))
      prev_override_color = nil
    elseif not pdfmode then
      override = prev_override_color
      if override then
        texsprint(format("\\special{color push %s}",override))
      end
    end
  end
  local sh_type = prescript and prescript.sh_type
  if sh_type then
    local domain  = prescript.sh_domain
    local centera = prescript.sh_center_a:explode()
    local centerb = prescript.sh_center_b:explode()
    for _,t in pairs({centera,centerb}) do
      for i,v in ipairs(t) do
        t[i] = format("%f",v)
      end
    end
    centera = tableconcat(centera," ")
    centerb = tableconcat(centerb," ")
    local colora  = prescript.sh_color_a or {0};
    local colorb  = prescript.sh_color_b or {1};
    for _,t in pairs({colora,colorb}) do
      for i,v in ipairs(t) do
        t[i] = format("%.3f",v)
      end
    end
    if #colora > #colorb then
      color_normalize(colora,colorb)
    elseif #colorb > #colora then
      color_normalize(colorb,colora)
    end
    local colorspace
    if     #colorb == 1 then colorspace = "DeviceGray"
    elseif #colorb == 3 then colorspace = "DeviceRGB"
    elseif #colorb == 4 then colorspace = "DeviceCMYK"
    else   return troff_no,override
    end
    colora = tableconcat(colora, " ")
    colorb = tableconcat(colorb, " ")
    local shade_no
    if sh_type == "linear" then
      local coordinates = tableconcat({centera,centerb}," ")
      shade_no = sh_pdfpageresources(2,domain,colorspace,colora,colorb,coordinates)
    elseif sh_type == "circular" then
      local radiusa = format("%f",prescript.sh_radius_a)
      local radiusb = format("%f",prescript.sh_radius_b)
      local coordinates = tableconcat({centera,radiusa,centerb,radiusb}," ")
      shade_no = sh_pdfpageresources(3,domain,colorspace,colora,colorb,coordinates)
    end
    pdf_literalcode("q /Pattern cs")
    return troff_no,override,shade_no
  end
  return troff_no,override
end

local function do_postobj_color(tr,over,sh)
  if sh then
    pdf_literalcode("W n /MPlibSh%s sh Q",sh)
  end
  if over then
    texsprint("\\special{color pop}")
  end
  if tr then
    pdf_literalcode("/MPlibTr%i gs",tr)
  end
end

local function flush(result,flusher)
  if result then
    local figures = result.fig
    if figures then
      for f=1, #figures do
        info("flushing figure %s",f)
        local figure = figures[f]
        local objects = getobjects(result,figure,f)
        local fignum = tonumber(figure:filename():match("([%d]+)$") or figure:charcode() or 0)
        local miterlimit, linecap, linejoin, dashed = -1, -1, -1, false
        local bbox = figure:boundingbox()
        local llx, lly, urx, ury = bbox[1], bbox[2], bbox[3], bbox[4] -- faster than unpack
        if urx < llx then
        else
          if tex_code_pre_mplib[f] then
            texsprint(tex_code_pre_mplib[f])
          end
          local TeX_code_bot = {}
          pdf_startfigure(fignum,llx,lly,urx,ury)
          start_pdf_code()
          if objects then
            local savedpath = nil
            local savedhtap = nil
            for o=1,#objects do
              local object        = objects[o]
              local objecttype    = object.type
              local prescript     = object.prescript
              prescript = prescript and script2table(prescript) -- prescript is now a table
              local tr_opaq,cr_over,shade_no = do_preobj_color(object,prescript)
              if prescript and prescript.mplibtexboxid then
                put_tex_boxes(object,prescript)
              elseif objecttype == "start_bounds" or objecttype == "stop_bounds" then --skip
              elseif objecttype == "start_clip" then
                local evenodd = not object.istext and object.postscript == "evenodd"
                start_pdf_code()
                flushnormalpath(object.path,false)
                pdf_literalcode(evenodd and "W* n" or "W n")
              elseif objecttype == "stop_clip" then
                stop_pdf_code()
                miterlimit, linecap, linejoin, dashed = -1, -1, -1, false
              elseif objecttype == "special" then
                if prescript and prescript.postmplibverbtex then
                  TeX_code_bot[#TeX_code_bot+1] = prescript.postmplibverbtex
                end
              elseif objecttype == "text" then
                local ot = object.transform -- 3,4,5,6,1,2
                start_pdf_code()
                pdf_literalcode("%f %f %f %f %f %f cm",ot[3],ot[4],ot[5],ot[6],ot[1],ot[2])
                pdf_textfigure(object.font,object.dsize,object.text,object.width,object.height,object.depth)
                stop_pdf_code()
              else
                local evenodd, collect, both = false, false, false
                local postscript = object.postscript
                if not object.istext then
                  if postscript == "evenodd" then
                    evenodd = true
                  elseif postscript == "collect" then
                    collect = true
                  elseif postscript == "both" then
                    both = true
                  elseif postscript == "eoboth" then
                    evenodd = true
                    both    = true
                  end
                end
                if collect then
                  if not savedpath then
                    savedpath = { object.path or false }
                    savedhtap = { object.htap or false }
                  else
                    savedpath[#savedpath+1] = object.path or false
                    savedhtap[#savedhtap+1] = object.htap or false
                  end
                else
                  local ml = object.miterlimit
                  if ml and ml ~= miterlimit then
                    miterlimit = ml
                    pdf_literalcode("%f M",ml)
                  end
                  local lj = object.linejoin
                  if lj and lj ~= linejoin then
                    linejoin = lj
                    pdf_literalcode("%i j",lj)
                  end
                  local lc = object.linecap
                  if lc and lc ~= linecap then
                    linecap = lc
                    pdf_literalcode("%i J",lc)
                  end
                  local dl = object.dash
                  if dl then
                    local d = format("[%s] %f d",tableconcat(dl.dashes or {}," "),dl.offset)
                    if d ~= dashed then
                      dashed = d
                      pdf_literalcode(dashed)
                    end
                  elseif dashed then
                    pdf_literalcode("[] 0 d")
                    dashed = false
                  end
                  local path = object.path
                  local transformed, penwidth = false, 1
                  local open = path and path[1].left_type and path[#path].right_type
                  local pen = object.pen
                  if pen then
                    if pen.type == 'elliptical' then
                      transformed, penwidth = pen_characteristics(object) -- boolean, value
                      pdf_literalcode("%f w",penwidth)
                      if objecttype == 'fill' then
                        objecttype = 'both'
                      end
                    else -- calculated by mplib itself
                      objecttype = 'fill'
                    end
                  end
                  if transformed then
                    start_pdf_code()
                  end
                  if path then
                    if savedpath then
                      for i=1,#savedpath do
                        local path = savedpath[i]
                        if transformed then
                          flushconcatpath(path,open)
                        else
                          flushnormalpath(path,open)
                        end
                      end
                      savedpath = nil
                    end
                    if transformed then
                      flushconcatpath(path,open)
                    else
                      flushnormalpath(path,open)
                    end
                    if not shade_no then -- conflict with shading
                      if objecttype == "fill" then
                        pdf_literalcode(evenodd and "h f*" or "h f")
                      elseif objecttype == "outline" then
                        if both then
                          pdf_literalcode(evenodd and "h B*" or "h B")
                        else
                          pdf_literalcode(open and "S" or "h S")
                        end
                      elseif objecttype == "both" then
                        pdf_literalcode(evenodd and "h B*" or "h B")
                      end
                    end
                  end
                  if transformed then
                    stop_pdf_code()
                  end
                  local path = object.htap
                  if path then
                    if transformed then
                      start_pdf_code()
                    end
                    if savedhtap then
                      for i=1,#savedhtap do
                        local path = savedhtap[i]
                        if transformed then
                          flushconcatpath(path,open)
                        else
                          flushnormalpath(path,open)
                        end
                      end
                      savedhtap = nil
                      evenodd   = true
                    end
                    if transformed then
                      flushconcatpath(path,open)
                    else
                      flushnormalpath(path,open)
                    end
                    if objecttype == "fill" then
                      pdf_literalcode(evenodd and "h f*" or "h f")
                    elseif objecttype == "outline" then
                      pdf_literalcode(open and "S" or "h S")
                    elseif objecttype == "both" then
                      pdf_literalcode(evenodd and "h B*" or "h B")
                    end
                    if transformed then
                      stop_pdf_code()
                    end
                  end
                end
              end
              do_postobj_color(tr_opaq,cr_over,shade_no)
            end
          end
          stop_pdf_code()
          pdf_stopfigure()
          if #TeX_code_bot > 0 then texsprint(TeX_code_bot) end
        end
      end
    end
  end
end
luamplib.flush = flush

local function colorconverter(cr)
  local n = #cr
  if n == 4 then
    local c, m, y, k = cr[1], cr[2], cr[3], cr[4]
    return format("%.3f %.3f %.3f %.3f k %.3f %.3f %.3f %.3f K",c,m,y,k,c,m,y,k), "0 g 0 G"
  elseif n == 3 then
    local r, g, b = cr[1], cr[2], cr[3]
    return format("%.3f %.3f %.3f rg %.3f %.3f %.3f RG",r,g,b,r,g,b), "0 g 0 G"
  else
    local s = cr[1]
    return format("%.3f g %.3f G",s,s), "0 g 0 G"
  end
end
luamplib.colorconverter = colorconverter
--
--  End of File `luamplib.lua'.
