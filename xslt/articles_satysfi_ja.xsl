<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
  <xsl:output method="text" encoding="UTF-8"/>
  <xsl:template match="/data">
    <xsl:text>&#x0A;</xsl:text>
    <xsl:text>let bib-articles = [&#x0A;</xsl:text>
    <xsl:apply-templates select="./PublicationEntries/Article" />
    <xsl:text>]&#x0A;</xsl:text>
  </xsl:template>
  <xsl:template match="PublicationEntries/Article">
    <xsl:choose>
      <xsl:when test="./@referee and ./@referee = 'false'">
        <!-- Misc(| -->
        <!-- author = {|<xsl:apply-templates select="./author" />|}; -->
        <!-- title = {<xsl:value-of select="normalize-space(./title)" />}; -->
        <!-- booktitle = {<xsl:value-of select="normalize-space(./journal)" />}; -->
        <!-- shortbooktitle = <xsl:if test="./journal/@abbr">Some({<xsl:value-of select="normalize-space(./journal/@abbr)" />});</xsl:if><xsl:if test="not(./journal/@abbr)">None;</xsl:if> -->
        <!-- year = <xsl:value-of select="normalize-space(./year)" />; -->
        <!-- |); -->
      </xsl:when>
      <xsl:when test="./@published and ./@published = 'false'">
        ToAppear(|
        author = {|<xsl:apply-templates select="./author" />|};
        title = {<xsl:value-of select="normalize-space(./title)" />};
        booktitle = {<xsl:value-of select="normalize-space(./journal)" />};
        shortbooktitle = <xsl:if test="./journal/@abbr">Some({<xsl:value-of select="normalize-space(./journal/@abbr)" />});</xsl:if><xsl:if test="not(./journal/@abbr)">None;</xsl:if>
        year = <xsl:value-of select="normalize-space(./year)" />;
        note = None;
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
        note = None;
        |);
      </xsl:otherwise>
    </xsl:choose>
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
