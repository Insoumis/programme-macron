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
            <body>
                <nav class="navbar navbar-default">
                  <div class="container-fluid">
                    <div class="navbar-header">
                      <a class="navbar-brand" href="/#">Analysons Macron</a>
                    </div>
                    <ul class="nav navbar-nav">
                      <li><a href="/#">Accueil</a></li>
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
                      <li class="active"><a href="synthese.html">Synthèse</a></li>
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
                    
                   <section id="synthese" class="group">
                      <a name="synthese"></a>
                      <h1 class="chapitre">Synthèse</h1>
                      <div id="generalites" class="subgroup">
                        <a name="generalites"></a>
                        <h2>Critique générale</h2>
                        <div class="analyse">
                           <p>
                            Il semble que le programme d'Emmanuel Macron se place sous le signe de la continuité des politiques menées depuis 30 ans, et en particulier du quinquennat précédent. Le programme <b>économique</b> poursuit le choix de la politique de l'offre, conformément à la logique contraignante des traités européens et aux recommandations de la commission européenne. En effet, d'une part, le choix est fait de maintenir les coûts et de contenir les salaires, puisque la hausse que suggère le programme n'est qu'un transfert de la part socialisée vers la part individuelle, compensée par des impôts. D'autre part, les investissements ne compenseront pas les mesures d'austérité prévues, si bien que l'impact global sur l'économie sera bien une contraction. Par ailleurs, les mesures d'allègements fiscaux prévues pour les grandes entreprises et les actionnaires contribueront davantage à rémunérer la rente et les dividendes, et donc à nourrir la bulle financière au détriment de l'économie réelle et de l'activité.<br />Par ailleurs, 
                           </p>
                           <p>
                            Du point de vue de l'<b>écologie</b>, le programme d'En Marche est également dans la continuité. Aucune critique du productivisme capitaliste, aucune critique du libre-échange, qui est un désastre pour l'environnement, n'y sont faites. Les prises de positions sur l'agriculture chimique ou les perturbateurs endoctriniens sont contradictoires et légères. L'essentiel des mesures environnementales sont soient faiblement incitatives, soient incantatoires. Enfin, les sommes avancées pour financer la transition écologique sont dérisoires.
                           </p>
                           <p>
                            En ce qui concerne les <b>institutions</b>, le programme est extrêmement insuffisant. Sans adresser les lacunes démocratiques profondes (monarchie présidentielle, non respect des engagements électoraux et référendums), il se borne à des réformes marginales de "moralisation" bien trop peu contraignantes. Certaines mesures semblent même constituer des régressions : ainsi, la représentativité des parlementaires sera diminuée, là où elle devrait être augmentée.
                           </p>
                           <p>
                            Sur l'<b>Europe</b>, puisque son programme est tout à fait dans la ligne de son orientation actuelle, il n'est pas surprenant qu'E. Macron ne fasse aucune contestation des traités européens, et du déficit démocratique qui découle largement de leur verrouillage. Sa proposition de parlement de la zone euro n'y changera rien. C'est pourtant cet immobilisme qui conduit l'Union Européenne au bord du gouffre, en la plongeant dans la morosité économique, et en ravivant les tensions, les haines, et les mouvements d'extrême-droite.
                           </p>
                           <p>
                            Le volet <b>international</b> est préoccupant. Il soutient la volonté d'une Europe de la Défense, dont on se demande, contre quelle menace, et surtout, si ce n'est pas davantage une Europe de la guerre qui se prépare, car celle-ci facilitera l'implication générale de ses membres dans des conflits. De plus, il semble suivre les recommandations de réarmement de l'OTAN, qui financeront l'industrie américaine de l'armement. Au final, les engagements d'Emmanuel Macron sur le plan international mettent à mal l'indépendance de la France.
                           </p>
                           <p>
                            
                           </p>
                        </div>
                      </div>                          
                      <div id="notre-vision" class="subgroup">
                        <a name="notre-vision"></a>
                        <h2>Notre vision</h2>
                        <div class="analyse">
                           <p>Le programme l'"<a href="https://avenirencommun.fr/">Avenir en Commun</a>" repose sur le principe de départ qu'il existe un intérêt général humain qui domine les intérêts particuliers, en s'appuyant sur le fait que nous partageons tous un même bien commun, la Terre. Nos modes de productions détruisent la nature, dans laquelle nous sommes tous plongés, et devant laquelle nous sommes tous égaux. Cette façon d'organiser la société, qui menace désormais jusqu'aux conditions de son existence, produit aussi des inégalités inacceptables. Il faut donc urgemment réaliser la transition écologique, le changement de notre façon de produire et de partager. C'est le sens de notre programme et de la révolution citoyenne qu'il a l'ambition de porter.</p>
                           <p>
                            La première étape de cette révolution citoyenne, c'est de rendre au peuple le pouvoir se s'organiser comme il le souhaite, afin qu'il puisse défendre l'intérêt général, c'est-à-dire ses intérêts. Il faut donc se débarrasser de l'oligarchie qui gouverne selon les siens en profitant des faiblesses de la Vème République. Une assemblée constituante sera ainsi convoquée aussitôt que le Jean-Luc Mélenchon sera élu. Son mode de désignation assurera qu'elle est issue de la société civile. Elle travaillera indépendamment du pouvoir qui s'exercera normalement dans le cadre de la Vème République en parallèle, le temps que devra durer le processus constituant. Chacun pourra faire des propositions. Par exemple, la France Insoumise suggérera d'inscrire dans la constitution la Règle Verte, et la liberté à chacun de disposer de son corps ce qui protégera l'IVG et autorisera le suicide assisté. Nous proposerons des réformes institutionnelles comme le référendum révocatoire et le remplacement du Sénat par une assemblée citoyenne. Au terme de ce processus, le texte proposé par l'assemblée sera soumis à référendum.
                           </p>
                           <p>
                            Le système capitaliste libéral atteint désormais ses limites : notre pays n'a jamais été aussi riche, et pourtant le nombre de pauvres, ou de sans domicile fixe, n'a de cesse d'augmenter. La financiarisation a paralysé notre économie. Nous mettrons donc fin au parasitage économique en luttant contre la rente, contre la fraude fiscale et l'évasion fiscale, et en impôsant plus justement les français, pour faire porter l'effort davantage sur les très riches et moins sur l'essentiel de la population. Nous protégerons nos industries grâce au protectionnisme solidaire et en redonnant du pouvoir aux travailleurs. Nous instaurerons une solidarité entre grandes entreprises et PME afin que les premières soutiennent l'activité des deuxièmes. Et surtout, nous augmenterons le SMIC, nous revaloriserons les minima sociaux afin que chacun vive au dessus du seuil de pauvreté, et nous garantirons à chacun le droit à un logement.
                           </p>
                           <p>
                            Notre écosystème est saccagé, et le changement climatique sera le défi majeur de ce siècle. Donc, nous réaliserons la transition écologique qui s'impose. Pour cela, nous nous fixerons l'objectif de 100% d'énergie renouvelables en 2050, et nous investirons 50 milliards d'euros dans ce secteur. Les ressources et les compétences pour le faire sont nombreuses en France. Nous sortirons progressivement du nucléaire. Nous sortirons par ailleurs de l'agriculture chimique pour développer une agriculture biologique plus respectueuse et viable à long-terme. Nous pénaliserons le transport de marchandises sur de grandes distances, et nous lutterons contre le gaspillage, la surproduction, et la surexploitation de la nature.
                           </p>
                           <p>
                            
                           </p>
                        </div>
                      </div>
                    </section>   
                </div>

              <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
