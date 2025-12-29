<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml">
 
    <xsl:output method="html" encoding="UTF-8" omit-xml-declaration="yes" indent="yes"/>
   
        <xsl:template match="/">
        <html lang="it">
            <head>
              <title>Progetto Codifica di Testi</title>
              <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
              <script src="codice_js.js"></script>
              <link href="style.css" rel="stylesheet" type="text/css"/>
              <link rel="icon" href="https://cdn-icons-png.flaticon.com/512/6957/6957020.png" />
              <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.5.1/css/all.css" />
              <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            </head>
 
            <body>
 
             <header>
              <i class="fa-solid fa-bars fa-2x" id="menutendina"> MENU</i>
              <ul id="navbar">
               <li>
                <a href="#home">
                 <i class="fa-solid fa-home"></i>
                </a>
              </li>
            <li class="dropdown">
              <a href="#articoli">Articoli <i class="fa-solid fa-angle-down"></i></a>
              <div>
                <a href="#art1">Articolo 1</a>
                <a href="#art2">Articolo 2</a>
                <a href="#art3">Articolo 3</a>
              </div>
            </li>
            <li class="dropdown">
              <a href="#bibliografie">Bibliografie <i class="fa-solid fa-angle-down"></i></a>
              <div>
                <a href="#bibl1">Bibliografia 1</a>
                <a href="#bibl2">Bibliografia 2</a>
              </div>
            </li>
            <li class="dropdown">
              <a href="#notizie">Notizie</a>
            </li>
            <li>
              <a href="#glossario">Glossario</a>
            </li>
            <li>
              <a href="#about">About</a>
            </li>
          </ul>
         </header>
 
 
     <section id="home" class="scorrimento">
          <img src="img_home.jpg" alt="Immagine di giornali" />
          <div class="titolo">
            <h1>
             <xsl:value-of select="//tei:titleStmt/tei:title[@xml:id='titolo_generale']" />
            </h1>
          </div>
        </section>
 
 
<div id="contenitore-generale-articoli" class="Articoli-Contenitore">
       
            <div class="colonna-sinistra">
                <xsl:variable name="etichette" select="('persone', 'luoghi', 'organizzazioni', 'espansioni',
                                                    'regolarizzazioni', 'ruoli', 'date', 'citazioni',
                                                    'lingua straniera', 'opere')" />
                <xsl:variable name="colori" select="('colore1', 'colore2', 'colore3', 'colore4', 'colore5',
                                                    'colore6', 'colore7', 'colore8', 'colore9', 'colore10')" />
                <xsl:variable name="funzioniJS" select="('persName', 'placeName', 'orgName', 'espansioni', 'regolarizzazioni',
                                                            'roleName', 'dateName', 'quoteName', 'foreignName', 'titleName')" />
 
                <xsl:for-each select="$etichette">
                    <xsl:variable name="i" select="position()" />
                    <button class="bottone-categoria {$colori[$i]}">
                        <xsl:attribute name="onclick">
    <xsl:choose>
        <xsl:when test="$etichette[$i] = 'espansioni'">toggleFunzione(this, 'mostraEspansioni', 'nascondiEspansioni')</xsl:when>
        <xsl:when test="$etichette[$i] = 'regolarizzazioni'">toggleFunzione(this, 'mostraReg', 'nascondiReg')</xsl:when>
        <xsl:otherwise>
            <xsl:text>evidenzia(this, '</xsl:text>
            <xsl:value-of select="$funzioniJS[$i]"/>
            <xsl:text>', </xsl:text>
            <xsl:value-of select="$i"/>
            <xsl:text>)</xsl:text>
        </xsl:otherwise>
    </xsl:choose>
