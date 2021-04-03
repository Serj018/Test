Create database DnD_collection
Use DnD_collection

drop database DnD_collection
go
Create table Oficiu(
Cod_oficiu int primary key,
Cod_produs int foreign key references Produs(Cod_produs),
Den_oficiu varchar(20) not null,
Cod_angajator int foreign key references Angajator(cod_angajator)
);
Create table Angajator(
Cod_angajator int primary key,
NumAngajator varchar(20) not null,
PrenAngajator varchar(20) not null,
Varsta numeric not null,
Salariu money not null
);
Create table Produs(
Cod_produs int primary key,
Den_produs varchar(20) not null,
PretProdus money not null,
Cod_cantitate int foreign key references CantitateTab(cod_cantitate)
); 

Create table CantitateTab(
Cod_cantitate int primary key,
Cantitate numeric not null,
DataLivrare date not null
);

INSERT INTO Oficiu VALUES (1,1,'GreenWord',1),
 (2,2,'Herbalive',2),
 (3,3,'CoralMoldova',3),
 (4,4,'GlobalBusinessCenter',4),
 (5,5,'ContinentalBusiness',5);
INSERT INTO Angajator VALUES (1,'Gustei','Sergiu',19,5000),
 (2,'Rusu','Bogdan',18, 8700),
 (3,'Botosanu','Dorian',20, 2000),
 (4,'Rotaru','Valeriu',15, 4500),
 (5,'Cojocaru','Ion',17, 5300);
INSERT INTO Produs VALUES (1,'Iphone',1350,1),
 (2,'Xiaomi',950,2),
 (3,'Sinupret',500,3),
 (4,'Samsung',2000,4),
 (5,'Apa minerala',1500,5); 

INSERT INTO CantitateTab VALUES (1, 100,'2020-08-11'),
 (2, 150,'2020-09-12'),
 (3, 40,'2020-08-11'),
 (4, 145,'2020-07-13'),
 (5, 45,'2020-04-11');

  select *from Produs;
  


 
-------Schimat/modificam date despre pretul produsului cu o alta valoare------
   UPDATE Produs
         SET PretProdus = '240'
            WHERE Cod_produs=5;


--------------Subinterogare care afiseaza numele angajatorilor cu cel mai mare salariu ---------
       SELECT NumAngajator,PrenAngajator,Salariu
            FROM Angajator
                 WHERE Salariu = (SELECT  MAX(Salariu ) FROM Angajator);


--------------Subinterogare care afiseaza numele angajatorilor cu cel mai mic salariu----
      SELECT NumAngajator,PrenAngajator,Salariu
            FROM Angajator
                 WHERE Salariu = (SELECT  MIN(Salariu ) FROM Angajator);


--------------Subinterogare care afiseaza numele angajatorilor cu lietera "R"------
   SELECT NumAngajator,PrenAngajator,Salariu
            FROM Angajator
	WHERE Cod_angajator =ANY(SELECT Cod_angajator FROM Angajator WHERE NumAngajator LIKE'R%');

	
------------De exemplu, noi trebuie să obțineți suma/catitate totala a tuturor produselo
---------pentru toate seturile de grupare care pot fi definite pe baza ierarhiei glosint ROLLUP------

	  SELECT
               YEAR(DataLivrare) AS orderyear,
               MONTH(DataLivrare) AS ordermonth,
			   SUM(Cantitate) AS sumqty
        FROM CantitateTab
             GROUP BY ROLLUP(YEAR(DataLivrare), MONTH(DataLivrare));
			


