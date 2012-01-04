# $OpenBSD$

ONLY_FOR_ARCHS =	i386

COMMENT =		Excelsior Oberon-2/Modula-2 compiler

DISTNAME =		xds-260-beta-linux
PKGNAME =		xds-2.60-beta

REVISION =		0

CATEGORIES =		lang

HOMEPAGE =		http://www.excelsior-usa.com/

MAINTAINER =		Alexander Shiryaev <shiryaev.a.v@gmail.com>

# Excelsior Freeware
PERMIT_PACKAGE_CDROM =	Excelsior forbids any redistribution
PERMIT_PACKAGE_FTP =	Excelsior forbids any redistribution
PERMIT_DISTFILES_CDROM =Excelsior forbids any redistribution
PERMIT_DISTFILES_FTP =	Excelsior forbids any redistribution

MASTER_SITES =		http://www.excelsior-usa.com/download/xds26x/
EXTRACT_SUFX =		.tgz

USE_GMAKE =		Yes

WRKDIST =		${WRKDIR}/xds

pre-build:
	perl -pi -e s,'%%XDSDIR%%',${PREFIX}/xds,g ${WRKSRC}/bin/xcwork
	perl -pi -e s,'%%XDSDIR%%',${PREFIX}/xds,g ${WRKSRC}/bin/xmwork

post-build:
	cd ${WRKSRC} && env PATH=${WRKSRC}/bin ./apisyms-x86 && env PATH=${WRKSRC}/bin ./apisyms-c

do-install:
	rm -rf ${WRKSRC}/C
	rm -f \
		${WRKSRC}/lib/x86/libmac_*.a \
		${WRKSRC}/*.prj \
		${WRKSRC}/apisyms-* \
		${WRKSRC}/bin/xdssamp
	find ${WRKSRC} -name "*.orig" -exec rm -f {} \;
	find ${WRKSRC} -name "*.mkf" -exec rm -f {} \;
	find ${WRKSRC} -type d -exec chmod 755 {} \;
	find ${WRKSRC} -type f -exec chmod 644 {} \;
	cd ${WRKSRC} && chmod 755 bin/xm bin/xmwork bin/xc bin/xcwork samples/buildx86
	mkdir ${PREFIX}/xds && cd ${WRKSRC} && pax -r -w . ${PREFIX}/xds

post-install:
	cd ${PREFIX}/bin && \
		ln -s ../xds/bin/xm xm && \
		ln -s ../xds/bin/xmwork xmwork && \
		ln -s ../xds/bin/xc xc && \
		ln -s ../xds/bin/xcwork xcwork && \
		ln -s ../xds/bin/h2d h2d

do-regress:
	find ${WRKSRC}/samples -name "*.sym" -exec rm -f {} \;
	cd ${WRKSRC}/samples && env PATH=${WRKSRC}/bin:${PATH} ./buildx86
	find ${WRKSRC}/samples -name "*.sym" -exec rm -f {} \;
	cd ${WRKSRC}/samples && env PATH=${WRKSRC}/bin:${PATH} ./buildc

do-build:
	cd ${WRKSRC}/lib/x86 && gmake -f lib.mkf
	cd ${WRKSRC}/lib/x86 && gmake -f tslib.mkf
	cd ${WRKSRC}/lib/C && gmake -f lib.mkf
	cd ${WRKSRC}/lib/C && gmake -f tslib.mkf

.include <bsd.port.mk>
