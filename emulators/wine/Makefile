# $OpenBSD$

COMMENT =	Windows programs launcher

# SHARED_LIBS +=  wine                      0.0 # 1.0
SHARED_LIBS +=  wine                      1.0

SHARED_ONLY =Yes
ONLY_FOR_ARCHS =i386 amd64

VER1 =	1.5

DISTNAME =	wine-${VER1}.14
CATEGORIES =	emulators

HOMEPAGE =	http://\winehq.org/

MAINTAINER =	Alexander Shiryaev <shiryaev.a.v@gmail.com>

# LGPLv2.1+
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes
PERMIT_DISTFILES_FTP =	Yes

MASTER_SITES =	${MASTER_SITE_SOURCEFORGE:=wine/} \
		http://prdownloads.sourceforge.net/wine \
		http://mirrors.ibiblio.org/wine/source/${VER1}/
EXTRACT_SUFX =	.tar.bz2

WANTLIB += c gettextpo m ossaudio pthread z
WANTLIB += crypto

MODULES =	devel/gettext \
		textproc/intltool

# build depends: devel/bison devel/flex
BUILD_DEPENDS =	devel/bison devel/flex
LIB_DEPENDS =	\
	converters/libiconv

#LIB_DEPENDS =	textproc/libxslt \
#	graphics/jpeg \
#	graphics/png \
#	graphics/libgphoto2 \
#	graphics/sane-backends \
#	graphics/lcms \
#	converters/libiconv
RUN_DEPENDS =	devel/desktop-file-utils

USE_GMAKE =	Yes
USE_LIBTOOL =	Yes
USE_GROFF =	Yes
CONFIGURE_STYLE =	gnu autoconf

CPPFLAGS =	-I${LOCALBASE}/include \
	-I${LOCALBASE}/include/libpng \
	-I${X11BASE}/include

LDFLAGS = \
	-L${LOCALBASE}/lib -L${X11BASE}/lib -pthread -lz -lm -lcrypto -liconv
#	-lz -lm -lcrypto -liconv

X_EXTRA_LIBS =	-L${X11BASE}/lib \
	-lXau -lXdmcp -ldrm -lGL -lGLU -lXxf86vm -lXdamage \
	-lxcb -lXau -lXdmcp

CONFIGURE_ENV = \
	CFLAGS="${CFLAGS}" \
	CPPFLAGS="${CPPFLAGS}" \
	LDFLAGS="${LDFLAGS}" \
	X_EXTRA_LIBS="${X_EXTRA_LIBS}" \
	FLEX="${PREFIX}/bin/gflex"

# User configuration dir for regress.
MAKE_ENV =	WINEPREFIX="${WRKBUILD}/.wine"

# CONFIGURE_ARGS = --help
CONFIGURE_ARGS = \
	--verbose \
	--without-pthread \
	--without-alsa --without-coreaudio --without-oss \
	--without-mpg123 --without-openal \
	--without-gsm \
	--without-gstreamer   \
	--without-sane --without-v4l --without-gphoto \
	--without-capi --without-cups --without-curses \
	--without-dbus --without-hal --without-ldap \
	--without-jpeg --without-tiff --without-png \
	--without-xml \
	--without-opencl \
	--with-fontconfig \
	--without-glu --without-opengl \
	--without-xcomposite --without-xinerama --with-xinput2 --with-xrandr \
	--without-gnutls --without-xslt \
	--without-openssl --without-osmesa --without-cms \
	--disable-win16 \
	--disable-tests

AUTOCONF_VERSION =	2.69

# NO_REGRESS =	Yes

# USE_SYSTRACE =	Yes

post-configure:
	cd ${WRKSRC} && ${MAKE} depend

.include <bsd.port.mk>
