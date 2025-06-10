
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

## Namespace
namespace eval test {

    call.command arguments



}

call.command arguments

# Function definition
proc defineCommand args { # Test

}

defineCommand test

proc defineCommand2 {test {d ""} args} {

}

defineCommand2 [defineCommand 2]
