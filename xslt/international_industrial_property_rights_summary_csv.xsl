<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
  <xsl:output method="text" encoding="UTF-8" />
  <xsl:strip-space elements="*" />
  <xsl:template match="/data">
    <xsl:apply-templates select="./IndustrialPropertyRights" />
  </xsl:template>
  <xsl:template match="IndustrialPropertyRights/Patent">
    <xsl:if test="not(./title/@japanese)">
      <!-- Title -->
      <xsl:value-of select="normalize-space(./title)"/>
      <xsl:text>, </xsl:text>
      <xsl:text>Patent, </xsl:text>
      <!-- Number -->
      <xsl:value-of select="normalize-space(./@application_number)" />
      <xsl:text>, </xsl:text>
      <!-- Year -->
      <xsl:value-of select="normalize-space(./year)" />
      <xsl:text>&#10;</xsl:text>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
