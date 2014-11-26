<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0'>

  <!-- Here live locale-specific customizations to the HTML base stylesheet -->

  <xsl:param name="draft.mode">yes</xsl:param>
  <xsl:param name="draft.watermark.image">images/draft.png</xsl:param>

  <xsl:template name="user.header.navigation">
    <div id="vcws-version-notice">
<!--
    <p>This text is a work in progress&#8212;highly subject to
       change&#8212;and may not accurately describe any released
       version of the Apache&#8482; Subversion&#174; software.
       Bookmarking or otherwise referring others to this page is
       probably not such a smart idea.  Please visit
       <a href="http://www.svnbook.com/" >http://www.svnbook.com/</a>
       for stable versions of this book.</p>
-->
    <p>Dieser Text befindet sich gegenwärtig in Bearbeitung,
      unterliegt ständigen Änderungen und kann dadurch nicht
      stets akkurat irgendeine freigegebene Version der Software
      Apache&#8482; Subversion&#174; beschreiben. Das Speichern dieser
      Seite als Lesezeichen oder andere auf diese Seite zu verweisen,
      ist keine so gute Idee. Besuchen Sie
      <a href="http://www.svnbook.com/" >http://www.svnbook.com/</a>,
      um stabile Versionen dieses Buchs zu erhalten.</p>
    </div>
  </xsl:template>

  <xsl:template name="user.footer.navigation">
    <div id="vcws-footer">
    <hr/>
<!--
    <p>You are reading <em>Version Control with Subversion</em> (for
       Subversion 1.8), by Ben Collins-Sussman, Brian W. Fitzpatrick,
       and C. Michael Pilato.</p>
    <p>This work is licensed under
       the <a href="http://creativecommons.org/licenses/by/2.0/"
       >Creative Commons Attribution License v2.0</a>.</p>
    <p>To submit comments, corrections, or other contributions to the
       text, please visit <a href="http://www.svnbook.com/"
       >http://www.svnbook.com/</a>.</p>
-->
    <p>Sie lesen <em>Versionskontrolle mit Subversion</em> (für
       Subversion 1.8), von Ben Collins-Sussman, Brian W. Fitzpatrick und
       C. Michael Pilato.</p>
    <p>Dieeses Werk ist lizensiert unter
       der <a href="http://creativecommons.org/licenses/by/2.0/" >
         Creative Commons Attribution License v2.0</a>.</p>
     <p>Um Kommentare, Korrekturen oder anderweitige Beiträge
        einzureichen, gehen Sie bitte
        auf <a href="http://www.svnbook.com/" >http://www.svnbook.com/</a>.</p>
    </div>
  </xsl:template>

</xsl:stylesheet>
