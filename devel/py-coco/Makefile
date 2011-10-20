# $OpenBSD$

COMMENT =		Python implementation of CoCo/R LL(k) compiler generator

MODPY_EGG_VERSION =	1.1.0rc
DISTNAME =		CocoPy-${MODPY_EGG_VERSION}
PKGNAME =		${DISTNAME:S/CocoPy/py-coco/}

CATEGORIES =		devel

HOMEPAGE =		http://pypi.python.org/pypi/CocoPy/

MAINTAINER =		Alexander Shiryaev <shiryaev.a.v@gmail.com>

# FIXME?: GPL2+
PERMIT_PACKAGE_FTP =	Yes
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_DISTFILES_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes

MASTER_SITES =		http://pypi.python.org/packages/source/C/CocoPy/
EXTRACT_SUFX =		.zip

MODULES =		lang/python

DOCSDIR =		${PREFIX}/share/doc/py-coco
EXAMPLESDIR =		${PREFIX}/share/examples/py-coco

post-extract:
	mv ${WRKSRC}/testSuite/TestAlts_output.txt ${WRKSRC}/testSuite/TestAlts_Output.txt

pre-build:
	perl -pi -e s,'%%PYTHON%%',${MODPY_BIN}, ${WRKSRC}/testSuite/cocopTester.py
	perl -pi -e s,'%%PYTHON%%',${MODPY_BIN}, ${WRKSRC}/frames/Driver.frame
	mkdir ${WRKSRC}/CocoPy
	mv ${WRKSRC}/frames ${WRKSRC}/pimaker ${WRKSRC}/sources \
		${WRKSRC}/CharClass.py ${WRKSRC}/Coco.py ${WRKSRC}/CodeGenerator.py \
		${WRKSRC}/Core.py ${WRKSRC}/DriverGen.py ${WRKSRC}/Errors.py \
		${WRKSRC}/Parser.py ${WRKSRC}/ParserGen.py ${WRKSRC}/Scanner.py \
		${WRKSRC}/Trace.py ${WRKSRC}/CocoPy
	cp ${WRKSRC}/setupInfo.py ${WRKSRC}/CocoPy

post-install:
	${INSTALL_DATA_DIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/documentation/* ${DOCSDIR}
	${INSTALL_DATA_DIR} ${EXAMPLESDIR}
	${INSTALL_DATA_DIR} ${EXAMPLESDIR}/Calc
	${INSTALL_DATA} ${WRKSRC}/examples/*.* ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/examples/Calc/* ${EXAMPLESDIR}/Calc
	printf '#!/bin/sh\n\nexec ${MODPY_BIN} ${MODPY_SITEPKG}/CocoPy/Coco.py "$${@}"' > ${WRKSRC}/cocopy.sh
	${INSTALL_SCRIPT} ${WRKSRC}/cocopy.sh ${PREFIX}/bin/cocopy

do-regress:
	cd ${WRKSRC}/testSuite && ${MODPY_BIN} cocopTester.py

.include <bsd.port.mk>
