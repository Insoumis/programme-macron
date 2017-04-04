<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs">

    <xsl:variable name="propositions" select="count(//engagement)" />
    <xsl:variable name="analyses" select="count(//analyse[text()])" />

    <xsl:template match="//aec/aec[matches(., 'https://laec.fr/s[0-9]*m[0-9]*')]" priority="4">
      <xsl:analyze-string select="." regex="https://laec.fr/s([0-9]*)m([0-9]*)">
        <xsl:matching-substring>
          <xsl:variable name="section" select="regex-group(1)" />
          <xsl:variable name="mesure" select="regex-group(2)" />
          <li>
            <a href="{.}"><xsl:copy-of select="document(concat('../tmp/laec_s', $section, 'm', $mesure, '.xml'))//measure/node()" /></a>
          </li>
        </xsl:matching-substring>
        <!--<xsl:non-matching-substring>
          <li>
            <a href="{.}">Mesure <xsl:value-of select="." /></a>
          </li>
        </xsl:non-matching-substring>-->
      </xsl:analyze-string>
    </xsl:template>

    <xsl:template match="//aec/aec[matches(., 'https://laec.fr/section/.*/')]" priority="3">
      <xsl:analyze-string select="." regex="https://laec.fr/section/([0-9]*)/.*">
        <xsl:matching-substring>
          <xsl:variable name="section" select="regex-group(1)" />
          <li><a href="{.}"><xsl:value-of select="document(concat('../tmp/laec_s', $section, 'm0.xml'))/measures/@title" /></a>
            <ul>
              <xsl:for-each select="document(concat('../tmp/laec_s', $section, 'm0.xml'))/measures/measure">
                <li><xsl:copy-of select="node()" /></li>
              </xsl:for-each>
            </ul>
          </li>
        </xsl:matching-substring>
        <!--<xsl:non-matching-substring>
          <li>
            <a href="{.}"><xsl:value-of select="." /></a>
          </li>
        </xsl:non-matching-substring>-->
      </xsl:analyze-string>
    </xsl:template>

    <xsl:template match="//aec/aec[@href]" priority="2">
      <li>
        <a href="{./@href}">« <xsl:value-of select="." /> »</a>
      </li>
    </xsl:template>

    <xsl:template match="//aec/aec[not(@href)]" priority="1">
      <li>
        <a href="{.}"><xsl:value-of select="." /></a>
      </li>
    </xsl:template>


    <xsl:template match="@*|node()">
      <xsl:copy>
        <xsl:apply-templates select="@*|node()"/>
      </xsl:copy>
    </xsl:template>
    
    <xsl:template match="/">

        <html>
            <head>
                <link href="/elements/logo-180x180.png" sizes="180x180" rel="apple-touch-icon" />
                <link sizes="32x32" href="/elements/logo-32x32.png" type="image/png" rel="icon" />
                <link sizes="16x16" href="/elements/logo-16x16.png" type="image/png" rel="icon" />
                <link color="#ffffff" href="/elements/logo-transparent.svg" rel="mask-icon" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta content="#ffffff" name="theme-color" />
                <meta content="Analysons Macron" name="apple-mobile-web-app-title" />
                <meta content="Analysons Macron" name="application-name" />
                <meta charset="utf-8" />
                <!--<link href="/includes/manifest.json" rel="manifest" />-->

                <meta content="Analysons Macron" property="og:title" />
                <meta content="website" property="og:type" />
                <meta content="http://analysons-macron.fr/" property="og:url" />
                <meta content="Analyse détaillée, mesure par mesure, du programme de Macron. Par la France Insoumise." property="og:description" />
                <meta content="http://analysons-macron.fr/elements/logo-256x256.png" property="og:image" />

                <meta name="twitter:card" content="summary_large_image" />
                <meta name="twitter:site" content="@Action_Insoumis" />
                <meta name="twitter:creator" content="@Action_Insoumis" />
                <meta name="twitter:description" content="Analyse détaillée, mesure par mesure, du programme de Macron. Par la France Insoumise." />
                <meta name="twitter:image" content="http://analysons-macron.fr/elements/logo-256x256.png" />

                <title>Le programme de Macron expliqué</title>
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous" />
                <link href="https://fonts.googleapis.com/css?family=Roboto+Slab" rel="stylesheet" /> 
                <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

                <script>
                  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
                  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

                  ga('create', 'UA-96762782-1', 'auto');
                  ga('send', 'pageview');

                </script>

                <style type="text/css">
                    html {
                      position: relative;
                      height: 100%;
                    }

                    body {
                        position: relative;
                    }

                    fixed {
                        position: fixed;
                    }

                    h2.chapitre {
                      font-family: 'Roboto Slab', serif;
                    }

                    ol.entrees > li {
                        list-style: none;
                    }

                    ol.entrees > li span.num {
                        float: left;
                        margin-left: -20px;
                        margin-right: 5px;
                        font-size: 1.3em;
                    }

                    div.subgroup {
                        min-height: 10em;
                    }

                    div.mesure {
                        font-style: italic;
                        padding-left: 2em;
                    }

                    div.analyse {
                        font-size: 1.2em;
                        margin-top: 2em;
                        text-align: justify;
                    }

                    div.analyse div {
                        margin-top: 0.5em;
                    }

                    div.attente {
                        color: #B8B8B8;
                    }

                    div.attente > span.text {
                        padding-left: 2.5em;
                    }

                    .aec {
                        background: url(elements/phi.png) no-repeat;
                        background-position: 15px 15px;
                        background-size: 30px;
                        margin: 10px;
	                      background-color: #0098B6;
	                      color:#FFFFFF;
	                      margin: 1.5em;
	                      padding: 1.2em;
	                     border-radius: 6px;
                    }

                    .aec ul {
                      padding-left: 20px;
                    }

                    .aec li {
	                    list-style-position: outside;
	                    list-style-type: disc;
	                    color: #ffffff;
	                    padding-left: 0px;
                    }

                    .aec a {
	                    color:#FFFFFF;
                      text-decoration: none;
	                    margin: 0;
                    }

                    .aec a:hover {
                      text-decoration: none;
                    }

                    h4 {
	                    /*font-family: 'Roboto Slab',sans-serif;*/
                        margin-left: 40px;
                        margin-top: 5px;
                    }

                    .label{
	                    display: inline-block;
	                    font-size: 16px;
	                    text-transform: uppercase;
	                    vertical-align: baseline;
                        font-weight: bold;
	                    transform: rotate(-4deg);
                    }

                    .share-buttons > li > a {
                        padding: 9px 15px;
                    }

                    /* sidebar */
                    #side-menu-container {
                        padding-left: 20px;
                        padding-bottom: 20px;
                    }

                    /* all links */
                    #side-menu-container .nav>li>a {
                        color: #999;
                        border-left: 2px solid transparent;
                        padding: 4px 20px;
                        font-size: 14px;
                        font-weight: 400;
                    }

                    /* nested links */
                    #side-menu-container .nav .nav>li>a {
                        padding-top: 1px;
                        padding-bottom: 1px;
                        padding-left: 30px;
                        font-size: 12px;
                    }

                    #side-menu-container .nav>.active>a, 
                    #side-menu-container .nav>li>a:hover, 
                    #side-menu-container .nav>li>a:focus {
                        color: #337ab7;                 
                        text-decoration: none;          
                        background-color: transparent;  
                        border-left-color: #337ab7; 
                    }
                    /* all active links */
                    #side-menu-container .nav>.active>a, 
                    #side-menu-container .nav>.active:hover>a,
                    #side-menu-container .nav>.active:focus>a {
                        font-weight: 700;
                    }
                    /* nested active links */
                    #side-menu-container .nav .nav>.active>a, 
                    #side-menu-container .nav .nav>.active:hover>a,
                    #side-menu-container .nav .nav>.active:focus>a {
                        font-weight: 500;
                    }

                    /* hide inactive nested list */
                    #side-menu-container .nav ul.nav {
                        display: none;           
                    }
                    /* show active nested list */
                    #side-menu-container .nav>.active>ul.nav {
                        display: block;           
                    }

                    /* make sidebar srollable */
                    #side-menu-container > ul {
                        overflow-y: auto;
                        height: 100%;
                        padding-top: 20px;
                    }
                </style>
            </head>
            <body data-spy="scroll" data-target="#side-menu-container" data-offset="60">
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
                      <li><a href="synthese.html">Synthèse</a></li>
                      <li><a href="pourquoi.html">Pourquoi ce site ?</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right share-buttons hidden-sm hidden-xs">
                      <li><a href="https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Fanalysons-macron.fr%2F&amp;t=Analysons%20Macron" title="Share on Facebook" target="_blank"><img alt="Share on Facebook" src="elements/Facebook.png" /></a></li>
                      <li><a href="https://twitter.com/intent/tweet?source=http%3A%2F%2Fanalysons-macron.fr%2F&amp;text=Analysons%20Macron:%20http%3A%2F%2Fanalysons-macron.fr%2F" target="_blank" title="Tweet"><img alt="Tweet" src="elements/Twitter.png" /></a></li>
                      <li><a href="https://plus.google.com/share?url=http%3A%2F%2Fanalysons-macron.fr%2F" target="_blank" title="Share on Google+"><img alt="Share on Google+" src="elements/Google+.png" /></a></li>
                      <li><a href="http://www.linkedin.com/shareArticle?mini=true&amp;url=http%3A%2F%2Fanalysons-macron.fr%2F&amp;title=Analysons%20Macron&amp;summary=Analyse%20du%20programme%20d'Emmanuel%20Macron%20par%20des%20militants%20de%20la%20France%20Insoumise.&amp;source=http%3A%2F%2Fanalysons-macron.fr%2F" target="_blank" title="Share on LinkedIn"><img alt="Share on LinkedIn" src="elements/LinkedIn.png" /></a></li>
                    </ul>
                  </div>
                </nav>
                <div class="container">
                <div class="row">
                  <nav class="col-lg-4 col-lg-push-8 visible-lg" id="side-menu-container">
                    <ul class="nav nav-stacked affix" role="tablist" id="side-menu">
                       <xsl:for-each select="/categories/categorie">
                        <xsl:variable name="chapitre" select="count(preceding-sibling::categorie)+1" />
                        <li>
                          <a href="#c{$chapitre}"><xsl:value-of select="$chapitre" />. <xsl:value-of select="./@nom" /></a>
                          <ul class="nav nav-stacked">
                            <xsl:for-each select="./entree">
                              <xsl:variable name="element" select="count(preceding-sibling::entree)+1" />
                              <li><a href="#c{$chapitre}m{$element}">
                                <xsl:value-of select="substring(./engagement, 1, 65)"/>
                                <xsl:if test="string-length(./engagement) &gt; 65">
                                   <xsl:text>...</xsl:text>
                                </xsl:if>
                              </a></li>
                            </xsl:for-each>
                          </ul>
                        </li>
                       </xsl:for-each>
                       <li><a href="synthese.html">Synthèse</a></li>
                    </ul>
                  </nav>
                  <div class="col-lg-8 col-lg-pull-4">
                    <h1>Le programme de Macron expliqué</h1>
                      <div class="progress">
                         <xsl:variable name="pourcentage" select="round(100 * $analyses div $propositions)" />
                        <div class="progress-bar" role="progressbar" aria-valuenow="{$pourcentage}" aria-valuemin="0" aria-valuemax="100" style="width: {$pourcentage}%;">
                          <xsl:value-of select="$analyses" />/<xsl:value-of select="$propositions" /> propositions analysées.
                        </div>
                      </div>

                      <p>Des citoyens insoumis proposent une analyse détaillée du programme d'En Marche. <a href="pourquoi.html">En savoir plus...</a></p>

                    <xsl:for-each select="/categories/categorie">
                        <xsl:variable name="chapitre" select="count(preceding-sibling::categorie)+1" />
                        <a name="c{$chapitre}"></a>
                        <section id="c{$chapitre}" class="group">
                          <h2 class="chapitre">Chapitre <xsl:value-of select="$chapitre" />. <xsl:value-of select="./@nom" /></h2>
                          <ol class="entrees">
                              <xsl:for-each select="./entree">
                                  <xsl:variable name="element" select="count(preceding-sibling::entree)+1" />
                                  <li>
                                      <div id="c{$chapitre}m{$element}" class="subgroup">
                                          <span class="num"><a href="#c{$chapitre}m{$element}" class="anchor"><xsl:value-of select="$chapitre" />.<xsl:value-of select="$element" /></a></span>
                                          <a name="c{$chapitre}m{$element}"></a>
                                          <h3>« <xsl:value-of select="./engagement" />»</h3>
                                          <xsl:if test="./mesure">
                                              <div class="mesure">
                                                  <xsl:copy-of select="./mesure" />
                                              </div>
                                          </xsl:if>
                                          <!--<h4>Analyse</h4>-->
                                          <xsl:choose>
                                            <xsl:when test="./analyse != ''">
                                              <div class="analyse">
                                                <span class="label label-{./analyse/@tag}"><xsl:value-of select="./analyse/@description" /></span>
                                                <div>
                                                    <xsl:apply-templates select="./analyse" />
                                                </div>
                                              </div>
                                            </xsl:when>
                                            <xsl:otherwise>
                                              <div class="analyse attente">
                                                <span class="glyphicon glyphicon-time" aria-hidden="true"></span> <span class="text">Nous n'avons pas encore rédigé d'analyse pour cette proposition. Repassez plus tard !</span>
                                              </div>
                                            </xsl:otherwise>
                                          </xsl:choose>
                                          <xsl:if test="./aec">
                                              <div class="aec">
                                                  <h4>Qu'en dit l'«Avenir en Commun» ?</h4>
                                                  <ul>
                                                      <xsl:apply-templates select="./aec/node()" />
                                                  </ul>
                                              </div>
                                          </xsl:if>
                                      </div>
                                  </li>
                              </xsl:for-each>
                          </ol>
                         </section>
                    </xsl:for-each> 
                  </div>
                  </div>
                </div>
              
              <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
              <!--<script>
                $(document).ready(function(){
                  $('body').on('activate.bs.scrollspy', function () {
                      $('section div.subgroup, section h2').css('color', 'gray');
                      $('.aec').css('background-color', 'gray');
                      var id = $("#side-menu-container li.active > a").last().attr('href').substr(1);
                      $('div#' + id).css('color', $('body').css('color'));
                      $('div#' + id + ' .aec').css('background-color', '#0098B6');
                      var id = $("#side-menu-container li.active > a").first().attr('href').substr(1);
                      $('#' + id + ' h2').css('color', $('body').css('color'));
                      $('div#' + id + ' .aec').css('background-color', '#0098B6');
                  });
                });
              </script>-->
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
