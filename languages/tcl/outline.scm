

;; Procedure definition
(comment) @annotation
(procedure
    ("proc" @name)
    name: (_) @name
) @item

;; Namespace declarations

(namespace .
    ("namespace" @name)
    (word_list .
        ((simple_word)
        (simple_word) @name) @name
    )  ) @item


;; Some outlines for Kissb Build targets, methods defined using "@" as command
;; This is a test to see how to customise outline, probably not its place in this plugin
;(command
;    name: (simple_word ) @name.cmd @name
;    arguments: (_)  @name
;    (#eq? @name.cmd "@")
;) @item
