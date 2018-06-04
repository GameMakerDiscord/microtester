/// string_format_exp(number)
/// @author YellowAfterlife
var i = round(argument0);
var u = "";
if (i >= 10000) {
    i /= 1000;
    u = "K";
    if (i >= 10000) {
        i /= 1000;
        u = "M";
        if (i >= 10000) {
            i /= 1000;
            u = "B";
            if (i >= 10000) {
                i /= 1000;
                u = "T";
            }
        }
    }
    return string_format(i, 0, 1) + u;
} else return string(i);
