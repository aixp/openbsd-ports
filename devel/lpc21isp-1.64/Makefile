# $OpenBSD: Makefile,v 1.1.1.1 2011/01/15 12:40:17 jasper Exp $

COMMENT =	ISP tool for LPC2000 and ADUC70xx microcontrollers

DISTNAME =	lpc21isp-1.64
CATEGORIES =	devel

HOMEPAGE =	http://sourceforge.net/projects/lpc21isp/

MAINTAINER =	Alexander Shiryaev <shiryaev.a.v@gmail.com>

# LGPLv3+
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes
PERMIT_DISTFILES_FTP =	Yes

MASTER_SITES =	${MASTER_SITE_SOURCEFORGE:=lpc21isp/}

WANTLIB =	c

USE_GMAKE =	Yes
MAKE_FLAGS =	CC=${CC}

NO_REGRESS =	Yes

post-extract:
	rm -f ${WRKDIST}/*.o ${WRKDIST}/lpc21isp

do-install:
	${INSTALL_PROGRAM} ${WRKBUILD}/lpc21isp ${PREFIX}/bin/lpc21isp

.include <bsd.port.mk>
