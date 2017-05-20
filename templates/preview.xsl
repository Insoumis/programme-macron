<xsl:stylesheet version="2.0"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:xs="http://www.w3.org/2001/XMLSchema"
        xmlns:doc="http://jlm2017.fr"
        xmlns:fn="http://www.w3.org/2005/xpath-functions"
        xmlns:dc="http://purl.org/dc/elements/1.1/"
        xmlns:cc="http://creativecommons.org/ns#"
        xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
        xmlns:svg="http://www.w3.org/2000/svg"
        xmlns="http://www.w3.org/2000/svg"
        xmlns:xlink="http://www.w3.org/1999/xlink"
        xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
        xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
        inkscape:version="0.48.2 r9819"
        sodipodi:docname="circonscriptions.svg"
        exclude-result-prefixes="xs doc">
  <xsl:output method="xml" indent="yes"/>

  <!--<xsl:template match="svg:polygon">
    <xsl:variable name="insee" select="substring-before(./@id, ' ')" />
    <xsl:variable name="city" select="key('citykey', substring-before(@id, ' '), $communes)"/>
    <xsl:variable name="red" select="$city/fn:number[@key='NON_TCE']" />
    <xsl:copy>
      <xsl:choose>
    <xsl:when test="$red">
      <xsl:attribute name="fill">rgb(255, <xsl:value-of select="255-round(255 * $red div 100)" />, <xsl:value-of select="255-round(255 * $red div 100)" /> )</xsl:attribute>
    </xsl:when>
    <xsl:otherwise>
      <xsl:attribute name="fill">rgb(100, 100, 100)</xsl:attribute>
    </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|node()" />
    </xsl:copy>-->
<xsl:template match="/">
<xsl:for-each select="/categories/categorie">
<xsl:variable name="chapitre_page" select="count(preceding-sibling::categorie)+1" />
<xsl:for-each select="./entree">
<xsl:variable name="element_page" select="count(preceding-sibling::entree)+1" />
<xsl:result-document method="xml" href="../public/elements/c{$chapitre_page}m{$element_page}.svg">
<svg
   width="1024mm"
   height="512mm"
   viewBox="0 0 3628.3465 1814.1732"
   viewport-fill="#00b8f9"
   id="svg2"
   version="1.1">
  <defs
     id="defs4" />
  <sodipodi:namedview
     id="base"
     pagecolor="#00b8f9"
     bordercolor="#666666"
     borderopacity="1.0"
     inkscape:pageopacity="1"
     inkscape:pageshadow="2"
     inkscape:zoom="0.19200035"
     inkscape:cx="957.63554"
     inkscape:cy="872.60545"
     inkscape:document-units="px"
     inkscape:current-layer="layer1"
     showgrid="false"
     inkscape:window-width="1535"
     inkscape:window-height="876"
     inkscape:window-x="65"
     inkscape:window-y="24"
     inkscape:window-maximized="1" />
  <metadata
     id="metadata7">
    <rdf:RDF>
      <cc:Work
         rdf:about="">
        <dc:format>image/svg+xml</dc:format>
        <dc:type
           rdf:resource="http://purl.org/dc/dcmitype/StillImage" />
        <dc:title></dc:title>
      </cc:Work>
    </rdf:RDF>
  </metadata>
  <rect height="100%" width="100%" fill="#00b8f9"></rect>
  <g
     inkscape:label="Calque 1"
     inkscape:groupmode="layer"
     id="layer1"
     transform="translate(0,761.81102)">
    <text
       xml:space="preserve"
       style="font-style:normal;font-weight:normal;font-size:40px;line-height:125%;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
       x="187.5"
       y="-444.59229"
       id="text4175"
       sodipodi:linespacing="125%"><tspan
         sodipodi:role="line"
         x="187.5"
         y="-444.59229"
         id="tspan4177"><tspan
           x="187.5"
           y="-444.59229"
           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:160px;font-family:Lato;-inkscape-font-specification:Lato"
           id="tspan4179">“<xsl:value-of select="./engagement" /></tspan></tspan></text>
    <text
       xml:space="preserve"
       style="font-style:normal;font-weight:normal;font-size:40px;line-height:125%;font-family:sans-serif;text-align:end;letter-spacing:0px;word-spacing:0px;text-anchor:end;fill:#000000;fill-opacity:1;stroke:none;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
       x="3416.7368"
       y="921.74762"
       id="text4181"
       sodipodi:linespacing="125%"><tspan
         sodipodi:role="line"
         x="3416.7368"
         y="921.74762"
         id="tspan4183"
         style="font-size:125px">En savoir plus sur analysons-macron.fr</tspan></text>
    <rect
       id="rect4189"
       width="1764.2969"
       height="137.95462"
       x="798.32013"
       y="238.48289"
       style="fill:#f0ad4e;fill-opacity:1;stroke:#f0ad4e;stroke-width:69.39212799;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
       transform="matrix(0.98477913,-0.17381042,0.17381042,0.98477913,0,0)" />
  </g>
</svg>
</xsl:result-document>
</xsl:for-each>
</xsl:for-each>
</xsl:template>

  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>

