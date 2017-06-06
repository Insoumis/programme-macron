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
<!-- “<xsl:value-of select="normalize-space(./engagement)" />” -->
<svg
   xmlns:dc="http://purl.org/dc/elements/1.1/"
   xmlns:cc="http://creativecommons.org/ns#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
   xmlns:svg="http://www.w3.org/2000/svg"
   xmlns="http://www.w3.org/2000/svg"
   xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
   xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
   version="1.1"
   id="Calque_1"
   x="0px"
   y="0px"
   width="1024px"
   height="512px"
   viewBox="0 0 1024 512"
   style="enable-background:new 0 0 1024 512;"
   xml:space="preserve"
   inkscape:version="0.91 r13725"
   sodipodi:docname="analysons-macron(1).svg"><metadata
     id="metadata3586"><rdf:RDF><cc:Work
         rdf:about=""><dc:format>image/svg+xml</dc:format><dc:type
           rdf:resource="http://purl.org/dc/dcmitype/StillImage" /></cc:Work></rdf:RDF></metadata><defs
     id="defs3584" /><sodipodi:namedview
     pagecolor="#ffffff"
     bordercolor="#666666"
     borderopacity="1"
     objecttolerance="10"
     gridtolerance="10"
     guidetolerance="10"
     inkscape:pageopacity="0"
     inkscape:pageshadow="2"
     inkscape:window-width="1535"
     inkscape:window-height="876"
     id="namedview3582"
     showgrid="false"
     inkscape:zoom="0.86571125"
     inkscape:cx="539.90022"
     inkscape:cy="256"
     inkscape:window-x="65"
     inkscape:window-y="24"
     inkscape:window-maximized="1"
     inkscape:current-layer="Calque_1"
     showguides="false" /><style
     type="text/css"
     id="style3482">
	.st0{fill:#2BB4E8;}
	.st1{fill:#FFFFFF;}
	.st2{font-family:'GillSans-BoldItalic';}
	.st3{font-size:50px;}
	.st4{font-size:30px;}
	.st5{letter-spacing:1;}
	.st6{fill:#E23D21;}
	.st7{font-size:34px;}
	.st8{font-family:'GillSans-Italic';}
	.st9{font-size:130px;}
	.st10{font-size:70.0426941px;}
	.st11{letter-spacing:2.0012188;}
	.st12{font-size:42.0255852px;}
</style><rect
     class="st0"
     width="1024"
     height="409.6000061"
     id="rect3484" /><text
     transform="matrix(1 0 0 1 708.4902344 154.8642578)"
     class="st1 st2 st3"
     id="text3498" />
<text
     transform="matrix(1 0 0 1 712.7626953 206.8642578)"
     class="st1 st2 st3"
     id="text3508" />
<text
     transform="matrix(1 0 0 1 838.1533203 258.8642578)"
     class="st1 st2 st3"
     id="text3522" />
<text
     transform="translate(106,90.204102)"
     id="text3526"><tspan
       style="-inkscape-font-specification:Gill Sans MT Pro Bold Italic';font-family:'Gill Sans MT Pro';font-weight:bold;font-style:italic;font-stretch:normal;font-variant:normal;font-size:30px;fill:#ffffff"
       id="tspan3594">LA PROMESSE D’EN MARCHE</tspan></text>
<!--<text
     transform="matrix(1 0 0 1 31.7480469 197.394043)"
     class="st1 st8 st9"
     id="text3562"><tspan
       style="-inkscape-font-specification:'Gill Sans MT Pro Italic';font-family:'Gill Sans MT Pro';font-weight:normal;font-style:italic;font-stretch:normal;font-variant:normal"
       id="tspan3588">“</tspan></text>-->
      
       
     <xsl:variable name="size" select="if (string-length(./analyse/@description) > 20) then round(1400 div string-length(./analyse/@description)) else 70" />
     

     <xsl:variable name="textlength" select="$size*string-length(./analyse/@description)+30" />
     <xsl:variable name="height" select="74.0451355" />
     <xsl:variable name="x" select="84.7403412 + ((530.9-84.7403412) div (70*10+30)) * $textlength" />
     <xsl:variable name="lowy" select="359.4546509 - ((359.4546509-343.8742371) div (70*10+30)) * $textlength" />
     <xsl:variable name="highy" select="$lowy + $height" />
     <xsl:variable name="midx" select="(84.7403412+$x) div 2.0" />
     <xsl:variable name="midy" select="($height) + 359.4546509 - ((359.4546509-343.8742371) div (70*10+30)) * ($textlength div 2.0)" />
<!--
x="106.32053"
     y="423.41309"
-->
<polygon
     class="st6"
     points="84.7403412,433.4997559 {$x},{$highy} {$x},{$lowy} 84.7403412,359.4546509 "
     id="polygon3564" />

<text
     width="{$textlength}"
     transform="matrix(0.99939087,-0.03490006,0,1.0006095,0,0)"
     id="text3566"
     text-anchor="middle"
     x="{$midx}"
     y="{$midy}"
     
       style="font-style:italic;text-align:center;font-variant:normal;font-stretch:normal;font-weight: bold; font-size:{$size}px;font-family:'Gill Sans MT Pro';-inkscape-font-specification:'Gill Sans MT Pro Bold Italic';word-spacing:0px;fill:#ffffff"
       
       ><xsl:value-of select="upper-case(./analyse/@description)" /></text>
<text
     transform="matrix(0.998782 -0.0348788 0 1.6666681 486.2689819 406.4814453)"
     class="st1 st2 st12"
     id="text3578" />
<text
     xml:space="preserve"
     style="font-style:normal;font-weight:normal;font-size:40px;line-height:125%;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
     x="106.16722"
     y="472.61539"
     id="text4432"
     sodipodi:linespacing="125%"><tspan
       sodipodi:role="line"
       id="tspan4434"
       x="106.16722"
       y="472.61539"
       style="font-style:italic;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:33.75px;font-family:'Gill Sans MT Pro';-inkscape-font-specification:'Gill Sans MT Pro Bold Italic';fill:#e23d21;fill-opacity:1">découvrez pourquoi sur analysons-macron.fr</tspan></text>
<flowRoot
     xml:space="preserve"
     id="flowRoot4154"
     style="font-style:normal;font-weight:normal;font-size:40px;line-height:125%;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;writing-mode:lr;"><flowRegion
       id="flowRegion4156"><rect
         id="rect4158"
         width="852.87201"
         height="272.49039"
         x="106.99987"
         y="119.12263"
         style="writing-mode:lr;" /></flowRegion><flowPara
       id="flowPara4160"
       style="font-style:italic;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:50px;line-height:103.99999619%;font-family:'Gill Sans MT Pro';-inkscape-font-specification:'Gill Sans MT Pro Bold Italic';writing-mode:lr;fill:#ffffff">“ <xsl:value-of select="normalize-space(./engagement)" /> ”</flowPara></flowRoot>

<use xlink:href="#polygon3564"/>
<use xlink:href="#text3566"/>

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

