
SUBDIRS = \
	vapi \
	librescl \
	test \
	plugins \
	po \
	scripts

INTLTOOL_FILES = intltool-extract.in \
                 intltool-merge.in \
                 intltool-update.in

librescldocdir = ${prefix}/doc/lscl
librescldoc_DATA = \
	README.md\
	COPYING\
	AUTHORS\
	ChangeLog\
	INSTALL\
	NEWS


EXTRA_DIST = \
	$(librescldoc_DATA) \
	$(INTLTOOL_FILES)


# Remove doc directory on uninstall
uninstall-local:
	-rm -r $(librescldocdir)

DISTCLEANFILES= intltool-extract \
                 intltool-merge \
                 intltool-update \
                 po/.intltool-merge-cache


ACLOCAL_AMFLAGS = -I m4
