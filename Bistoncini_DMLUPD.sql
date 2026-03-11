
-- Inserire un nuovo utente
INSERT INTO Utente (Nome_Utente, Email_Numero_Telefono, Password, Data_Nascita, Abbonato) VALUES
('franco87', 'franco87@example.com', 'passwordFranco', '1987-04-15', TRUE);

-- Inserire un nuovo portafoglio
INSERT INTO Portafoglio (Numero_Bits, Nome_Utente) VALUES
(1500, 'franco87');

-- Inserire un nuovo canale
INSERT INTO Canale (Nome, Descrizione, Immagine_Profilo, Trailer, Numero_Followers, Nome_Utente, Affiliate) VALUES
('InnovazioneTech', 'Ultime novità e recensioni tecnologiche.', 'innovazionetech.jpg', 'innovazionetech.mp4', 6000, 'franco87', TRUE);

-- Inserire un nuovo social
INSERT INTO Social (Nome_Social, Nome_Canale) VALUES
('Pinterest', 'InnovazioneTech');

-- Inserire un nuovo evento nel calendario
INSERT INTO Calendario (Ora, Data, Nome_Canale) VALUES
('14:00:00', '2023-05-15', 'InnovazioneTech');

-- Inserire una nuova categoria
INSERT INTO Categoria (Nome_Categoria, Nome) VALUES
('Informatica', 'InnovazioneTech');

-- Inserire una nuova live
INSERT INTO Live (Titolo, Descrizione, Data, Ora, Durata, Numero_Spettatori_Attuali, Numero_Spettatori_Medi, Numero_Visualizzazioni, Contenuti_Utenti_Fragili, Passata, Nome_Canale, Nome_Categoria, Nome_Utente) VALUES
('Live Coding', 'Sessione di programmazione in diretta.', '2023-06-01', '16:00:00', 120, 300, 350, 1200, 'No', FALSE, 'InnovazioneTech', 'Informatica', 'franco87');



-- Aggiornare la password di un utente
UPDATE Utente
SET Password = 'newPassword123'
WHERE Nome_Utente = 'mario56';

-- Aggiornare i bits di un portafoglio
UPDATE Portafoglio
SET Numero_Bits = 2000
WHERE Nome_Utente = 'giulia23';

-- Aggiornare la descrizione di un canale
UPDATE Canale
SET Descrizione = 'Discussioni su tecnologia e innovazione aggiornate.'
WHERE Nome = 'TechTalk';

-- Aggiornare la durata di un live
UPDATE Live
SET Durata = 140
WHERE Titolo = 'Live Tech Talk 1';
