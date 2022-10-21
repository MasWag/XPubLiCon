<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" > 
  <xsl:output method="text" encoding="UTF-8"/>
  <xsl:template match="/data">
    let teaching-experience = '&lt;
    +section{Teaching Experiences} &lt;
      +tabbedblock ?:(60pt) [
      <xsl:apply-templates select="./TeachingExperiences/TeachingExperience"/>
    ];&gt;&gt;
  </xsl:template>
  <xsl:template match="TeachingExperience">
      ({<xsl:value-of select="normalize-space(./start_year)" />/<xsl:value-of select="normalize-space(./start_month)" />-<xsl:if test="./end_year and ./end_month"><xsl:value-of select="normalize-space(./end_year)" />/<xsl:value-of select="normalize-space(./end_month)" /></xsl:if><xsl:if test="not(./end_year and ./end_month)">Now</xsl:if>}, '&lt;+p{
      <xsl:if test="./@TA and ./@TA = 'true'">
        Teaching assistant for
      </xsl:if>
      \emph{<xsl:value-of select="normalize-space(./name)" />},
      <xsl:value-of select="normalize-space(./organization)" />
      }&gt;);
  </xsl:template>
</xsl:stylesheet>
