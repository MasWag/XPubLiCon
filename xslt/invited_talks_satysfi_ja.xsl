<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
  <xsl:output method="text" encoding="UTF-8"/>
  <xsl:template match="/data">
    <xsl:text>let invited-talks = '&lt;&#x0A;</xsl:text>
    <xsl:text>  +listing {&#x0A;</xsl:text>
    <xsl:apply-templates select="./Talks" />
    <xsl:text>    }&#x0A;</xsl:text>
    <xsl:text>&gt;&#x0A;</xsl:text>
  </xsl:template>
  <xsl:template match="Talk">
    <xsl:if test="./@invited and ./@invited = 'true'">
      <xsl:text>  * </xsl:text>
      <xsl:value-of select="normalize-space(./title)" />
      <xsl:text>, </xsl:text>
      <xsl:apply-templates select="./venue"/>
      <xsl:text>, </xsl:text>
      <xsl:choose>
        <xsl:when test="./location/@japanese">
          <xsl:value-of select="normalize-space(./location/@japanese)" />
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="normalize-space(./location)" />
        </xsl:otherwise>
      </xsl:choose>
      <xsl:text>, </xsl:text>
      <xsl:value-of select="normalize-space(./year)" />
      <xsl:text>年</xsl:text>
      <xsl:value-of select="normalize-space(./month)" />
      <xsl:text>月</xsl:text>
      <xsl:value-of select="normalize-space(./day)" />
      <xsl:text>日</xsl:text>
      <xsl:text>.</xsl:text>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
