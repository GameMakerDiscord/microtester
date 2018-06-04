///
function jscallback_jshpgt(_5394, _get_timer) {
	if (performance.now) {
		// first we get the JS code of our compiled GML script:
		var gmljs = window.gml_Script_gmcallback_jshpgt.toString();
		// then, we parse that JS code to figure out the minified name of get_timer:
		var mt = /5394\s*,\s*([$\w]+)/g.exec(gmljs);
		if (mt) {
			// if all is well, we then replace the implementation with ours:
			window[mt[1]] = function() { return performance.now() * 1000000 };
			console.log("jshpgt: Rebound get_timer (" + mt[1] + ").");
		} else console.error("jshpgt: Couldn't find get_timer.");
	} else console.error("jshpgt: performance.now is not supported.");
}