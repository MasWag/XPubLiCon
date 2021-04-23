<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
  <xsl:output method="text" encoding="UTF-8" />
  <xsl:strip-space elements="*" />
  <xsl:template match="/data">
    <xsl:apply-templates select="./Talks" />
  </xsl:template>
  <xsl:template match="Talks/Talk">
    <!-- Presenter -->
    <xsl:value-of select="normalize-space(./presenter)" /><xsl:text>,</xsl:text>
    <!-- Title -->
    <xsl:value-of select="normalize-space(./title)" /><xsl:text>,"</xsl:text>
    <!-- Venue -->
    <xsl:value-of select="normalize-space(./venue)" /><xsl:text>",</xsl:text>
    <!-- Year -->
    <xsl:value-of select="normalize-space(./year)" /><xsl:text>,</xsl:text>
    <xsl:value-of select="normalize-space(./year)" /><xsl:text>,</xsl:text>
    <!-- Invited -->
    <xsl:choose>
      <xsl:when test="normalize-space(./@invited) = 'true'">
        <xsl:text>true,</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>false,</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <!-- International -->
    <xsl:choose>
      <xsl:when test="normalize-space(./@international) = 'false'">
        <xsl:text>false</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>true</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>&#10;</xsl:text>
  </xsl:template>
</xsl:stylesheet>
