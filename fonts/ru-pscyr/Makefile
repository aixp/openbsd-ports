# $OpenBSD$

COMMENT=		cyrillic PostScript Type1 fonts to use with TeX

DISTNAME=		pscyr-0.4d_beta9
REVISION=		1
PKGNAME=		ru-${DISTNAME}
CATEGORIES=		fonts russian print

MAINTAINER=		Alexander Yurchenko <grange@openbsd.org>

# Free redistribution is permitted without fonts files modifications
PERMIT_PACKAGE_CDROM=	may not sell
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	may not sell
PERMIT_DISTFILES_FTP=	Yes

MASTER_SITES=		ftp://scon155.phys.msu.su/pub/russian/psfonts/0.4d-beta/
MASTER_SITES0=		ftp://scon155.phys.msu.su/pub/russian/psfonts/0.4d-beta/T2D/

DISTFILES=		PSCyr-0.4-beta9-tex.tar.gz \
			PSCyr-0.4-beta9-type1.tar.gz \
			t2dcmr.fd:0 t2denc.def:0
EXTRACT_ONLY=		PSCyr-0.4-beta9-tex.tar.gz \
			PSCyr-0.4-beta9-type1.tar.gz
DIST_SUBDIR=	pscyr

# texmf-dist/tex/generic/babel/russianb.ldf
BUILD_DEPENDS=		print/texlive/base

RUN_DEPENDS=		print/texlive/base

NO_BUILD=		Yes
NO_REGRESS=		Yes
PKG_ARCH=		*

TEXMF_DIR=		${PREFIX}/share/texmf-local

WRKSRC=			${WRKDIR}/PSCyr
WRKDIST=		${WRKSRC}

post-extract:
	mkdir -p ${WRKDIST}/tex/generic/babel
	cp ${PREFIX}/share/texmf-dist/tex/generic/babel/russianb.ldf \
	    ${WRKDIST}/tex/generic/babel

do-install:
	${INSTALL_DATA_DIR} ${TEXMF_DIR}/fonts/map/dvips/pscyr
	${INSTALL_DATA_DIR} ${TEXMF_DIR}/fonts/map/dvipdfm/pscyr
	${INSTALL_DATA_DIR} ${TEXMF_DIR}/fonts/enc/dvips/pscyr
	${INSTALL_DATA_DIR} ${TEXMF_DIR}/tex/latex/pscyr
	${INSTALL_DATA_DIR} ${TEXMF_DIR}/fonts/tfm/public/pscyr
	${INSTALL_DATA_DIR} ${TEXMF_DIR}/fonts/vf/public/pscyr
	${INSTALL_DATA_DIR} ${TEXMF_DIR}/fonts/type1/public/pscyr
	${INSTALL_DATA_DIR} ${TEXMF_DIR}/fonts/afm/public/pscyr
	${INSTALL_DATA_DIR} ${TEXMF_DIR}/doc/fonts/pscyr
	${INSTALL_DATA_DIR} ${TEXMF_DIR}/tex/latex/cyrillic
	${INSTALL_DATA_DIR} ${TEXMF_DIR}/tex/generic/babel
	${INSTALL_DATA} ${WRKDIST}/dvips/pscyr/t2{a,d}.enc \
	    ${TEXMF_DIR}/fonts/enc/dvips/pscyr
	${INSTALL_DATA} ${WRKDIST}/dvips/pscyr/pscyr.map \
	    ${TEXMF_DIR}/fonts/map/dvips/pscyr
	${INSTALL_DATA} ${WRKDIST}/dvipdfm/base/pscyr2.map \
	    ${TEXMF_DIR}/fonts/map/dvipdfm/pscyr
	${INSTALL_DATA} ${WRKDIST}/tex/latex/pscyr/* \
	    ${TEXMF_DIR}/tex/latex/pscyr
	${INSTALL_DATA} ${WRKDIST}/fonts/tfm/public/pscyr/* \
	    ${TEXMF_DIR}/fonts/tfm/public/pscyr
	${INSTALL_DATA} ${WRKDIST}/fonts/vf/public/pscyr/* \
	    ${TEXMF_DIR}/fonts/vf/public/pscyr
	${INSTALL_DATA} ${WRKDIST}/fonts/type1/public/pscyr/* \
	    ${TEXMF_DIR}/fonts/type1/public/pscyr
	${INSTALL_DATA} ${WRKDIST}/fonts/afm/public/pscyr/* \
	    ${TEXMF_DIR}/fonts/afm/public/pscyr
	${INSTALL_DATA} ${WRKDIST}/{LICENSE,doc/README.koi,doc/PROBLEMS} \
	    ${TEXMF_DIR}/doc/fonts/pscyr
	${INSTALL_DATA} ${FULLDISTDIR}/t2d{cmr.fd,enc.def} \
	    ${TEXMF_DIR}/tex/latex/cyrillic
	${INSTALL_DATA} ${WRKDIST}/tex/generic/babel/russianb.ldf \
	    ${TEXMF_DIR}/tex/generic/babel

.include <bsd.port.mk>
