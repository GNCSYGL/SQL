-- *** DISTINCT ***

CREATE TABLE musteri_urun 
(
urun_id int, 
musteri_isim varchar(50),
urun_isim varchar(50) 
);
INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal'); 
INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal'); 
INSERT INTO musteri_urun VALUES (20, 'Veli', 'Elma'); 
INSERT INTO musteri_urun VALUES (30, 'Ayse', 'Armut'); 
INSERT INTO musteri_urun VALUES (20, 'Ali', 'Elma'); 
INSERT INTO musteri_urun VALUES (10, 'Adem', 'Portakal'); 
INSERT INTO musteri_urun VALUES (40, 'Veli', 'Kaysi'); 
INSERT INTO musteri_urun VALUES (20, 'Elif', 'Elma');

Select * From musteri_urun

--Musteri urun tablosundan urun isimlerini tekrarsiz(grup) listeleyiniz
-- GROUP BY ile cozum
Select urun_isim From musteri_urun
Group By urun_isim

--DISTINCT ile cozum
Select Distinct(urun_isim) From musteri_urun

-- Tabloda kac farkli meyve vardir ?
Select urun_isim, count(urun_isim) From musteri_urun
Group By urun_isim

-- FETCH NEXT () ROW ONLY / OFFSET / LIMIT

--Musteri urun tablosundan ilk 3 kaydi listeleyiniz.
Select * From musteri_urun Order By urun_id 
Fetch Next 3 Row Only

-- LIMIT
Select * From musteri_urun Order By urun_id 
Limit 3

-- Musteri urun tablosundan ilk kaydi listeleyiniz
Select * From musteri_urun Order By urun_id 
Limit 1

--Musteri urun tablosundan son 3 kaydi listeleyiniz.
Select * From musteri_urun Order By urun_id Desc
Limit 3

CREATE TABLE maas
(
id int,
musteri_isim varchar(50),
maas int
);
INSERT INTO maas VALUES (10, 'Ali', 5000);
INSERT INTO maas VALUES (10, 'Ali', 7500);
INSERT INTO maas VALUES (20, 'Veli', 10000);
INSERT INTO maas VALUES (30, 'Ayse', 9000);
INSERT INTO maas VALUES (20, 'Ali', 6500);
INSERT INTO maas VALUES (10, 'Adem', 8000);
INSERT INTO maas VALUES (40, 'Veli', 8500);
INSERT INTO maas VALUES (20, 'Elif', 5500);

Select * From maas 

--En yuksek maasi alan musteriyi listeleyiniz.
Select * From maas Order By maas Desc Limit 1 
--Maas tablosundan en yuksek ikinci maasi listeleyiniz.
Select * From maas Order By maas Desc Limit 1 Offset 1
/*
Offset --> Satir atlamak istedigimizde kullaniriz. Orn; "Offset 2" yazarak 2 satir atla demek isteriz
*/
Select * From maas Order By maas Desc Offset 1
Fetch Next 1 Row Only

--Maas tablosundan en dusuk dorduncu maasi listeleyiniz.
Select * From maas Order By maas Offset 3 Limit 2

-- *** ALTER TABLE STATEMENT ***
Drop table personel Cascade

CREATE TABLE personel  (
id int,
isim varchar(50),  sehir varchar(50),  maas int,  
sirket varchar(20),
CONSTRAINT personel_pk PRIMARY KEY (id)
);
INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

Select * From personel

--1) ADD default deger ile tabloya bir field ekleme
Alter Table personel 
Add ulke varchar(30)

Alter Table personel 
Add zipcode varchar(30)

Alter Table personel
Add adres varchar(50) Default 'Turkiye'--Default yazarak olusturdugumuz yeni sutuna belirttigimiz veriyi hepsine atar

--3)Drop tablodan sutun silme
Alter Table personel
Drop Column zipcode;

Alter Table personel
Drop ulke,drop adres

Alter Table personel
Drop sirket

-- RENAME COLUMN ile sutun adi degistirme

Alter Table personel
Rename Column sehir To il

-- RENAME tablonun ismini degistirme
Alter Table personel
Rename To Isci

Select * From isci

-- TYPE/SET(modify) sutunlarin ozelliklerini degistirme
Alter Table isci
Alter Column il Type varchar(30),
Alter Column maas Set Not Null;
/*
Eger numerik data turune sahip bir sutunun data turune String bir data turu atamak istersek
Type varchar(30) Using (maas::varchar(30)) bu formati kullaniriz.
*/
Alter Table isci
Alter Column maas
Type varchar(30) Using (maas::varchar(30))

CREATE TABLE ogrenciler2
(
id serial,--Serial data turu otamatik olarak 1'den baslayarak sirali olarak sayi atamasi yapar
		  --Insert Into ile tabloya veri eklerken Serial Data turunu kullandigim veri degeri yerine Default yazariz.
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu real       
);
BEGIN;
INSERT INTO ogrenciler2 VALUES(default, 'Ali Can', 'Hasan',75.5);
INSERT INTO ogrenciler2 VALUES(default, 'Merve Gul', 'Ayse',85.3);
savepoint x;
INSERT INTO ogrenciler2 VALUES(default, 'Kemal Yasa', 'Hasan',85.6);
INSERT INTO ogrenciler2 VALUES(default, 'Nesibe Yilmaz', 'Ayse',95.3);
savepoint y;
INSERT INTO ogrenciler2 VALUES(default, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler2 VALUES(default, 'Can Bak', 'Ali', 67.5);
ROLLBACK to y;
COMMIT;

Select * From ogrenciler2
Delete from ogrenciler2











