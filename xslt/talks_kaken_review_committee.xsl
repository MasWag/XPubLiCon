<?xml version="1.0" ?>
<!-- Specification: 発表者名、発表標題、学会等名、発表年をカンマでつないで入力してください。 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
  <xsl:output method="text" encoding="UTF-8" />
  <xsl:strip-space elements="*" />
  <xsl:template match="/data">
    <xsl:apply-templates select="./Talks" />
  </xsl:template>
  <xsl:template match="Talks/Talk">
    <xsl:if test="not(./@international) or normalize-space(./@international) = 'true'">
      <!-- Presenter -->
      <xsl:value-of select="normalize-space(./presenter)" /><xsl:text>,</xsl:text>
      <!-- Title -->
      <xsl:value-of select="normalize-space(./title)" /><xsl:text>,"</xsl:text>
      <!-- Venue -->
      <xsl:value-of select="normalize-space(./venue)" /><xsl:text>",</xsl:text>
      <!-- Year -->
      <xsl:value-of select="normalize-space(./year)" />
      <xsl:text>&#10;</xsl:text>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
