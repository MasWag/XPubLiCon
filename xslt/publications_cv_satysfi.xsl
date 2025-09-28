<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:output method="text" encoding="UTF-8"/>
<xsl:template match="/data">
let bibliography = [
  <xsl:apply-templates select="./PublicationEntries" />
]
</xsl:template>
<xsl:template match="PublicationEntries/InProceedings">
  <xsl:choose>
    <xsl:when test="./@minor = true">
    </xsl:when>
    <xsl:when test="./@published and ./@published = 'false'">
      ToAppear(|
      author = {|<xsl:apply-templates select="./author" />|};
      title = {<xsl:value-of select="normalize-space(./title)" />};
      booktitle = {<xsl:value-of select="normalize-space(./booktitle)" />};
      shortbooktitle = <xsl:if test="./booktitle/@abbr">Some({<xsl:value-of select="normalize-space(./booktitle/@abbr)" />});</xsl:if><xsl:if test="not(./booktitle/@abbr)">None;</xsl:if>
      year = <xsl:value-of select="normalize-space(./year)" />;
      |);
    </xsl:when>
    <xsl:when test="./@referee = 'false'">
    </xsl:when>
    <xsl:otherwise>
      InProceedings(|
      author = {|<xsl:apply-templates select="./author" />|};
      title = {<xsl:value-of select="normalize-space(./title)" />};
      booktitle = {<xsl:value-of select="normalize-space(./booktitle)" />};
      shortbooktitle = <xsl:if test="./booktitle/@abbr">Some({<xsl:value-of select="normalize-space(./booktitle/@abbr)" />});</xsl:if><xsl:if test="not(./booktitle/@abbr)">None;</xsl:if>
      series = <xsl:if test="./@series">Some({<xsl:value-of select="normalize-space(./@series)" />})</xsl:if><xsl:if test="not(./@series)">None</xsl:if>;
      volume = <xsl:if test="./@volume">Some(<xsl:value-of select="normalize-space(./@volume)" />)</xsl:if><xsl:if test="not(./@volume)">None</xsl:if>;
      number = <xsl:if test="./number">Some({<xsl:value-of select="normalize-space(./number)" />})</xsl:if><xsl:if test="not(./number)">None</xsl:if>;
      pages = <xsl:if test="./pages">Some((`<xsl:value-of select="substring-before(normalize-space(./pages),'-')" />`,`<xsl:value-of select="substring-after(normalize-space(./pages),'-')" />`))</xsl:if><xsl:if test="not(./pages)">None</xsl:if>;
      year = <xsl:value-of select="normalize-space(./year)" />;
      |);
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>
<xsl:template match="PublicationEntries/Article">
  <xsl:choose>
    <xsl:when test="./@published and ./@published = 'false'">
      ToAppear(|
      author = {|<xsl:apply-templates select="./author" />|};
      title = {<xsl:value-of select="normalize-space(./title)" />};
      booktitle = {<xsl:value-of select="normalize-space(./journal)" />};
      shortbooktitle = <xsl:if test="./journal/@abbr">Some({<xsl:value-of select="normalize-space(./journal/@abbr)" />});</xsl:if><xsl:if test="not(./journal/@abbr)">None;</xsl:if>
      year = <xsl:value-of select="normalize-space(./year)" />;
      |);
    </xsl:when>
    <xsl:when test="./@referee = 'false'">
        Misc(|
        author = {|<xsl:apply-templates select="./author" />|};
        title = {<xsl:value-of select="normalize-space(./title)" />};
        booktitle = {<xsl:value-of select="normalize-space(./journal)" />};
        shortbooktitle = <xsl:if test="./journal/@abbr">Some({<xsl:value-of select="normalize-space(./journal/@abbr)" />});</xsl:if><xsl:if test="not(./journal/@abbr)">None;</xsl:if>
        year = <xsl:value-of select="normalize-space(./year)" />;
        |);
    </xsl:when>
    <xsl:otherwise>
      Article(|
      author = {|<xsl:apply-templates select="./author" />|};
      title = {<xsl:value-of select="normalize-space(./title)" />};
      journal = {<xsl:value-of select="normalize-space(./journal)" />};
      shortjournal = <xsl:if test="./journal/@abbr">Some({<xsl:value-of select="normalize-space(./journal/@abbr)" />});</xsl:if><xsl:if test="not(./journal/@abbr)">None;</xsl:if>
      volume = <xsl:if test="./volume">Some(<xsl:value-of select="normalize-space(./volume)" />)</xsl:if><xsl:if test="not(./volume)">None</xsl:if>;
      number = <xsl:if test="./number">Some({<xsl:value-of select="normalize-space(./number)" />})</xsl:if><xsl:if test="not(./number)">None</xsl:if>;
      pages = (`<xsl:value-of select="normalize-space(./start_page)" />`,`<xsl:value-of select="normalize-space(./end_page)" />`);
      year = <xsl:value-of select="normalize-space(./year)" />;
      |);
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>
 <xsl:template match="PublicationEntries/Book">
   Book(|
    author = {|<xsl:apply-templates select="./author" /><xsl:if test="not(./author)"><xsl:apply-templates select="./editor" /></xsl:if>|};
    title = {<xsl:value-of select="normalize-space(./title)" />};
    publisher = {<xsl:value-of select="normalize-space(./publisher)" />};
    year = <xsl:value-of select="normalize-space(./year)" />;
  |);
</xsl:template>
<xsl:template match="dblp/incollection">
  InProceedings(|
    author = {|<xsl:apply-templates select="./author" />|};
    title = {<xsl:value-of select="normalize-space(./title)" />};
    booktitle = {<xsl:value-of select="normalize-space(./booktitle)" />};
    series = None; <!-- TODO: Perhaps this is available in crossref -->
    volume = None; <!-- TODO: Perhaps this is available in crossref -->
    number = None; <!-- TODO: Perhaps this is available in crossref -->
    pages = (<xsl:value-of select="translate(normalize-space(./pages),'-',',')" />);
    year = <xsl:value-of select="normalize-space(./year)" />;
  |);
</xsl:template>
<xsl:template match="dblp/www">
  WebSite(|
    author = {|<xsl:apply-templates select="./author" />|};
    title = {<xsl:value-of select="normalize-space(./title)" />};
    url = `<xsl:value-of select="normalize-space(./url)" />`;
    year = <xsl:value-of select="normalize-space(./year)" />;
  |);
</xsl:template>
<xsl:template match="PublicationEntries/Thesis">
</xsl:template>
<xsl:template match="PublicationEntries/Misc">
</xsl:template>
<xsl:template match="author">
  <xsl:apply-templates />
  <xsl:if test="position()!=last()">, </xsl:if>
</xsl:template>
<xsl:template match="editor">
  <xsl:apply-templates />
  <xsl:if test="position()!=last()">, </xsl:if>
</xsl:template>
</xsl:stylesheet>
