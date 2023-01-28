---% language=uk
---
---\startcomponent cld-specialcommands
---
---\environment cld-environment
---
---\startchapter[title=Special commands]
---
---\index{tracing}
---
---\startsection[title=Tracing]
---
---There are a few functions in the `context` namespace that are no
---macros at the *TeX* end.
---
---```
---context.runfile("somefile.cld")
---```
---
---Another useful command is:
---
---```
---context.settracing(true)
---```
---
---There are a few tracing options that you can set at the *TeX* end:
---
---```
---\enabletrackers[context.files]
---\enabletrackers[context.trace]
---```
---
----------------------------------------------------------------


---
---\startsection[title=Overloads]
---
---A few macros have special functions (overloads) at the *Lua* end. One of them is
---`\char`. The function makes sure that the characters ends up right. The
---same is true for `\chardef`. So, you don't need to mess around with `\relax` or trailing spaces as you would do at the *TeX* end in order to tell the
---scanner to stop looking ahead.
---
---```
---context.char(123)
---```
---
---Other examples of macros that have optimized functions are `\par`,
---`\bgroup` and `\egroup`. Or take this:
---
---\startbuffer
---1: \ctxlua{commands.doif(true)}{one}
---2: \cldcommand{doif("a","a","two")}
---3: \ctxcommand{doif(true)}{three}
---\stopbuffer
---
---\typebuffer
---
---\startlines
---\getbuffer
---\stoplines
---
----------------------------------------------------------------


---
---\startsection[title=Steps]
---
---% added and extended in sync with an article about a generic 'execute'
---% feature
---
---We already mentioned the stepper as a very special trick so let's give
---some more explanation here. When you run the following code:
---
---\setbox0\emptybox
---
---```
---\startluacode
---  context.startitemize()
---    context.startitem()
---      context("BEFORE 1")
---    context.stopitem()
---    context("\\setbox0\\hbox{!!!!}")
---    context.startitem()
---      context("%p",tex.getbox(0).width)
---    context.stopitem()
---  context.stopitemize()
---\stopluacode
---```
---
---You get a message like:
---
---```
---[ctxlua]:8: attempt to index a nil value
---...
---10             context("\\setbox0\\hbox{!!!!}")
---11             context.startitem()
---12 >>              context("%p",tex.getbox(0).width)
---...
---```
---
---due to the fact that the box is still void. All that the *ConTeXt* commands feed
---into *TeX* happens when the code snippet has finished. You can however run a
---snippet of code the following way:
---
---\startbuffer
---\startluacode
---  context.stepwise (function()
---    context.startitemize()
---      context.startitem()
---        context.step("BEFORE 1")
---      context.stopitem()
---      context.step("\\setbox0\\hbox{!!!!}")
---      context.startitem()
---        context.step("%p",tex.getbox(0).width)
---      context.stopitem()
---    context.stopitemize()
---  end)
---\stopluacode
---\stopbuffer
---
---\typebuffer
---
---and get:
---
---\getbuffer
---
---A more extensive example is:
---
---\startbuffer
---\startluacode
---  context.stepwise (function()
---    context.startitemize()
---      context.startitem()
---        context.step("BEFORE 1")
---      context.stopitem()
---      context.step("\\setbox0\\hbox{!!!!}")
---      context.startitem()
---        context.step("%p",tex.getbox(0).width)
---      context.stopitem()
---      context.startitem()
---        context.step("BEFORE 2")
---      context.stopitem()
---      context.step("\\setbox2\\hbox{????}")
---      context.startitem()
---        context.step("%p",tex.getbox(2).width)
---      context.startitem()
---        context.step("BEFORE 3")
---      context.stopitem()
---      context.startitem()
---        context.step("\\copy0\\copy2")
---      context.stopitem()
---      context.startitem()
---        context.step("BEFORE 4")
---        context.startitemize() context.stepwise (function() context.step("\\bgroup") context.step("\\setbox0\\hbox{>>>>}") context.startitem() context.step("%p",tex.getbox(0).width) context.stopitem() context.step("\\setbox2\\hbox{<<<<}") context.startitem() context.step("%p",tex.getbox(2).width) context.stopitem() context.startitem() context.step("\\copy0\\copy2") context.stopitem() context.startitem() context.step("\\copy0\\copy2") context.stopitem() context.step("\\egroup") end)
---        context.stopitemize()
---      context.stopitem()
---      context.startitem()
---        context.step("AFTER 1\\par")
---      context.stopitem()
---      context.startitem()
---        context.step("\\copy0\\copy2\\par")
---      context.stopitem()
---      context.startitem()
---        context.step("\\copy0\\copy2\\par")
---      context.stopitem()
---      context.startitem()
---        context.step("AFTER 2\\par")
---      context.stopitem()
---      context.startitem()
---        context.step("\\copy0\\copy2\\par")
---      context.stopitem()
---      context.startitem()
---        context.step("\\copy0\\copy2\\par")
---      context.stopitem()
---    context.stopitemize()
---  end)
---\stopluacode
---\stopbuffer
---
---\typebuffer
---
---which gives:
---
---\getbuffer
---
---A step returns control to *TeX* immediately and after the *TeX* code that it
---feeds back is expanded, returns to *Lua*. There are some limitations due to the
---input stack but normally that is no real issue.
---
---You can run the following code:
---
---```
---\definenumber[LineCounter][way=bypage]
---\starttext
---\startluacode
---for i=1,2000 do
---    context.incrementnumber { "LineCounter" }
---    context.getnumber { "LineCounter" }
---    context.par()
---end
---\stopluacode
---\stoptext
---```
---
---You will notice however that the number is not right on each page. This is
---because *TeX* doesn't know yet that there is no room on the page. The next will
---work better:
---
---```
---\definenumber[LineCounter][way=bypage]
---\starttext
---\startluacode
---context.stepwise(function()
---    for i=1,2000 do
---        context.testpage { 0 }
---        context.incrementnumber { "LineCounter" }
---        context.getnumber { "LineCounter" }
---        context.par()
---        context.step()
---    end
---end)
---\stopluacode
---\stoptext
---```
---
---Instead of the `testpage` function you can also play directly with
---registers, like:
---
---```
---if tex.pagegtotal + tex.count.lineheight > tex.pagetotal then
---```
---
---but often an already defined helper does a better job. Of course you will
---probably never need this kind of hacks anyway, if only because much more is going
---on and there are better ways then.
---
----------------------------------------------------------------


---
---\stopchapter
---
---\stopcomponent
---