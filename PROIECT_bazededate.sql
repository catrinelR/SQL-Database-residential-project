CREATE DATABASE PROIECT;
USE PROIECT;
SHOW DATABASES;
SHOW TABLES;
DROP TABLE proprietati;
DROP TABLE tip_proprietate;
DROP TABLE clienti;
DROP TABLE clienti_confidential;
DROP TABLE vanzari;

CREATE TABLE proprietati(
id_prop INT PRIMARY KEY AUTO_INCREMENT,
denumire VARCHAR(255),
nr_camere VARCHAR (10),
suprafata_utila_mp INT,
suprafata_construita_mp INT,
suprafata_teren_mp INT DEFAULT NULL,
pret_euro INT
);
DESCRIBE proprietati;
        
CREATE TABLE tip_proprietate(
id_tip INT PRIMARY KEY AUTO_INCREMENT,
denumire VARCHAR(255),
descriere VARCHAR(255)
);
DESCRIBE tip_proprietate;

ALTER TABLE proprietati  ADD FOREIGN KEY fk1(id_prop)
REFERENCES tip_proprietate(id_tip) 
ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE clienti(
id_client INT PRIMARY KEY AUTO_INCREMENT,
nume VARCHAR(255),
prenume VARCHAR(255),
telefon VARCHAR(20), 
email VARCHAR(255),
buget_euro INT 
);
DESCRIBE clienti;
-- TELEFON NU VA FI DE TIP INT PT CA DACA INCEPE CU CIFRA 0 ACEASTA VA FI DECUPATA
CREATE TABLE clienti_confidential(
id INT NOT NULL UNIQUE,
CI VARCHAR(20),
adresa VARCHAR(255), 
oras VARCHAR(255), 
judet VARCHAR(255)
);
DESCRIBE clienti_confidential;

ALTER TABLE clienti_confidential ADD FOREIGN KEY fk2(id)
REFERENCES clienti(id_client) 
ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE vanzari(
id_vanzare INT PRIMARY KEY AUTO_INCREMENT, 
id_prop INT NOT NULL,
id_client INT NOT NULL,
data_achizitie DATE,
cantitate INT,
pret_vanzare_euro INT
);
DESCRIBE vanzari;

ALTER TABLE vanzari ADD FOREIGN KEY fk3(id_prop)
REFERENCES proprietati(id_prop) 
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE vanzari ADD FOREIGN KEY fk4(id_client)
REFERENCES clienti(id_client) 
ON DELETE CASCADE ON UPDATE CASCADE;

DESCRIBE vanzari;

SHOW TABLES;
select * from proprietati;
-- popularea tabelelor
INSERT INTO proprietati VALUES 
(NULL,'casa1', 3, 105, 120, 180, 128000),
(NULL,'casa2', 3, 95, 115, 175, 123000),
(NULL,'casa3', 4, 165, 180, 220, 143000),
(NULL,'casa4', 4, 126, 146, 220, 136000),
(NULL,'casa5', 4, 179, 196, 235, 148000),
(NULL,'casa6', 4, 134, 155, 235, 140000),
(NULL,'casa7', 4, 110, 130, 320, 139000);
INSERT INTO proprietati(id_prop, denumire, nr_camere, suprafata_utila_mp, suprafata_construita_mp, pret_euro) VALUES 
(NULL,'apartament1', 4, 95, 132, 142500),
(NULL,'apartament2', 3, 73, 101, 109500),
(NULL,'apartament3', 2, 52, 70, 78000),
(NULL,'studio', 1, 41, 53, 61500),
(NULL,'garsoniera', 1, 33, 44, 49500);
SELECT * FROM proprietati;

INSERT INTO tip_proprietate(denumire, descriere) VALUES
('TIP A', 'casa 3 camere P+1'),
('TIP B', 'casa 3 camere P+1'),
('TIP C', 'casa 4 camere S+P+1'),
('TIP C1', 'casa 4 camere P+1'),
('TIP D', 'casa 4 camere S+P+1'),
('TIP D1', 'casa 4 camere P+1'),
('TIP E', 'casa 4 camere P'),
('TIP 1', 'apartament 4 camere 3 balcoane'),
('TIP 2', 'apartament 3 camere 2 balcoane'),
('TIP 3', 'apartament 2 camere 2 balcoane'),
('TIP 4', 'studio 1 camera 1 balcon'),
('TIP 5', 'garsoniera 1 camera 1 balcon inchis');
SELECT * FROM tip_proprietate;

