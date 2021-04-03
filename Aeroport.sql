-----Crearea bazei de date Aeroport--------
CREATE DATABASE Aeroport

-----------Utilizarea BD Aeroport----------------

 USE Aeroport  
 GO

---------------Creare tabelului Clase------------------------
        CREATE TABLE Clase
                    (cod_clasa INT PRIMARY KEY,
                    procent_clasa VARCHAR(50) NOT NULL,
                    tip_clasa VARCHAR(50) NOT NULL
                    );

--------------------Crearea tabelului Aeroportuir dar si crearea un tip(varchar) care va fi atribuit unor coloane a BD--------

        CREATE TYPE Dentypeobj FROM VARCHAR(50)
    GO
        CREATE TABLE Aeroporturi(cod_aeroport INT PRIMARY KEY 
                                 CHECK(cod_aeroport > 4 and cod_aeroport < 10),
                                 nume_aeroport Dentypeobj not null,
                                 nume_comapnie Dentypeobj not null)


-------------------------Crearea tabelului Avion------------------------

GO
       CREATE TABLE Avion(cod_avion INT PRIMARY KEY 
                          CHECK(cod_avion > 1001 and cod_avion < 10000),
                          model_avion Dentypeobj not null,
                          capacitate INT not null)

-----------------------------Crearea tabelului Pasageri----------------------------

GO
        CREATE TABLE Pasageri(cod_client INT PRIMARY KEY 
                              CHECK(cod_client > 10001 and cod_client < 100000),
                              CNP Dentypeobj not null,
                              nume Dentypeobj not null,
                              prenume Dentypeobj not null,
                              telefon Dentypeobj not null,
                              data_nas DATE not null,
                              adresa Dentypeobj not null)


 ---------------------Crearea tabelului Tari---------------------------

GO
         CREATE TABLE Tari(cod_tara INT PRIMARY KEY 
                           CHECK(cod_tara >100 and cod_tara <1000),
                           cod_aeroport INT CHECK (cod_aeroport > 4 and cod_aeroport < 10)
                           FOREIGN KEY REFERENCES Aeroporturi(cod_aeroport),
                           tara Dentypeobj not null,
                           oras Dentypeobj not null)

-----------------------Crearea tabelului Cursa-------------------------------------

GO
        CREATE TABLE Cursa(cod_cursa INT PRIMARY KEY 
                           CHECK(cod_cursa >100001 and cod_cursa <1000000),
                           cod_tara INT CHECK (cod_tara >100 and cod_tara <1000)
                           FOREIGN KEY REFERENCES Tari(cod_tara),
                           cod_avion INT CHECK (cod_avion > 1001 and cod_avion < 10000)
                           FOREIGN KEY REFERENCES Avion(cod_avion),
                           cod_clasa INT 
                           FOREIGN KEY REFERENCES Clase(cod_clasa),
                           statut Dentypeobj not null)

-------------------------Tabelul Bilete-------------------------------

GO
          CREATE TABLE Bilete(Nr_bilet Dentypeobj not null,
                              cod_client INT CHECK (cod_client > 10001 and cod_client < 100000)
                              FOREIGN KEY REFERENCES Pasageri(cod_client),
                              cod_cursa INT CHECK(cod_cursa >100001 and cod_cursa <1000000)
                              FOREIGN KEY REFERENCES Cursa(cod_cursa),
                              loc_plecare Dentypeobj not null,
                              loc_aterizare Dentypeobj not null,
                              data_plec DATE not null,
                              ora_plec TIME not null,
                              ora_ateriz TIME not null,
                              pret MONEY not null)




-----------------------------------------------------////Inserarea in tabelul Aeroporturi/////----------------------------------

