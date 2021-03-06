# $OpenBSD: Makefile,v 1.19 2011/06/08 17:41:58 rpointel Exp $

SHARED_ONLY=            Yes

COMMENT=                python bindings for the GtkSourceView library

GNOME_PROJECT=          pygtksourceview
GNOME_VERSION=          2.10.1
PKGNAME=                py-gtksourceview-${GNOME_VERSION}
REVISION=               4

EXTRACT_SUFX=          .tar.bz2

CATEGORIES=             x11

HOMEPAGE=               http://projects.gnome.org/gtksourceview/pygtksourceview.html

MAINTAINER=             Jasper Lievisse Adriaanse <jasper@openbsd.org>, \
                        Antoine Jacoutot <ajacoutot@openbsd.org>

# LGPLv2
PERMIT_PACKAGE_CDROM=   Yes
PERMIT_PACKAGE_FTP=     Yes
PERMIT_DISTFILES_CDROM= Yes
PERMIT_DISTFILES_FTP=   Yes

MODULES=                devel/gettext lang/python x11/gnome

WANTLIB += X11 Xau Xcomposite Xcursor Xdamage Xdmcp Xext Xfixes
WANTLIB += Xi Xinerama Xrandr Xrender atk-1.0 cairo expat ffi
WANTLIB += fontconfig freetype gdk-x11-2.0 gdk_pixbuf-2.0 gio-2.0
WANTLIB += glib-2.0 gmodule-2.0 gobject-2.0
WANTLIB += gtk-x11-2.0 m pango-1.0 pangocairo-1.0 pangoft2-1.0
WANTLIB += pcre pixman-1 png pthread-stubs xcb xml2 z
WANTLIB += xcb-render xcb-render-util gtksourceview-2.0

LIB_DEPENDS=            x11/gtksourceview
BUILD_DEPENDS=          ${RUN_DEPENDS} \
                        textproc/libxslt \
                        textproc/docbook-xsl
RUN_DEPENDS=            devel/py-gobject>=2.15.2 \
                        x11/py-gtk2

CONFIGURE_STYLE=        gnu

LIBTOOL_FLAGS=          --tag=disable-static

.include <bsd.port.mk>
