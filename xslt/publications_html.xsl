<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
  <xsl:output method="xml" encoding="UTF-8"/>
  <xsl:template match="/data">
    <ul>
      <xsl:apply-templates select="./PublicationEntries" />
    </ul>
  </xsl:template>
  <xsl:template match="PublicationEntries/InProceedings">
    <li>
      <span class="authors"><xsl:apply-templates select="./author" /></span>
      <span class="title"><xsl:value-of select="normalize-space(./title)" /></span>
      <span class="book-name">
        <xsl:choose>
          <xsl:when test="./@published and ./@published = 'false' and ./@abbr">
            To appear in Proc. <xsl:value-of select="normalize-space(./booktitle/@abbr)" /><xsl:text> </xsl:text><xsl:value-of select="normalize-space(./year)" />
          </xsl:when>
          <xsl:when test="./@published and ./@published = 'false' and not ./@abbr">
            To appear in Proc. <xsl:value-of select="normalize-space(./booktitle/)" /><xsl:text> </xsl:text><xsl:value-of select="normalize-space(./year)" />
          </xsl:when>
          <xsl:when test="not (./@published and ./@published = 'false') and ./@abbr">
            Proc. <xsl:value-of select="normalize-space(./booktitle/@abbr)" /><xsl:text> </xsl:text><xsl:value-of select="normalize-space(./year)" />
          </xsl:when>
          <xsl:otherwise>
            Proc. <xsl:value-of select="normalize-space(./booktitle)" /><xsl:text> </xsl:text><xsl:value-of select="normalize-space(./year)" />
          </xsl:otherwise>
        </xsl:choose>
        </span>
      <xsl:if test="./@volume">, 
      <xsl:if test="./@series"><xsl:value-of select="normalize-space(./@series)" /><xsl:text> </xsl:text></xsl:if>
      <xsl:if test="not(./@series)">vol. </xsl:if>
      <xsl:value-of select="normalize-space(./@volume)" />
      </xsl:if>
      <xsl:if test="./number">, 
      No. <xsl:value-of select="normalize-space(./number)" />
      </xsl:if>
      <xsl:if test="./pages">, 
        <span class="pages">pp. <xsl:value-of select="normalize-space(./pages)" /></span>
      </xsl:if>
      <xsl:if test="./@organization">,
        <span class="organization"><xsl:value-of select="normalize-space(./@organization)" /></span>
        </xsl:if>.
        <xsl:if test="./officialPDF or ./authorPDF"><br />
        [<xsl:if test="./officialPDF">
        <xsl:apply-templates select="./officialPDF/WebResource" />
      </xsl:if>
      <xsl:if test="./officialPDF and ./authorPDF">
        <xsl:text> | </xsl:text>
      </xsl:if>
      <xsl:if test="./authorPDF">
        <xsl:apply-templates select="./authorPDF/WebResource" />
        </xsl:if>]
      </xsl:if>
      <xsl:if test="./otherResources">
        [<xsl:apply-templates select="./otherResources" />]
      </xsl:if>
    </li>
  </xsl:template>
  <xsl:template match="PublicationEntries/Article">
    <li>
      <span class="authors"><xsl:apply-templates select="./author" /></span>
      <span class="title"><xsl:value-of select="normalize-space(./title)" /></span>
      <span class="book-name"><xsl:value-of select="normalize-space(./journal)" /></span>,
      <xsl:if test="./volume">
        <span class="volume">vol. <xsl:value-of select="normalize-space(./volume)" /></span>,
      </xsl:if>
      <xsl:if test="./number">
        <span class="number">no. <xsl:value-of select="normalize-space(./number)" /></span>,
      </xsl:if>
      <span class="pages">pp. <xsl:value-of select="normalize-space(./begin_pages)" />-<xsl:value-of select="normalize-space(./end_pages)" /></span>,
      <span class="year"><xsl:value-of select="normalize-space(./year)" /></span>
      <xsl:if test="./@publisher">,
        <span class="organization">
          <xsl:value-of select="normalize-space(./@publisher)" />
        </span>
        </xsl:if>.
      <xsl:if test="./note"><br />
        <xsl:apply-templates select="./note" />
      </xsl:if>
        <xsl:if test="./officialPDF or ./authorPDF"><br />
        [<xsl:if test="./officialPDF">
        <xsl:apply-templates select="./officialPDF/WebResource" />
      </xsl:if>
      <xsl:if test="./officialPDF and ./authorPDF">
        <xsl:text> | </xsl:text>
      </xsl:if>
      <xsl:if test="./authorPDF">
        <xsl:apply-templates select="./authorPDF/WebResource" />
        </xsl:if>]
      </xsl:if>
    </li>
  </xsl:template>
  <xsl:template match="PublicationEntries/Book">
    <li>
      <span class="authors"><xsl:apply-templates select="./author" /></span>
      <span class="title"><xsl:value-of select="normalize-space(./title)" /></span>
      <span class="year"><xsl:value-of select="normalize-space(./year)" /></span>
      <xsl:if test="./@publisher">
        <span class="organization"><xsl:value-of select="normalize-space(./@publisher)" /></span>
      </xsl:if>.
    </li>
  </xsl:template>
  <xsl:template match="dblp/incollection">
    (`<xsl:value-of select="./@key" />`, InProceedings(|
    author = {|<xsl:apply-templates select="./author" />|};
    title = {<xsl:value-of select="normalize-space(./title)" />};
    booktitle = {<xsl:value-of select="normalize-space(./booktitle)" />};
    series = None; <!-- TODO: Perhaps this is available in crossref -->
    volume = None; <!-- TODO: Perhaps this is available in crossref -->
    number = None; <!-- TODO: Perhaps this is available in crossref -->
    pages = (<xsl:value-of select="translate(normalize-space(./pages),'-',',')" />);
    year = <xsl:value-of select="normalize-space(./year)" />;
    |));
  </xsl:template>
  <xsl:template match="dblp/www">
    (`<xsl:value-of select="./@key" />`, WebSite(|
    author = {|<xsl:apply-templates select="./author" />|};
    title = {<xsl:value-of select="normalize-space(./title)" />};
    url = `<xsl:value-of select="normalize-space(./url)" />`;
    year = <xsl:value-of select="normalize-space(./year)" />;
    |));
  </xsl:template>
  <xsl:template match="PublicationEntries/Thesis">
    <li>
      <span class="authors"><xsl:apply-templates select="./author" /></span>
      <span class="title"><xsl:value-of select="normalize-space(./title)" /></span>
      <span class="book-name"><xsl:value-of select="normalize-space(./@degree)" /> Thesis</span>,
      <span class="organization"><xsl:value-of select="normalize-space(./school)" /></span>,
      <span class="year"><xsl:value-of select="normalize-space(./year)" /></span>.
    </li>
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
    <xsl:apply-templates />
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
