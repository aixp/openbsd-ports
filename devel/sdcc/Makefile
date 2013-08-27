# $OpenBSD: Makefile,v 1.10 2013/07/01 10:39:18 sthen Exp $

COMMENT=	Small Device C Compiler
BROKEN-sparc64=	illegal operands building SDCCval.c

DISTNAME=	sdcc-src-3.3.0
PKGNAME=	${DISTNAME:S/-src//}
EXTRACT_SUFX=	.tar.bz2
CATEGORIES=	devel

HOMEPAGE=	http://sdcc.sourceforge.net/

# GPL
PERMIT_PACKAGE_CDROM=	Yes
WANTLIB=		c m stdc++ readline termcap

MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=sdcc/}

BUILD_DEPENDS=		${RUN_DEPENDS}
RUN_DEPENDS=		devel/gputils
LIB_DEPENDS=		devel/boost

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	docdir=${PREFIX}/share/doc/sdcc
CONFIGURE_ENV+=		CFLAGS="${CFLAGS} -I${LOCALBASE}/include" \
			CXXFLAGS="${CXXFLAGS} -I${LOCALBASE}/include" \
			LDFLAGS="${LDFLAGS} -I${LOCALBASE}/lib"

USE_GMAKE=		Yes

WRKDIST=		${WRKDIR}/${DISTNAME:S/-src//}

.include <bsd.port.mk>