INSERT INTO Aeroporturi(cod_aeroport,nume_aeroport,nume_comapnie )
VALUES (5,'Chisinau','AirMoldova');
INSERT INTO Aeroporturi(cod_aeroport,nume_aeroport,nume_comapnie )
VALUES (6,'Instambul','TurkeyAirline');
INSERT INTO Aeroporturi(cod_aeroport,nume_aeroport,nume_comapnie )
VALUES (7,'Tokyo','HanedaAir');
INSERT INTO Aeroporturi(cod_aeroport,nume_aeroport,nume_comapnie )
VALUES (8,'Londra','BritishAirline');
INSERT INTO Aeroporturi(cod_aeroport,nume_aeroport,nume_comapnie )
VALUES (9,' Beijing',' Air_China');
INSERT INTO Aeroporturi(cod_aeroport,nume_aeroport,nume_comapnie )
VALUES (15,' Beijing',' ChinesFly');


---------------------------------/////////////////Inserarea in tabelul Clase///////////////////-----------------------------------------

 
INSERT INTO Clase(cod_clasa,procent_clasa,tip_clasa )
VALUES (1,'60%','Economic');
INSERT INTO Clase(cod_clasa,procent_clasa,tip_clasa )
VALUES (2,'30%','Economic_Premium');
INSERT INTO Clase(cod_clasa,procent_clasa,tip_clasa )
VALUES (3,'10%','Business');


------------------------------------//////////////Inserarea in tabelul Tari//////////////////----------------------------------------

INSERT INTO Tari(cod_tara,cod_aeroport,tara,oras)
VALUES (101,5,'Moldova','Chisinau');
INSERT INTO Tari(cod_tara,cod_aeroport,tara,oras)
VALUES (102,6,'Turcia','Instabul');
INSERT INTO Tari(cod_tara,cod_aeroport,tara,oras)
VALUES (103,7,'Japonia','Tokyo');
INSERT INTO Tari(cod_tara,cod_aeroport,tara,oras)
VALUES (104,8,'Marea_Britanie','Londra');
INSERT INTO Tari(cod_tara,cod_aeroport,tara,oras)
VALUES (105,9,'China','Bejing');


------------------------------////////////////Inserarea in tabelul Avion/////////////////////-----------------------------------------------


INSERT INTO Avion(cod_avion,model_avion,capacitate)
VALUES (1002,'Airobus_a380','420');
INSERT INTO Avion(cod_avion,model_avion,capacitate)
VALUES (1003,'Airobus_a320','300');
INSERT INTO Avion(cod_avion,model_avion,capacitate)
VALUES (1004,'Boeing_747','220');
INSERT INTO Avion(cod_avion,model_avion,capacitate)
VALUES (1005,'Boeing_737','250');
INSERT INTO Avion(cod_avion,model_avion,capacitate)
VALUES (1006,'Boeing_777','270');

SELECT * FROM Avion

---------------------------///////////////Inserarea in tabelul Pasageri////////////////////----------------------------------

INSERT INTO Pasageri(cod_client,CNP,nume,prenume,telefon,data_nas,adresa)
VALUES (10002,'2031564789546','Caraman','Eliza','061325149','01-09-2001','Recea');
INSERT INTO Pasageri(cod_client,CNP,nume,prenume,telefon,data_nas,adresa)
VALUES (10003,'2098564789546','Gustei','Sergiu','061548022','18-01-1991','Hancesti');
INSERT INTO Pasageri(cod_client,CNP,nume,prenume,telefon,data_nas,adresa)
VALUES (10004,'2031535689546','Batca','Cristi','056825149','21-03-1999','Ialoveni');
INSERT INTO Pasageri(cod_client,CNP,nume,prenume,telefon,data_nas,adresa)
VALUES (10005,'2032354689546','Ionescu','Alexandru','061315149','16-01-2004','Chisinau');
INSERT INTO Pasageri(cod_client,CNP,nume,prenume,telefon,data_nas,adresa)
VALUES (10006,'2031564780123','Rusu','Victor','061300049','04-08-2011','Hancesti');
INSERT INTO Pasageri(cod_client,CNP,nume,prenume,telefon,data_nas,adresa)
VALUES (10007,'2031564781286','Chitic','Danu','061335849','17-09-2001','Hancesti');
INSERT INTO Pasageri(cod_client,CNP,nume,prenume,telefon,data_nas,adresa)
VALUES (10008,'2031564785556','Moroz','Daniel','061325229','27-10-1998','Chisinau');
INSERT INTO Pasageri(cod_client,CNP,nume,prenume,telefon,data_nas,adresa)
VALUES (10009,'2031564789546','Cojocaru','Ion','061001149','28-04-2006','Truseni');
INSERT INTO Pasageri(cod_client,CNP,nume,prenume,telefon,data_nas,adresa)
VALUES (10010,'2128564789546','Mitu','Andrei','061325458','01-06-2011','Telenesti');
INSERT INTO Pasageri(cod_client,CNP,nume,prenume,telefon,data_nas,adresa)
VALUES (10011,'2002354789546','Tricolici','Andrei','061625149','18-09-2001','Chisinau');

