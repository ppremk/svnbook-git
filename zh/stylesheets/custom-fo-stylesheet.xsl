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

</xsl:stylesheet>
