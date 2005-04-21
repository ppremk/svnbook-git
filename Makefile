# Paths which you may wish to customize:
XSLTPROC = xsltproc
XMLLINT = xmllint
INSTALL_DIR = $(DESTDIR)/usr/share/doc/subversion
INSTALL = install
SVNVERSION = svnversion

# You should not normally need to edit anything below here.
SHELL = /bin/sh

TOOLS_DIR = ../tools
BOOK_DIR = book
BOOK_HTML_CHUNK_DIR = $(BOOK_DIR)/html-chunk
BOOK_HTML_TARGET = $(BOOK_DIR)/svn-book.html
# In the HTML chunk build, index.html is created last, so serves as an 
# acceptable timestamp file for the entire multi-file output.
BOOK_HTML_CHUNK_TARGET = $(BOOK_HTML_CHUNK_DIR)/index.html
BOOK_PDF_TARGET = $(BOOK_DIR)/svn-book.pdf
BOOK_PS_TARGET = $(BOOK_DIR)/svn-book.ps
BOOK_FO_TARGET = $(BOOK_DIR)/svn-book.fo
BOOK_XML_SOURCE = $(BOOK_DIR)/book.xml
BOOK_VERSION_SOURCE = $(BOOK_DIR)/version.xml
BOOK_ALL_SOURCE = $(BOOK_DIR)/*.xml
BOOK_IMAGES = $(BOOK_DIR)/images/*.png
BOOK_INSTALL_DIR = $(INSTALL_DIR)/book

ENSURE_XSL = if ! test -e "$(TOOLS_DIR)/xsl"; \
	     then $(TOOLS_DIR)/bin/find-xsl.py; fi

# Customization hooks for xsltproc options
BOOK_HTML_XSLTPROC_OPTS = 
BOOK_FO_XSLTPROC_OPTS =
# FO example: --stringparam page.height 9in --stringparam page.width 6.4in

# Uncomment the following line if you'd like to print on A4 paper
# BOOK_FO_XSLTPROC_OPTS = --stringparam paper.type A4

# Grouping targets
all: all-book
all-book: book-html book-html-chunk book-pdf book-ps
all-html: book-html book-html-chunk
all-pdf: book-pdf
all-ps: book-ps

install: install-book
install-book: install-book-html install-book-html-chunk \
	      install-book-pdf install-book-ps

clean: book-clean

# Build targets
$(BOOK_VERSION_SOURCE): book-version

book-version:
	@if $(SVNVERSION) . > /dev/null; then \
	  echo '<!ENTITY svn.version "Revision '`$(SVNVERSION) .`'">' \
	    > $(BOOK_VERSION_SOURCE).tmp; \
	else \
	  echo '<!ENTITY svn.version "">' > $(BOOK_VERSION_SOURCE).tmp; \
	fi
	@if cmp -s $(BOOK_VERSION_SOURCE) $(BOOK_VERSION_SOURCE).tmp; then \
	  rm $(BOOK_VERSION_SOURCE).tmp; \
	else \
	  mv $(BOOK_VERSION_SOURCE).tmp $(BOOK_VERSION_SOURCE); \
	fi

book-html: $(BOOK_HTML_TARGET)
$(BOOK_HTML_TARGET): $(BOOK_ALL_SOURCE) $(BOOK_VERSION_SOURCE)
	$(ENSURE_XSL)
	$(XSLTPROC) $(BOOK_HTML_XSLTPROC_OPTS) --output $(BOOK_HTML_TARGET) \
	  $(TOOLS_DIR)/html-stylesheet.xsl $(BOOK_XML_SOURCE)

# The trailing slash on the xsltproc --output option is essential to
# output pages into the directory
book-html-chunk: $(BOOK_HTML_CHUNK_TARGET)
$(BOOK_HTML_CHUNK_TARGET): $(BOOK_ALL_SOURCE) $(BOOK_VERSION_SOURCE) \
                           $(BOOK_DIR)/styles.css $(BOOK_IMAGES)
	mkdir -p $(BOOK_HTML_CHUNK_DIR)
	mkdir -p $(BOOK_HTML_CHUNK_DIR)/images
	$(ENSURE_XSL)
	$(XSLTPROC) $(BOOK_HTML_XSLTPROC_OPTS) \
           --output $(BOOK_HTML_CHUNK_DIR)/ \
	   $(TOOLS_DIR)/chunk-stylesheet.xsl $(BOOK_XML_SOURCE)
	cp $(BOOK_DIR)/styles.css $(BOOK_HTML_CHUNK_DIR)
	cp $(BOOK_IMAGES) $(BOOK_HTML_CHUNK_DIR)/images

$(BOOK_FO_TARGET): $(BOOK_ALL_SOURCE) $(BOOK_VERSION_SOURCE) $(BOOK_IMAGES)
	$(ENSURE_XSL)
	$(XSLTPROC) $(BOOK_FO_XSLTPROC_OPTS) --output $(BOOK_FO_TARGET) \
	  $(TOOLS_DIR)/fo-stylesheet.xsl $(BOOK_XML_SOURCE)

book-pdf: $(BOOK_PDF_TARGET)
$(BOOK_PDF_TARGET): $(BOOK_FO_TARGET) $(BOOK_IMAGES)
	$(TOOLS_DIR)/bin/run-fop.sh . -fo $(BOOK_FO_TARGET) \
	  -pdf $(BOOK_PDF_TARGET)

book-ps: $(BOOK_PS_TARGET)
$(BOOK_PS_TARGET): $(BOOK_FO_TARGET) $(BOOK_IMAGES)
	$(TOOLS_DIR)/bin/run-fop.sh . -fo $(BOOK_FO_TARGET) \
	  -ps $(BOOK_PS_TARGET)

# Install targets
$(BOOK_INSTALL_DIR):
	$(INSTALL) -d $(BOOK_INSTALL_DIR)

install-book-html: $(BOOK_HTML_TARGET)
	$(INSTALL) -d $(BOOK_INSTALL_DIR)/images
	$(INSTALL) $(BOOK_HTML_TARGET) $(BOOK_INSTALL_DIR)
	$(INSTALL) $(BOOK_DIR)/styles.css $(BOOK_INSTALL_DIR)
	$(INSTALL) $(BOOK_IMAGES) $(BOOK_INSTALL_DIR)/images

install-book-html-chunk: $(BOOK_HTML_CHUNK_TARGET)
	$(INSTALL) -d $(BOOK_INSTALL_DIR)/images
	$(INSTALL) $(BOOK_HTML_CHUNK_DIR)/*.html $(BOOK_INSTALL_DIR)
	$(INSTALL) $(BOOK_DIR)/styles.css $(BOOK_INSTALL_DIR)
	$(INSTALL) $(BOOK_IMAGES) $(BOOK_INSTALL_DIR)/images

install-book-pdf: $(BOOK_PDF_TARGET) $(BOOK_INSTALL_DIR)
	$(INSTALL) $(BOOK_PDF_TARGET) $(BOOK_INSTALL_DIR)

install-book-ps: $(BOOK_PS_TARGET) $(BOOK_INSTALL_DIR)
	$(INSTALL) $(BOOK_PS_TARGET) $(BOOK_INSTALL_DIR)

# Clean targets
book-clean:
	rm -f $(BOOK_VERSION_SOURCE)
	rm -f $(BOOK_HTML_TARGET) $(BOOK_FO_TARGET)
	rm -rf $(BOOK_HTML_CHUNK_DIR)
	rm -f $(BOOK_PDF_TARGET) $(BOOK_PS_TARGET) 

# Utility targets
valid: $(BOOK_VERSION_SOURCE)
	$(XMLLINT) --noout --nonet --valid $(BOOK_XML_SOURCE)