Select * from Pasageri
---------------------------///////////////Inserarea in tabelul Cursa////////////////////----------------------------------


INSERT INTO Cursa(cod_cursa,cod_tara,cod_avion,cod_clasa,statut)
VALUES (100002,101,1002,1,'In_proces');
INSERT INTO Cursa(cod_cursa,cod_tara,cod_avion,cod_clasa,statut)
VALUES (100003,102,1006,1,'In_asteptare');
INSERT INTO Cursa(cod_cursa,cod_tara,cod_avion,cod_clasa,statut)
VALUES (100004,102,1004,2,'In_proces');
INSERT INTO Cursa(cod_cursa,cod_tara,cod_avion,cod_clasa,statut)
VALUES (100005,103,1004,3,'In_proces');
INSERT INTO Cursa(cod_cursa,cod_tara,cod_avion,cod_clasa,statut)
VALUES (100006,104,1002,3,'Finalizata');
INSERT INTO Cursa(cod_cursa,cod_tara,cod_avion,cod_clasa,statut)
VALUES (100007,103,1003,2,'In_proces');
INSERT INTO Cursa(cod_cursa,cod_tara,cod_avion,cod_clasa,statut)
VALUES (100008,105,1004,2,'In_astepare');
INSERT INTO Cursa(cod_cursa,cod_tara,cod_avion,cod_clasa,statut)
VALUES (100009,105,1005,1,'Finalizata');
INSERT INTO Cursa(cod_cursa,cod_tara,cod_avion,cod_clasa,statut)
VALUES (100010,102,1005,1,'In_proces');

select * FROM Cursa
---------------------------------------////////////////Inserarea in tabelul Bilete//////////////------------------------


INSERT INTO Bilete(Nr_bilet,cod_client,cod_cursa,loc_plecare,loc_aterizare,data_plec,ora_plec,ora_ateriz,pret)
VALUES ('BA14875',10002,100002,'Bucuresti','Chisinau','2020-09-12','12:00','13:00',2000);
INSERT INTO Bilete(Nr_bilet,cod_client,cod_cursa,loc_plecare,loc_aterizare,data_plec,ora_plec,ora_ateriz,pret)
VALUES ('BA12675',10003,100003,'Chisinau','Instambul','2020-07-11','16:00','19:30',5000);
INSERT INTO Bilete(Nr_bilet,cod_client,cod_cursa,loc_plecare,loc_aterizare,data_plec,ora_plec,ora_ateriz,pret)
VALUES ('BA14835',10004,100002,'Madrid','Chisinau','2020-04-22','12:00','18:00',7000);
INSERT INTO Bilete(Nr_bilet,cod_client,cod_cursa,loc_plecare,loc_aterizare,data_plec,ora_plec,ora_ateriz,pret)
VALUES ('BA10575',10005,100004,'Bucuresti','Instambul','2020-08-10','10:00','13:00',8000);
INSERT INTO Bilete(Nr_bilet,cod_client,cod_cursa,loc_plecare,loc_aterizare,data_plec,ora_plec,ora_ateriz,pret)
VALUES ('BA14895',10006,100004,'Moscova','Instambul','2020-02-13','09:00','12:00',12000);
INSERT INTO Bilete(Nr_bilet,cod_client,cod_cursa,loc_plecare,loc_aterizare,data_plec,ora_plec,ora_ateriz,pret)
VALUES ('BA14636',10007,100006,'Bucuresti','Londra','2020-07-18','12:00','14:00',7500);
INSERT INTO Bilete(Nr_bilet,cod_client,cod_cursa,loc_plecare,loc_aterizare,data_plec,ora_plec,ora_ateriz,pret)
VALUES ('BA14815',10008,100005,'San_Peterburg','Tokyo','2020-01-12','12:00','19:00',12000);
INSERT INTO Bilete(Nr_bilet,cod_client,cod_cursa,loc_plecare,loc_aterizare,data_plec,ora_plec,ora_ateriz,pret)
VALUES ('BA14035',10009,100003,'Bucuresti','Instambul','2020-11-25','12:00','14:00',8000);
INSERT INTO Bilete(Nr_bilet,cod_client,cod_cursa,loc_plecare,loc_aterizare,data_plec,ora_plec,ora_ateriz,pret)
VALUES ('BA14675',10010,100005,'Bejing','Tokyo','2020-09-27','12:00','13:30',4000);