INSERT INTO clienti VALUES
(NULL, 'PETRESCU', 'MARIA', '0749852749', 'mariapetrescu@yahoo.com', 90000),
(NULL, 'STANESCU', 'DANIELA', '0751298731', 'daniela@gmail.com', 125000),
(NULL, 'OPREA', 'IOAN', '0755886218', 'ioanoprea@yahoo.com', 145000),
(NULL, 'MIHALACHE', 'PETRE', '0748782471', 'petremihalache@gmail.com', 135000),
(NULL, 'NEAGOE', 'VALERIA', '0749815444', 'valerianeagoe@yahoo.com', 70000),
(NULL, 'SAMBRIAN', 'NICOLAE', '0733162587', 'nicolae@yahoo.com', 145000),
(NULL, 'NEGOESCU', 'VLAD', '0756141995', 'vladnegoescu@gmail.com', 115000),
(NULL, 'GRECU',	'SIMONA', '0755861877',	'simonagrecu@yahoo.com', 145000),
(NULL, 'NICOLAESCU', 'DANIEL', '0787884512', 'daniel@yahoo.com', 200000),
(NULL, 'DRAGOMIR', 'FLORIN', '0747004858', 'florindragomir@gmail.com', 150000),
(NULL, 'ALEXE', 'TEODORA', '0786235148', 'teodoraalexe@gmail.com', 150000),
(NULL, 'TOMESCU', 'CONSTANTIN', '0745846885', 'constantin@yahoo.com', 155000),
(NULL, 'LUCA', 'NATALIA', '0789554122', 'natalialuca@gmail.com', 135000),
(NULL, 'RADUCAN', 'BOGDAN', '0755866335', 'bogdan@yahoo.com', 60000),
(NULL, 'DINU', 'IULIANA', '0741864559', 'iulianadinu@gmail.com', 135000);
SELECT * FROM clienti;

INSERT INTO clienti_confidential VALUES
(1,'RJ 445609', 'Strada Marinarilor nr 18, bloc 10, sc 1, et3, ap 48', 'Bucuresti', 'ILFOV'),
(2,'BT 191348', 'Strada Smaraldului nr 10, bloc 6, et1, ap 5', 'Bragadiru', 'ILFOV'),
(3,'IF 674593', 'Strada Stefan cel Mare nr 28', 'Tunari', 'ILFOV'),
(4,'RX 410972', 'Calea Mosilor nr 227, bloc 39, sc 2, et 4, ap 52', 'Bucuresti', 'ILFOV'),
(5,'RT 912597', 'Sos. Giurgiului nr 129, bloc 8A, sc2, et6, ap 64', 'Bucuresti', 'ILFOV'),
(6,'IF 456298', 'Calea Vacaresti nr 328, bloc 8F, sc A, ap 12', 'Bucuresti', 'ILFOV'),
(7,'RK 215404', 'Strada 23 August nr 85', 'Otopeni', 'ILFOV'),
(8,'IF 960285', 'Strada Zorilor nr 9', 'Popesti Leordeni', 'ILFOV'),
(9,'RD 758604', 'Sos. Nordului nr 54', 'Bucuresti', 'ILFOV'),
(10,'XZ 853021', 'Bd Unirii nr 209, Bloc D4, ap 5', 'Buzau', 'BUZAU'),
(11,'RK 076503', 'Strada Vulturilor nr 65', 'Bucuresti', 'ILFOV'),
(12,'RX 595382', 'Strada Cuza Voda nr 114', 'Bucuresti', 'ILFOV'),
(13,'RR 138945', 'Strada Fetesti nr 2', 'Bucuresti', 'ILFOV'),
(14,'DX 764023', 'Strada Laleleor nr 8, Bloc P4, sc 2, ap 18', 'Craiova', 'DOLJ'),
(15,'RD 968519', 'Strada Crinul de Gradina nr 22', 'Bucuresti', 'ILFOV');
SELECT * FROM clienti_confidential;

