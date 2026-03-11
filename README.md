# Servizio di Live Streaming - Progetto di Basi di Dati e Sistemi Informativi

Progetto per il corso di **Basi di Dati e Sistemi Informativi**  
Anno Accademico **2023/2024**

**Componente del gruppo**
- Sara Bistoncini (matricola 20050074)

---

# Descrizione del progetto

Il progetto riguarda la progettazione di una **base di dati per un servizio di live streaming** ispirato a piattaforme come Twitch.

La piattaforma consente agli utenti di assistere a dirette live su diversi argomenti, interagire in tempo reale tramite chat pubblica, seguire gli streamer preferiti, abbonarsi ai canali, effettuare donazioni tramite bit e accedere a contenuti esclusivi.

Il sistema supporta sia utenti registrati sia utenti guest e prevede funzionalità dedicate anche agli utenti fragili, attraverso contenuti accessibili e versioni inclusive delle pagine.

Il progetto è stato sviluppato attraverso le principali fasi di progettazione di basi di dati:

- analisi dei requisiti
- glossario dei termini
- riscrittura e strutturazione dei requisiti
- progettazione concettuale con schema E-R
- definizione delle regole aziendali
- progettazione logica
- schema relazionale
- definizione di DDL e DML su PostgreSQL

---

# Obiettivo del progetto

L’obiettivo è modellare una base di dati capace di gestire tutti gli aspetti principali di una piattaforma di live streaming, tra cui:

- utenti registrati e guest
- streamer e viewer
- canali
- live, video e clip
- notifiche
- follower
- abbonamenti premium
- portafogli di bit e donazioni
- reazioni, commenti e votazioni
- calendario delle live
- contenuti suggeriti
- contenuti accessibili per utenti fragili

---

# Funzionalità principali modellate

Il sistema supporta le seguenti funzionalità:

- registrazione degli utenti con nome utente, password, data di nascita e contatto
- distinzione tra utenti registrati e guest
- possibilità per un utente di essere viewer, streamer o entrambi
- creazione e gestione dei canali degli streamer
- associazione di social, immagine profilo e trailer ai canali
- gestione di live, video e clip
- notifiche ai follower all’avvio di una live
- ricerca dei contenuti per hashtag o categoria
- gestione dei follower
- sistema di subscription ai canali
- accesso a contenuti extra per utenti premium
- portafoglio di bit per donazioni agli streamer
- votazione dei contenuti tramite scala Likert da 1 a 10
- messaggistica privata tra utenti
- suggerimento di contenuti in base alle preferenze dell’utente
- supporto a contenuti accessibili per utenti fragili
- gestione delle condizioni per la qualifica di affiliate
- gestione dello storico utenti premium
- controllo di commenti offensivi e profili fake
- gestione dei costi di hosting dei canali

---

# Requisiti principali del dominio

La base di dati è stata progettata per rappresentare un servizio di live streaming in cui:

- ogni utente può essere viewer e/o streamer
- i viewer possono essere registrati oppure guest
- gli utenti registrati possono commentare, seguire streamer e creare live
- gli utenti premium possono accedere a contenuti extra
- ogni streamer possiede un canale
- ogni canale può contenere live, video e clip
- ogni live ha data, ora, durata, categoria e reazioni
- i follower ricevono notifiche quando inizia una live
- gli utenti possono cercare contenuti per hashtag e categorie
- i follower possono votare i contenuti
- gli utenti possono inviare messaggi privati
- gli utenti fragili possono accedere a contenuti inclusivi e modalità facilitate

---

# Entità principali del progetto

Le principali entità modellate sono:

- **Utente**
- **Canale**
- **Live**
- **Altri contenuti**
- **Categoria**
- **Reazione**
- **Notifica**
- **Portafoglio**
- **Chat privata**
- **Calendario**
- **Social**

---

# Progettazione concettuale

La progettazione concettuale è stata sviluppata a partire dai requisiti iniziali, seguendo un approccio **inside-out**, iniziando dalle entità principali:

- utente
- live
- canale

Successivamente sono state definite le relazioni, gli attributi e i vincoli, facendo uso di pattern di progettazione come:

- **reificazione di attributi di entità**
- **part-of**
- **casi particolari di entità**

Tra gli esempi citati nella relazione:

- la **categoria** è stata trasformata da semplice attributo a entità
- sono state usate relazioni part-of tra **archivio e canale** e tra **calendario e canale**
- il concetto di **utente** è stato specializzato nei vari ruoli del dominio

---

# Regole aziendali

Sono state definite regole aziendali per garantire correttezza e coerenza del modello.

## Vincoli di integrità

Alcuni dei principali vincoli sono:

- un portafoglio deve essere posseduto da un utente
- un account deve essere posseduto da un utente
- una notifica deve essere emessa dopo una live
- un canale deve essere posseduto da uno streamer
- un canale deve appartenere a una categoria
- un guest non deve avere un account
- una chat privata deve appartenere a un utente registrato
- un utente registrato deve avere un canale
- un calendario deve essere posseduto da un canale
- i social devono essere associati a un canale
- una live deve essere fatta da uno streamer

## Derivazioni

Tra le derivazioni principali:

