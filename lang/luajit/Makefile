# $OpenBSD$

ONLY_FOR_ARCHS=	amd64 i386

COMMENT =	JIT compiler for Lua
DISTNAME =	LuaJIT-2.0.0-beta11
PKGNAME = ${DISTNAME:L}

MASTER_SITES =	http://luajit.org/download/

CATEGORIES =	lang

HOMEPAGE =	http://luajit.org

MAINTAINER =	Aaron Bieber <abieber@openbsd.org>

# MIT
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes
PERMIT_DISTFILES_FTP =	Yes

WANTLIB =	c m

MODULES =	lang/lua

MAKE_ENV+= CFLAGS="${CFLAGS}" CPPFLAGS="${CPPFLGS}"

USE_GMAKE = Yes

USE_SYSTRACE = Yes

pre-configure: 
	${SUBST_CMD} ${WRKDIST}/Makefile

.include <bsd.port.mk>
