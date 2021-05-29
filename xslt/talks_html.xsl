<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" > 
  <xsl:output method="xml" encoding="UTF-8"/>
  <xsl:template match="/data">
    <ul>
      <xsl:apply-templates select="./Talks/Talk"/>
    </ul>
  </xsl:template>
  <xsl:template match="Talk">
    <xsl:if test="not(./@minor) or ./@minor = 'false'">
      <li>
        <span class="title"><xsl:value-of select="normalize-space(./title)" /></span>
        <xsl:if test="./@invited and ./@invited = 'true'">
          Invited talk at 
        </xsl:if>
        <xsl:apply-templates select="./venue/WebResource"/>,
        <xsl:value-of select="normalize-space(./location)" />,
        <xsl:value-of select="normalize-space(./date)" />.
        <xsl:if test="./WebResource">
          [<xsl:apply-templates select="./WebResource"/>]
        </xsl:if>
      </li>
    </xsl:if>
  </xsl:template>
  <xsl:template match="WebResource">
    <xsl:element name="a">
      <xsl:attribute name="href">
        <xsl:if test="./@doi">
          <xsl:text>https://doi.org/</xsl:text>
          <xsl:value-of select="normalize-space(./@doi)" />
        </xsl:if>                            
        <xsl:if test="./@url">
          <xsl:value-of select="normalize-space(./@url)" />
        </xsl:if>                            
      </xsl:attribute>
      <xsl:value-of select="normalize-space(./@label)" />
    </xsl:element>
    <xsl:if test="position()!=last()"><xsl:text> | </xsl:text></xsl:if>
  </xsl:template>
</xsl:stylesheet>