- un altro contenuto si ottiene da una live
- il numero di spettatori medi di una live si ottiene sommando gli spettatori attuali a intervalli regolari e calcolandone la media

---

# Progettazione logica

Nella fase di progettazione logica sono stati definiti:

- tavola dei volumi
- tavola delle operazioni
- analisi delle ridondanze
- eliminazione delle generalizzazioni
- accorpamento e partizionamento di entità e associazioni
- schema relazionale finale

---

# Analisi delle ridondanze

Sono state analizzate alcune ridondanze per valutare il miglior compromesso tra:

- occupazione di spazio
- costo in accessi giornalieri
- prestazioni del sistema

Le principali ridondanze considerate sono:

- quantità di live presenti nell’archivio
- numero medio di spettatori di una live

In entrambi i casi è stata scelta la **presenza della ridondanza**, poiché consente di ridurre il numero di accessi giornalieri e migliorare le prestazioni complessive del sistema.

---

# Eliminazione delle generalizzazioni

Durante la ristrutturazione dello schema E-R sono state eliminate alcune generalizzazioni.

In particolare:

- **viewer** e **streamer** sono stati ricondotti all’entità **utente registrato**
- **guest** è stato accorpato all’entità più generale **utente**

Questa scelta è stata fatta per semplificare il modello senza perdere informazioni rilevanti.

---

# Accorpamenti e partizionamenti

Sono stati effettuati diversi interventi di ristrutturazione del modello:

- accorpamento dell’entità **account** nell’entità **utente**
- accorpamento dell’entità **utente premium** in **utente** tramite attributo booleano
- accorpamento dell’entità **archivio** con la gestione dei contenuti
- accorpamento di **video** e **clip** in una singola entità chiamata **altri contenuti**
- trasformazione dell’attributo **commento** in una vera e propria entità **reazione**

Queste scelte hanno reso il modello più compatto e coerente con i requisiti.

---

# Schema relazionale

Il progetto include la definizione dello schema relazionale con vincoli di integrità referenziale.

Le principali relazioni definite sono:

- **UTENTE**
- **CHAT_PRIVATA**
- **PORTAFOGLIO**
- **NOTIFICA**
- **CANALE**
- **SOCIAL**
- **CALENDARIO**
- **ALTRI_CONTENUTI**
- **LIVE**
- **CATEGORIA**
- **REAZIONE**

Ogni relazione è stata accompagnata dai rispettivi riferimenti esterni e vincoli di integrità.

---

# Operazioni supportate dal sistema

La base di dati deve supportare operazioni periodiche e amministrative, tra cui:

- controllo giornaliero delle condizioni per la qualifica di affiliate
- calcolo settimanale della classifica degli streamer più seguiti
- calcolo giornaliero della media dei like per contenuto
- generazione giornaliera del rating dei contenuti più votati
- controllo ed eliminazione multipla giornaliera dei commenti offensivi
- controllo dei nuovi utenti registrati
- segnalazione di profili fake
- visualizzazione periodica dello storico degli utenti premium

---

# Volumi stimati

La progettazione logica è stata accompagnata da una stima dei volumi, ispirata a piattaforme reali come Twitch.

Alcuni valori stimati riportati nella relazione:

- 140 milioni di utenti complessivi
- 80 milioni di utenti registrati
- 60 milioni di guest
- 7 milioni di streamer
- 9 milioni di canali
- 210 milioni di live al mese
- 1,2 miliardi di chat private
- 42 milioni di eventi in calendario
- 150 categorie

Questi dati sono stati utilizzati per motivare le scelte di modellazione e ottimizzazione.

---

# DDL e DML

Il progetto prevede anche una parte implementativa su **PostgreSQL**.

## DDL

È stato creato un database chiamato **SERVIZIO** su PostgreSQL per gestire i dati della piattaforma.

Le tabelle sono state progettate tenendo conto dei vincoli di integrità referenziale definiti nello schema relazionale.

## DML di popolamento

Il database è stato popolato con dati di esempio ritenuti verosimili.

Sono stati inseriti tra **5 e 10 esempi** per ciascun attributo delle tabelle principali.

## DML di modifica

Sono state implementate anche operazioni di modifica, tra cui:

- aggiunta di un utente
- aggiunta di un portafoglio
- aggiunta di un canale
- aggiunta di social associati
- modifica della password di un utente
- modifica del numero di bit nel portafoglio
- modifica della descrizione di un canale
- modifica della durata di una live

---

# Tecnologie utilizzate

- PostgreSQL
- SQL
- Progettazione concettuale E-R
- Progettazione logica
- Vincoli di integrità referenziale
- DDL
- DML

---

# Struttura del lavoro

Il progetto è stato sviluppato attraverso le seguenti sezioni:

1. Progettazione concettuale
2. Glossario dei termini
3. Requisiti riscritti
4. Requisiti strutturati in gruppi omogenei
5. Schema E-R e regole aziendali
6. Progettazione logica
7. Analisi delle ridondanze
8. Eliminazione generalizzazioni
9. Ristrutturazione schema E-R
10. Schema relazionale
11. DDL e DML

---

# Autore

Sara Bistoncini  
Matricola 20050074
