<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>

    <xsl:template match="str | int | float">
        <xsl:element name="field">
            <xsl:attribute name="name"><xsl:value-of select='@name'/></xsl:attribute>
            <xsl:value-of select="text()"/>
        </xsl:element> 
    </xsl:template>
    
    <xsl:template match="doc">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="arr">
        <xsl:variable name="name" select="@name"/>
        <xsl:for-each select="str | int | float">
            <xsl:element name="field">
                <xsl:attribute name="name"><xsl:value-of select='$name'/></xsl:attribute>
                <xsl:value-of select="text()"/>
            </xsl:element> 
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="response/result">
        <add>
            <xsl:apply-templates select="@* | node()"/>
        </add>
    </xsl:template>
    <xsl:template match="response/lst">
    </xsl:template>
    
    <xsl:template match="@* | node()" mode="copy">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    
    <!-- ======================================================================= -->
    <!-- DEFAULT TEMPLATE                                                        -->
    <!-- ======================================================================= -->
    
    
    <!--  <xsl:template match="@* | node()">
        <xsl:apply-templates select="@* | node()"/>
    </xsl:template>
    
    <xsl:template match="@* | node()">
        <xsl:apply-templates select="@* | node()"/>
    </xsl:template>  -->
    
</xsl:stylesheet>
