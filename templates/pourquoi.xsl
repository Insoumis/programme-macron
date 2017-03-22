<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs">

    <xsl:variable name="propositions" select="count(//engagement)" />
    <xsl:variable name="analyses" select="count(//analyse[text()])" />
    
    <xsl:template match="/">
        <html>
            <head>
                <base href="https://insoumis.github.io/programme-macron/" />
                <link href="/elements/logo-180x180.png" sizes="180x180" rel="apple-touch-icon" />
                <link sizes="32x32" href="/elements/logo-32x32.png" type="image/png" rel="icon" />
                <link sizes="16x16" href="/elements/logo-16x16.png" type="image/png" rel="icon" />
                <link color="#0198b5" href="/elements/logo-transparent.svg" rel="mask-icon" />
                <meta content="#ffffff" name="theme-color" />
                <meta content="Analysons Macron" name="apple-mobile-web-app-title" />
                <meta content="Analysons Macron" name="application-name" />
                <meta charset="utf-8" />
                <!--<link href="/includes/manifest.json" rel="manifest" />-->
                <meta content="Analysons Macron" property="og:title" />
                <meta content="website" property="og:type" />
                <meta content="https://insoumis.github.io/programme-macron/" property="og:url" />
                <meta content="https://insoumis.github.io/programme-macron/elements/logo-256x256.png" property="og:image" />
                <title>Le programme de Macron expliqué</title>
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous" />
                <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

                <style type="text/css">
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
                </style>
            </head>
            <body>
                <nav class="navbar navbar-default">
                  <div class="container-fluid">
                    <div class="navbar-header">
                      <a class="navbar-brand" href="#">Analysons Macron</a>
                    </div>
                    <ul class="nav navbar-nav">
                      <li><a href="#">Accueil</a></li>
                       <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Par chapitre
                        <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                           <xsl:for-each select="/categories/categorie">
                            <xsl:variable name="chapitre" select="count(preceding-sibling::categorie)+1" />
                            <li><a href="#c{$chapitre}"><xsl:value-of select="$chapitre" />. <xsl:value-of select="./@nom" /></a></li>
                           </xsl:for-each>
                        </ul>
                      </li>
                      <li class="active"><a href="pourquoi.html">Pourquoi ce site ?</a></li>
                    </ul>
                  </div>
                </nav>
                <div class="container">
                    
                <h1>Pourquoi ce site ?</h1>

                <p>Le climat particulier de cette campagne traversée par les "affaires", et les défaillances du système médiatique peu propice à la mise en avant et à la discussion des idées, nous ont poussé à trouver un cadre plus favorable à un travail de réflexion et de débat. Aussi, notre collectif de militants de la <a href="https://avenirencommun.fr/">France Insoumise</a> a mis en place une critique point par point du programme d'Emmanuel Macron, qui selon nous n'a pas reçu l'examen que la délibération démocratique nécessite.</p>

                <p>Bien évidemment, il s'agit d'une critique orientée (comment une critique ne pourrait pas l'être), mais nous avons cherché à être aussi rigoureux que possible. Nous espérons que ce travail vous sera utile.</p>

                </div>

              <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
