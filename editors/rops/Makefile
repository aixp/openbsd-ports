# $OpenBSD$

COMMENT =	simple text editor

DISTNAME =	rops-0.2
CATEGORIES =	editors

HOMEPAGE =	http://hep.msu.dubna.ru/~shiryaev/files/rops/

MAINTAINER =	Alexander Shiryaev <shiryaev.a.v@gmail.com>

# BSD
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes
PERMIT_DISTFILES_FTP =	Yes

MASTER_SITES =	${HOMEPAGE}

MODULES =	lang/python

BUILD_DEPENDS =	x11/py-gtksourceview \
		x11/py-gtk2 \
		textproc/py-chardet
LIB_DEPENDS =	x11/gtksourceview \
		${MODPY_LIB_DEPENDS}
RUN_DEPENDS =	x11/py-gtk2 \
		x11/py-gtksourceview \
		textproc/py-chardet

NO_REGRESS =	Yes

pre-configure:
	/bin/rm ${WRKSRC}/rops/regexts.py
	echo '#!/bin/sh\n\nexec ${MODPY_BIN} ${MODPY_SITEPKG}/rops/ide.py "$${@}"' > ${WRKSRC}/rops.sh

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/gtksourceview-2.0/language-specs
	${INSTALL_DATA} ${WRKSRC}/oberon.lang ${PREFIX}/share/gtksourceview-2.0/language-specs/oberon.lang
	${INSTALL_DATA} ${WRKSRC}/zonnon.lang ${PREFIX}/share/gtksourceview-2.0/language-specs/zonnon.lang
	${INSTALL_DATA_DIR} ${PREFIX}/share/gtksourceview-2.0/styles
	${INSTALL_DATA} ${WRKSRC}/strict.xml ${PREFIX}/share/gtksourceview-2.0/styles/strict.xml
	${INSTALL_SCRIPT} ${WRKSRC}/rops.sh ${PREFIX}/bin/rops

.include <bsd.port.mk>
