# $OpenBSD$

COMMENT =		dictionary lookup program

DISTNAME =		goldendict-1.0.1-src
PKGNAME =		${DISTNAME:S/-src//}

CATEGORIES =		textproc

REVISION =			0

HOMEPAGE =		http://goldendict.org/

MAINTAINER =		Alexander Shiryaev <shiryaev.a.v@gmail.com>

# GPLv3
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes
PERMIT_DISTFILES_FTP =	Yes

WANTLIB += QtDBus QtGui QtNetwork QtWebKit QtXml X11 Xtst c execinfo
WANTLIB += hunspell-1.2 iconv m ogg phonon pthread stdc++ vorbis
WANTLIB += vorbisfile z

MASTER_SITES =		${MASTER_SITE_SOURCEFORGE:=goldendict/}
EXTRACT_SUFX =		.tar.bz2

MODULES =		x11/qt4

LIB_DEPENDS =		audio/libvorbis \
			devel/libexecinfo \
			textproc/hunspell \
			x11/qt4

RUN_DEPENDS =		devel/desktop-file-utils

FAKE_FLAGS=		INSTALL_ROOT="${WRKINST}"

NO_REGRESS =		Yes

WRKDIST =		${WRKDIR}

USE_SYSTRACE=		Yes

post-patch:
	perl -pi -e "s:/usr:${PREFIX}:" ${WRKSRC}/redist/goldendict.desktop

do-configure:
	cd ${WRKDIST} && ${LOCALBASE}/bin/qmake4 \
		INCLUDEPATH+=${LOCALBASE}/include \
		INCLUDEPATH+=${X11BASE}/include \
		LIBS+=-L${LOCALBASE}/lib \
		LIBS+=-L${X11BASE}/lib \
		goldendict.pro

post-install:
	mkdir -p ${PREFIX}/share/apps/goldendict/locale
	${INSTALL_DATA} ${WRKSRC}/locale/*.qm ${PREFIX}/share/apps/goldendict/locale/

.include <bsd.port.mk>
