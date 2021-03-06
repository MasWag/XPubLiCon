<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" > 
  <xsl:output method="xml" encoding="UTF-8"/>
  <xsl:template match="/data">
    <ul>
      <xsl:apply-templates select="./Awards/Award"/>
    </ul>
  </xsl:template>
  <xsl:template match="Award">
    <li>
      <xsl:value-of select="normalize-space(./name)" /><xsl:if test="count(./author) > 1"> (jointly with <xsl:apply-templates select="./author"/>)</xsl:if>, <span class="organization">
      <xsl:element name="a">
        <xsl:if test="./organization/@url">
          <xsl:attribute name="href">
            <xsl:value-of select="normalize-space(./organization/@url)" />
          </xsl:attribute>
        </xsl:if>
        <xsl:value-of select="normalize-space(./organization)" />
      </xsl:element>
      </span>, <xsl:apply-templates select="./month" /><xsl:if test="./day"><xsl:text> </xsl:text><xsl:value-of select="normalize-space(./day)" /></xsl:if><xsl:if test="./year and ./month">, </xsl:if><xsl:value-of select="normalize-space(./year)" />.
    </li>
  </xsl:template>
  <xsl:template match="month">
    <xsl:choose>
      <xsl:when test=". = 1">January</xsl:when>
      <xsl:when test=". = 2">February</xsl:when>
      <xsl:when test=". = 3">March</xsl:when>
      <xsl:when test=". = 4">April</xsl:when>
      <xsl:when test=". = 5">May</xsl:when>
      <xsl:when test=". = 6">June</xsl:when>
      <xsl:when test=". = 7">July</xsl:when>
      <xsl:when test=". = 8">August</xsl:when>
      <xsl:when test=". = 9">September</xsl:when>
      <xsl:when test=". = 10">October</xsl:when>
      <xsl:when test=". = 11">November</xsl:when>
      <xsl:when test=". = 12">December</xsl:when>
      <xsl:otherwise><xsl:value-of select="text()"/></xsl:otherwise>
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
