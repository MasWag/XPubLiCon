<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
  <xsl:output method="text" encoding="UTF-8"/>
  <xsl:template match="/data">
    <xsl:text>let awards = '&lt;&#x0A;</xsl:text>
    <xsl:text>  +listing {&#x0A;</xsl:text>
    <xsl:apply-templates select="./Awards" />
    <xsl:text>    }&#x0A;</xsl:text>
    <xsl:text>&gt;&#x0A;</xsl:text>
  </xsl:template>
  <xsl:template match="Award">
    <xsl:text>  * </xsl:text>
    <xsl:choose>
      <xsl:when test="./name/@japanese">
        <xsl:value-of select="normalize-space(./name/@japanese)" /><!-- handling the comma -->
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="normalize-space(./name)" /><!-- handling the comma -->
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(./author) > 1"> (<xsl:apply-templates select="./author"/> と共同受賞)</xsl:if>
    <xsl:text>，</xsl:text>
    <xsl:choose>
      <xsl:when test="./organization/@japanese">
        <xsl:value-of select="normalize-space(./organization/@japanese)" /><!-- handling the comma -->
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="normalize-space(./organization)" /><!-- handling the comma -->
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>，</xsl:text>
    <!-- Date -->
    <xsl:if test="./year">
      <xsl:value-of select="normalize-space(./year)" />
      <xsl:text>年</xsl:text>
    </xsl:if>
    <xsl:if test="./month">
      <xsl:value-of select="normalize-space(./month)" />
      <xsl:text>月</xsl:text>
    </xsl:if>
    <xsl:if test="./day">
      <xsl:value-of select="normalize-space(./day)" />
      <xsl:text>日</xsl:text>
    </xsl:if>
  </xsl:template>
  <xsl:template match="author">
    <!-- We assume that ./@me != 'true' holds for only one of the authors. -->
    <xsl:if test="not(./@me) or ./@me != 'true'">
      <xsl:choose>
        <xsl:when test="./@japanese">
          <xsl:value-of select="./@japanese" /><!-- handling the comma -->
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="text()" /><!-- handling the comma -->
        </xsl:otherwise>
      </xsl:choose>
      <xsl:choose>
        <xsl:when test="(not(../author[last()]/@me) or ../author[last()]/@me != 'true')">
          <!-- When the last author is not me -->
          <xsl:choose>
            <xsl:when test="position() != last()">
              <xsl:text>氏，</xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:text>氏</xsl:text>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:otherwise>
          <!-- When the last author is me -->
          <xsl:choose>
            <xsl:when test="position() != last() - 1">
              <xsl:text>氏，</xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:text>氏</xsl:text>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
