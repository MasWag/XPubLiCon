<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" > 
  <xsl:output method="xml" encoding="UTF-8"/>
  <xsl:template match="/data">
    <ul>
      <xsl:apply-templates select="./Tools/WebResource"/>
    </ul>
  </xsl:template>
  <xsl:template match="WebResource">
    <li>
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
        <span class="title"><xsl:value-of select="normalize-space(./@label)" /></span>
      </xsl:element>
    </li>
  </xsl:template>
</xsl:stylesheet>