</xsl:attribute>
                        <xsl:value-of select="."/>
                    </button>
                </xsl:for-each>
            </div>
            <div id="contenitore-sezioni-articoli">
 
 
     <section id="art1" class="Articoli">
            <h2>Articolo 1</h2>
            <div class="contenitore">
 
                            <div class="colonna-centro">
                <img src="N.54_MariaRepettiAmorDiDonna_Pag.34.png" alt="Immagine Articolo 1"/>
              </div>
 
              <div class="blocco-destra">
              <h3>Vol.3, fasc.54, pag.34, 1879</h3>
              <div class="colonna-destra-contenuto">                
              <xsl:apply-templates select="//tei:body/tei:div[@xml:id='Articolo1']"/>
              </div>
            </div>
      </div>    
          </section>
 
 
         <section class="Articoli" id="art2">
  <h2>Articolo 2</h2>
  <div class="contenitore">
   
 
    <div class="colonna-centro">
      <img src="N.59_LibriTestoScuoleSecondarie_P.137.png" alt="Immagine1 Articolo 2"/>
    </div>
 
    <div class="blocco-destra">
      <h3>Vol.3, fasc.59, pag.137, 1879</h3>
      <div class="colonna-destra-contenuto">
        <xsl:apply-templates select="//tei:body/tei:div[@xml:id='Articolo2_pt.1']"/>
      </div>
    </div>
 
  </div>
 
  <div class="contenitore">
 
 
    <div class="colonna-centro">
      <img src="N.59_LibriTestoScuoleSecondarie_P.138.png" alt="Immagine2 Articolo 2"/>
    </div>
 
    <div class="blocco-destra">
      <h3>Vol.3, fasc.59, pag.138, 1879</h3>
      <div class="colonna-destra-contenuto">
        <xsl:apply-templates select="//tei:body/tei:div[@xml:id='Articolo2_pt.2']"/>
      </div>
    </div>
 
  </div>
 
 
</section>
 
<section class="Articoli" id="art3">
  <h2>Articolo 3</h2>
  <div class="contenitore">
   
 
    <div class="colonna-centro">
      <img src="N.87_LaTutelaDellaVitaDegliOperai_P.148.png" alt="Immagine Articolo 3"/>
    </div>
 
    <div class="blocco-destra">
      <h3>Vol.4, fasc.87, pag.148, 1879</h3>
      <div class="colonna-destra-contenuto">
        <xsl:apply-templates select="//tei:body/tei:div[@xml:id='Articolo3']"/>
      </div>
    </div>
 
  </div>
