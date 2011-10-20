.SUFFIXES: .m .k

all: CoordTransformTest

CoordTransformTest: Math2.k CoordTransform.k CoordTransformTest.k
	obc -o ${.TARGET} ${.ALLSRC}

CoordTransform.k: Math2.k

CoordTransformTest.k: Math2.k

.m.k:
	obc -c ${.IMPSRC}

clean:
	rm -f *.k *.core CoordTransformTest
