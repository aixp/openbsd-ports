# $OpenBSD$

COMMENT =	vector graphics editor

#SHARED_LIBS +=		ipe			7.0
#SHARED_LIBS +=		ipecairo		7.0
#SHARED_LIBS +=		ipelua			7.0
#SHARED_LIBS +=		ipeqtcanvas		7.0
#SHARED_LIBS +=		ipeui			7.0

DISTNAME =	ipe-7.0.13
DISTFILES =	${DISTNAME}-src.tar.gz

CATEGORIES =	graphics

HOMEPAGE =	http://ipe7.sourceforge.net/

# GPLv3
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes
PERMIT_DISTFILES_FTP =	Yes

MASTER_SITES = 	${MASTER_SITE_SOURCEFORGE:=ipe7/}

WRKSRC =	${WRKDIR}/${DISTNAME}/src

MODULES =	x11/qt4 lang/lua converters/libiconv
LIB_DEPENDS =	x11/qt4 \
		graphics/cairo
RUN_DEPENDS =	print/ghostscript/gnu-fonts

WANTLIB += GL QtGui X11 Xau Xdamage Xdmcp Xext Xfixes Xrender
WANTLIB += Xxf86vm c cairo drm expat fontconfig freetype glib-2.0
WANTLIB += gobject-2.0 gthread-2.0 intl lua m pixman-1 png pthread
WANTLIB += pthread-stubs stdc++ xcb xcb-render xcb-shm z

USE_GMAKE =	Yes

MAKE_ENV =	IPEPREFIX=${LOCALBASE} \
		CPPFLAGS="${CFLAGS} -I${LOCALBASE}/include" \
		LDFLAGS="${LDFLAGS} -L${LOCALBASE}/lib" \
		LUA_LIBS="-L${MODLUA_LIBDIR} -llua"

FAKE_FLAGS =	IPEPREFIX="${WRKINST}${PREFIX}"

NO_REGRESS =	Yes

USE_SYSTRACE =	Yes

pre-configure:
	perl -pi -e s,'/usr/share/fonts/type1/gsfonts/','${LOCALBASE}/share/ghostscript/fonts/',g ${WRKSRC}/../fontmaps/gsfonts-fontmap.xml
	perl -pi -e s,'lua ','lua', ${WRKSRC}/../scripts/ipe-update-master

post-install:
	${INSTALL_DATA} ${WRKSRC}/../fontmaps/gsfonts-fontmap.xml ${PREFIX}/share/ipe/fontmap.xml

.include <bsd.port.mk>
