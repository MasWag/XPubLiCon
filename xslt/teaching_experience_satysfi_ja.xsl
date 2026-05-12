<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:doc="urn:xpub:documentation" > 
  <xsl:output method="text" encoding="UTF-8"/>
  <doc:usage>
    Set skip_ta to true to omit TeachingExperience entries with TA="true".
    Example:
      xsltproc --stringparam skip_ta true xslt/teaching_experience_satysfi_ja.xsl example/data.xml
  </doc:usage>
  <xsl:param name="skip_ta">false</xsl:param>
  <xsl:template match="/data">
    <xsl:text>&#x0A;</xsl:text>
    <xsl:text>let teaching-experience = '&lt;&#x0A;</xsl:text>
    <xsl:text>  +listing {&#x0A;</xsl:text>
    <xsl:apply-templates select="./TeachingExperiences/TeachingExperience[not(normalize-space($skip_ta) = 'true' and @TA = 'true')]"/>
    <xsl:text>    }&#x0A;</xsl:text>
    <xsl:text>&gt;&#x0A;</xsl:text>
  </xsl:template>
  <xsl:template match="TeachingExperience">
    <xsl:text>      * </xsl:text>
    <xsl:choose>
      <xsl:when test="./name/@japanese">
        <xsl:value-of select="normalize-space(./name/@japanese)" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="normalize-space(./name)" />
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="./@TA and ./@TA = 'true'">
      <xsl:text> (TA)</xsl:text>
    </xsl:if>
    <xsl:text>，</xsl:text>
    <xsl:choose>
      <xsl:when test="./organization/@japanese">
        <xsl:value-of select="normalize-space(./organization/@japanese)" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="normalize-space(./organization)" />
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>，</xsl:text>
    <xsl:value-of select="normalize-space(./start_year)" />
    <xsl:text>/</xsl:text>
    <xsl:value-of select="normalize-space(./start_month)" />
    <xsl:text>-</xsl:text>
    <xsl:choose>
      <xsl:when test="./end_year and ./end_month">
        <xsl:value-of select="normalize-space(./end_year)" />
        <xsl:text>/</xsl:text>
        <xsl:value-of select="normalize-space(./end_month)" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>現在</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>&#x0A;</xsl:text>
  </xsl:template>
</xsl:stylesheet>
