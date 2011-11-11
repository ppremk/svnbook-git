<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0'>

  <!-- Here live locale-specific customizations to the HTML base stylesheet -->

  <xsl:param name="draft.mode">yes</xsl:param>
  <xsl:param name="draft.watermark.image">images/draft.png</xsl:param>

  <xsl:template name="user.header.navigation">
    <div id="vcws-header">
    <hr/>
    <p>This text is a work in progress&#8212;highly subject to
       change&#8212;and may not accurately describe any released
       version of the Apache&#8482; Subversion&#174; software.
       Bookmarking or otherwise referring others to this page is
       probably not such a smart idea.  Please visit
       <a href="http://www.svnbook.com/" >http://www.svnbook.com/</a>
       for stable versions of this book.</p>
    </div>
  </xsl:template>

  <xsl:template name="user.footer.navigation">
    <div id="vcws-footer">
    <hr/>
    <img src="images/cc-by.png" style="float: right;" />
    <p>You are reading <em>Version Control with Subversion</em> (for
       Subversion 1.7), by Ben Collins-Sussman, Brian W. Fitzpatrick,
       and C. Michael Pilato.</p>
    <p>This work is licensed under
       the <a href="http://creativecommons.org/licenses/by/2.0/"
       >Creative Commons Attribution License v2.0</a>.</p>
    <p>To submit comments, corrections, or other contributions to the
       text, please visit <a href="http://www.svnbook.com/"
       >http://www.svnbook.com/</a>.</p>
    </div>
  </xsl:template>

</xsl:stylesheet>
