/// assert(value, expected_value)
var a = argument0, b = argument1;
if (a != b) show_error("Assertion failed"
    + chr(13) + chr(10) + "Received: " + string(a)
    + chr(13) + chr(10) + "Expected: " + string(b)
, true);