INSERT INTO vanzari VALUES 
(NULL, 1 , 4, '2021-05-20', 1, 128000),
(NULL, 3, 10, '2020-02-18', 1, 143000),
(NULL, 2, 15, '2021-11-08', 1, 123000),
(NULL, 4, 6, '2020-10-17', 1, 136000), 
(NULL, 5, 11, '2022-09-24', 1, 140000),
(NULL, 6, 9, '2021-08-14', 1, 148000),
(NULL, 7, 8, '2019-10-28', 1, 139000),
(NULL, 8, 12, '2022-03-19', 1, 142500),
(NULL, 11, 5, '2022-05-24', 1, 61500),
(NULL, 12, 14, '2021-06-04', 1, 49500),
(NULL, 10, 1, '2022-09-28', 1, 78000),
(NULL, 9, 7, '2021-11-25', 1, 109500),
(NULL, 1, 13, '2021-08-29', 1, 128000),
(NULL, 2, 2, '2020-10-04', 1, 123000),
(NULL, 6, 3, '2021-07-19', 1, 140000);
SELECT * FROM vanzari;

-- proiectati o interogare ce va afisa id-ul, numele, prenumele si bugetul tuturor clientilor, ordonoati crescator dupa buget
SELECT buget_euro, id_client, nume FROM clienti ORDER BY buget_euro ASC;
-- proiectati o interogare ce va afisa toti clientii cu bugetul mai mare sau egal cu 135000 
SELECT * FROM clienti WHERE buget_euro >= 135000 ORDER BY buget_euro ASC;
-- proiectati o interogare ce va fisa toti clientii al caror nume incepe cu litera N
SELECT id_client, nume, prenume FROM clienti WHERE ASCII(nume)=ASCII('N');
-- SAU 
SELECT * FROM clienti WHERE nume LIKE 'N%';
-- sa se afiseze clientul cu cel mai mare buget
SELECT * FROM clienti WHERE buget_euro=(SELECT MAX(buget_euro) FROM clienti);
-- sau
SELECT * FROM clienti WHERE buget_euro=(SELECT buget_euro FROM clienti ORDER BY buget_euro DESC LIMIT 1);
-- sa se afiseze proprietatile cu suprafata utila mai mare de 90 mp si pretul maxim de 140000 euro
SELECT * FROM proprietati WHERE suprafata_utila_mp >90 AND pret_euro <=140000;
-- sa se afiseze suprafata utila medie pentru proprietatile cu 3 camere
SELECT FLOOR(AVG(suprafata_utila_mp)) AS suprafata_medie FROM proprietati WHERE nr_camere=3;


-- sa se afiseze lista tuturor proprietatilor puse spre vanzare, tipul si descrierea fiecareia
SELECT p.*, t.denumire, t.descriere FROM proprietati AS p LEFT JOIN tip_proprietate AS t ON p.id_prop=t.id_tip;

-- sa se afiseze o lista a proprietatilor impreuna cu numele si prenumele clientului care a facut achizitia, 
-- ordonate dupa cea mai recenta data de achizitie
SELECT p.*, c.nume, c.prenume, v.data_achizitie FROM proprietati AS p 
LEFT JOIN vanzari AS v ON p.id_prop=v.id_prop
LEFT JOIN clienti AS c ON c.id_client=v.id_client
ORDER BY v.data_achizitie DESC;
-- SAU
SELECT id_prop, denumire, nr_camere, suprafata_utila_mp, suprafata_construita_mp, suprafata_teren_mp, pret_euro, id_client, nume, prenume, data_achizitie
FROM afisare_proprietati_clienti_vanzari
ORDER BY v.data_achizitie DESC;

-- Proiectati o interogare ce va afisa tipul proprietatilor ce au 3 camere
SELECT p.denumire, p.nr_camere, t.denumire, t.descriere FROM proprietati AS p 
RIGHT JOIN tip_proprietate AS t ON p.id_prop=t.id_tip
WHERE p.nr_camere=3 GROUP BY t.denumire;

-- sa se afiseze lista tuturor proprietatilor, impreuna cu numele si prenumele clientilor care le-au achizitionat, 
-- ordonate cronologic dupa data achizitiei
SELECT v.data_achizitie, p.*, c.nume, c.prenume FROM proprietati AS p 
RIGHT JOIN vanzari AS v ON p.id_prop=v.id_prop
LEFT JOIN clienti AS c ON v.id_client=c.id_client 
 ORDER BY v.data_achizitie ASC;

-- sa se afiseze bugetul clientilor pe fiecare oras
SELECT SUM(c.buget_euro) AS buget, conf.oras FROM clienti AS c LEFT JOIN clienti_confidential AS conf
ON c.id_client=conf.id GROUP BY conf.oras;