-----------------------/////////////////////////////////------------------------------------------
---------------------Vedearea tabelului Clase---------------------- 
USE Aeroport
GO
CREATE VIEW exemplu1 AS
           SELECT cod_clasa,procent_clasa,tip_clasa
           FROM Clase;

SELECT *FROM exemplu1;

---------------Vedearea tabelului Aeroporturi--------------
USE Aeroport
GO
CREATE VIEW exemplu2 AS
           SELECT cod_aeroport,nume_aeroport,nume_comapnie
           FROM Aeroporturi WHERE nume_comapnie LIKE'%A';

----------------Vedearea tabelului Tari----------------------------
USE Aeroport
GO
CREATE VIEW exemplu3 AS
            SELECT cod_tara,cod_aeroport,tara,oras
            FROM Tari;


---------------------Vedearea tabelului Avion--------------------

USE Aeroport
GO
CREATE VIEW exemplu4 AS
           SELECT cod_avion,model_avion,capacitate
           FROM Avion;

------------------------Vedearea tabelului Pasageri-------------

USE Aeroport
GO
CREATE VIEW ListaPasageri AS
            SELECT cod_client,CNP,nume,prenume,telefon,data_nas,adresa
            FROM Pasageri;

-------------------------Vedearea tabelului Cursa---------------------

USE Aeroport
GO
CREATE VIEW CurseleAvioane AS
            SELECT cod_cursa,cod_tara,cod_avion,cod_clasa,statut
            FROM Cursa;


------------------------Vedearea tabelului Bilete--------------------

USE Aeroport
GO
CREATE VIEW BileteleAvion AS
           SELECT Nr_bilet,cod_client,cod_cursa,loc_plecare,loc_aterizare,ora_plec,ora_ateriz,pret
           FROM Bilete;
---------------------------------------

---Afisarea tutoror comapnilor care se incep cu litera "A"----

 SELECT cod_aeroport,nume_aeroport,nume_comapnie
           FROM Aeroporturi WHERE nume_comapnie LIKE'%A';

-----------Afisarea curselor a carui statu este deja finalizat-------

SELECT dbo.Cursa.cod_cursa, dbo.Cursa.statut, dbo.Aeroporturi.nume_aeroport, dbo.Tari.tara, dbo.Tari.oras, dbo.Avion.model_avion, dbo.Clase.tip_clasa
      FROM     dbo.Cursa INNER JOIN
                  dbo.Avion ON dbo.Cursa.cod_avion = dbo.Avion.cod_avion INNER JOIN
                  dbo.Bilete ON dbo.Cursa.cod_cursa = dbo.Bilete.cod_cursa INNER JOIN
                  dbo.Clase ON dbo.Cursa.cod_clasa = dbo.Clase.cod_clasa INNER JOIN
                  dbo.Pasageri ON dbo.Bilete.cod_client = dbo.Pasageri.cod_client INNER JOIN
                  dbo.Tari ON dbo.Cursa.cod_tara = dbo.Tari.cod_tara INNER JOIN
                  dbo.Aeroporturi ON dbo.Tari.cod_aeroport = dbo.Aeroporturi.cod_aeroport
