<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
  <xsl:output method="text" encoding="UTF-8"/>
  <xsl:template match="/data">
    <xsl:text>let talks = '&lt;&#x0A;</xsl:text>
    <xsl:text>  +listing {&#x0A;</xsl:text>
    <xsl:apply-templates select="./Talks" />
    <xsl:text>    }&#x0A;</xsl:text>
    <xsl:text>&gt;&#x0A;</xsl:text>
  </xsl:template>
  <xsl:template match="Talk">
    <xsl:if test="not(./@minor) or ./@minor = 'false'">
      <xsl:text>  * </xsl:text>
      <xsl:value-of select="normalize-space(./title)" />
      <xsl:text>, </xsl:text>
      <xsl:apply-templates select="./venue/WebResource/@label"/>
      <xsl:text>, </xsl:text>
      <xsl:value-of select="normalize-space(./location)" />
      <xsl:text>, </xsl:text>
      <xsl:value-of select="normalize-space(./date)" />
      <xsl:text>.</xsl:text>
      <xsl:if test="./@invited and ./@invited = 'true'">
        <xsl:text> [招待講演]</xsl:text>
      </xsl:if>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