-- sa se afiseze cel mai mare buget, cel mai mic buget si media bugetelor clientilor din fiecare oras (grupati pe orase)
SELECT conf.oras, floor(avg(c.buget_euro)) AS medie_buget, MAX(c.buget_euro) AS buget_maxim, MIN(c.buget_euro) AS buget_minim
FROM clienti_confidential AS conf LEFT JOIN clienti AS c ON c.id_client=conf.id 
GROUP BY conf.oras;

-- LISTA CLIENTILOR CARE AU CUMPARAT IN ANUL 2021 PROPRIETATI CU 4 CAMERE
SELECT  c.nume, c.prenume, p.denumire, p.nr_camere FROM clienti AS c 
LEFT JOIN vanzari AS v ON c.id_client=v.id_client
 LEFT JOIN proprietati AS p ON p.id_prop=v.id_prop
WHERE YEAR(v.data_achizitie)=2021  AND p.nr_camere=4;
-- SAU - alternativa de script folosind vederi
SELECT  nume, prenume, denumire, nr_camere FROM afisare_proprietati_clienti_vanzari
WHERE YEAR(data_achizitie)=2021  AND nr_camere=4;

-- CATE PROPRIETATI AU FOST ACHIZITIONATE DIN FIECARE TIP IN 2021
SELECT t.denumire, COUNT(p.id_prop) AS nr_proprietati, v.data_achizitie FROM proprietati AS p 
LEFT JOIN vanzari AS v ON p.id_prop=v.id_prop
LEFT JOIN tip_proprietate AS t ON p.id_prop=t.id_tip 
WHERE year(v.data_achizitie)=2021 GROUP BY t.denumire;

-- Proiectati o interogare ce va afisa numele intreg al clientilor(intr-o singura coloana) si bugetul acestora (cu sufixul EURO), 
-- o lista a proprietatilor achizitionate, pretul fiecareia (cu sufixul EURO),
SELECT c.id_client, CONCAT(c.nume, ' ', c.prenume) AS NUME_INTREG, CONCAT(c.buget_euro, ' EURO') AS BUGET, 
 p.denumire, CONCAT(p.pret_euro, ' EURO') AS PRET FROM clienti AS c 
 LEFT JOIN vanzari AS v ON c.id_client=v.id_client
 LEFT JOIN proprietati AS p ON p.id_prop=v.id_prop;
 -- sau 
 SELECT id_client, CONCAT(nume, ' ', prenume) AS NUME_INTREG, CONCAT(buget_euro, ' EURO') AS BUGET, 
 denumire, CONCAT(pret_euro, ' EURO') AS PRET FROM afisare_proprietati_clienti_vanzari ORDER BY id_client ASC;


-- Creati o vedere ce va afisa toate datele clientilor, inclusiv cele confidentiale.
CREATE OR REPLACE VIEW afisare_clienti1 AS
SELECT c.id_client, c.nume, c.prenume, c.telefon, c.email, c.buget_euro, conf.CI, conf.adresa, conf.oras, conf.judet
FROM clienti AS c INNER JOIN clienti_confidential AS conf
ON c.id_client=conf.id;
SELECT * FROM afisare_clienti1;

-- creati o vedere ce va afisa toti clientii, grupati pe judete iar in cadrul judetelor pe orase
CREATE OR REPLACE VIEW afisare_clienti2 AS
SELECT * FROM clienti AS c INNER JOIN clienti_confidential AS conf
ON c.id_client=conf.id ORDER BY conf.judet ASC, conf.oras ASC;
SELECT * FROM afisare_clienti2;

-- CREATI O VEDERE CE VA AFISA LISTA PROPRIETATILOR, DATELE CLIENTILOR SI DATELE DE VANZARE
CREATE OR REPLACE VIEW afisare_proprietati_clienti_vanzari AS
SELECT p.*, c.*, v.data_achizitie, v.cantitate, v.pret_vanzare_euro FROM proprietati AS p 
LEFT JOIN vanzari AS v ON p.id_prop=v.id_prop
LEFT JOIN clienti AS c ON c.id_client=v.id_client;
SELECT * FROM afisare_proprietati_clienti_vanzari;

-- sa se afiseze datele, inclusiv cele confidentiale ale clientilor, astfel:id, nume, prenume, CI_serie, CI_numar, 
-- telefon, email, adresa completa(judet, oras, adresa), buget
SELECT c.id_client AS id, c.nume, c.prenume, substring_index(conf.CI, ' ',1) AS CI_serie, substring_index(conf.CI, ' ', -1) AS CI_numar,
c.telefon, c.email, CONCAT(conf.judet, ',', conf.oras, ',', conf.adresa) AS adresa_completa, c.buget_euro
FROM clienti AS c INNER JOIN clienti_confidential AS conf
ON c.id_client=conf.id;
-- SAU
SELECT id_client AS id, nume, prenume, substring_index(CI, ' ',1) AS CI_serie, substring_index(CI, ' ', -1) AS CI_numar,
telefon, email, CONCAT(judet, ',', oras, ',', adresa) AS adresa_completa, buget_euro
FROM afisare_clienti1;