</section>
 
 
 <section id="bibl1" class="Articoli">
            <h2>Bibliografia 1</h2>
            <div class="contenitore">
           
                            <div class="colonna-centro">
                <img src="N.60_Bibliografia_ItemLetteratura_P.156.png" alt="Immagine Bibliografia 1"/>
              </div>
 
              <div class="blocco-destra">
              <h3>Vol.3, fasc.60, pag.156, 1879</h3>
              <div class="colonna-destra-contenuto">                
              <xsl:apply-templates select="//tei:body/tei:div[@xml:id='Bibliografia1_pt.1']"/>
              </div>
            </div>
            </div>
 
 
            <div class="contenitore">
 
 
    <div class="colonna-centro">
      <img src="N.60_Bibliografia_ItemLetteratura_P.157.png" alt="Immagine2 Bibliografia 1"/>
    </div>
 
    <div class="blocco-destra">
      <h3>Vol.3, fasc.60, pag.157, 1879</h3>
      <div class="colonna-destra-contenuto">
        <xsl:apply-templates select="//tei:body/tei:div[@xml:id='Bibliografia1_pt.2']"/>
    </div>
      </div>  
      </div>  
          </section>
 
          <section id="bibl2" class="Articoli">
            <h2>Bibliografia 2</h2>
            <div class="contenitore">
           
                            <div class="colonna-centro">
                <img src="N.194_Bibliografia_ItemRecensioneLuigiCapuana_P.190.png" alt="Immagine Bibliografia 2"/>
              </div>
 
              <div class="blocco-destra">
              <h3>Vol.8, fasc.194, pag.190, 1881</h3>
              <div class="colonna-destra-contenuto">                
              <xsl:apply-templates select="//tei:body/tei:div[@xml:id='Bibliografia2']"/>
              </div>
            </div>
            </div>
         </section>
 
         <section id="notizie" class="Articoli">
            <h2>Notizie</h2>
            <div class="contenitore">
           
                            <div class="colonna-centro">
                <img src="N.60_Notizie2Item_P.160.png" alt="Immagine Notizie"/>
              </div>
 
              <div class="blocco-destra">
              <h3>Vol.3, fasc.60, pag.190, 1879</h3>
              <div class="colonna-destra-contenuto">                
              <xsl:apply-templates select="//tei:body/tei:div[@xml:id='Notizie']"/>
              </div>
            </div>
            </div>
         </section>
 
      </div>    
      </div>
      
      <div id="glossario">
      <xsl:call-template name="glossario"/>
      </div>

      <section id="about" class="about-section">
    <div class="about-content">
        <h2>About</h2>
        <p>Progetto realizzato da: <xsl:apply-templates select="//tei:respStmt/tei:name[@xml:id='Raffaele']" /> e <xsl:apply-templates select="//tei:respStmt/tei:name[@xml:id='Veronica']" /></p>
        <p>Corso di Codifica di Testi - A.A. 2024/2025</p>
        <p>Coordinamento: Prof. <xsl:apply-templates select="//tei:seriesStmt/tei:respStmt/tei:name[@xml:id='Professore']" /></p>
        <p> <xsl:apply-templates select="//tei:notesStmt/tei:note[@xml:id='riferimenti']" /></p>
        <div class="about-icons">
            <i class="fa-solid fa-graduation-cap"></i>
            <i class="fa-solid fa-university"></i>
        </div>
    </div>
</section>

          </body>
        </html>
 
    </xsl:template>
 
    <xsl:template match="tei:div[@xml:id='Articolo1']">
        <xsl:apply-templates/>
    </xsl:template>
 
     <xsl:template match="tei:div[@xml:id='Articolo2_pt.1']">
        <xsl:apply-templates/>
    </xsl:template>
 
     <xsl:template match="tei:div[@xml:id='Articolo2_pt.2']">
        <xsl:apply-templates/>
    </xsl:template>
 
    <xsl:template match="tei:div[@xml:id='Articolo3']">
        <xsl:apply-templates/>
    </xsl:template>
 
    <xsl:template match="tei:div[@xml:id='Bibliografia1_pt.1']">
        <xsl:apply-templates/>
    </xsl:template>
 
    <xsl:template match="tei:div[@xml:id='Bibliografia1_pt.2']">
        <xsl:apply-templates/>
    </xsl:template>
 
    <xsl:template match="tei:head">
        <h4 class="articolo-head">
            <xsl:apply-templates/>
        </h4>
    </xsl:template>
 
    <xsl:template match="tei:ab">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
 
    <xsl:template match="tei:lb[@break = 'no']">
    </xsl:template>
 
    <xsl:template match="tei:lb[not(@break = 'no')]">
    <br/>
</xsl:template>
   
    <xsl:template match="tei:cb">
    </xsl:template>
   
 
    <xsl:template match="tei:hi[@rend='italic']">
        <i class="italic-text">
            <xsl:apply-templates/>
        </i>
    </xsl:template>
 
    <xsl:template match="tei:pb">
            </xsl:template>
   
    <xsl:template match="text()">
        <xsl:value-of select="."/>
    </xsl:template>
 
    <xsl:template match="tei:note">
    <sup class="nota">
        <xsl:apply-templates/>
    </sup>
</xsl:template>
 
 
    <!-- PERSONE -->
<xsl:template match="tei:persName">
    <span class="persName">
        <xsl:apply-templates/>
    </span>
</xsl:template>
 
<!-- LUOGHI -->
<xsl:template match="tei:placeName">
    <span class="placeName">
        <xsl:apply-templates/>
    </span>
