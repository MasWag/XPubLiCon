<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" > 
  <xsl:output method="text" encoding="UTF-8" />
  <xsl:strip-space elements="*" />
  <xsl:template match="/data">research_projects
アクション名,アクションタイプ,ID,タイトル(日本語),タイトル(英語),担当研究者(日本語),担当研究者(英語),提供機関(日本語),提供機関(英語),制度名(日本語),制度名(英語),研究種目(日本語),研究種目(英語),研究機関名(日本語),研究機関名(英語),研究期間(From),研究期間(To),担当区分,配分額(総額),配分額(直接経費),配分額(間接経費),研究概要(日本語),研究概要(英語),国際共著,課題番号,URL
<xsl:apply-templates select="./Grants" />
  </xsl:template>
  <xsl:template match="Grants/ResearchProject">
    <xsl:choose>
      <xsl:when test="./@id">update,doc,<xsl:value-of select="normalize-space(./@id)"/></xsl:when>
      <xsl:otherwise>insert,merge,null</xsl:otherwise>
      </xsl:choose>,<xsl:choose>
      <xsl:when test="./title/@japanese">"<xsl:value-of select="normalize-space(./title/@japanese)"/>"</xsl:when>
      <xsl:otherwise>"<xsl:value-of select="normalize-space(./title)"/>"</xsl:otherwise>
      </xsl:choose>,<xsl:choose>
      <xsl:when test="./title/text()">"<xsl:value-of select="normalize-space(./title/text())"/>"</xsl:when>
      <xsl:otherwise>null</xsl:otherwise>
      </xsl:choose>,<xsl:choose>
      <xsl:when test="./author/@japanese">"<xsl:value-of select="normalize-space(./author/@japanese)"/>"</xsl:when>
      <xsl:otherwise>"<xsl:value-of select="normalize-space(./author)"/>"</xsl:otherwise>
      </xsl:choose>,"<xsl:value-of select="normalize-space(./author)"/>",<xsl:choose>
      <xsl:when test="./grant_agency/@japanese">"<xsl:value-of select="normalize-space(./grant_agency/@japanese)"/>"</xsl:when>
      <xsl:otherwise>"<xsl:value-of select="normalize-space(./grant_agency)"/>"</xsl:otherwise>
      </xsl:choose>,"<xsl:value-of select="normalize-space(./grant_agency)"/>",<xsl:choose>
      <xsl:when test="./scheme/@japanese">"<xsl:value-of select="normalize-space(./scheme/@japanese)"/>"</xsl:when>
      <xsl:otherwise>"<xsl:value-of select="normalize-space(./scheme)"/>"</xsl:otherwise>
      </xsl:choose>,"<xsl:value-of select="normalize-space(./scheme)"/>",<xsl:choose>
      <xsl:when test="./categories/@japanese">"<xsl:value-of select="normalize-space(./categories/@japanese)"/>","<xsl:value-of select="normalize-space(./categories)"/>"</xsl:when>
      <xsl:when test="./categories">"<xsl:value-of select="normalize-space(./categories)"/>","<xsl:value-of select="normalize-space(./categories)"/>"</xsl:when>
      <xsl:otherwise>null,null</xsl:otherwise>
      </xsl:choose>,<xsl:choose>
      <xsl:when test="./organization/@japanese">"<xsl:value-of select="normalize-space(./organization/@japanese)"/>"</xsl:when>
      <xsl:otherwise>"<xsl:value-of select="normalize-space(./organization)"/>"</xsl:otherwise>
      </xsl:choose>,"<xsl:value-of select="normalize-space(./organization)"/>",<xsl:choose>
      <xsl:when test="./start_day"><xsl:value-of select="normalize-space(./start_year)"/>-<xsl:value-of select="normalize-space(./start_month)"/>-<xsl:value-of select="normalize-space(./start_day)"/></xsl:when>
      <xsl:otherwise>null</xsl:otherwise>
      </xsl:choose>,<xsl:choose>
      <xsl:when test="./end_day"><xsl:value-of select="normalize-space(./end_year)"/>-<xsl:value-of select="normalize-space(./end_month)"/>-<xsl:value-of select="normalize-space(./end_day)"/></xsl:when>
      <xsl:otherwise>null</xsl:otherwise>
      </xsl:choose>,<xsl:choose>
      <xsl:when test="./@type"><xsl:value-of select="normalize-space(./@type)"/></xsl:when>
      <xsl:otherwise>null</xsl:otherwise>
      </xsl:choose>,<xsl:choose>
      <xsl:when test="./@total"><xsl:value-of select="normalize-space(./@total)"/></xsl:when>
      <xsl:otherwise>null</xsl:otherwise>
      </xsl:choose>,<xsl:choose>
      <xsl:when test="./@total_direct"><xsl:value-of select="normalize-space(./@total_direct)"/></xsl:when>
      <xsl:otherwise>null</xsl:otherwise>
      </xsl:choose>,<xsl:choose>
      <xsl:when test="./@total_indirect"><xsl:value-of select="normalize-space(./@total_indirect)"/></xsl:when>
      <xsl:otherwise>null</xsl:otherwise>
      </xsl:choose>,<xsl:choose>
      <xsl:when test="./abstract_japanese">"<xsl:value-of select="normalize-space(./abstract_japanese)"/>"</xsl:when>
      <xsl:otherwise>null</xsl:otherwise>
      </xsl:choose>,<xsl:choose>
      <xsl:when test="./abstract_english">"<xsl:value-of select="normalize-space(./abstract_english)"/>"</xsl:when>
      <xsl:otherwise>null</xsl:otherwise>
      </xsl:choose>,<xsl:choose>
      <xsl:when test="./@international">"<xsl:value-of select="normalize-space(./@international)"/>"</xsl:when>
      <xsl:otherwise>null</xsl:otherwise>
      </xsl:choose>,<xsl:choose>
      <xsl:when test="./@grant_number">"<xsl:value-of select="normalize-space(./@grant_number)"/>"</xsl:when>
      <xsl:otherwise>null</xsl:otherwise>
      </xsl:choose>,<xsl:choose>
      <xsl:when test="./@url">"<xsl:value-of select="normalize-space(./@url)"/>"</xsl:when>
      <xsl:otherwise>null</xsl:otherwise>
    </xsl:choose>
    <xsl:text>&#10;</xsl:text>
  </xsl:template>
  <xsl:template match="Grants/OtherGrants">
  </xsl:template>
</xsl:stylesheet>
