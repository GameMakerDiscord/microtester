if (++ntime <= frames_between_tests) exit;
ntime = 0;
ndone += 1;
var n = ds_list_size(swaps);
var i, q;
var cpt = calls_per_test;
var tpf = tests_per_frame;
repeat (tests_per_frame) {
    // each iteration we shuffle the list
    // (to reduce odds of data being impacted by caching on YYC)
    // and run the scripts in it while counting up time it took to do so
    ds_list_shuffle(swaps);
    for (i = 0; i < n; i++) {
        q = swaps[|i];
        var w = q[test_t.args], t;
        var w0 = w[0], w1, w2, w3, w4, w5, w6, w7;
        switch (array_length_1d(w)) {
            case 1:
                t = get_timer();
                repeat (cpt) script_execute(w0);
                break;
            case 2:
                w1 = w[1];
                t = get_timer();
                repeat (cpt) script_execute(w0, w1);
                break;
            case 3:
                w1 = w[1]; w2 = w[2];
                t = get_timer();
                repeat (cpt) script_execute(w0, w1, w2);
                break;
            case 4:
                w1 = w[1]; w2 = w[2]; w3 = w[3];
                t = get_timer();
                repeat (cpt) script_execute(w0, w1, w2, w3);
                break;
            case 5:
                w1 = w[1]; w2 = w[2]; w3 = w[3]; w4 = w[4];
                t = get_timer();
                repeat (cpt) script_execute(w0, w1, w2, w3, w4);
                break;
            case 6:
                w1 = w[1]; w2 = w[2]; w3 = w[3]; w4 = w[4]; w5 = w[5];
                t = get_timer();
                repeat (cpt) script_execute(w0, w1, w2, w3, w4, w5);
                break;
            case 7:
                w1 = w[1]; w2 = w[2]; w3 = w[3]; w4 = w[4]; w5 = w[5]; w6 = w[6];
                t = get_timer();
                repeat (cpt) script_execute(w0, w1, w2, w3, w4, w5, w6);
                break;
            default: show_error("Too many arguments", 1);
        }
        t = get_timer() - t;
        q[@test_t.total] += t;
    }
}
// then we recalculate the average time per script:
var num_total = ndone * cpt * tpf;
for (i = 0; i < n; i++) {
    q = swaps[|i];
    q[@test_t.avg] = q[test_t.total] / num_total;
}
