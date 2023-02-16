<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
  <xsl:output method="text" encoding="UTF-8" />
  <xsl:strip-space elements="*" />
  <xsl:template match="/data">
    <xsl:apply-templates select="./Grants" />
  </xsl:template>
  <xsl:template match="Grants/ResearchProject">
    <!-- Funding Agency -->
    <xsl:choose>
      <xsl:when test="./grant_agency/@japanese">
        <xsl:value-of select="normalize-space(./grant_agency/@japanese)"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="normalize-space(./grant_agency)"/>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text> </xsl:text>
    <!-- Funding Scheme -->
    <xsl:choose>
      <xsl:when test="./scheme/@japanese">
        <xsl:value-of select="normalize-space(./scheme/@japanese)"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="normalize-space(./scheme)"/>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>, </xsl:text>
    <!-- Date -->
    <xsl:if test="./start_day and ./end_day">
      <xsl:value-of select="normalize-space(./start_year)"/><xsl:text>年</xsl:text>
      <xsl:value-of select="normalize-space(./start_month)"/><xsl:text>月</xsl:text>
      <xsl:value-of select="normalize-space(./start_day)"/><xsl:text>日</xsl:text>
      <xsl:text>--</xsl:text>
      <xsl:value-of select="normalize-space(./end_year)"/><xsl:text>年</xsl:text>
      <xsl:value-of select="normalize-space(./end_month)"/><xsl:text>月</xsl:text>
      <xsl:value-of select="normalize-space(./end_day)"/><xsl:text>日</xsl:text>
    </xsl:if>
    <xsl:text>, </xsl:text>
    <!-- Project Title -->
    <xsl:choose>
      <xsl:when test="./title/@japanese">
        <xsl:value-of select="normalize-space(./title/@japanese)"/>
      </xsl:when>
      <xsl:otherwise>
      <xsl:value-of select="normalize-space(./title)"/>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>&#10;</xsl:text>
  </xsl:template>
</xsl:stylesheet>
