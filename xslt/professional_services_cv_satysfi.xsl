<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" > 
  <xsl:output method="text" encoding="UTF-8"/>
  <xsl:template match="/data">
    <xsl:apply-templates select="./Committees"/>
  </xsl:template>
  <xsl:template match="Committees">
    <xsl:text>&#x0A;</xsl:text>
    <xsl:text>let professional-activities = '&lt;&#x0A;</xsl:text>
    <xsl:text>  +section{Professional Activities} &lt;&#x0A;</xsl:text>
    <xsl:text>    +listing-with-gap(0pt) {&#x0A;</xsl:text>
    <xsl:if test="./PCChair">
      <xsl:text>    * \bold{Program committee chair} of </xsl:text>
      <xsl:apply-templates select="./PCChair"/>
      <xsl:text>&#x0A;</xsl:text>
    </xsl:if>
    <xsl:if test="./PCMember">
      <xsl:text>      * \bold{Program committee member} of </xsl:text>
      <xsl:apply-templates select="./PCMember"/>
      <xsl:text>&#x0A;</xsl:text>
    </xsl:if>
    <xsl:if test="./AECommittee">
      <xsl:text>      * \bold{Artifact evaluation committee member} of </xsl:text>
      <xsl:apply-templates select="./AECommittee"/>
      <xsl:text>&#x0A;</xsl:text>
    </xsl:if>
    <xsl:if test="./PublicityChair">
      <xsl:text>      * \bold{Publicity chair} of </xsl:text>
      <xsl:apply-templates select="./AECommittee"/>
      <xsl:text>&#x0A;</xsl:text>
    </xsl:if>
    <xsl:apply-templates select="./Other"/>
    <xsl:text>    }&#x0A;</xsl:text>
    <xsl:text>  &gt;&#x0A;</xsl:text>
    <xsl:text>&gt;&#x0A;</xsl:text>
  </xsl:template>
  <xsl:template match="PCMember">
    <xsl:value-of select="normalize-space(./organization)" /> <xsl:value-of select="normalize-space(./start_year)" />
    <xsl:text>. </xsl:text>
  </xsl:template>
  <xsl:template match="PCChair">
    <xsl:value-of select="normalize-space(./organization)" /> <xsl:value-of select="normalize-space(./start_year)" />
    <xsl:text>. </xsl:text>
  </xsl:template>
  <xsl:template match="AECommittee">
    <xsl:value-of select="normalize-space(./organization)" /> <xsl:value-of select="normalize-space(./start_year)" />
    <xsl:text>. </xsl:text>
  </xsl:template>
  <xsl:template match="PublicityChair">
    <xsl:value-of select="normalize-space(./organization)" /> <xsl:value-of select="normalize-space(./start_year)" />
    <xsl:text>. </xsl:text>
  </xsl:template>
  <xsl:template match="Other">
    <xsl:text>      * </xsl:text>
    <xsl:value-of select="normalize-space(./name)" />
    <xsl:text> of </xsl:text>
    <xsl:value-of select="normalize-space(./organization)" /> <xsl:value-of select="normalize-space(./start_year)" />
    <xsl:text>. </xsl:text>
    <xsl:text>&#x0A;</xsl:text>
  </xsl:template>
</xsl:stylesheet>
