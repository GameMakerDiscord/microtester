/// test_add([optional name;]script, ...args)
/// @author YellowAfterlife
// Sets up a script to be tested.
// Will be called with provided arguments.
enum test_t { name, args, total, avg, sizeof }
// handle (script, ...) vs (name, script, ...)
var q = array_create(test_t.sizeof);
var r, k = 0;
var v = argument[0];
if (is_string(v)) {
    q[test_t.name] = v;
    r[0] = argument[++k];
} else {
    q[test_t.name] = script_get_name(v);
    r[0] = v;
}
//
var n = argument_count;
for (var i = k + 1; i < n; i++) {
    r[i - k] = argument[i];
}
q[test_t.args] = r;
q[test_t.total] = 0;
q[test_t.avg] = 0;
ds_list_add(tests, q);

