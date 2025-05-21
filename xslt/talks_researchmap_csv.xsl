<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" > 
  <xsl:output method="text" encoding="UTF-8" />
  <xsl:strip-space elements="*" />
  <xsl:template match="/data">
    <xsl:text>presentations</xsl:text>
    <xsl:text>&#10;</xsl:text>
    <xsl:text>アクション名,アクションタイプ,ID,タイトル(日本語),タイトル(英語),講演者(日本語),講演者(英語),会議名(日本語),会議名(英語),発表年月日,招待の有無,記述言語,会議種別,国際・国内会議,国際共著</xsl:text>
    <xsl:text>&#10;</xsl:text>
    <xsl:apply-templates select="./Talks" />    
  </xsl:template>
  <xsl:template match="Talk">
    <xsl:choose>
      <xsl:when test="./@id">
        <xsl:text>update,doc,</xsl:text><xsl:value-of select="normalize-space(./@id)"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>insert,merge,null</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>,</xsl:text>
    <!-- Title -->
    <xsl:call-template name="value-of-with-japanese">
      <xsl:with-param name="node" select="./title"/>
    </xsl:call-template>
    <xsl:text>,</xsl:text>
    <!-- Presenter -->
    <xsl:call-template name="value-of-with-japanese">
      <xsl:with-param name="node" select="./presenter"/>
    </xsl:call-template>
    <xsl:text>,</xsl:text>
    <!-- Venue -->
    <xsl:call-template name="value-of-with-default">
      <xsl:with-param name="node" select="./venue"/>
      <xsl:with-param name="default" select="null"/>
    </xsl:call-template>
    <xsl:text>,</xsl:text>
    <xsl:call-template name="value-of-with-default">
      <xsl:with-param name="node" select="./venue"/>
      <xsl:with-param name="default" select="null"/>
    </xsl:call-template>
    <xsl:text>,</xsl:text>
    <!-- Date -->
    <xsl:choose>
      <xsl:when test="./year and ./month and ./day">
        <xsl:value-of select="normalize-space(./year)"/><xsl:text>/</xsl:text><xsl:value-of select="normalize-space(./month)"/><xsl:text>/</xsl:text><xsl:value-of select="normalize-space(./day)"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>null</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>,</xsl:text>
    <!-- Invitation -->
    <xsl:call-template name="value-of-with-default">
      <xsl:with-param name="node" select="./@invited"/>
      <xsl:with-param name="default" select="'false'"/>
    </xsl:call-template>
    <xsl:text>,</xsl:text>
    <!-- Language -->
    <xsl:call-template name="value-of-with-default">
      <xsl:with-param name="node" select="./@lang"/>
      <xsl:with-param name="default" select="'eng'"/>
    </xsl:call-template>
    <xsl:text>,</xsl:text>
    <!-- type -->
    <xsl:choose>
      <xsl:when test="./@type">
        <xsl:value-of select="normalize-space(./@type)" />
      </xsl:when>
      <xsl:when test="./@invited">
        <xsl:text>invited_oral_presentation</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>oral_presentation</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>,</xsl:text>
    <!-- venue -->
    <xsl:choose>
      <xsl:when test="./@international_venue">
        <xsl:value-of select="normalize-space(./@international_venue)" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>null</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>,</xsl:text>
    <!-- venue -->
    <xsl:choose>
      <xsl:when test="./@international_collaboration">
        <xsl:value-of select="normalize-space(./@international_collaboration)" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>null</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>&#10;</xsl:text>
  </xsl:template>
  <xsl:template name="value-of-with-default">
    <xsl:param name="node" />
    <xsl:param name="default" />
    <xsl:if test="$node">
      <xsl:text>"</xsl:text><xsl:value-of select="normalize-space($node)" /><xsl:text>"</xsl:text>
    </xsl:if>
    <xsl:if test="not($node)">
      <xsl:value-of select="$default" />
    </xsl:if>
  </xsl:template>
  <xsl:template name="value-of-with-japanese">
    <xsl:param name="node" />
    <xsl:if test="$node/@japanese">
      <xsl:text>"</xsl:text><xsl:value-of select="normalize-space($node/@japanese)" /><xsl:text>"</xsl:text>
    </xsl:if>
    <xsl:if test="not($node/@japanese)">
      <xsl:text>"</xsl:text><xsl:value-of select="normalize-space($node)" /><xsl:text>"</xsl:text>
    </xsl:if>
    <xsl:text>,</xsl:text>
    <xsl:text>"</xsl:text><xsl:value-of select="normalize-space($node)" /><xsl:text>"</xsl:text>
  </xsl:template>
</xsl:stylesheet>
