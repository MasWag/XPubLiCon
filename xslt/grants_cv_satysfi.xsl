<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
  <xsl:output method="text" encoding="UTF-8"/>
  <xsl:template match="/data">
    <xsl:text>&#x0A;</xsl:text>
    <xsl:text>let grants = '&lt;&#x0A;</xsl:text>
    <xsl:text>  +section{Research Grants} &lt;&#x0A;</xsl:text>
    <xsl:text>    +listing-with-gap(0pt) {&#x0A;</xsl:text>
    <xsl:apply-templates select="./Grants" />
    <xsl:text>    }&#x0A;</xsl:text>
    <xsl:text>  &gt;&#x0A;</xsl:text>
    <xsl:text>&gt;&#x0A;</xsl:text>
  </xsl:template>
  <xsl:template match="Grants/ResearchProject">
    <xsl:text>      * </xsl:text>
    <xsl:value-of select="normalize-space(./scheme)" />
    <xsl:text>, </xsl:text>
    <xsl:if test="./@grant_number">
      <xsl:text>Grant Number: </xsl:text>
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
      <xsl:text>, </xsl:text>
    </xsl:if>
    <xsl:apply-templates select="./grant_agency" />
    <xsl:text>, </xsl:text>
    <xsl:value-of select="normalize-space(./start_year)" />
    <xsl:text>/</xsl:text>
    <xsl:value-of select="normalize-space(./start_month)" />
    <xsl:text>-</xsl:text>
    <xsl:value-of select="normalize-space(./end_year)" />
    <xsl:text>/</xsl:text>
    <xsl:value-of select="normalize-space(./end_month)" />
    <xsl:text>.</xsl:text>
    <xsl:text>&#x0A;</xsl:text>
  </xsl:template>
  <xsl:template match="Grants/OtherGrants">
    <xsl:text>      * </xsl:text>
    <xsl:value-of select="normalize-space(./scheme)" />
    <xsl:text>, </xsl:text>
    <xsl:if test="./@grant_number">
      <xsl:text>Grant Number: </xsl:text>
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
      <xsl:text>, </xsl:text>
    </xsl:if>
    <xsl:apply-templates select="./grant_agency" />
    <!-- <xsl:value-of select="normalize-space(./grant_agency)" /> -->
    <!-- <xsl:text>, </xsl:text> -->
    <!-- <xsl:value-of select="normalize-space(./start_year)" /> -->
    <!-- <xsl:value-of select="normalize-space(./start_month)" /> -->
    <!-- <xsl:text>-</xsl:text> -->
    <!-- <xsl:value-of select="normalize-space(./end_year)" /> -->
    <!-- <xsl:value-of select="normalize-space(./end_month)" /> -->
    <xsl:text>.</xsl:text>
    <xsl:text>&#x0A;</xsl:text>
</xsl:template>
<xsl:template match="grant_agency">
  <xsl:value-of select="normalize-space(text())" />
</xsl:template>
</xsl:stylesheet>
