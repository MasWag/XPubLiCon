<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
  <xsl:output method="text" encoding="UTF-8" />
  <xsl:strip-space elements="*" />
  <xsl:template match="/data">
    <xsl:apply-templates select="./PublicationEntries" />
  </xsl:template>
  <xsl:template match="PublicationEntries/InProceedings">
    <!-- Title -->
    <xsl:choose>
      <xsl:when test="./title/@japanese">
        <xsl:value-of select="normalize-space(./title/@japanese)"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="normalize-space(./title)"/>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>, </xsl:text>
    <!-- Authors -->
    <xsl:apply-templates select="./author" />
    <xsl:text>, </xsl:text>
    <!-- journal -->
    <xsl:value-of select="normalize-space(./journal)" />
    <xsl:text>, </xsl:text>
    <!-- volume -->
    <xsl:value-of select="normalize-space(./volume)" />
    <!-- number -->
    <xsl:if test="./number">
      <xsl:text>(</xsl:text>
      <xsl:value-of select="normalize-space(./number)" />
      <xsl:text>)</xsl:text>
    </xsl:if>
    <xsl:text>, </xsl:text>
    <!-- begin page -->
    <xsl:value-of select="normalize-space(./start_page)" />
    <xsl:text>--</xsl:text>
    <!-- end page -->
    <xsl:value-of select="normalize-space(./end_page)" />
    <xsl:text>&#10;</xsl:text>
  </xsl:template>
  <xsl:template match="PublicationEntries/Article">
  </xsl:template>
  <xsl:template match="PublicationEntries/Thesis">
  </xsl:template>
  <xsl:template match="author">
    <xsl:choose>
      <xsl:when test="./@japanese">
        <xsl:value-of select="./@japanese" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="text()" />
      </xsl:otherwise>
    </xsl:choose>
    <!-- handling the comma -->
    <xsl:if test="position() != last()">
      <xsl:text>, </xsl:text>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
