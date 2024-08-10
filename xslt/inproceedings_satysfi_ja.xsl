<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
  <xsl:output method="text" encoding="UTF-8"/>
  <xsl:template match="/data">
    <xsl:text>&#x0A;</xsl:text>
    <xsl:text>let bib-inproceedings = [&#x0A;</xsl:text>
    <xsl:apply-templates select="./PublicationEntries/InProceedings" />
    <xsl:text>]&#x0A;</xsl:text>
  </xsl:template>
  <xsl:template match="PublicationEntries/InProceedings">
    <xsl:choose>
      <xsl:when test="./@minor = 'true' or ./@reviewed = 'false' or ./@workshop = 'true'">
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
      <xsl:otherwise>
        InProceedings(|
        author = {|<xsl:apply-templates select="./author" />|};
        title = {<xsl:value-of select="normalize-space(./title)" />};
        booktitle = {<xsl:value-of select="normalize-space(./booktitle)" />};
        shortbooktitle = <xsl:if test="./booktitle/@abbr">Some({<xsl:value-of select="normalize-space(./booktitle/@abbr)" />});</xsl:if><xsl:if test="not(./booktitle/@abbr)">None;</xsl:if>
        series = <xsl:if test="./@series">Some({<xsl:value-of select="normalize-space(./@series)" />})</xsl:if><xsl:if test="not(./@series)">None</xsl:if>;
        volume = <xsl:if test="./@volume">Some(<xsl:value-of select="normalize-space(./@volume)" />)</xsl:if><xsl:if test="not(./@volume)">None</xsl:if>;
        number = <xsl:if test="./number">Some({<xsl:value-of select="normalize-space(./number)" />})</xsl:if><xsl:if test="not(./number)">None</xsl:if>;
        pages = (`<xsl:value-of select="substring-before(normalize-space(./pages),'-')" />`,`<xsl:value-of select="substring-after(normalize-space(./pages),'-')" />`);
        year = <xsl:value-of select="normalize-space(./year)" />;
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
