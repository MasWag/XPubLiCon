<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
  <xsl:output method="xml" encoding="UTF-8"/>
  <xsl:template match="/data">
    <ul>
      <xsl:apply-templates select="./PublicationEntries/Article[@type='editorial_chapter'] | ./PublicationEntries/Proceedings" />
    </ul>
  </xsl:template>
  <xsl:template match="PublicationEntries/Article[@type='editorial_chapter']">
    <li>
      <span class="authors"><xsl:apply-templates select="./author" /></span>
      <span class="title"><xsl:value-of select="normalize-space(./title)" /></span>
      <span class="book-name">
        <xsl:choose>
          <xsl:when test="./@published and ./@published = 'false' and ./journal/@abbr">
            To appear in <xsl:value-of select="normalize-space(./journal/@abbr)" />
          </xsl:when>
          <xsl:when test="./@published and ./@published = 'false' and (not (./journal/@abbr))">
            To appear in <xsl:value-of select="normalize-space(./journal)" />
          </xsl:when>
          <xsl:when test="not (./@published and ./@published = 'false') and ./journal/@abbr">
            <xsl:value-of select="normalize-space(./journal/@abbr)" />
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="normalize-space(./journal)" />
          </xsl:otherwise>
        </xsl:choose>
      </span>,
      <xsl:if test="./volume">
        <span class="volume">vol. <xsl:value-of select="normalize-space(./volume)" /></span>,
      </xsl:if>
      <xsl:if test="./number">
        <span class="number">issue <xsl:value-of select="normalize-space(./number)" /></span>,
      </xsl:if>
      <xsl:if test="./start_page">
        <span class="pages">pp. <xsl:value-of select="normalize-space(./start_page)" />-<xsl:value-of select="normalize-space(./end_page)" /></span>,
      </xsl:if>
      <span class="year"><xsl:value-of select="normalize-space(./year)" /></span>
      <xsl:if test="./@publisher">,
        <span class="organization">
          <xsl:value-of select="normalize-space(./@publisher)" />
        </span>
      </xsl:if>.
      <xsl:if test="./note"><br />
        <xsl:apply-templates select="./note" />
      </xsl:if>
      <xsl:if test="./officialPDF or ./authorPDF or ./otherResources"><br />
        [<xsl:if test="./officialPDF">
        <xsl:apply-templates select="./officialPDF/WebResource" />
      </xsl:if>
      <xsl:if test="./officialPDF and (./authorPDF or ./otherResources)">
        <xsl:text> | </xsl:text>
      </xsl:if>
      <xsl:if test="./authorPDF">
        <xsl:apply-templates select="./authorPDF/WebResource" />
        </xsl:if>
      <xsl:if test="./authorPDF and ./otherResources">
        <xsl:text> | </xsl:text>
      </xsl:if>
      <xsl:if test="./otherResources">
        <xsl:apply-templates select="./otherResources" />
        </xsl:if>]
      </xsl:if>
    </li>
  </xsl:template>
  <xsl:template match="PublicationEntries/Proceedings">
    <xsl:choose>
      <xsl:when test="./@minor = 'true'">
      </xsl:when>
      <xsl:otherwise>
        <li>
          <span class="authors"><xsl:apply-templates select="./editor" /> (eds.)</span>
          <span class="title"><xsl:value-of select="normalize-space(./title)" /></span>
          <xsl:if test="./@series or ./@volume">
            <span class="book-name">
              <xsl:if test="./@series"><xsl:value-of select="normalize-space(./@series)" /></xsl:if>
              <xsl:if test="./@series and ./@volume"><xsl:text> </xsl:text></xsl:if>
              <xsl:if test="./@volume"><xsl:value-of select="normalize-space(./@volume)" /></xsl:if>
            </span>,
          </xsl:if>
          <span class="year"><xsl:value-of select="normalize-space(./year)" /></span>
          <xsl:if test="./@publisher or ./@organization">,
            <span class="organization">
              <xsl:choose>
                <xsl:when test="./@publisher"><xsl:value-of select="normalize-space(./@publisher)" /></xsl:when>
                <xsl:otherwise><xsl:value-of select="normalize-space(./@organization)" /></xsl:otherwise>
              </xsl:choose>
            </span>
          </xsl:if>.
          <xsl:if test="./note"><br />
            <xsl:apply-templates select="./note" />
          </xsl:if>
          <xsl:if test="./officialPDF or ./authorPDF or ./otherResources">
            <br />
            <xsl:text>[</xsl:text>
            <xsl:if test="./officialPDF">
              <xsl:apply-templates select="./officialPDF/WebResource" />
            </xsl:if>
            <xsl:if test="./officialPDF and (./authorPDF or ./otherResources)">
              <xsl:text> | </xsl:text>
            </xsl:if>
            <xsl:if test="./authorPDF">
              <xsl:apply-templates select="./authorPDF/WebResource" />
            </xsl:if>
            <xsl:if test="./authorPDF and ./otherResources">
              <xsl:text> | </xsl:text>
            </xsl:if>
            <xsl:if test="./otherResources">
              <xsl:apply-templates select="./otherResources" />
            </xsl:if>
            <xsl:text>]</xsl:text>
          </xsl:if>
        </li>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="author">
    <xsl:if test="./@url">
      <xsl:element name="a">
        <xsl:attribute name="href">
          <xsl:value-of select="./@url" />
        </xsl:attribute>
        <xsl:apply-templates />
      </xsl:element>
    </xsl:if>
    <xsl:if test="not(./@url)"><xsl:apply-templates /></xsl:if>
    <xsl:if test="position()!=last()">, </xsl:if>
  </xsl:template>
  <xsl:template match="editor">
    <xsl:if test="./@url">
      <xsl:element name="a">
        <xsl:attribute name="href">
          <xsl:value-of select="./@url" />
        </xsl:attribute>
        <xsl:apply-templates />
      </xsl:element>
    </xsl:if>
    <xsl:if test="not(./@url)"><xsl:apply-templates /></xsl:if>
    <xsl:if test="position()!=last()">, </xsl:if>
  </xsl:template>
  <xsl:template match="WebResource">
    <xsl:element name="a">
      <xsl:attribute name="href">
        <xsl:if test="./@doi">
          <xsl:text>https://doi.org/</xsl:text>
          <xsl:value-of select="normalize-space(./@doi)" />
        </xsl:if>
        <xsl:if test="./@url">
          <xsl:value-of select="normalize-space(./@url)" />
        </xsl:if>
      </xsl:attribute>
      <xsl:value-of select="normalize-space(./@label)" />
    </xsl:element>
  </xsl:template>
  <xsl:template match="otherResources">
    <xsl:apply-templates select="./WebResource" />
    <xsl:if test="position()!=last()"><xsl:text> | </xsl:text></xsl:if>
  </xsl:template>
</xsl:stylesheet>
