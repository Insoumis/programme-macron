<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs">

    <xsl:variable name="propositions" select="count(//engagement)" />
    <xsl:variable name="analyses" select="count(//analyse[text()])" />
    
    <xsl:template match="/">
        <html>
            <head>
                <link href="/elements/favicon-apple-touch-icon.png" sizes="180x180" rel="apple-touch-icon" />
                <link sizes="32x32" href="/elements/favicon-32x32.png" type="image/png" rel="icon" />
                <link sizes="16x16" href="/elements/favicon-16x16.png" type="image/png" rel="icon" />
                <link color="#0198b5" href="/elements/favicon-safari-pinned-tab.svg" rel="mask-icon" />
                <meta content="#ffffff" name="theme-color" />
                <meta content="Portail insoumis" name="apple-mobile-web-app-title" />
                <meta content="Portail insoumis" name="application-name" />
                <meta charset="utf-8" />
                <link href="/includes/manifest.json" rel="manifest" />
                <meta content="Portail insoumis" property="og:title" />
                <meta content="website" property="og:type" />
                <meta content="https://checklist.insoumis.online/" property="og:url" />
                <meta content="http://checklist.insoumis.online/elements/open-graph.jpg" property="og:image" />
                <title>Le programme de Macron expliqué</title>
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous" />
                <style type="text/css">
                    div.mesure {
                        font-style: italic;
                        padding-left: 2em;
                    }

                    div.analyse {
                        font-size: 1.2em;
                        margin-top: 2em;
                    }

                    div.analyse div {
                        margin-top: 0.5em;
                    }
                </style>
            </head>
            <body>
                <div class="container">
                  <nav class="navbar navbar-default">
                    <div class="container-fluid">
                      <div class="navbar-header">
                        <a class="navbar-brand" href="#">Analysons Macron</a>
                      </div>
                      <ul class="nav navbar-nav">
                        <li class="active"><a href="#">Accueil</a></li>
                         <li class="dropdown">
                          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Par chapitre
                          <span class="caret"></span></a>
                          <ul class="dropdown-menu">
                             <xsl:for-each select="/categories/categorie">
                              <xsl:variable name="chapitre" select="count(preceding-sibling::categorie)+1" />
                              <li><a href="#c{$chapitre}">Chapitre <xsl:value-of select="$chapitre" />. <xsl:value-of select="./@nom" /></a></li>
                             </xsl:for-each>
                          </ul>
                        </li>
                        <li><a href="pourquoi.html">Pourquoi ce site ?</a></li>
                      </ul>
                    </div>
                  </nav>

                <h1>Le programme de Macron expliqué</h1>

                <p>Progression : <xsl:value-of select="$analyses" />/<xsl:value-of select="$propositions" /> propositions analysées.</p>
                
                <xsl:for-each select="/categories/categorie">
                    <xsl:variable name="chapitre" select="count(preceding-sibling::categorie)+1" />
                    <a name="c{$chapitre}"></a>
                    <h2>Chapitre <xsl:value-of select="$chapitre" />. <xsl:value-of select="./@nom" /></h2>
                    <ol class="entrees">
                        <xsl:for-each select="./entree">
                            <xsl:variable name="element" select="count(preceding-sibling::entree)+1" />
                            <li>
                                <div>
                                    <a name="c{$chapitre}m{$element}"></a>
                                    <h3>« <xsl:value-of select="./engagement" />» <a href="#c{$chapitre}m{$element}"><span class="glyphicon glyphicon-link" data-id=""></span></a></h3>
                                    <xsl:if test="./mesure">
                                        <div class="mesure">
                                            <xsl:copy-of select="./mesure" />
                                        </div>
                                    </xsl:if>
                                    <!--<h4>Analyse</h4>-->
                                    <div class="analyse"><span class="label label-{./analyse/@tag}"><xsl:value-of select="./analyse/@description" /></span>
                                        <div>
                                            <xsl:copy-of select="./analyse" />
                                        </div>
                                    </div>
                                    <xsl:if test="./aec">
                                        <h4>Qu'en dit l'«Avenir en Commun» ?</h4>
                                        <div class="aec">
                                            <ul>
                                                <xsl:for-each select="./aec/aec">
                                                    <xsl:choose>
                                                      <xsl:when test="./@href">
                                                        <li><a href="{./@href}">« <xsl:value-of select="." /> »</a></li>
                                                      </xsl:when>
                                                      <xsl:otherwise>
                                                        <li><a href="{.}"><xsl:value-of select="." /></a></li>
                                                      </xsl:otherwise>
                                                    </xsl:choose>
                                                </xsl:for-each>
                                            </ul>
                                        </div>
                                    </xsl:if>
                                </div>
                            </li>
                        </xsl:for-each>
                    </ol>
                </xsl:for-each>
                
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
