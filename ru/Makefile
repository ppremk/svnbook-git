include ../tools/Makefile.base
FO_XSLTPROC_OPTS = --param fop1.extensions 1
L10N_REVISION = r


BOOKFILES = \
	book.xml \
	foreword.xml \
	ch00-preface.xml \
	ch01-fundamental-concepts.xml \
	ch02-basic-usage.xml \
	ch03-advanced-topics.xml \
	ch04-branching-and-merging.xml \
	ch05-repository-admin.xml \
	ch06-server-configuration.xml \
	ch07-customizing-svn.xml \
	ch08-embedding-svn.xml \
	ch09-reference.xml \
	appa-quickstart.xml \
	appb-svn-for-cvs-users.xml \
	appc-webdav.xml \
	copyright.xml

status:
	./bin/genstat --directory book --full --precision 2 $(BOOKFILES) >TRANSLATION-STATUS
