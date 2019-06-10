<xsl:stylesheet version="1.0" 
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output omit-xml-declaration="yes" indent="yes"/>

    <xsl:variable name="slash" select="'/'"/>
    <xsl:variable name="underscore" select="'_'"/>

    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="project[@remote='rk']/@name">
        <xsl:attribute name="name">
            <xsl:value-of select="translate(., $slash, $underscore)"/>
        </xsl:attribute>
    </xsl:template>
</xsl:stylesheet>