</xsl:template>
 
<!-- ORGANIZZAZIONI -->
<xsl:template match="tei:orgName">
    <span class="orgName">
        <xsl:apply-templates/>
    </span>
</xsl:template>
 
<!-- RUOLI -->
<xsl:template match="tei:roleName">
    <span class="roleName">
        <xsl:apply-templates/>
    </span>
</xsl:template>
 
<!-- DATE -->
<xsl:template match="tei:date">
    <span class="dateName">
        <xsl:apply-templates/>
    </span>
</xsl:template>
 
<!-- CITAZIONI -->
<xsl:template match="tei:quote">
    <span class="quoteName">
        <xsl:apply-templates/>
    </span>
</xsl:template>
 
<!-- LINGUA STRANIERA -->
<xsl:template match="tei:foreign">
    <span class="foreignName">
        <xsl:apply-templates/>
    </span>
</xsl:template>
 
<!-- OPERE -->
<xsl:template match="tei:title[not(ancestor::tei:head)]">
    <span class="titleName">
        <xsl:apply-templates/>
    </span>
</xsl:template>
 
 
 
<xsl:template match="tei:choice[tei:abbr and tei:expan]">
    <span class="abbr" data-expan="{normalize-space(tei:expan)}" data-abbr="{normalize-space(tei:abbr)}">
        <xsl:value-of select="tei:abbr"/>
    </span>
</xsl:template>
 
 
 
 
<xsl:template match="tei:orig">
    <xsl:variable name="regValue" select="normalize-space(../tei:reg)" />
    <span class="orig">
        <xsl:attribute name="data-reg">
            <xsl:choose>
                <xsl:when test="ends-with(., '-')">
                    <xsl:value-of select="$regValue" />
                </xsl:when>
                <xsl:when test="preceding::tei:orig[1][ends-with(., '-')]">
                    <xsl:text>HIDE_THIS</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$regValue" />
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        
        <xsl:attribute name="data-orig">
            <xsl:value-of select="normalize-space(.)" />
        </xsl:attribute>
        
        <xsl:apply-templates/>
    </span>
</xsl:template>

<xsl:template match="tei:reg">
    </xsl:template>

<xsl:template match="tei:lb">
    <xsl:choose>
        <xsl:when test="@break = 'no'"></xsl:when>
        <xsl:otherwise>
            <br/>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template name="glossario">
  <div id="glossario-container">
    <h1>Glossario</h1>
    
    <div class="glossario-sezione">
      <xsl:apply-templates select="//tei:listPerson" />
    </div>

    <div class="glossario-sezione">
      <xsl:apply-templates select="//tei:listOrg" />
    </div>

    <div class="glossario-sezione">
      <xsl:apply-templates select="//tei:listPlace" />
    </div>
  </div>
</xsl:template>

<xsl:template match="tei:listPerson">
  <h2>Persone</h2>
  <ul>
    <xsl:for-each select="tei:person">
      <li><b><xsl:value-of select="tei:persName" /></b></li>
    </xsl:for-each>
  </ul>
</xsl:template>

<xsl:template match="tei:listOrg">
  <h2>Organizzazioni</h2>
  <ul>
    <xsl:for-each select="tei:org">
      <li><b><xsl:value-of select="tei:orgName" /></b></li>
    </xsl:for-each>
  </ul>
</xsl:template>

<xsl:template match="tei:listPlace">
  <h2>Luoghi</h2>
  <ul>
    <xsl:for-each select="tei:place">
      <li><b><xsl:value-of select="tei:placeName" /></b></li>
    </xsl:for-each>
  </ul>
</xsl:template>

<xsl:template match="tei:note[@xml:id='riferimenti']">
    <xsl:apply-templates/>
</xsl:template>
 
<xsl:template match="tei:ref">
    <a href="{@target}" target="_blank" class="link">
        <xsl:apply-templates/>
    </a>
</xsl:template> 
 
 
</xsl:stylesheet>