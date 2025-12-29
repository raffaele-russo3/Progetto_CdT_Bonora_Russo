Questo progetto è stato sviluppato per l'esame di Codifica di Testi del corso di Informatica Umanistica dell'Università di Pisa dagli studenti Veronica Bonora e Raffaele Russo. 
Sono stati codificati alcuni articoli presenti nell'archivio digitale della rivista La Rassegna Settimanale. Tramite Saxon abbiamo creato l'output html con questa riga di comando da terminale: java -jar SaxonHe12-5J\saxon-he-12.5.jar -s:Progetto_raffavero.xml -xsl:trasformazione_xsl.xsl -o:output.html
Per permettere di verificare la correttezza del documento xml tramite Xerces e dtd abbiamo usato il seguente comando: java -cp ".;xerces-2_12_2-xml-schema-1.1/*" dom.Counter -v "Progetto_raffavero.xml"
 # Progetto_CdT_Bonora_Russo
