<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" > 
  <xsl:output method="text" encoding="UTF-8" />
  <xsl:strip-space elements="*" />
  <xsl:template match="/data">committee_memberships
"アクション名","アクションタイプ",ID,年月(From),年月(To),委員名(日本語),委員名(英語),団体名(日本語),団体名(英語),団体区分
<xsl:apply-templates select="./Committees" />
  </xsl:template>
  <xsl:template match="Committees/PCMember">
    <xsl:choose>
      <xsl:when test="./@id">update,doc,<xsl:value-of select="normalize-space(./@id)"/></xsl:when>
      <xsl:otherwise>insert,merge,null</xsl:otherwise>
      </xsl:choose>,<xsl:choose><xsl:when test="./start_year"><xsl:value-of select="./start_year" /><xsl:value-of select="./start_month" />,</xsl:when>
      <xsl:otherwise>null,</xsl:otherwise></xsl:choose><xsl:choose>
      <xsl:when test="./end_year"><xsl:value-of select="./end_year" /><xsl:value-of select="./end_month" />,</xsl:when>
      <xsl:otherwise>null,</xsl:otherwise>
      </xsl:choose>プログラム委員,"PC Member",<xsl:choose>
      <xsl:when test="./organization/@japanese">"<xsl:value-of select="normalize-space(./organization/@japanese)"/>"</xsl:when>
      <xsl:otherwise>"<xsl:value-of select="normalize-space(./organization)"/>"</xsl:otherwise>
      </xsl:choose>,"<xsl:value-of select="normalize-space(./organization)"/>",<xsl:value-of select="./@type" /><xsl:text>
</xsl:text>
  </xsl:template>
  <xsl:template match="Committees/PCChair">
    <xsl:choose>
      <xsl:when test="./@id">update,doc,<xsl:value-of select="normalize-space(./@id)"/></xsl:when>
      <xsl:otherwise>insert,merge,null</xsl:otherwise>
      </xsl:choose>,<xsl:choose><xsl:when test="./start_year"><xsl:value-of select="./start_year" /><xsl:value-of select="./start_month" />,</xsl:when>
      <xsl:otherwise>null,</xsl:otherwise></xsl:choose><xsl:choose>
      <xsl:when test="./end_year"><xsl:value-of select="./end_year" /><xsl:value-of select="./end_month" />,</xsl:when>
      <xsl:otherwise>null,</xsl:otherwise>
      </xsl:choose>プログラム委員長,"PC Chair",<xsl:choose>
      <xsl:when test="./organization/@japanese">"<xsl:value-of select="normalize-space(./organization/@japanese)"/>"</xsl:when>
      <xsl:otherwise>"<xsl:value-of select="normalize-space(./organization)"/>"</xsl:otherwise>
      </xsl:choose>,"<xsl:value-of select="normalize-space(./organization)"/>",<xsl:value-of select="./@type" />
  </xsl:template>
  <xsl:template match="Committees/Other">
    <xsl:choose>
      <xsl:when test="./@id">update,doc,<xsl:value-of select="normalize-space(./@id)"/></xsl:when>
      <xsl:otherwise>insert,merge,null</xsl:otherwise>
      </xsl:choose>,<xsl:choose><xsl:when test="./start_year"><xsl:value-of select="./start_year" /><xsl:value-of select="./start_month" />,</xsl:when>
      <xsl:otherwise>null,</xsl:otherwise></xsl:choose><xsl:choose>
      <xsl:when test="./end_year"><xsl:value-of select="./end_year" /><xsl:value-of select="./end_month" />,</xsl:when>
      <xsl:otherwise>null,</xsl:otherwise>
      </xsl:choose>"<xsl:choose>
      <xsl:when test="./name/@japanese"><xsl:value-of select="./name/@japanese" /></xsl:when>
      <xsl:otherwise><xsl:value-of select="./name" /></xsl:otherwise>
      </xsl:choose>","<xsl:value-of select="./name" />",<xsl:choose>
      <xsl:when test="./organization/@japanese">"<xsl:value-of select="normalize-space(./organization/@japanese)"/>"</xsl:when>
      <xsl:otherwise>"<xsl:value-of select="normalize-space(./organization)"/>"</xsl:otherwise>
      </xsl:choose>,"<xsl:value-of select="normalize-space(./organization)"/>",<xsl:value-of select="./@type" />
  </xsl:template>
</xsl:stylesheet>
