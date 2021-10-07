<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
  <xsl:output method="text" encoding="UTF-8" />
  <xsl:strip-space elements="*" />
  <xsl:template match="/data"><xsl:text>published_papers&#10;</xsl:text>
  <xsl:text>"アクション名","アクションタイプ",ID,タイトル(日本語),タイトル(英語),著者(日本語),著者(英語),出版者・発行元(日本語),出版者・発行元(英語),出版年月,誌名(日本語),誌名(英語),巻,号,開始ページ,終了ページ,掲載種別&#10;</xsl:text>
<xsl:apply-templates select="./PublicationEntries" />
</xsl:template>
  <xsl:template match="PublicationEntries/InProceedings">
    <xsl:if test="not(./@published) or ./@published = 'true'">
      <xsl:choose>
        <xsl:when test="./@id"><xsl:text>update,doc,</xsl:text><xsl:value-of select="normalize-space(./@id)"/></xsl:when>
        <xsl:otherwise>insert,merge,null</xsl:otherwise>
        </xsl:choose><xsl:text>,"</xsl:text>
        <!-- Title -->
        <xsl:value-of select="normalize-space(./title)" />","<xsl:value-of select="normalize-space(./title)" /><xsl:text>",</xsl:text>
        <!-- Authors -->
        <xsl:text>"[</xsl:text>
        <xsl:apply-templates select="./author" />
        <xsl:text>]",</xsl:text>
        <xsl:text>"[</xsl:text>
        <xsl:apply-templates select="./author" />
        <xsl:text>]",</xsl:text>
        <!-- Publisher -->
        <xsl:choose>
          <xsl:when test="./@publisher"><xsl:value-of select="normalize-space(./@publisher)" />,<xsl:value-of select="normalize-space(./@publisher)" />,</xsl:when>
          <xsl:otherwise>null,null,</xsl:otherwise>
        </xsl:choose>
        <!-- Publication year -->
        <xsl:choose>
          <xsl:when test="./year">
            <xsl:value-of select="normalize-space(./year)" /><xsl:text>,"</xsl:text>
          </xsl:when>
          <xsl:otherwise>null,"</xsl:otherwise>
        </xsl:choose>
        <!-- Booktitle -->
        <xsl:value-of select="normalize-space(./booktitle)" /><xsl:text>","</xsl:text><xsl:value-of select="normalize-space(./booktitle)" /><xsl:text>",null,null,null,null,international_conference_proceedings&#10;</xsl:text>
    </xsl:if>
  </xsl:template>
  <xsl:template match="PublicationEntries/Article">
    <xsl:if test="not(./@published) or ./@published = 'true'">
      <xsl:choose>
        <xsl:when test="./@id">update,doc,<xsl:value-of select="normalize-space(./@id)"/></xsl:when>
        <xsl:otherwise>insert,merge,null</xsl:otherwise>
        </xsl:choose><xsl:text>,"</xsl:text>
        <!-- Title -->
        <xsl:value-of select="normalize-space(./title)" />",<xsl:value-of select="normalize-space(./title)" /><xsl:text>",</xsl:text>
        <!-- Authors -->
        <xsl:text>"[</xsl:text>
        <xsl:apply-templates select="./author" />
        <xsl:text>]",</xsl:text>
        <xsl:text>"[</xsl:text>
        <xsl:apply-templates select="./author" />
        <xsl:text>]",</xsl:text>
        <!-- Publisher -->
        <xsl:choose>
          <xsl:when test="./@publisher"><xsl:value-of select="normalize-space(./@publisher)" />,<xsl:value-of select="normalize-space(./@publisher)" />,</xsl:when>
          <xsl:otherwise>null,null,</xsl:otherwise>
        </xsl:choose>
        <!-- Publication year -->
        <xsl:value-of select="normalize-space(./year)" /><xsl:text>,</xsl:text>
        <!-- journal -->
        <xsl:value-of select="normalize-space(./journal)" /><xsl:text>,</xsl:text><xsl:value-of select="normalize-space(./journal)" /><xsl:text>,</xsl:text>
        <!-- volume -->
        <xsl:value-of select="normalize-space(./@volume)" /><xsl:text>,</xsl:text>
        <!-- number -->
        <xsl:choose>
          <xsl:when test="./@number">
            <xsl:value-of select="normalize-space(./@number)" /><xsl:text>,</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>null,</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
        <!-- begin page -->
        <xsl:value-of select="normalize-space(./@start_page)" /><xsl:text>,</xsl:text>
        <!-- end page -->
        <xsl:value-of select="normalize-space(./@end_page)" /><xsl:text>,scientific_journal&#10;</xsl:text>
    </xsl:if>
  </xsl:template>
  <!-- TODO -->
  <!-- 
       master_thesis：学位論文（修士）
       doctoral_thesis：学位論文（博士）
       others：学位論文（その他）
  -->
  <xsl:template match="PublicationEntries/Thesis"></xsl:template>
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
