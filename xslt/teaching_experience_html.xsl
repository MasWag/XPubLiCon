<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" > 
  <xsl:output method="xml" encoding="UTF-8"/>
  <xsl:template match="/data">
    <ul>
      <xsl:apply-templates select="./TeachingExperiences/TeachingExperience"/>
    </ul>
  </xsl:template>
  <xsl:template match="TeachingExperience">
    <xsl:element name="li">
      <xsl:if test="./@id">
        <xsl:attribute name="id">
          <xsl:value-of select="normalize-space(./@id)" />
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="./@TA and ./@TA = 'true'">
        Teaching assistant for 
      </xsl:if>
      <xsl:if test="./@url">
        <xsl:element name="a">
          <xsl:attribute name="href">
            <xsl:value-of select="normalize-space(./@url)" />
          </xsl:attribute>
          <xsl:value-of select="normalize-space(./name)" /> (<xsl:value-of select="normalize-space(./name/@japanese)" />
          <xsl:text>)</xsl:text>
        </xsl:element>
      </xsl:if>
      <xsl:if test="not(./@url)">
        <xsl:value-of select="normalize-space(./name)" /> (<xsl:value-of select="normalize-space(./name/@japanese)" />
        <xsl:text>)</xsl:text>
      </xsl:if>
      <xsl:if test="./note">
        <xsl:text> (</xsl:text>
        <xsl:value-of select="normalize-space(./note)" />
        <xsl:text>)</xsl:text>
      </xsl:if>
      <xsl:text>, </xsl:text>
      <xsl:value-of select="normalize-space(./start_year)" />/<xsl:value-of select="normalize-space(./start_month)" />--<xsl:if test="./end_year and ./end_month"><xsl:value-of select="normalize-space(./end_year)" />/<xsl:value-of select="normalize-space(./end_month)" /></xsl:if>, <xsl:value-of select="normalize-space(./organization)" />
    </xsl:element>
  </xsl:template>
</xsl:stylesheet>
