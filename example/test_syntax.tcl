
## Base types

set var "str"
set var 10
set var 10.2
notANumber10

## Builtins
set a 10
unset a 10
lset a 2

## Variables
set test true
$test
${::test}

proc vartest args {
    global test
}

## If else
if {[files.cp defefe dede]} {

} elseif {[files.cp defefe dede]} {

} else {
    return
}

if { []} {
    fefef
    fefef
}

## loop
foreach i {0 1 2} {

    if {$i==0} {
        continue
    } else {
        break
    }
}



call.command arguments

# Command  definition
#######
proc definedCommand args { # Test

}

definedCommand test

proc definedCommand2 {test {d ""} args} {

}

definedCommand2 [definedCommand 2]

definedCommand2 [definedCommand [definedCommand 1]]

# examples from @Nindaleth
[list message [list severity INFO] {stream {}}]
list message [list severity INFO] {stream {}}

puts "test"

## Namespace
###########
namespace eval test {

    variable myvar  10
    set anothervar "foo"

    definedCommand2 2


}

## Error
#######
try {

    definedCommand2 2

    error "Error"

} on error {msg stack} {

} finally {

}

try {

    set f [open /some/file/name r]

} trap {POSIX EISDIR} {} {

    puts "failed to open /some/file/name: it's a directory"

} trap {POSIX ENOENT} {} {

    puts "failed to open /some/file/name: it doesn't exist"

} finally {

}


## regexp
## Some examples from TCL user manual
###########

regexp {\mfoo(?!bar\M)(\w*)} $string -> restOfWord
regexp -indices {(?ib)\<badger\>} $string location
regsub -nocase {\yinteresting\y} $string {"&"} string


## Source/load
#######

source file.tcl
load lib.so


## Subst / String
###########

string map {/ _} /path/to/underscore
subst {$var ; [cmd]}
split "a:b:c" :
trap


## Trace
############

proc traceCmd args {
}

trace add variable test read traceCmd


###################
## Some other tests identified as potential issues
######################


## From Issue 1 @Nindaleth
###############

namespace eval test {
    # Comment
}

proc myproc args {
    # Comment
}

# @brief do something
proc sth { param } {

  set val "ddd"

  puts "[string repeat { # } $param ]" ; #test
  puts "### $headline ###"
  puts "[string repeat { # } $param ]"
}

puts "Another line to test"

# end of sth


proc ftp_download { aasrc aadst } {
    puts "$tid: TEST: '$aasrc' '$aadst'"

    foreach src $aasrc dst $aadst {
        set src2 $src
        set dst2 $dst
        log_trace "${tid}($l_sid): src: '$src' / '$src2' "
        set src3 $src2
        set dst3 $dst2
        if { 0 < [ string length $dst3 ] } {
            append dst3 "/"
        }
    }
    return $dst3
}

proc log0  {message stream} {

  puts "$severity: ($stream) $message"

  return 0

}

proc foo [list a b c] {
    # Test
    puts "hello"
    echo "word$hi \$bye word"
}

proc log1 [list message [list severity INFO] {stream {}}] {

  puts "$severity: ($stream) $message"

  return 0

}

proc log2 [list message [list severity $g_severities(INFO)] {stream {}}] {

  puts "$severity: ($stream) $message"

  return 0
}

proc log3 { message { severity INFO } { stream {} } } {

  puts "$severity: ($stream) $message"

  return 0
}

global var1
global var2
global env

global argc
global argv
global argv0
global var3
