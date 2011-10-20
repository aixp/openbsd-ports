# $OpenBSD$

COMMENT =	ISP tool for PIC16, PIC12 and PIC18 microcontrollers

DISTNAME =	picprog-1.9.1
CATEGORIES =	devel

HOMEPAGE =	http://hyvatti.iki.fi/~jaakko/pic/picprog.html

MAINTAINER =	Alexander Shiryaev <shiryaev.a.v@gmail.com>

# FIXME:
# LGPLv3+
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes
PERMIT_DISTFILES_FTP =	Yes

MASTER_SITES =	http://www.iki.fi/hyvatti/pic/

# FIXME:
WANTLIB =	c

USE_GMAKE =	Yes
MAKE_FLAGS =	CXX=${CXX}

NO_REGRESS =	Yes

do-install:
	${INSTALL_PROGRAM} ${WRKBUILD}/picprog ${PREFIX}/bin/picprog
	${INSTALL_MAN} ${WRKBUILD}/picprog.1 ${PREFIX}/man/man1

.include <bsd.port.mk>
