





; These rules imported from tree sitter project and improved upon
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(comment) @spell @comment
(command name: (simple_word) @function)

(procedure
    name: (_) @function
)

;(namespace) @keyword
;(namespace . (word_list) @keyword)
;(namespace
;    (_): (simple_word) @function)



(argument
  name: (_) @variable.parameter @variable
)

((simple_word) @variable.builtin @variable
               (#any-of? @variable.builtin
                "argc"
                "argv"
                "argv0"
                "auto_path"
                "env"
                "errorCode"
                "errorInfo"
                "tcl_interactive"
                "tcl_library"
                "tcl_nonwordchars"
                "tcl_patchLevel"
                "tcl_pkgPath"
                "tcl_platform"
                "tcl_precision"
                "tcl_rcFileName"
                "tcl_traceCompile"
                "tcl_traceExec"
                "tcl_wordchars"
                "tcl_version"))

"expr" @function.builtin @function

; Highlight switch arguments as string
(command
    name: (simple_word) @keyword
    arguments:
        (word_list
            (braced_word
                (command
                    name: (simple_word) @string)))
    (#eq? @keyword "switch"))

;("regsub" @function.builtin @function)

;(regsub_switch) @attribute
;(regsub
;    pattern: (_) @string.regex
;    substitution: (_) @string.regex)

;; Built-in commands
"proc" @function.builtin @keyword.function @keyword
;(namespace . (_) @string ) @function.builtin @keyword.function @keyword
;(namespace . (word_list . (_) @string) @keyword ) @function.builtin @keyword.function @keyword
(namespace .
    (word_list .
        (simple_word) @string
        (simple_word) @operator
    ) @keyword ) @function.builtin @keyword.function @keyword


(command
  name: (simple_word) @function.builtin @keyword.function @keyword
  (#any-of? @function.builtin
   "cd"
   "exec"
   "exit"
   "incr"
   "info"
   "join"
   "puts"
   "regexp"
   "regsub"
   "split"
   "subst"
   "source"
   "namespace"
   "trace"
   "zipfs"
   "append"
   "break"
   "catch"
   "continue"
   "default"
   "dict"
   "error"
   "eval"
   "global"
   "lappend"
   "lassign"
   "lindex"
   "linsert"
   "list"
   "llength"
   "lmap"
   "lrange"
   "lrepeat"
   "lreplace"
   "lreverse"
   "lsearch"
   "lset"
   "lsort"
   "on"
   "package"
   "unset"
   "variable"))

; Highlight unset and variable arguments as variables
(set (id) @variable) @function.builtin @keyword.function @keyword
;(command
;    name: (simple_word) @function.builtin @keyword.function @keyword
;    arguments: (word_list) @variable
;    (#any-of? @keyword
;        "unset"
;        "variable"))

;; Commands that are keywords, like return
(command name: (simple_word) @operator
         (#any-of? @operator
          "break"
          "catch"
          "continue"
          "default"
          "error"
          "on"
          "return"
          "throw"
          "try"
          "trap"
          "finally"))

;; {*} unpack
(unpack) @operator

;; Loops or keyword
[
 "while"
 "foreach"
 ] @repeat @keyword

;; Conditionals
(command
    name: (simple_word) @conditional @keyword
    (#any-of? @conditional
        "if"
        "else"
        "elseif"))

(if .(_)) @conditional @keyword

;[
; "if"
; "else"
; "elseif"
; ] @conditional @keyword

[
 "**"
 "/" "*" "%" "+" "-"
 "<<" ">>"
 ">" "<" ">=" "<="
 "==" "!="
 "eq" "ne"
 "in" "ni"
 "&"
 "^"
 "|"
 "&&"
 "||"
 ] @operator




(variable_substitution) @variable.special
(#set! "priority" 100)
["{" "}"] @variable.special

(quoted_word) @string
(escaped_character) @string.escape

(number) @number
((simple_word) @number
    (#match? @number
        "^(?:\\+|-)?[0-9\\.]+$"))

((simple_word) @boolean
        (#any-of? @boolean "true" "false"))



;; Removed {} from punctuation, conflicts with variable substitution
[
 ;;"{" "}"
 "[" "]"
 ] @punctuation.bracket @punctuation.delimiter
[
 ;"{" "}"
 ";"
 ] @punctuation.special
(#set! "priority" 50)




;((simple_word)   @punctuation.special
    ;(#match? @punctuation.special
    ;        "\\{\\s")
;)
;((simple_word)   @punctuation.delimiter
    ;(#match? @punctuation.delimiter
    ;        "\\s}\\s")
;)

; after apply array auto_execok auto_import auto_load auto_mkindex auto_qualify
; auto_reset bgerror binary chan clock close coroutine dde encoding eof fblocked
; fconfigure fcopy file fileevent filename flush format gets glob history http
; interp load mathfunc mathop memory msgcat my next nextto open parray pid
; pkg::create pkg_mkIndex platform platform::shell pwd re_syntax read refchan
; registry rename safe scan seek self socket source string tailcall tcl::prefix
; tcl_endOfWord tcl_findLibrary tcl_startOfNextWord tcl_startOfPreviousWord
; tcl_wordBreakAfter tcl_wordBreakBefore tcltest tell time timerate tm
; transchan unknown unload update uplevel upvar vwait yield yieldto zlib


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Other customisations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Highlight require argument from package
(command
    name: (simple_word) @keyword
    arguments: (word_list
                (simple_word) @string
                (#any-of? @string
                    "require"
                    "provide"
                    "ifneeded")    )
  ;      (simple_word) @string
  ;      (#eq? @keyword "require")
    (#eq? @keyword "package"))
