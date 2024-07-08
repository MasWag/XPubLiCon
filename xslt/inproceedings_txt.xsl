<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
  <xsl:output method="text" encoding="UTF-8" />
  <xsl:template match="/data">
    <xsl:apply-templates select="./PublicationEntries/InProceedings" />
  </xsl:template>
  <xsl:template match="InProceedings">
    <xsl:text>"</xsl:text>
    <xsl:call-template name="removePeriod">
      <xsl:with-param name="text">
        <xsl:value-of select="normalize-space(./title)" />
      </xsl:with-param>
    </xsl:call-template>
    <xsl:text>", </xsl:text>
    <xsl:apply-templates select="./author" />
    <xsl:text>, </xsl:text>
    <xsl:choose>
      <xsl:when test="./@published and ./@published = 'false'">
        <xsl:text>To appear in Proc. </xsl:text>
        <xsl:value-of select="normalize-space(./booktitle)" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>Proc. </xsl:text>
        <xsl:value-of select="normalize-space(./booktitle)" />
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="./booktitle/@abbr">
      <xsl:text> (</xsl:text>
      <xsl:value-of select="normalize-space(./booktitle/@abbr)" />
      <xsl:text> </xsl:text>
      <xsl:value-of select="normalize-space(./year)" />
      <xsl:text>)</xsl:text>
    </xsl:if>
    <xsl:if test="./@volume">
      <xsl:text>, </xsl:text>
      <xsl:if test="./@series">
        <xsl:value-of select="normalize-space(./@series)" />
        <xsl:text> </xsl:text>
      </xsl:if>
      <xsl:text>volume </xsl:text>
      <xsl:value-of select="normalize-space(./@volume)" />
    </xsl:if>
    <xsl:if test="./number">
      <xsl:text>, </xsl:text>
      <xsl:text>No. </xsl:text>
      <xsl:value-of select="normalize-space(./number)" />
    </xsl:if>
    <xsl:if test="./pages">
      <xsl:text>, </xsl:text>
      <xsl:text>pp. </xsl:text>
      <xsl:value-of select="normalize-space(./pages)" />
    </xsl:if>
    <xsl:text>, </xsl:text>
    <xsl:value-of select="normalize-space(./year)" />
    <xsl:if test="./@publisher">
      <xsl:text>, </xsl:text>
      <xsl:value-of select="normalize-space(./@publisher)" />
    </xsl:if>
    <xsl:text>.&#10;</xsl:text>
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
  <!-- Remove the period at the end in title -->
  <xsl:template name="removePeriod">
    <xsl:param name="text" />
    <!-- Apply normalize space to the given text -->
    <xsl:variable name="text" select="normalize-space($text)" />
    <xsl:choose>
      <xsl:when test="substring($text, string-length($text)) = '.'">
        <xsl:value-of select="substring($text, 1, string-length($text) - 1)" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$text" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>
