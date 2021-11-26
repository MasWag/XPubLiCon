<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" > 
  <xsl:output method="text" encoding="UTF-8" />
  <xsl:strip-space elements="*" />
  <xsl:template match="/data">
    <xsl:text>awards&#10;</xsl:text>
    <xsl:text>"アクション名","アクションタイプ",ID,賞名(日本語),賞名(英語),受賞者・グループ(日本語),受賞者・グループ(英語),タイトル(日本語),タイトル(英語),授与機関(日本語),授与機関(英語),概要(日本語),概要(英語),受賞年月,受賞区分,URL,主要な業績かどうか,公開の有無&#10;</xsl:text>
    <xsl:apply-templates select="./Awards" />
  </xsl:template>
  <xsl:template match="Awards/Award">
    <xsl:choose>
      <xsl:when test="./@id">update,doc,<xsl:value-of select="normalize-space(./@id)"/></xsl:when>
      <xsl:otherwise>insert,merge,null</xsl:otherwise>
      </xsl:choose>,"<xsl:choose>
      <xsl:when test="./name/@japanese"><xsl:value-of select="./name/@japanese" /></xsl:when>
      <xsl:otherwise><xsl:value-of select="./name" /></xsl:otherwise>
      </xsl:choose>","<xsl:value-of select="normalize-space(./name)" /><xsl:text>",</xsl:text>
      <!-- authors in Japanese -->
      <xsl:text>"[</xsl:text>
      <xsl:apply-templates select="./author">
        <xsl:with-param name="japanese">True</xsl:with-param>
      </xsl:apply-templates>
      <xsl:text>]",</xsl:text>
      <!-- authors -->
      <xsl:text>"[</xsl:text>
      <xsl:apply-templates select="./author" />
      <xsl:text>]",</xsl:text>
      <!-- title -->
      <xsl:choose>
        <xsl:when test="./title/@japanese">"<xsl:value-of select="normalize-space(./title/@japanese)"/>","<xsl:value-of select="normalize-space(./title)"/>",</xsl:when>
        <xsl:when test="./title">"<xsl:value-of select="normalize-space(./title)"/>","<xsl:value-of select="normalize-space(./title)"/>",</xsl:when>
        <xsl:otherwise>null,null,</xsl:otherwise>
      </xsl:choose>
      <!-- organization -->
      <xsl:choose>
        <xsl:when test="./organization/@japanese">"<xsl:value-of select="normalize-space(./organization/@japanese)"/>"</xsl:when>
        <xsl:otherwise>"<xsl:value-of select="normalize-space(./organization)"/>"</xsl:otherwise>
      </xsl:choose>
      <xsl:text>,"</xsl:text>
      <xsl:value-of select="normalize-space(./organization)"/>
      <xsl:text>",</xsl:text>
      <!-- abstract in Japanese -->
      <xsl:choose>
        <xsl:when test="./abstract_japanese">"<xsl:value-of select="normalize-space(./abstract_japanese)"/>",</xsl:when>
        <xsl:otherwise>null,</xsl:otherwise>
      </xsl:choose>
      <!-- abstract in English -->
      <xsl:choose>
        <xsl:when test="./abstract_english">"<xsl:value-of select="normalize-space(./abstract_english)"/>",</xsl:when>
        <xsl:otherwise>null,</xsl:otherwise>
      </xsl:choose>
      <!-- Year and Month -->
      <xsl:choose>
        <xsl:when test="./year and ./month"><xsl:value-of select="normalize-space(./year)" />-<xsl:value-of select="format-number(./month, '00')" />,</xsl:when>
        <xsl:otherwise>null,</xsl:otherwise>
      </xsl:choose>
      <!-- type -->
      <xsl:choose>
        <xsl:when test="./@type"><xsl:value-of select="./@type" />,</xsl:when>
        <xsl:otherwise>null,</xsl:otherwise>
      </xsl:choose>
      <!-- URL -->
      <xsl:choose>
        <xsl:when test="./@url"><xsl:value-of select="./@url" />,</xsl:when>
        <xsl:otherwise>null,</xsl:otherwise>
      </xsl:choose>
      <!-- major -->
      <xsl:choose>
        <xsl:when test="./@major"><xsl:value-of select="./@major" />,</xsl:when>
        <xsl:otherwise>null,</xsl:otherwise>
      </xsl:choose>
      <!-- disclosed -->
      <xsl:choose>
        <xsl:when test="./@disclosed"><xsl:value-of select="./@disclosed" />,</xsl:when>
        <xsl:otherwise>null,</xsl:otherwise>
      </xsl:choose>
      <xsl:text>&#10;</xsl:text>
  </xsl:template>
  <xsl:template match="author">
    <xsl:param name="japanese">False</xsl:param>
    <xsl:choose>
      <xsl:when test="./@japanese and $japanese != 'False'"><xsl:value-of select="./@japanese" /></xsl:when>
      <xsl:otherwise><xsl:value-of select="text()" /></xsl:otherwise>
    </xsl:choose>
    <!-- handling the comma -->
    <xsl:if test="position() != last()">
      <xsl:text>, </xsl:text>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