-- sa se creeze o procedura care sa insereze un nou client in baza de date ( se va folosi o tranzactie operatiunile de inserare)
/* start transaction;
insert into clienti(id_client, nume, prenume, telefon, email, buget_euro) 
values(16, 'MARCULESCU', 'VALENTINA', '0721588622', 'valentinamarculescu@gmail.com', 150000);
insert into clienti_confidential values(16, 'IF 258963',	'Strada Biruintei nr 10', 	'Popesti Leordeni',	'ILFOV');
commit;
rollback;
select * from clienti;
select * from clienti_confidential;
DELETE FROM clienti WHERE id_client=16;
DELETE FROM clienti_confidential WHERE id=16; */

-- sa se creze o procedura ce afiseaza TOATE DATELE UNUI CLIENT, INCLUSIV CELE CONFIDENTIALE pe baza de id
DELIMITER //
	drop procedure if exists find_client //
    create procedure find_client(in fid int)
		begin
			declare mesaj varchar(255);
            if(select id_client from afisare_clienti1 where id_client=fid)is not null then
				select * from afisare_clienti1 where id_client=fid; 
			else 
				select concat("clientul cu id-ul ",fid,' nu exista') as mesaj;
			end if ;
        end;//
DELIMITER ;
call find_client(11);
call find_client(18);
select 2=2;

-- sa se creeze o procedura de actualizare a telefonului si emailului unui client din tabela clienti pe baza de id
DELIMITER //
	drop procedure if exists act_date //
    create procedure act_date(in atelefon varchar(20), aemail varchar(255), aid int)
		begin 
			declare prodtelefon varchar(20);
            declare prodemail varchar(255);
            set prodtelefon=(select telefon from clienti where id_client=aid);
            set prodemail=(select email from clienti where id_client=aid);
            if(select id_client from clienti where id_client=aid)is not null then
				update clienti set telefon=atelefon where id_client=aid;
                update clienti set email=aemail where id_client=aid;
                select concat(prodtelefon,' ',prodemail,' a fost inlocuit cu succes cu ',atelefon,' ', aemail) as mesaj;
			else 
             select concat("Clientul cu id-ul ",aid,' nu exista') as mesaj;
			end if ;
        end;//
DELIMITER ;
call act_date('0788554122','lucanatalia@gmail.com', 13);


-- sa se creeze o functie ce afiseaza bugetul unei persoane cautate pe baza de nume si prenume
delimiter //
	drop function if exists afisare_buget //
    create function afisare_buget(fnume varchar(255), fprenume varchar(255)) returns int no sql deterministic
    begin
        return (select buget_euro from clienti 
        where nume=fnume and prenume=fprenume);
    end; //
delimiter ;
select afisare_buget( 'NEGOESCU','VLAD');

select length(telefon) from clienti;
select * from clienti_confidential;

-- creati un trigger care sa nu permita stergerea datelor din tabela clienti_confidential.
DELIMITER //
drop trigger if exists stergere_conf //
create trigger stergere_conf before delete on clienti_confidential for each row
	begin
		signal sqlstate '20000' set message_text='datele nu pot fi sterse, trebuie sters intai clientul din tabla clienti';
	end; //
DELIMITER ;

DELETE FROM clienti_confidential where id=15;
insert into clienti_confidential values (15, 'RD 968519', 'Strada Crinul de Gradina 22','Bucuresti','ILFOV');
insert into clienti values (15, 'DINU', 'IULIANA', '0741864559', 'iulianadinu@gmail.com', 135000);
select * from clienti_confidential;
select * from clienti;
delete from clienti where id_client=18;

use proiect;
id_prop INT PRIMARY KEY AUTO_INCREMENT,
denumire VARCHAR(255),
nr_camere VARCHAR (10),
suprafata_utila_mp INT,
suprafata_construita_mp INT,
suprafata_teren_mp INT DEFAULT NULL,
pret_euro 

-- ORDINEA OPERATIILOR:
-- select - from - where - group by - having - order by - limit





























































































