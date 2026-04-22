<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
  <xsl:output method="text" encoding="UTF-8" />
  <xsl:strip-space elements="*" />
  <xsl:template match="/data">
    <xsl:apply-templates select="./PublicationEntries" />
  </xsl:template>
  <xsl:template match="PublicationEntries/Article[@type='editorial_chapter']" priority="2">
  </xsl:template>
  <xsl:template match="PublicationEntries/InProceedings">
    <xsl:if test="not(./@published) or normalize-space(./@published) = 'True'">
      <xsl:text>@InProceedings{&#10;</xsl:text>
      <!-- Authors -->
      <xsl:text>    author = {</xsl:text>
      <xsl:apply-templates select="./author" />
      <xsl:text>},&#10;</xsl:text>
      <!-- Title -->
      <xsl:text>    title = {</xsl:text>
      <xsl:value-of select="normalize-space(./title)" />
      <xsl:text>},&#10;</xsl:text>
      <!-- Booktitle -->
      <xsl:text>    booktitle = {</xsl:text>
      <xsl:value-of select="normalize-space(./booktitle)" />
      <xsl:text>},&#10;</xsl:text>
      <!-- Year -->
      <xsl:text>    year = {</xsl:text>
      <xsl:value-of select="normalize-space(./year)" />
      <xsl:text>}</xsl:text>
      <!-- Pages -->
      <xsl:if test="./pages">
        <xsl:text>,&#10;    pages = {</xsl:text>
        <xsl:value-of select="normalize-space(./pages)" />
        <xsl:text>}</xsl:text>
      </xsl:if>
      <!-- Series -->
      <xsl:if test="./@series">
        <xsl:text>,&#10;    series = {</xsl:text>
        <xsl:value-of select="normalize-space(./@series)" />
        <xsl:text>}</xsl:text>
      </xsl:if>
      <!-- Volume -->
      <xsl:if test="./@volume">
        <xsl:text>,&#10;    volume = {</xsl:text>
        <xsl:value-of select="normalize-space(./@volume)" />
        <xsl:text>}</xsl:text>
      </xsl:if>
      <!-- Number -->
      <xsl:if test="./@number">
        <xsl:text>,&#10;    number = {</xsl:text>
        <xsl:value-of select="normalize-space(./@number)" />
        <xsl:text>}</xsl:text>
      </xsl:if>
      <!-- Publisher -->
      <xsl:if test="./@organization">
        <xsl:text>,&#10;    publisher = {</xsl:text>
        <xsl:value-of select="normalize-space(./@organization)" />
        <xsl:text>}</xsl:text>
      </xsl:if>
      <xsl:text>&#10;}&#10;</xsl:text>
    </xsl:if>
  </xsl:template>
  <xsl:template match="PublicationEntries/Proceedings">
    <xsl:if test="not(./@minor) or normalize-space(./@minor) != 'true'">
      <xsl:text>@Proceedings{&#10;</xsl:text>
      <!-- Editors -->
      <xsl:text>    editor = {</xsl:text>
      <xsl:apply-templates select="./editor" />
      <xsl:text>},&#10;</xsl:text>
      <!-- Title -->
      <xsl:text>    title = {</xsl:text>
      <xsl:value-of select="normalize-space(./title)" />
      <xsl:text>},&#10;</xsl:text>
      <!-- Year -->
      <xsl:text>    year = {</xsl:text>
      <xsl:value-of select="normalize-space(./year)" />
      <xsl:text>}</xsl:text>
      <!-- Series -->
      <xsl:if test="./@series">
        <xsl:text>,&#10;    series = {</xsl:text>
        <xsl:value-of select="normalize-space(./@series)" />
        <xsl:text>}</xsl:text>
      </xsl:if>
      <!-- Volume -->
      <xsl:if test="./@volume">
        <xsl:text>,&#10;    volume = {</xsl:text>
        <xsl:value-of select="normalize-space(./@volume)" />
        <xsl:text>}</xsl:text>
      </xsl:if>
      <!-- Publisher -->
      <xsl:if test="./@publisher or ./@organization">
        <xsl:text>,&#10;    publisher = {</xsl:text>
        <xsl:choose>
          <xsl:when test="./@publisher"><xsl:value-of select="normalize-space(./@publisher)" /></xsl:when>
          <xsl:otherwise><xsl:value-of select="normalize-space(./@organization)" /></xsl:otherwise>
        </xsl:choose>
        <xsl:text>}</xsl:text>
      </xsl:if>
      <!-- DOI -->
      <xsl:if test="./officialPDF/WebResource/@doi or ./authorPDF/WebResource/@doi or ./otherResources/WebResource/@doi">
        <xsl:text>,&#10;    doi = {</xsl:text>
        <xsl:value-of select="(./officialPDF/WebResource/@doi | ./authorPDF/WebResource/@doi | ./otherResources/WebResource/@doi)[1]" />
        <xsl:text>}</xsl:text>
      </xsl:if>
      <!-- URL -->
      <xsl:if test="./officialPDF/WebResource/@url or ./authorPDF/WebResource/@url or ./otherResources/WebResource/@url">
        <xsl:text>,&#10;    url = {</xsl:text>
        <xsl:value-of select="(./officialPDF/WebResource/@url | ./authorPDF/WebResource/@url | ./otherResources/WebResource/@url)[1]" />
        <xsl:text>}</xsl:text>
      </xsl:if>
      <xsl:text>&#10;}&#10;</xsl:text>
    </xsl:if>
  </xsl:template>
  <xsl:template match="PublicationEntries/Article">
    <xsl:if test="not(./@published) or normalize-space(./@published) = 'True'">
    <xsl:text>@Article{&#10;</xsl:text>
    <!-- Authors -->
    <xsl:text>    author = {</xsl:text>
    <xsl:apply-templates select="./author" />
    <xsl:text>},&#10;</xsl:text>
    <!-- Title -->
    <xsl:text>    title = {</xsl:text>
    <xsl:value-of select="normalize-space(./title)" />
    <xsl:text>},&#10;</xsl:text>
    <!-- Journal -->
    <xsl:text>    journal = {</xsl:text>
    <xsl:value-of select="normalize-space(./journal)" />
    <xsl:text>},&#10;</xsl:text>
    <!-- Year -->
    <xsl:text>    year = {</xsl:text>
    <xsl:value-of select="normalize-space(./year)" />
    <xsl:text>}</xsl:text>
    <!-- Volume -->
    <xsl:if test="./@volume">
      <xsl:text>,&#10;    volume = {</xsl:text>
      <xsl:value-of select="normalize-space(./@volume)" />
      <xsl:text>}</xsl:text>
    </xsl:if>
    <!-- Number -->
    <xsl:if test="./@number">
      <xsl:text>,&#10;    number = {</xsl:text>
      <xsl:value-of select="normalize-space(./@number)" />
      <xsl:text>}</xsl:text>
    </xsl:if>
    <!-- Publisher -->
    <xsl:if test="./@publisher">
      <xsl:text>,&#10;    publisher = {</xsl:text>
      <xsl:value-of select="normalize-space(./@publisher)" />
      <xsl:text>}</xsl:text>
    </xsl:if>
    <!-- Pages -->
    <xsl:if test="./start_page and ./end_page">
      <xsl:text>,&#10;    pages = {</xsl:text>
      <xsl:value-of select="normalize-space(./start_page)" />-<xsl:value-of select="normalize-space(./end_page)" />
      <xsl:text>}</xsl:text>
    </xsl:if>
    <xsl:text>&#10;}&#10;</xsl:text>
    </xsl:if>
  </xsl:template>
  <xsl:template match="PublicationEntries/Book">
    <xsl:choose>
      <xsl:when test="./@chapter">
        <xsl:text>@InBook{&#10;</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>@Book{&#10;</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <!-- Authors -->
    <xsl:text>    author = {</xsl:text>
    <xsl:apply-templates select="./author" />
    <xsl:text>},&#10;</xsl:text>
    <!-- Title -->
    <xsl:text>    title = {</xsl:text>
    <xsl:value-of select="normalize-space(./title)" />
    <xsl:text>},&#10;</xsl:text>
    <!-- Year -->
    <xsl:text>    year = {</xsl:text>
    <xsl:value-of select="normalize-space(./year)" />
    <xsl:text>}</xsl:text>
    <!-- Chapter -->
    <xsl:if test="./@chapter">
      <xsl:text>,&#10;    volume = {</xsl:text>
      <xsl:value-of select="normalize-space(./@chapter)" />
      <xsl:text>}</xsl:text>
    </xsl:if>
    <!-- Publisher -->
    <xsl:if test="./@publisher">
      <xsl:text>,&#10;    publisher = {</xsl:text>
      <xsl:value-of select="normalize-space(./@publisher)" />
      <xsl:text>}</xsl:text>
    </xsl:if>
    <xsl:text>&#10;}&#10;</xsl:text>
  </xsl:template>
  <xsl:template match="PublicationEntries/Thesis">
    <xsl:choose>
      <xsl:when test="normalize-space(./@degree) = 'Ph.D.'">
        <xsl:text>@PhdThesis{&#10;</xsl:text>
      </xsl:when>
      <xsl:when test="normalize-space(./@degree) = 'master'">
        <xsl:text>@MasterThesis{&#10;</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>@Thesis{&#10;</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <!-- Authors -->
    <xsl:text>    author = {</xsl:text>
    <xsl:apply-templates select="./author" />
    <xsl:text>},&#10;</xsl:text>
    <!-- Title -->
    <xsl:text>    title = {</xsl:text>
    <xsl:value-of select="normalize-space(./title)" />
    <xsl:text>},&#10;</xsl:text>
    <!-- School -->
    <xsl:text>    school = {</xsl:text>
    <xsl:value-of select="normalize-space(./school)" />
    <xsl:text>},&#10;</xsl:text>
    <!-- Year -->
    <xsl:text>    year = {</xsl:text>
    <xsl:value-of select="normalize-space(./year)" />
    <xsl:text>}&#10;}&#10;</xsl:text>
  </xsl:template>
  <xsl:template match="author|editor">
    <xsl:param name="japanese">False</xsl:param>
    <xsl:choose>
      <xsl:when test="./@japanese and $japanese != 'False'"><xsl:value-of select="./@japanese" /></xsl:when>
      <xsl:otherwise><xsl:value-of select="text()" /></xsl:otherwise>
    </xsl:choose>
    <!-- handling and -->
    <xsl:if test="position() != last()">
      <xsl:text> and </xsl:text>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
