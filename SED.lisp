for(i 1 3
	R=R+500*i
	println(R)
	system("sed -i 's/home/mohammad/Desktop/ocean4.ocn')
	load("/home/mohammad/Desktop/ocean4.ocn")
)

procedure(CCFreadCSV(filename)
	let((paramNames values inp line rows trailCR)
	trailCR=pcreCompile("\n$")
	inp=infile(filename)
	when(inp && gets(line inp)
		line=pcreReplace(trailCR line "" 1)
		paramNames=parseString(line ",")
		while(gets(line inp)
			line=pcreReplace(trailCR line "" 1)
			values=parseString(line ",")
			rows=tconc(rows values)
		)
	)
	when(inp 
		 close(inp)
	)
	list(paramNames car(rows))
	)
)
nour=(CCFreadCSV "/home/mohammad/Desktop/ocean4.ocn")
println(nour)
