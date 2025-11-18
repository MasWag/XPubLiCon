<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
  <xsl:output method="text" encoding="UTF-8"/>
  <xsl:template match="/data">
    <xsl:text>&#x0A;</xsl:text>
    <xsl:text>let bib-minor = [&#x0A;</xsl:text>
    <xsl:apply-templates select="./PublicationEntries" />
    <xsl:text>]&#x0A;</xsl:text>
  </xsl:template>
  <xsl:template match="PublicationEntries/Article">
    <xsl:if test="./@minor = 'true' or ./@referee = 'false'">
        Article(|
        author = {|<xsl:apply-templates select="./author" />|};
        title = {<xsl:value-of select="normalize-space(./title)" />};
        journal = {<xsl:value-of select="normalize-space(./journal)" />};
        shortjournal = <xsl:if test="./journal/@abbr">Some({<xsl:value-of select="normalize-space(./journal/@abbr)" />});</xsl:if><xsl:if test="not(./journal/@abbr)">None;</xsl:if>
        volume = <xsl:if test="./volume">Some(<xsl:value-of select="normalize-space(./volume)" />)</xsl:if><xsl:if test="not(./volume)">None</xsl:if>;
        number = <xsl:if test="./number">Some({<xsl:value-of select="normalize-space(./number)" />})</xsl:if><xsl:if test="not(./number)">None</xsl:if>;
        pages = (`<xsl:value-of select="normalize-space(./start_page)" />`,`<xsl:value-of select="normalize-space(./end_page)" />`);
        year = <xsl:value-of select="normalize-space(./year)" />;
        note = None;
        |);
    </xsl:if>
  </xsl:template>
  <xsl:template match="PublicationEntries/Thesis">
  </xsl:template>
  <xsl:template match="PublicationEntries/InProceedings">
    <xsl:choose>
      <xsl:when test="./@published and ./@published = 'false' and ./@reviewed = 'false'">
        ToAppear(|
        author = {|<xsl:apply-templates select="./author" />|};
        title = {<xsl:value-of select="normalize-space(./title)" />};
        booktitle = {<xsl:value-of select="normalize-space(./booktitle)" />};
        shortbooktitle = <xsl:if test="./booktitle/@abbr">Some({<xsl:value-of select="normalize-space(./booktitle/@abbr)" />});</xsl:if><xsl:if test="not(./booktitle/@abbr)">None;</xsl:if>
        year = <xsl:value-of select="normalize-space(./year)" />;
        note = None;
        |);
      </xsl:when>
      <xsl:when test="./@reviewed = 'false'">
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
        note = None;
        |);
      </xsl:when>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="PublicationEntries/Misc">
    Misc(|
    author = {|<xsl:apply-templates select="./author" />|};
    title = {<xsl:value-of select="normalize-space(./title)" />};
    booktitle = {<xsl:value-of select="normalize-space(./booktitle)" />};
    shortbooktitle = <xsl:if test="./booktitle/@abbr">Some({<xsl:value-of select="normalize-space(./booktitle/@abbr)" />});</xsl:if><xsl:if test="not(./booktitle/@abbr)">None;</xsl:if>
    year = <xsl:value-of select="normalize-space(./year)" />;
    note = None;
    |);
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
