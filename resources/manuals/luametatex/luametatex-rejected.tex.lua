---% language=us runpath=texruns:manuals/luametatex
---
---\environment luametatex-style
---
---\startcomponent luametatex-rejected
---
---# Rejected features
---
---\startsection[title=Introduction]
---
---I should have started this chapter sooner because some experiments were removed
---without them being documented. This chapter is mostly for myself so that I don't
---revisit rejected features.
---
----------------------------------------------------------------


---
---\startsection[title=Text]
---
---{\em todo}
---
----------------------------------------------------------------


---
---\startsection[title=Math]
---
---\startsubsection[title=Fences]
---
---The \tex {mathfencesmode} primitive could be used to force the atom class of the
---fake fences to be the old inner class instead of the new fence class but we
---dropped that: it's now always a fence subtype (class). Unpacking is therefore now
---controlled by a class option and not enforced by the (new in *Lua*METATEX) subtype.
---
----------------------------------------------------------------


---
---\startsubsection[title=Delimiters]
---
---The \tex {mathdelimitersmode} primitive was experimental and dealt with the
---following (potential) problems. Three bits can be set. The first bit prevents an
---unwanted shift when the fence symbol is not scaled (a cambria side effect). The
---second bit forces italic correction between a preceding character ordinal and the
---fenced subformula, while the third bit turns that subformula into an ordinary so
---that the same spacing applies as with unfenced variants.
---
---So, when set to 7 fenced subformulas with unscaled delimiters came out the same
---as unfenced ones. This could be handy for cases where one was forced to use `left` and `right` always because of unpredictable content. The full list of
---flags that we had at the time of removal is given in the next table:
---
--- value   meaning 
---
--- `"01`  don't apply the usual shift 
--- `"02`  apply italic correction when possible 
--- `"04`  force an ordinary subformula 
--- `"08`  no shift when a base character 
--- `"10`  only shift when an extensible 
--- `"20`  don't error on a missing right  
---
---Because the effect depends on the font (and for Cambria one could use for
---instance `"16`) we finally decided to kick it out and correct the font
---instead using the font goodie file. After all it's more a *ConTeXt* preference
---than an overall demand (read: we think no one else cares much about this).
---
---The `"20` options to not error on a missing right fence has been turned
---into `mathcheckfencesmode`.
---
----------------------------------------------------------------


---
---\startsubsection[title=Flattening]
---
---The \tex {mathflattenmode} primitive is gone as we have other ways to deal with
---this now. It related to italic corrections in traditional fonts.
---
----------------------------------------------------------------


---
---\startsubsection[title=Rules]
---
---The \tex {mathrulethicknessmode} feature has been turned into a class option
---which is more granular.
---
----------------------------------------------------------------


---
---\startsubsection[title=Control]
---
---Although it has its use when developing *Lua*METATEX\ the \tex {mathcontrolmode}
---parameters is no longer there. We have plenty of (more) detailed control now.
---
----------------------------------------------------------------


---
---\stopchapter
---
---\stopcomponent
---