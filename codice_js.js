// Funzione generale per evidenziare elementi con colore del bottone
function evidenzia(bottone, classe, colorNum) {
    const highlightClass = 'highlight' + colorNum;
    const elementiDaEvidenziare = document.querySelectorAll('.' + classe);
   
 
    const isAttivo = bottone.classList.contains('attivo');
   
    // Rimuove la classe highlight da TUTTI gli elementi
    for (let i = 1; i <= 10; i++) {
        document.querySelectorAll('.highlight' + i)
            .forEach(e => e.classList.remove('highlight' + i));
    }
   
    // Rimuove lo stato 'attivo' da TUTTI i bottoni di evidenziazione
    document.querySelectorAll('.bottone-categoria').forEach(btn => {
        // Se è un bottone di evidenziazione (non espansione o regolarizzazione), rimuove 'attivo'
        if (btn.textContent.toLowerCase() !== 'espansioni' && btn.textContent.toLowerCase() !== 'regolarizzazioni') {
            btn.classList.remove('attivo');
        }
    });
 
 
    // 2. Se il bottone NON era attivo, lo attiva e applica l'evidenziazione
    if (!isAttivo) {
        elementiDaEvidenziare.forEach(e => e.classList.add(highlightClass));
       
        // Imposta il bottone come attivo
        bottone.classList.add('attivo');
    }
    // Se era attivo, non facciamo nulla.
}
 
// Funzione generica per gestire toggle funzioni come espansioni/regolarizzazioni
function toggleFunzione(bottone, funzioneAttiva, funzioneDisattiva) {
 
    const isAttivo = bottone.classList.contains('attivo');
   
    //Togli lo stato 'attivo' da TUTTI gli altri bottoni
    document.querySelectorAll('.bottone-categoria').forEach(btn => {
        // Per evitare conflitti, disattiva SOLO gli altri bottoni di toggle
        if (btn !== bottone) {
            btn.classList.remove('attivo');
        }
    });
   
   
    if (isAttivo) {
        // Se era attivo, disattivalo e chiama la funzione per nascondere
        bottone.classList.remove('attivo');
        if (window[funzioneDisattiva]) {
            window[funzioneDisattiva]();
        }
    } else {
        // Se NON era attivo, attivalo e chiama la funzione per mostrare
        bottone.classList.add('attivo');
        if (window[funzioneAttiva]) {
            // Prima di mostrare, nascondi l'altra funzione di toggle se attiva
            if (funzioneAttiva === 'mostraReg' && document.querySelector(".bottone-categoria:nth-child(4)").classList.contains('attivo')) {
                 nascondiEspansioni();
                 document.querySelector(".bottone-categoria:nth-child(4)").classList.remove('attivo');
            } else if (funzioneAttiva === 'mostraEspansioni' && document.querySelector(".bottone-categoria:nth-child(5)").classList.contains('attivo')) {
                 nascondiReg();
                 document.querySelector(".bottone-categoria:nth-child(5)").classList.remove('attivo');
            }
            window[funzioneAttiva]();
        }
    }
}
 
// ESPANSIONI: mostra il contenuto di <expan> al posto di <abbr>
function mostraEspansioni() {
    document.querySelectorAll('.abbr').forEach(e => {
        const expan = e.dataset.expan;
        if (expan) {
            e.textContent = expan;
            e.classList.add('replaced');
        }
    });
}
 
// NASCONDI ESPANSIONI: ripristina il contenuto di <abbr>
function nascondiEspansioni() {
    document.querySelectorAll('.abbr').forEach(e => {
 
        if (e.classList.contains('replaced')) {
            e.textContent = e.dataset.abbr;
            e.classList.remove('replaced');
        }
    });
}
 
// REGOLARIZZAZIONI: mostra il contenuto di <reg> al posto di <orig>
function mostraReg() {
    document.querySelectorAll('.orig').forEach(e => {
        const reg = e.dataset.reg;
        if (reg === 'HIDE_THIS') {
            e.style.display = 'none';
            e.classList.add('regular');
        } else if (reg) {
            e.textContent = reg;
            e.classList.add('regular');
        }
    });
}
 
// NASCONDI REGOLARIZZAZIONI: ripristina il contenuto di <orig>
function nascondiReg() {
    document.querySelectorAll('.orig').forEach(e => {
        if (e.classList.contains('regular')) {
            e.style.display = 'inline'; // Torna a mostrarlo (come testo normale)
            e.textContent = e.dataset.orig;
            e.classList.remove('regular');
        }
    });
}