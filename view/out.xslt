<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>XML Display</title>
        <style>
          body { font-family: Arial, sans-serif; }
          .thread { margin-bottom: 20px; padding: 10px; border: 1px solid #ccc; }
          .section { margin-bottom: 10px; }
          .label { font-weight: bold; }
          .content { margin-left: 20px; }
        </style>
      </head>
      <body>
        <h1>XML Display</h1>
        <xsl:apply-templates/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="T">
    <div class="thread">
      <div class="section">
        <span class="label">Threads:</span>
        <div class="content">
          <xsl:apply-templates select="threads/thread"/>
        </div>
      </div>
      <div class="section">
        <span class="label">Store:</span>
        <div class="content">
          <xsl:value-of select="store"/>
        </div>
      </div>
      <div class="section">
        <span class="label">Busy:</span>
        <div class="content">
          <xsl:value-of select="busy"/>
        </div>
      </div>
      <div class="section">
        <span class="label">Terminated:</span>
        <div class="content">
          <xsl:value-of select="terminated"/>
        </div>
      </div>
      <div class="section">
        <span class="label">Input:</span>
        <div class="content">
          <xsl:value-of select="input"/>
        </div>
      </div>
      <div class="section">
        <span class="label">Output:</span>
        <div class="content">
          <xsl:value-of select="output"/>
        </div>
      </div>
      <div class="section">
        <span class="label">Next Location:</span>
        <div class="content">
          <xsl:value-of select="nextLoc"/>
        </div>
      </div>
      <div class="section">
        <span class="label">Classes:</span>
        <div class="content">
          <xsl:apply-templates select="classes/classData"/>
        </div>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="thread">
    <div class="section">
      <span class="label">K:</span>
      <div class="content">
        <xsl:value-of select="k"/>
      </div>
    </div>
    <div class="section">
      <span class="label">Control:</span>
      <div class="content">
        <xsl:apply-templates select="control"/>
      </div>
    </div>
    <div class="section">
      <span class="label">Environment:</span>
      <div class="content">
        <xsl:value-of select="env"/>
      </div>
    </div>
    <div class="section">
      <span class="label">Holds:</span>
      <div class="content">
        <xsl:value-of select="holds"/>
      </div>
    </div>
    <div class="section">
      <span class="label">ID:</span>
      <div class="content">
        <xsl:value-of select="id"/>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="control">
    <div class="section">
      <span class="label">Fstack:</span>
      <div class="content">
        <xsl:value-of select="fstack"/>
      </div>
    </div>
    <div class="section">
      <span class="label">Xstack:</span>
      <div class="content">
        <xsl:value-of select="xstack"/>
      </div>
    </div>
    <div class="section">
      <span class="label">Current Object:</span>
      <div class="content">
        <xsl:apply-templates select="crntObj"/>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="crntObj">
    <div class="section">
      <span class="label">Current Class:</span>
      <div class="content">
        <xsl:value-of select="crntClass"/>
      </div>
    </div>
    <div class="section">
      <span class="label">envStack:</span>
      <div class="content">
        <xsl:value-of select="envStack"/>
      </div>
    </div>
    <div class="section">
      <span class="label">location:</span>
      <div class="content">
        <xsl:value-of select="location"/>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="classData">
    <div class="section">
      <span class="label">Class Name:</span>
      <div class="content">
        <xsl:value-of select="className"/>
      </div>
    </div>
    <div class="section">
      <span class="label">Base Class:</span>
      <div class="content">
        <xsl:value-of select="baseClass"/>
      </div>
    </div>
    <div class="section">
      <span class="label">Declarations:</span>
      <div class="content">
        <xsl:apply-templates select="declarations"/>
      </div>
    </div>
  </xsl:template>
</xsl:stylesheet>
