<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0'>

  <!-- Here live locale-specific customizations to the FO base stylesheet -->

  <xsl:param name="draft.mode">yes</xsl:param>
  <xsl:param name="body.font.family">serif,SimSun,KaiTi_GB2312</xsl:param>
  <xsl:param name="title.font.family">DroidSansFallback</xsl:param>

  <!-- override default setting in xsl/fo/inline.xsl, to be consistent
       with html.
  -->
  <xsl:template match="userinput">
    <xsl:call-template name="inline.monoseq"/>
  </xsl:template>

  <xsl:template match="filename">
    <xsl:call-template name="inline.italicseq"/>
  </xsl:template>

  <xsl:template match="command">
    <xsl:call-template name="inline.italicseq"/>
  </xsl:template>

  <xsl:attribute-set name="formal.title.properties">
    <xsl:attribute name="font-weight">normal</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="root.properties">
    <xsl:attribute name="line-height">1.5</xsl:attribute>
  </xsl:attribute-set>

  <xsl:param name="local.l10n.xml" select="document('')"/>
  <l:i18n xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0">
    <l:l10n language="zh_cn">
      <l:context name="authorgroup">
        <l:template name="sep" text=", "/>
        <l:template name="sep2" text=" 和 "/>
        <l:template name="seplast" text=" 和 "/>
      </l:context>

      <l:context name="index">
        <l:template name="term-separator" text=", "/>
        <l:template name="number-separator" text=", "/>
        <l:template name="range-separator" text="-"/>
      </l:context>
    </l:l10n>
  </l:i18n>
</xsl:stylesheet>
