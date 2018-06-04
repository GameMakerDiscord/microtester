# microtester
A tool for comparing performance of GML scripts.

# How to use this
1. Download the repository, open the project file (or import it into GMS2).
2. Add one or more scripts that you want to compare to the project.
3. Open `setup_tests_here` and add a `test_add` line for each of them.

    If you need to specify arguments, you can do so by adding them to `test_add`:
    
    ```
    test_add(scr_add, 1, 2);
    ```
    
    You can also set custom labels for items by prepending a name argument:
    
    ```
    test_add("+", scr_add, 1, 2);
    ```
4. Tweak other settings in the same script if needed.
5. Run on the platform in question and give it a bit of time to get a good average.

# Things to consider
* On HTML5, running the game in debug mode and then running a JS profiler can show more accurate results than running microtester alone.
* Be sure to test setups close to your real ones - for example, if you are evaluating whether to substitute a read-only `ds_map` with a `switch` block, use a similar number of items in both to what you would in the actual project.
* Be sure not to optimize prematurely - it can be easy to get caught up on trying to perfect small operations instead of making the actual project.
