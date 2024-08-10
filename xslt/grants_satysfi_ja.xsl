<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
  <xsl:output method="text" encoding="UTF-8"/>
  <xsl:template match="/data">
    <xsl:text>&#x0A;</xsl:text>
    <xsl:text>let grants = '&lt;&#x0A;</xsl:text>
    <xsl:text>  +listing {&#x0A;</xsl:text>
    <xsl:apply-templates select="./Grants/ResearchProject" />
    <xsl:text>    }&#x0A;</xsl:text>
    <xsl:text>&gt;&#x0A;</xsl:text>
  </xsl:template>
  <xsl:template match="Grants/ResearchProject">
    <xsl:text>      * </xsl:text>
    <xsl:choose>
      <xsl:when test="./grant_agency/@japanese">
        <xsl:value-of select="normalize-space(./grant_agency/@japanese)" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="normalize-space(./grant_agency)" />
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text> </xsl:text>
    <xsl:choose>
      <xsl:when test="./scheme/@japanese">
        <xsl:value-of select="normalize-space(./scheme/@japanese)" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="normalize-space(./scheme)" />
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>，</xsl:text>
    <xsl:choose>
      <xsl:when test="./title/@japanese">
        <xsl:value-of select="normalize-space(./title/@japanese)" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="normalize-space(./title)" />
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>，</xsl:text>
    <xsl:if test="./@grant_number">
      <xsl:text>研究課題/領域番号：</xsl:text>
      <xsl:choose>
        <xsl:when test="./@url">
          <xsl:element name="a">
            <xsl:attribute name="href">
              <xsl:value-of select="normalize-space(./@url)" />
            </xsl:attribute>
            <xsl:value-of select="normalize-space(./@grant_number)" />
          </xsl:element>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="normalize-space(./@grant_number)" />
        </xsl:otherwise>
      </xsl:choose>
      <xsl:text>，</xsl:text>
    </xsl:if>
    <xsl:text>期間：</xsl:text>
    <xsl:value-of select="normalize-space(./start_year)" />
    <xsl:text>/</xsl:text>
    <xsl:value-of select="normalize-space(./start_month)" />
    <xsl:text>-</xsl:text>
    <xsl:value-of select="normalize-space(./end_year)" />
    <xsl:text>/</xsl:text>
    <xsl:value-of select="normalize-space(./end_month)" />
    <xsl:text>，</xsl:text>
    <xsl:text>直接経費総額：</xsl:text>
    <xsl:value-of select="format-number(./@total_direct, '###,###')" />
    <xsl:text>円，</xsl:text>
    <xsl:choose>
      <xsl:when test="./@type = 'principal_investigator'">
        <xsl:text>研究代表者</xsl:text>
      </xsl:when>
      <xsl:when test="./@type = 'coinvestigator'">
        <xsl:text>分担者</xsl:text>
      </xsl:when>
    </xsl:choose>
    <xsl:text>&#x0A;</xsl:text>
  </xsl:template>
  <xsl:template match="Grants/OtherGrants">
    <xsl:text>      * </xsl:text>
    <xsl:choose>
      <xsl:when test="./scheme/@japanese">
        <xsl:value-of select="normalize-space(./scheme/@japanese)" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="normalize-space(./scheme)" />
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>，</xsl:text>
    <xsl:choose>
      <xsl:when test="./grant_agency/@japanese">
        <xsl:value-of select="normalize-space(./grant_agency/@japanese)" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="normalize-space(./grant_agency)" />
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>，</xsl:text>
    <xsl:if test="./@grant_number">
      <xsl:text>研究課題/領域番号: </xsl:text>
      <xsl:choose>
        <xsl:when test="./@url">
          <xsl:element name="a">
            <xsl:attribute name="href">
              <xsl:value-of select="normalize-space(./@url)" />
            </xsl:attribute>
            <xsl:value-of select="normalize-space(./@grant_number)" />
          </xsl:element>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="normalize-space(./@grant_number)" />
        </xsl:otherwise>
      </xsl:choose>
      <xsl:text>，</xsl:text>
    </xsl:if>
    <!-- <xsl:value-of select="normalize-space(./grant_agency)" /> -->
    <!-- <xsl:text>，</xsl:text> -->
    <!-- <xsl:value-of select="normalize-space(./start_year)" /> -->
    <!-- <xsl:value-of select="normalize-space(./start_month)" /> -->
    <!-- <xsl:text>-</xsl:text> -->
    <!-- <xsl:value-of select="normalize-space(./end_year)" /> -->
    <!-- <xsl:value-of select="normalize-space(./end_month)" /> -->
    <xsl:text>&#x0A;</xsl:text>
  </xsl:template>
</xsl:stylesheet>
