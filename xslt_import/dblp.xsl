<?xml version="1.0" ?>
<!--
Brief: This is a XSLT stylesheet to generate XPubLiCon's XML from DBLP's XML.
Note: Currently, we only support inproceedings.
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
  <xsl:template match="author">
    <author>
      <xsl:value-of select="."/>
    </author>
  </xsl:template>
</xsl:stylesheet>
