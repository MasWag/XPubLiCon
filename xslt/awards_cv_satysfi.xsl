<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:output method="text" encoding="UTF-8"/>
<xsl:template match="/data">
<xsl:text>
let awards = '&lt;
  +section{Awards} &lt;
    +listing-with-gap(0pt) {</xsl:text>
        <xsl:apply-templates select="./Awards" />
<xsl:text>  }
  &gt;
&gt;
</xsl:text>
</xsl:template>
<xsl:template match="Award">
  <xsl:text>  * </xsl:text>
  <xsl:value-of select="normalize-space(./name)" /><xsl:text>, </xsl:text>
  <xsl:value-of select="normalize-space(./organization)" /><xsl:text>, </xsl:text>
  <xsl:value-of select="normalize-space(./day)" /><xsl:text>, </xsl:text>
  <xsl:call-template name="conv-month" /><xsl:text>, </xsl:text>
  <xsl:value-of select="normalize-space(./year)" /><xsl:text>.</xsl:text>
</xsl:template>
<xsl:template name="conv-month">
  <xsl:choose>
    <xsl:when test="./month=1">January</xsl:when>
    <xsl:when test="./month=2">February</xsl:when>
    <xsl:when test="./month=3">March</xsl:when>
    <xsl:when test="./month=4">April</xsl:when>
    <xsl:when test="./month=5">May</xsl:when>
    <xsl:when test="./month=6">June</xsl:when>
    <xsl:when test="./month=7">July</xsl:when>
    <xsl:when test="./month=8">August</xsl:when>
    <xsl:when test="./month=9">September</xsl:when>
    <xsl:when test="./month=10">October</xsl:when>
    <xsl:when test="./month=11">November</xsl:when>
    <xsl:when test="./month=12">December</xsl:when>
    <xsl:otherwise></xsl:otherwise>
  </xsl:choose>
</xsl:template>
</xsl:stylesheet>
