CREATE TABLE Utente (
    Nome_Utente VARCHAR(255) PRIMARY KEY,
    Email_Numero_Telefono VARCHAR(255),
    Password VARCHAR(255),
    Data_Nascita DATE,
    Abbonato BOOLEAN
);

CREATE TABLE Canale (
    Nome VARCHAR(255) PRIMARY KEY,
    Descrizione TEXT,
    Immagine_Profilo VARCHAR(255),
    Trailer VARCHAR(255),
    Numero_Followers INT,
    Nome_Utente VARCHAR(255),
    Affiliate BOOLEAN,
    FOREIGN KEY (Nome_Utente) REFERENCES Utente(Nome_Utente)
);

CREATE TABLE Categoria (
    Nome_Categoria VARCHAR(255) PRIMARY KEY,
    Nome VARCHAR(255)
);

CREATE TABLE Live (
    Codice SERIAL PRIMARY KEY,
    Titolo VARCHAR(255),
    Descrizione TEXT,
    Data DATE,
    Ora TIME,
    Durata INT,
    Numero_Spettatori_Attuali INT,
    Numero_Spettatori_Medi INT,
    Numero_Visualizzazioni INT,
    Contenuti_Utenti_Fragili TEXT,
    Passata BOOLEAN,
    Nome_Canale VARCHAR(255),
    Nome_Categoria VARCHAR(255),
    Nome_Utente VARCHAR(255),
    Codice_Reazione INT,
    FOREIGN KEY (Nome_Canale) REFERENCES Canale(Nome),
    FOREIGN KEY (Nome_Categoria) REFERENCES Categoria(Nome_Categoria),
    FOREIGN KEY (Nome_Utente) REFERENCES Utente(Nome_Utente)
);

CREATE TABLE Reazioni (
    Codice_Reazione SERIAL PRIMARY KEY,
    Commento TEXT,
    Voto INT CHECK (Voto BETWEEN 1 AND 10),
    Nome_Utente VARCHAR(255),
    Codice INT,
    FOREIGN KEY (Nome_Utente) REFERENCES Utente(Nome_Utente),
    FOREIGN KEY (Codice) REFERENCES Live(Codice)
);

CREATE TABLE Notifica (
    Codice SERIAL PRIMARY KEY,
    Titolo VARCHAR(255),
    Descrizione TEXT,
    Nome_Utente VARCHAR(255),
    Codice_Live INT,
    FOREIGN KEY (Nome_Utente) REFERENCES Utente(Nome_Utente),
    FOREIGN KEY (Codice_Live) REFERENCES Live(Codice)
);

CREATE TABLE Portafoglio (
    Codice SERIAL PRIMARY KEY,
    Numero_Bits INT,
    Nome_Utente VARCHAR(255),
    FOREIGN KEY (Nome_Utente) REFERENCES Utente(Nome_Utente)
);

CREATE TABLE Chat_Privata (
    ID_Chat SERIAL PRIMARY KEY,
    Nome_Utente VARCHAR(255),
    Destinatario VARCHAR(255),
    FOREIGN KEY (Nome_Utente) REFERENCES Utente(Nome_Utente)
);

CREATE TABLE Social (
    Nome_Social VARCHAR(255) PRIMARY KEY,
    Nome_Canale VARCHAR(255),
    FOREIGN KEY (Nome_Canale) REFERENCES Canale(Nome)
);

CREATE TABLE Calendario (
    ID_Calendario SERIAL PRIMARY KEY,
    Ora TIME,
    Data DATE,
    Nome_Canale VARCHAR(255),
    FOREIGN KEY (Nome_Canale) REFERENCES Canale(Nome)
);

CREATE TABLE Altri_Contenuti (
    Codice SERIAL PRIMARY KEY,
    Titolo VARCHAR(255),
    Numero_Visualizzazioni INT,
    Contenuti_Utenti_Fragili TEXT,
    Valutazione INT CHECK (Valutazione BETWEEN 1 AND 10),
    Nome_Canale VARCHAR(255),
    FOREIGN KEY (Nome_Canale) REFERENCES Canale(Nome)
);
