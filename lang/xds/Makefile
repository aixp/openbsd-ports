# $OpenBSD$

ONLY_FOR_ARCHS =	i386

COMMENT =		Excelsior Oberon-2/Modula-2 compiler

DISTNAME =		xds-x86-251-enduser-linux
PKGNAME =		xds-2.51

CATEGORIES =		lang

HOMEPAGE =		http://www.excelsior-usa.com/

MAINTAINER =		Alexander Shiryaev <shiryaev.a.v@gmail.com>

# Excelsior Freeware
PERMIT_PACKAGE_CDROM =	Excelsior forbids any redistribution
PERMIT_PACKAGE_FTP =	Excelsior forbids any redistribution
PERMIT_DISTFILES_CDROM =Excelsior forbids any redistribution
PERMIT_DISTFILES_FTP =	Excelsior forbids any redistribution

MASTER_SITES =		http://www.excelsior-usa.com/download/xds25x/
EXTRACT_SUFX =		.tgz

USE_GMAKE =		Yes

MAKE_FILE =		lib.mkf
WRKDIST =		${WRKDIR}/xds
WRKBUILD =		${WRKSRC}/lib/x86

ALL_TARGET =		#

#pre-patch:
#	elf2olf -o linux ${WRKSRC}/bin/xc ${WRKSRC}/bin/h2d

post-patch:
	perl -pi -e s,'%%XDSDIR%%',${PREFIX}/xds,g ${WRKSRC}/bin/xcwork

post-build:
	cd ${WRKSRC} && env PATH=${WRKSRC}/bin ./apisyms-x86

do-install:
	rm -rf ${WRKSRC}/C ${WRKSRC}/include
	rm -f \
		${WRKSRC}/lib/x86/libmac_*.a \
		${WRKSRC}/*.prj \
		${WRKSRC}/apisyms-x86 \
		${WRKSRC}/bin/xdssamp
	find ${WRKSRC} -name "*.orig" -exec rm -f {} \;
	find ${WRKSRC} -name "*.mkf" -exec rm -f {} \;
	find ${WRKSRC} -type d -exec chmod 755 {} \;
	find ${WRKSRC} -type f -exec chmod 644 {} \;
	cd ${WRKSRC} && chmod 755 bin/xc bin/xcwork samples/buildx86
	mkdir ${PREFIX}/xds && cd ${WRKSRC} && pax -r -w . ${PREFIX}/xds

post-install:
	cd ${PREFIX}/bin && \
		ln -s ../xds/bin/xc xc && \
		ln -s ../xds/bin/xcwork xcwork && \
		ln -s ../xds/bin/h2d xds-h2d

do-regress:
	cd ${WRKSRC}/samples && env PATH=${WRKSRC}/bin:${PATH} ./buildx86

.include <bsd.port.mk>
