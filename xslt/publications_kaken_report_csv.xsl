<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
  <xsl:output method="text" encoding="UTF-8" />
  <xsl:strip-space elements="*" />
  <xsl:template match="/data">
    <xsl:apply-templates select="./PublicationEntries" />
  </xsl:template>
  <xsl:template match="PublicationEntries/InProceedings">
    <!-- Category (Paper: 1, Data:2) -->
    <xsl:text>1,</xsl:text>
    <!-- Paper No -->
    <xsl:value-of select="normalize-space(position())" /><xsl:text>,</xsl:text>
    <!-- Data No (N/A: 0) -->
    <xsl:text>0,</xsl:text>
    <!-- doi -->
    <xsl:value-of select="normalize-space(./officialPDF/WebResource/@doi)" /><xsl:text>,"</xsl:text>
    <!-- Authors -->
    <xsl:apply-templates select="./author" /><xsl:text>","</xsl:text>
    <!-- Title -->
    <xsl:value-of select="normalize-space(./title)" /><xsl:text>","</xsl:text>
    <!-- Booktitle -->
    <xsl:value-of select="normalize-space(./booktitle)" /><xsl:text>",</xsl:text>
    <!-- volume -->
    <xsl:choose>
      <xsl:when test="./volume">
        <xsl:value-of select="normalize-space(./volume)" /><xsl:text>,</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>-,</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <!-- year -->
    <xsl:value-of select="normalize-space(./year)" /><xsl:text>,</xsl:text>
    <!-- pages -->
    <xsl:choose>
      <xsl:when test="./pages">
        <xsl:value-of select="normalize-space(./pages)" /><xsl:text>,</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>-,</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <!-- Refree Reading -->
    <xsl:text>1,</xsl:text>
    <!-- International Publication -->
    <xsl:choose>
      <xsl:when test="normalize-space(./@international_collaboration) = 'true'">
        <xsl:text>1,</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>0,</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <!-- Open Access -->
    <xsl:choose>
      <xsl:when test="normalize-space(./officialPDF/@open_access) = 'true'">
        <xsl:text>1</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>0</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <!-- Fields for data -->
    <xsl:text>,,,,,,,,,,,&#10;</xsl:text>
  </xsl:template>
  <xsl:template match="PublicationEntries/Article">
    <!-- Category (Paper: 1, Data:2) -->
    <xsl:text>1,</xsl:text>
    <!-- Paper No -->
    <xsl:value-of select="normalize-space(position())" /><xsl:text>,</xsl:text>
    <!-- Data No (N/A: 0) -->
    <xsl:text>0,</xsl:text>
    <!-- doi -->
    <xsl:value-of select="normalize-space(./officialPDF/WebResource/@doi)" /><xsl:text>,"</xsl:text>
    <!-- Authors -->
    <xsl:apply-templates select="./author" /><xsl:text>","</xsl:text>
    <!-- Title -->
    <xsl:value-of select="normalize-space(./title)" /><xsl:text>","</xsl:text>
    <!-- Journal -->
    <xsl:value-of select="normalize-space(./journal)" /><xsl:text>",</xsl:text>
    <!-- volume -->
    <xsl:value-of select="normalize-space(./volume)" /><xsl:text>,</xsl:text>
    <!-- year -->
    <xsl:value-of select="normalize-space(./year)" /><xsl:text>,</xsl:text>
    <!-- pages -->
    <xsl:value-of select="normalize-space(./start_page)" />-<xsl:value-of select="normalize-space(./end_page)" /><xsl:text>,</xsl:text>
    <!-- Refree Reading -->
    <xsl:text>1,</xsl:text>
    <!-- International Publication -->
    <xsl:choose>
      <xsl:when test="normalize-space(./@international_collaboration) = 'true'">
        <xsl:text>1,</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>0,</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <!-- Open Access -->
    <xsl:choose>
      <xsl:when test="normalize-space(./officialPDF/@open_access) = 'true'">
        <xsl:text>1</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>0</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <!-- Fields for data -->
    <xsl:text>,,,,,,,,,,,&#10;</xsl:text>
  </xsl:template>
  <xsl:template match="PublicationEntries/Thesis"></xsl:template>
  <xsl:template match="author">
    <xsl:param name="japanese">False</xsl:param>
    <xsl:choose>
      <xsl:when test="./@japanese and $japanese != 'False'"><xsl:value-of select="./@japanese" /></xsl:when>
      <xsl:otherwise><xsl:value-of select="text()" /></xsl:otherwise>
    </xsl:choose>
    <!-- handling and -->
    <xsl:if test="position() != last()">
      <xsl:text>,</xsl:text>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
