<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
  <xsl:output method="text" encoding="UTF-8"/>
  <xsl:template match="/data">
    <xsl:text>&#x0A;</xsl:text>
    <xsl:text>let patents = '&lt;&#x0A;</xsl:text>
    <xsl:text>  +listing {&#x0A;</xsl:text>
    <xsl:apply-templates select="./IndustrialPropertyRights/Patent" />
    <xsl:text>    }&#x0A;</xsl:text>
    <xsl:text>&gt;&#x0A;</xsl:text>
  </xsl:template>
  <xsl:template match="IndustrialPropertyRights/Patent">
    <xsl:text>      * </xsl:text>
    <xsl:choose>
      <xsl:when test="./@patent_number">
        <xsl:value-of select="normalize-space(./@patent_number)" />
      </xsl:when>
      <xsl:when test="./@published_number">
        <xsl:value-of select="normalize-space(./@published_number)" />
      </xsl:when>
      <xsl:when test="./@application_number">
        <xsl:value-of select="normalize-space(./@application_number)" />
      </xsl:when>
    </xsl:choose>
    <xsl:text>，</xsl:text>
    <xsl:choose>
      <xsl:when test="./title/@japanese">
        <xsl:value-of select="normalize-space(./title/@japanese)" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="normalize-space(./title)" />
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>，</xsl:text>
    <xsl:apply-templates select="./author" />
    <xsl:text>&#x0A;</xsl:text>
  </xsl:template>
  <xsl:template match="author">
    <xsl:choose>
      <xsl:when test="./@japanese">
        <xsl:value-of select="normalize-space(./@japanese)" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="normalize-space(text())" />
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="position()!=last()">，</xsl:if>
  </xsl:template>
</xsl:stylesheet>
