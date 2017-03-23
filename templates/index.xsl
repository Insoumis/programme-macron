<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs">

    <xsl:variable name="propositions" select="count(//engagement)" />
    <xsl:variable name="analyses" select="count(//analyse[text()])" />
    
    <xsl:template match="/">
        <html>
            <head>
                <link href="/elements/logo-180x180.png" sizes="180x180" rel="apple-touch-icon" />
                <link sizes="32x32" href="/elements/logo-32x32.png" type="image/png" rel="icon" />
                <link sizes="16x16" href="/elements/logo-16x16.png" type="image/png" rel="icon" />
                <link color="#ffffff" href="/elements/logo-transparent.svg" rel="mask-icon" />
                <meta content="#ffffff" name="theme-color" />
                <meta content="Analysons Macron" name="apple-mobile-web-app-title" />
                <meta content="Analysons Macron" name="application-name" />
                <meta charset="utf-8" />
                <!--<link href="/includes/manifest.json" rel="manifest" />-->
                <meta content="Analysons Macron" property="og:title" />
                <meta content="website" property="og:type" />
                <meta content="http://analysons-macron.fr/" property="og:url" />
                <meta content="http://analysons-macron.fr/elements/logo-256x256.png" property="og:image" />
                <title>Le programme de Macron expliqué</title>
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous" />
                <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

                <style type="text/css">
                    body {
                      position: relative;
                    }

                    h2.chapitre {
                      
                    }

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

                    .share-buttons > li > a {
                        padding: 9px 15px;
                    }
                </style>
            </head>
            <body data-spy="scroll" data-target="#side-menu-container">
                <nav class="navbar navbar-default">
                  <div class="container-fluid">
                    <div class="navbar-header">
                      <a class="navbar-brand" href="/#">Analysons Macron</a>
                    </div>
                    <ul class="nav navbar-nav">
                      <li class="active"><a href="/#">Accueil</a></li>
                       <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Par chapitre
                        <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                           <xsl:for-each select="/categories/categorie">
                            <xsl:variable name="chapitre" select="count(preceding-sibling::categorie)+1" />
                            <li><a href="/#c{$chapitre}"><xsl:value-of select="$chapitre" />. <xsl:value-of select="./@nom" /></a></li>
                           </xsl:for-each>
                        </ul>
                      </li>
                      <li><a href="pourquoi.html">Pourquoi ce site ?</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right share-buttons">
                      <li><a href="https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Fanalysons-macron.fr%2F&amp;t=Analysons%20Macron" title="Share on Facebook" target="_blank"><img alt="Share on Facebook" src="elements/Facebook.png" /></a></li>
                      <li><a href="https://twitter.com/intent/tweet?source=http%3A%2F%2Fanalysons-macron.fr%2F&amp;text=Analysons%20Macron:%20http%3A%2F%2Fanalysons-macron.fr%2F" target="_blank" title="Tweet"><img alt="Tweet" src="elements/Twitter.png" /></a></li>
                      <li><a href="https://plus.google.com/share?url=http%3A%2F%2Fanalysons-macron.fr%2F" target="_blank" title="Share on Google+"><img alt="Share on Google+" src="elements/Google+.png" /></a></li>
                      <li><a href="http://www.linkedin.com/shareArticle?mini=true&amp;url=http%3A%2F%2Fanalysons-macron.fr%2F&amp;title=Analysons%20Macron&amp;summary=Analyse%20du%20programme%20d'Emmanuel%20Macron%20par%20des%20militants%20de%20la%20France%20Insoumise.&amp;source=http%3A%2F%2Fanalysons-macron.fr%2F" target="_blank" title="Share on LinkedIn"><img alt="Share on LinkedIn" src="elements/LinkedIn.png" /></a></li>
                    </ul>
                  </div>
                </nav>
                <div class="container">
                    
                <h1>Le programme de Macron expliqué</h1>

                <p>Progression : <xsl:value-of select="$analyses" />/<xsl:value-of select="$propositions" /> propositions analysées.</p>
                <div class="row">
                  <div class="col-lg-4 col-lg-push-8" id="side-menu-container">
                    <ul class="nav nav-list affix" role="tablist" id="side-menu">
                       <xsl:for-each select="/categories/categorie">
                        <xsl:variable name="chapitre" select="count(preceding-sibling::categorie)+1" />
                        <li><a href="#c{$chapitre}"><xsl:value-of select="$chapitre" />. <xsl:value-of select="./@nom" /></a></li>
                       </xsl:for-each>
                    </ul>
                  </div>
                  <div class="col-lg-8 col-lg-pull-4">
                    <xsl:for-each select="/categories/categorie">
                        <xsl:variable name="chapitre" select="count(preceding-sibling::categorie)+1" />
                        <a name="c{$chapitre}"></a>
                        <div id="c{$chapitre}">
                          <h2 class="chapitre">Chapitre <xsl:value-of select="$chapitre" />. <xsl:value-of select="./@nom" /></h2>
                          <ol class="entrees">
                              <xsl:for-each select="./entree">
                                  <xsl:variable name="element" select="count(preceding-sibling::entree)+1" />
                                  <li>
                                      <div id="c{$chapitre}m{$element}">
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
                                              <h4>φ Qu'en dit l'«Avenir en Commun» ?</h4>
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
                         </div>
                    </xsl:for-each>
                  </div>
                  </div>
                </div>
              
              <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
              <script type="text/javascript">$(document).ready(function() {$('body').scrollspy({ target: '#side-menu-container' })});</script>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
