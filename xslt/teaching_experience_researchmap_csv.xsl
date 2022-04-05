<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" > 
  <xsl:output method="text" encoding="UTF-8" />
  <xsl:strip-space elements="*" />
  <xsl:template match="/data">teaching_experience
"アクション名","アクションタイプ",ID,科目(日本語),科目(英語),機関名(日本語),機関名(英語),年月(From),年月(To),概要(日本語),概要(英語),科目区分,URL
<xsl:apply-templates select="./TeachingExperiences" />
  </xsl:template>
  <xsl:template match="TeachingExperiences/TeachingExperience">
    <xsl:if test="not(./@TA) or ./@TA = 'false'">
      <xsl:choose>
        <xsl:when test="./@id">update,doc,<xsl:value-of select="normalize-space(./@id)"/>,</xsl:when>
        <xsl:otherwise>insert,merge,null,</xsl:otherwise>
      </xsl:choose>"<xsl:value-of select="normalize-space(./name/@japanese)"/>","<xsl:value-of select="normalize-space(./name)"/>","<xsl:value-of select="normalize-space(./organization/@japanese)"/>","<xsl:value-of select="normalize-space(./organization)"/>",<xsl:value-of select="./start_year" /><xsl:value-of select="format-number(./start_month,'00')" />,<xsl:choose>
      <xsl:when test="./end_year"><xsl:value-of select="./end_year" /><xsl:value-of select="format-number(./end_month,'00')" />,</xsl:when>
      <xsl:otherwise>9999,</xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="./abstract_japanese">
        "<xsl:value-of select="normalize-space(./abstract_japanese)"/>"
      </xsl:when>
      <xsl:otherwise>null</xsl:otherwise>
    </xsl:choose>,<xsl:choose>
      <xsl:when test="./abstract_english">
        "<xsl:value-of select="normalize-space(./abstract_english)"/>"
      </xsl:when>
      <xsl:otherwise>null</xsl:otherwise>
    </xsl:choose>,<xsl:value-of select="./@type" />,<xsl:choose>
        <xsl:when test="./@url">"<xsl:value-of select="./@url" />"</xsl:when>
        <xsl:otherwise>null</xsl:otherwise>
      </xsl:choose>
      <xsl:text>&#10;</xsl:text>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
