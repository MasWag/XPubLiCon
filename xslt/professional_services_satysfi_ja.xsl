<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" > 
  <xsl:output method="text" encoding="UTF-8"/>
  <xsl:template match="/data">
    <xsl:apply-templates select="./Committees"/>
  </xsl:template>
  <xsl:template match="Committees">
    <xsl:text>&#x0A;</xsl:text>
    <xsl:text>let professional-activities = '&lt;&#x0A;</xsl:text>
    <xsl:text>    +listing {&#x0A;</xsl:text>
    <xsl:if test="./PCChair">
      <xsl:text>    * \bold{プログラム委員長 (Program Committee Chair)} of </xsl:text>
      <xsl:apply-templates select="./PCChair"/>
      <xsl:text>&#x0A;</xsl:text>
    </xsl:if>
    <xsl:if test="./PCMember">
      <xsl:text>      * \textbf{プログラム委員 (Program Committee Member)} of </xsl:text>
      <xsl:apply-templates select="./PCMember"/>
      <xsl:text>&#x0A;</xsl:text>
    </xsl:if>
    <xsl:if test="./AECommittee">
      <xsl:text>      * \textbf{アーティファクト審査委員 (Artifact Evaluation Committee Member)} of </xsl:text>
      <xsl:apply-templates select="./AECommittee"/>
      <xsl:text>&#x0A;</xsl:text>
    </xsl:if>
    <xsl:if test="./PublicityChair">
      <xsl:text>      * \textbf{Publicity chair} of </xsl:text>
      <xsl:apply-templates select="./AECommittee"/>
      <xsl:text>&#x0A;</xsl:text>
    </xsl:if>
    <xsl:apply-templates select="./Other"/>
    <xsl:text>    }&#x0A;</xsl:text>
    <xsl:text>&gt;&#x0A;</xsl:text>
    <xsl:text>let professional-activities-program-committee-member = {&#x0A;</xsl:text>
    <xsl:apply-templates select="./PCMember"/>
    <xsl:text>}&#x0A;</xsl:text>
    <xsl:text>let professional-activities-artifact-evaluation-committee-member = {&#x0A;</xsl:text>
    <xsl:apply-templates select="./AECommittee"/>
    <xsl:text>}&#x0A;</xsl:text>
  </xsl:template>
  <xsl:template match="PCMember">
    <xsl:choose>
      <xsl:when test="./organization/@japanese">
        <xsl:value-of select="normalize-space(./organization/@japanese)" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="normalize-space(./organization)" />
      </xsl:otherwise>
    </xsl:choose>
    <xsl:value-of select="normalize-space(./start_year)" />
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