WHERE  (dbo.Cursa.statut LIKE 'Finalizata%')



-------Afisam numele comapnie care sunt din orasul Tokyo--------
 SELECT Tari.cod_tara, Tari.tara, Tari.oras, Aeroporturi.nume_comapnie
FROM     Cursa INNER JOIN
                  Tari ON Cursa.cod_tara = Tari.cod_tara INNER JOIN
                  Aeroporturi ON Tari.cod_aeroport = Aeroporturi.cod_aeroport
WHERE Tari.oras  IN
       (SELECT Tari.oras FROM Tari,Aeroporturi  WHERE oras='Tokyo');


-------Schimat/modificam date despre capacitate avionului cu o alta valoare------

   UPDATE Avion
         SET capacitate = '700'
            WHERE cod_avion=1006;


--------------Subinterogare care afiseaza numele comanilor aeriene a caror tari se incepe cu lietera "M"------
         SELECT nume_comapnie
               FROM Aeroporturi
                    WHERE cod_aeroport =ANY(SELECT cod_aeroport FROM Tari WHERE tara LIKE'M%');


------------De exemplu, noi trebuie să obțineți suma totală a uni bilet +suma totala a biletelor
------------petru toate seturile de grupare care pot fi definite pe baza ierarhiei glosint ROLLUP------

        SELECT
               YEAR(data_plec) AS orderyear,
               MONTH(data_plec) AS ordermonth,
               SUM(pret) AS sumqty
        FROM Bilete
             GROUP BY ROLLUP(YEAR(data_plec), MONTH(data_plec))
			 HAVING COUNT(data_plec) > 1;


----------------Acest exemlu grupeaza date despre capacitate avionelor pe categorii si apoi le sumeaza----------------
       SELECT model_avion,capacitate, SUM (capacitate) AS sumqty
              FROM Avion
                   GROUP BY CUBE(model_avion, capacitate);
				   

-------------------Grupam pasageri dupa anul nastrere cu id mai mare(>) 10006 afisandue intro ordine descrescatore-----------

          SELECT nume,prenume, YEAR(data_nas) AS orderyear
                FROM Pasageri
                     WHERE cod_client>10006
           GROUP BY nume,prenume, YEAR(data_nas)
                   HAVING COUNT(*) > 0
                   ORDER BY  orderyear DESC;



									   
SELECT * FROM Pasageri

DELETE FROM Tari  WHERE cod_aeroport=ANY(SELECT cod_aeroport  FROM Aeroporturi WHERE cod_aeroport=8);



---------------------Recuperarea bazei de date cu RESTORE DATABASE -------------
USE master
GO
RESTORE DATABASE Aeroport FROM Copie1 WITH REPLACE;

--------------------Crearea rolurilor pentru acces la baza de date------------------

--------Directorul va avea dreptul sa fac orice in baza de date dar eu il voi limita asa ca o sai retrag unele drepturi asupra bazei de date------
CREATE ROLE Bibliotecar AUTHORIZATION db_owner;  
GO
------Codul de retragerea a inserari stergeri si modificari bazei de date pentru Director-----
REVOKE INSERT,UPDATE,DELETE FROM Director; 


----Cream un rol Manager ce va avea dreptul dea adauga midifica si sterge din BD informati despre carti--------
CREATE ROLE Manager AUTHORIZATION db_ddladmin ;  
GO

-----------Cream un rol vanzator care nu are dreptul dea adauga sau modifica sterge --
CREATE ROLE Citior AUTHORIZATION db_denydatawriter  ;  
GO
-----Dam drept la Vanzator sa insereze date---------
GRANT INSERT ON Bilete TO Vanzator ;

