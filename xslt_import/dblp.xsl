<?xml version="1.0" ?>
<!--
Brief: This is a XSLT stylesheet to generate XPubLiCon's XML from DBLP's XML.
Note: Currently, we support inproceedings and proceedings.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
  <xsl:output method="xml" encoding="UTF-8"/>
  <xsl:template match="/">
    <data>
      <PublicationEntries>
        <xsl:apply-templates select="./dblp" />
      </PublicationEntries>
    </data>
  </xsl:template>
  <xsl:template match="inproceedings">
    <xsl:element name="InProceedings">
      <xsl:apply-templates select="./author" />
      <xsl:element name="title">
        <xsl:value-of select="./title" />
      </xsl:element>
      <xsl:element name="year">
        <xsl:value-of select="./year" />
      </xsl:element>
      <xsl:element name="pages">
        <xsl:value-of select="./pages" />
      </xsl:element>
      <xsl:element name="booktitle">
        <xsl:value-of select="./booktitle" />
      </xsl:element>
    </xsl:element>
  </xsl:template>
  <xsl:template match="proceedings">
    <xsl:element name="Proceedings">
      <xsl:if test="./series">
        <xsl:attribute name="series">
          <xsl:value-of select="./series" />
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="./volume">
        <xsl:attribute name="volume">
          <xsl:value-of select="./volume" />
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="./publisher">
        <xsl:attribute name="publisher">
          <xsl:value-of select="./publisher" />
        </xsl:attribute>
      </xsl:if>
      <xsl:apply-templates select="./editor" />
      <xsl:element name="title">
        <xsl:value-of select="./title" />
      </xsl:element>
      <xsl:element name="year">
        <xsl:value-of select="./year" />
      </xsl:element>
      <xsl:if test="./doi or ./ee">
        <xsl:element name="officialPDF">
          <xsl:element name="WebResource">
            <xsl:attribute name="label">
              <xsl:choose>
                <xsl:when test="./publisher"><xsl:value-of select="./publisher" /></xsl:when>
                <xsl:otherwise>official</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
            <xsl:choose>
              <xsl:when test="./doi">
                <xsl:attribute name="doi">
                  <xsl:value-of select="./doi" />
                </xsl:attribute>
              </xsl:when>
              <xsl:when test="starts-with(./ee, 'https://doi.org/')">
                <xsl:attribute name="doi">
                  <xsl:value-of select="substring-after(./ee, 'https://doi.org/')" />
                </xsl:attribute>
              </xsl:when>
              <xsl:otherwise>
                <xsl:attribute name="url">
                  <xsl:value-of select="./ee" />
                </xsl:attribute>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:element>
        </xsl:element>
      </xsl:if>
      <xsl:if test="./@key or ./url">
        <xsl:element name="otherResources">
          <xsl:element name="WebResource">
            <xsl:attribute name="label">DBLP</xsl:attribute>
            <xsl:attribute name="url">
              <xsl:choose>
                <xsl:when test="./@key">
                  <xsl:text>https://dblp.org/rec/</xsl:text>
                  <xsl:value-of select="./@key" />
                  <xsl:text>.bib</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="./url" />
                </xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
          </xsl:element>
        </xsl:element>
      </xsl:if>
    </xsl:element>
  </xsl:template>
  <xsl:template match="author">
    <author>
      <xsl:value-of select="."/>
    </author>
  </xsl:template>
  <xsl:template match="editor">
    <editor>
      <xsl:value-of select="."/>
    </editor>
  </xsl:template>
</xsl:stylesheet>
