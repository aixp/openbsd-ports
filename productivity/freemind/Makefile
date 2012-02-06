# $OpenBSD$

COMMENT=	"mind-mapping software written in Java"

VERSION=	0.8.0
DISTNAME=	freemind-bin-max-${VERSION:S/./_/g}
PKGNAME=	freemind-${VERSION}
CATEGORIES=	productivity

HOMEPAGE=	http://freemind.sourceforge.net/

# GPL
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=freemind/}

EXTRACT_SUFX=	.zip

MODULES=	java
MODJAVA_VER=	1.4+

NO_BUILD=	Yes
NO_REGRESS=	Yes

INST_DIR=	freemind

do-install:
	${INSTALL_DATA_DIR} ${PREFIX}/${INST_DIR}
	cd ${WRKDIR} && \
		${TAR} -cf - accessories bin doc freemind.sh lib license \
		patterns.xml plugins user.properties | \
		${TAR} -C ${PREFIX}/${INST_DIR} -xf -
	chmod +x ${PREFIX}/${INST_DIR}/freemind.sh
	${INSTALL_SCRIPT} ${FILESDIR}/freemind ${PREFIX}/bin/freemind
	@perl -pi -e 's,%%LOCALBASE%%,${LOCALBASE},g; \
		s,%%INST_DIR%%,${INST_DIR},g' ${PREFIX}/bin/freemind

.include <bsd.port.mk>
