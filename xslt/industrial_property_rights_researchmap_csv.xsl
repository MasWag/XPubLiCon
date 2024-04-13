<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
  <xsl:output method="text" encoding="UTF-8" />
  <xsl:strip-space elements="*" />
  <xsl:template match="/data">
    <xsl:text>industrial_property_rights</xsl:text>
    <xsl:text>&#10;</xsl:text>
    <xsl:text>アクション名,アクションタイプ,ID,産業財産権の種類,産業財産権名(日本語),産業財産権名(英語),発明者/考案者/創作者(日本語),発明者/考案者/創作者(英語),出願番号,出願日,出願人(機関)(日本語),出願人(機関)(英語),公開番号,公開日</xsl:text>
    <xsl:text>&#10;</xsl:text>
    <xsl:apply-templates select="./IndustrialPropertyRights" />
  </xsl:template>
  <xsl:template match="Patent">
    <xsl:choose>
      <xsl:when test="./@id">
        <xsl:text>update,doc,</xsl:text><xsl:value-of select="normalize-space(./@id)"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>insert,merge,null</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <!-- Kind -->
    <xsl:text>,patent_right,</xsl:text>
    <!-- Title -->
    <xsl:call-template name="value-of-with-japanese">
      <xsl:with-param name="node" select="./title"/>
    </xsl:call-template>
    <xsl:text>,</xsl:text>
    <!-- Authors -->
    <xsl:text>"[</xsl:text>
    <xsl:apply-templates select="./author">
      <xsl:with-param name="japanese" select="'True'"/>
    </xsl:apply-templates>
    <xsl:text>]",</xsl:text>
    <xsl:text>"[</xsl:text>
    <xsl:apply-templates select="./author" />
    <xsl:text>]", </xsl:text>
    <!-- Application number -->
    <xsl:call-template name="output-field">
      <xsl:with-param name="node" select="@application_number"/>
    </xsl:call-template>
    <!-- Application date -->
    <xsl:call-template name="output-field">
      <xsl:with-param name="node" select="@application_date"/>
    </xsl:call-template>
    <!-- Applicant -->
    <xsl:call-template name="value-of-with-japanese">
      <xsl:with-param name="node" select="./applicant"/>
    </xsl:call-template>
    <xsl:text>, </xsl:text>
    <!-- Patent number -->
    <xsl:call-template name="output-field">
      <xsl:with-param name="node" select="@patent_number"/>
    </xsl:call-template>
    <!-- Registration date -->
    <xsl:call-template name="output-field">
      <xsl:with-param name="node" select="@registration_date"/>
      <xsl:with-param name="trailing_comma" select="False" />
    </xsl:call-template>
    <xsl:text>&#10;</xsl:text>
  </xsl:template>
  <!--
    Template: output-field
    Description: Outputs the value of a given node, or 'null' if the node is empty or does not exist.
    Usage: This template is designed to handle the output of XML node values directly into CSV format, ensuring proper CSV syntax.
           It checks if the node parameter passed has content; if it does, it outputs the node's value normalized. If the node is empty or not present, it outputs 'null'.
           Each call to this template should pass a single node from which the data will be extracted.

    Parameters:
      node - A reference to an XML node whose value is to be outputted.
      trailing_comma - A boolean value that determines whether a trailing comma should be added to the output. Default is true.

    Example Usage:
      <xsl:call-template name="output-field">
        <xsl:with-param name="node" select="@application_number"/>
      </xsl:call-template>
  -->  
  <xsl:template name="output-field">
    <xsl:param name="node" />
    <xsl:param name="trailing_comma">True</xsl:param>
    <xsl:text>"</xsl:text>
    <xsl:choose>
      <xsl:when test="$node">
        <xsl:value-of select="normalize-space($node)"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>null</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>"</xsl:text>
    <xsl:if test="$trailing_comma = 'True'">
      <xsl:text>, </xsl:text>
    </xsl:if>
  </xsl:template>
  <xsl:template name="value-of-with-default">
    <xsl:param name="node" />
    <xsl:param name="default" />
    <xsl:if test="$node">
      <xsl:text>"</xsl:text><xsl:value-of select="normalize-space($node)" /><xsl:text>"</xsl:text>
    </xsl:if>
    <xsl:if test="not($node)">
      <xsl:value-of select="$default" />
    </xsl:if>
  </xsl:template>
  <xsl:template name="value-of-with-japanese">
    <xsl:param name="node" />
    <xsl:if test="$node/@japanese">
      <xsl:text>"</xsl:text><xsl:value-of select="normalize-space($node/@japanese)" /><xsl:text>"</xsl:text>
    </xsl:if>
    <xsl:if test="not($node/@japanese)">
      <xsl:text>"</xsl:text><xsl:value-of select="normalize-space($node)" /><xsl:text>"</xsl:text>
    </xsl:if>
    <xsl:text>,</xsl:text>
    <xsl:if test="normalize-space($node) != ''">
      <xsl:text>"</xsl:text><xsl:value-of select="normalize-space($node)" /><xsl:text>"</xsl:text>
    </xsl:if>
    <xsl:if test="normalize-space($node) = ''">
      <xsl:text>null</xsl:text>
    </xsl:if>
  </xsl:template>
  <xsl:template match="author">
    <xsl:param name="japanese">False</xsl:param>
    <xsl:choose>
      <xsl:when test="./@japanese and $japanese != 'False'">
        <xsl:value-of select="./@japanese" />
        <!-- handling the comma. We put a comma if this is not the last and text() is nonempty -->
        <xsl:if test="position() != last() and ./@japanese != ''">
          <xsl:text>, </xsl:text>
        </xsl:if>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="text()" />
        <!-- handling the comma. We put a comma if this is not the last and text() is nonempty -->
        <xsl:if test="position() != last() and text() != ''">
          <xsl:text>, </xsl:text>
        </xsl:if>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>
