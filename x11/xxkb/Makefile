COMMENT=		"XKB keyboard layout switcher"

DISTNAME=		xxkb-1.11-src
PKGNAME=		xxkb_noicons-1.11

CATEGORIES=		x11

PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=Yes
PERMIT_DISTFILES_FTP=	Yes
WANTLIB=		X11 Xt SM ICE Xpm Xext c

MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=xxkb/}

USE_X11=		Yes
CONFIGURE_STYLE=	imake noman

WRKDIST=		${WRKDIR}/xxkb

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/xxkb ${PREFIX}/bin/
	${INSTALL_DATA} ${WRKSRC}/XXkb.ad ${PREFIX}/lib/X11/app-defaults/XXkb

.include <bsd.port.mk>
