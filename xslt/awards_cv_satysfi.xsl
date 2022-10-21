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
  <xsl:value-of select="normalize-space(./name)" />
  <xsl:if test="count(./author) > 1"> (jointly with <xsl:apply-templates select="./author"/>)</xsl:if>
  <xsl:text>, </xsl:text>
  <xsl:value-of select="normalize-space(./organization)" /><xsl:text>, </xsl:text>
  <xsl:call-template name="conv-month" />
  <xsl:if test="./day">
  <xsl:text> </xsl:text><xsl:value-of select="normalize-space(./day)" />
  </xsl:if>
  <xsl:text>, </xsl:text>
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
  <xsl:template match="author">
    <!-- We assume that ./@me != 'true' holds for only one of the authors. -->
    <xsl:if test="not(./@me) or ./@me != 'true'">
      <xsl:value-of select="text()" /><!-- handling the comma -->
      <xsl:choose>
        <xsl:when test="(not(../author[last()]/@me) or ../author[last()]/@me != 'true')">
          <!-- When the last author is not me -->
          <xsl:choose>
            <xsl:when test="count(../author) = 3 and position() != last()">
              <xsl:text> and </xsl:text>
            </xsl:when>
            <xsl:when test="count(../author) > 3">
              <xsl:choose>
                <xsl:when test="(not(../author[last() - 1]/@me) or ../author[last() - 1]/@me != 'true')">
                  <!-- When the last -1 author is not me -->
                  <xsl:choose>
                    <xsl:when test="last() > position() + 1">
                      <xsl:text>, </xsl:text>
                    </xsl:when>
                    <xsl:when test="last() = position() + 1">
                      <xsl:text>, and </xsl:text>
                    </xsl:when>
                  </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                  <!-- When the last -1 author is me -->
                  <xsl:choose>
                    <xsl:when test="last() > position() + 2">
                      <xsl:text>, </xsl:text>
                    </xsl:when>
                    <xsl:when test="last() = position() + 2">
                      <xsl:text>, and </xsl:text>
                    </xsl:when>
                  </xsl:choose>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:when>
          </xsl:choose>
        </xsl:when>
        <xsl:otherwise>
          <!-- When the last author is me -->
          <xsl:choose>
            <xsl:when test="count(../author) = 3 and position() + 1 != last()">
              <xsl:text> and </xsl:text>
            </xsl:when>
            <xsl:when test="count(../author) > 3">
              <xsl:choose>
                <xsl:when test="last() > position() + 2">
                  <xsl:text>, </xsl:text>
                </xsl:when>
                <xsl:when test="position() + 2 = last()">
                  <xsl:text>, and </xsl:text>
                </xsl:when>
              </xsl:choose>
            </xsl:when>
          </xsl:choose>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
