/// pack(...values)->array
var n = argument_count;
var r = array_create(n);
for (var i = 0; i < n; i++) {
    r[i] = argument[i];
}
return r;
