<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
  <xsl:output method="xml" encoding="UTF-8"/>
  <xsl:template match="/data">
    <ul>
      <xsl:apply-templates select="./Grants" />
    </ul>
  </xsl:template>
  <xsl:template match="Grants/ResearchProject">
    <li>
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
    </li>
  </xsl:template>
  <xsl:template match="Grants/OtherGrants">
    <li>
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
    </li>
  </xsl:template>
  <xsl:template match="grant_agency">
    <xsl:choose>
      <xsl:when test="./@url">
        <xsl:element name="a">
          <xsl:attribute name="href">
            <xsl:value-of select="normalize-space(./@url)" />
          </xsl:attribute>
          <xsl:value-of select="normalize-space(text())" />
        </xsl:element>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="normalize-space(text())" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>
