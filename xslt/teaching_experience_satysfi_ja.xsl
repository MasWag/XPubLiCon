<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" > 
  <xsl:output method="text" encoding="UTF-8"/>
  <xsl:template match="/data">
    <xsl:text>&#x0A;</xsl:text>
    <xsl:text>let teaching-experience = '&lt;&#x0A;</xsl:text>
    <xsl:text>  +listing {&#x0A;</xsl:text>
    <xsl:apply-templates select="./TeachingExperiences/TeachingExperience"/>
    <xsl:text>    }&#x0A;</xsl:text>
    <xsl:text>&gt;&#x0A;</xsl:text>
  </xsl:template>
  <xsl:template match="TeachingExperience">
    <xsl:text>      * </xsl:text>
    <xsl:choose>
      <xsl:when test="./name/@japanese">
        <xsl:value-of select="normalize-space(./name/@japanese)" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="normalize-space(./name)" />
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="./@TA and ./@TA = 'true'">
      <xsl:text> (TA)</xsl:text>
    </xsl:if>
    <xsl:text>，</xsl:text>
    <xsl:choose>
      <xsl:when test="./organization/@japanese">
        <xsl:value-of select="normalize-space(./organization/@japanese)" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="normalize-space(./organization)" />
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>，</xsl:text>
    <xsl:value-of select="normalize-space(./start_year)" />
    <xsl:text>/</xsl:text>
    <xsl:value-of select="normalize-space(./start_month)" />
    <xsl:text>-</xsl:text>
    <xsl:choose>
      <xsl:when test="./end_year and ./end_month">
        <xsl:value-of select="normalize-space(./end_year)" />
        <xsl:text>/</xsl:text>
        <xsl:value-of select="normalize-space(./end_month)" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>現在</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>&#x0A;</xsl:text>
  </xsl:template>
</xsl:stylesheet>
