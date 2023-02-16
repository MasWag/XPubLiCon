<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
  <xsl:output method="text" encoding="UTF-8" />
  <xsl:strip-space elements="*" />
  <xsl:template match="/data">
    <xsl:apply-templates select="./Awards/Award"/>
  </xsl:template>
  <xsl:template match="Award">
    <!-- Name -->
    <xsl:choose>
      <xsl:when test="./name/@japanese">
        <xsl:value-of select="./name/@japanese" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="./name" />
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>, </xsl:text>
    <!-- Organization -->
    <xsl:choose>
      <xsl:when test="./organization/@japanese">
      <xsl:value-of select="normalize-space(./organization/@japanese)"/>
      </xsl:when>
      <xsl:otherwise>
      <xsl:value-of select="normalize-space(./organization)"/>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>, </xsl:text>
    <!-- Date -->
    <xsl:if test="./year and ./month">
      <xsl:value-of select="normalize-space(./year)" /><xsl:text>年</xsl:text>
      <xsl:value-of select="normalize-space(./month)" /><xsl:text>月</xsl:text>
    </xsl:if>
    <xsl:text>&#10;</xsl:text>
  </xsl:template>
</xsl:stylesheet>
