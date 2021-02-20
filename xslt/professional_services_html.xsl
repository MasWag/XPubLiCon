<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" > 
  <xsl:output method="xml" encoding="UTF-8"/>
  <xsl:template match="/data">
    <xsl:apply-templates select="./Committees"/>
  </xsl:template>
  <xsl:template match="Committees">
    <ul>
      <xsl:if test="./PCMember">
        <li>Program committee member: 
          <xsl:apply-templates select="./PCMember"/>
        </li>
      </xsl:if>
      <xsl:if test="./PCChair">
        <li>Program committee chair: 
          <xsl:apply-templates select="./PCChair"/>
        </li>
      </xsl:if>
      <xsl:apply-templates select="./Other"/>
    </ul>
  </xsl:template>
  <xsl:template match="PCMember">
    <xsl:element name="a">
      <xsl:if test="./@id">
        <xsl:attribute name="id">
          <xsl:value-of select="normalize-space(./@id)" />
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="./@url">
        <xsl:attribute name="href">
          <xsl:value-of select="normalize-space(./organization/@url)" />
        </xsl:attribute>
      </xsl:if>
      <xsl:value-of select="normalize-space(./organization)" /> <xsl:value-of select="normalize-space(./start_year)" />.
    </xsl:element>
  </xsl:template>
  <xsl:template match="PCChair">
    <xsl:element name="a">
      <xsl:if test="./@id">
        <xsl:attribute name="id">
          <xsl:value-of select="normalize-space(./@id)" />
        </xsl:attribute>
      </xsl:if>
      <xsl:attribute name="href">
        <xsl:value-of select="normalize-space(./organization/@url)" />
      </xsl:attribute>
      <xsl:value-of select="normalize-space(./organization)" /> <xsl:value-of select="normalize-space(./start_year)" />.
    </xsl:element>
    </xsl:template>
  <xsl:template match="Other">
    <li><xsl:value-of select="normalize-space(./name)" /> 
    <xsl:element name="a">
      <xsl:if test="./@id">
        <xsl:attribute name="id">
          <xsl:value-of select="normalize-space(./@id)" />
        </xsl:attribute>
      </xsl:if>
      <xsl:attribute name="href">
        <xsl:value-of select="normalize-space(./organization/@url)" />
      </xsl:attribute>
      <xsl:value-of select="normalize-space(./organization)" /> <xsl:value-of select="normalize-space(./start_year)" />.
    </xsl:element>
    </li>
    </xsl:template>
</xsl:stylesheet>
