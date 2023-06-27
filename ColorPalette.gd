class_name ColorPalette

const g = Vector3(0.299, 0.587, 0.114)
var Palette = {}
var HueDict = {
	"Main"					: 0		#This is here so the hashtable has that Main label but this is essentially the same color from the input
	,"AdjacentMinusFar"		:-.064	#For these "adjacents" you might want to fiddle the amount a bit
	,"AdjacentMinusNear"	:-.032
	,"AdjacentPlusFar"		: .064
	,"AdjacentPlusNear"		: .032
	,"TriadicMinus"			: .66	#Triadic colors would form a triangle on the color wheel
	,"TriadicPlus"			: .33
	,"SquareMinus"			:-.25	#Square colors would form a square on the color wheel
	,"SquareComplimentary"	: .5	#This is the "opposite" or complimentary color
	,"SquarePlus"			: .25
	}

func Generate(c:Color)->Dictionary:
	for x in HueDict:
		var h2 = c.h + HueDict[x]
		h2 = h2 -1 if h2 > 1 else h2 + 1 if h2 < 0 else h2
		var color = c
		color.h = h2
		Palette[x]=color
	var sc = Palette["SquareComplimentary"]
	var cg = Vector3(sc.r,sc.g,sc.b)
	cg = cg.dot(g)
	Palette["Neutral"] = c.blend(sc).darkened(.5)
	Palette["Grayscale"] = Color(cg,cg,cg)
	return Palette
