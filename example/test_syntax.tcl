
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
