///////////////////////
// UTILITY FUNCTIONS //
///////////////////////

//These functions may end up being added to the runtime core file.
//They will be marked as such if this happens.

::mergeTable <- function(a, b) {
	if(typeof a == null && typeof b == null) return null
	if(typeof a == null) return b
	if(typeof b == null) return a
	if(a == null) return b
	if(b == null) return a

	//Create new table
	local nt = clone(a)

	//Merge B table slots into A table
	foreach(slot, i in b) {
		if(!nt.rawin(slot)) nt[slot] <- i
		else if(typeof nt[slot] == "table" && typeof b[slot] == "table") nt[slot] = mergeTable(nt[slot], b[slot])
		else nt[slot] <- i
	}

	return nt
}

::gotoTest <- function() {
	game.check = false
	startPlay("res/map/test.json")
}

::gotoMario <- function() {
	game.check = false
	startPlay("res/map/mario0.json")
}

::canint <- function(str) {
	switch(typeof str) {
		case "float":
		case "integer":
			return true
			break
		case "string":
			if(str.len() == 0) return false
			else {
				for(local i = 0; i < 10; i++) {
					if(str[0].tochar() == i.tostring()) return true
				}
				if(str[0] == "-") return true
			}
			return false
			break
		default:
			return false
			break
	}
}

::eval <- function(str) {
	//Does not work properly right now
	//Needs modification in the runtime
	return dostr("return " + str)
}

::minNum <- function(a, b) { return (a * (a < b)) + (b * (b <= a)) }

::maxNum <- function(a, b) { return (a * (a > b)) + (b * (b >= a)) }