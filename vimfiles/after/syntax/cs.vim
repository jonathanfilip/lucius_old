" The C# file included with Vim does not allow these strings to continue to
" a new line (when it should).
syn region  csVerbatimString	start=+@"+ end=+"+ skip=+""+ contains=csVerbatimSpec,@Spell
