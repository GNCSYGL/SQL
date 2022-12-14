CREATE TABLE ogrenciler5
(
 ogrenci_no char(7), 
 isim varchar(20),
 soyisim varchar(25),
 not_ort real, -- ondalikli sayilar icin "real" kullanilir
 kayit_tarih date
);

--VAROLAN BIR TABLODAN YENI BIR TABLO OLUSTURMA
CREATE TABLE NOTLAR
AS
SELECT isim,not_ort FROM ogrenciler5;

select * from notlar;

--INSERT = TABLO ICINE VERI EKLEME

INSERT INTO notlar VALUES ('Orhan','95.5'); 
INSERT INTO notlar VALUES ('Ali','75.5'); 
INSERT INTO notlar VALUES ('Musa','45.5'); 
INSERT INTO notlar VALUES ('Hakan','65.5'); 
INSERT INTO notlar VALUES ('Adem','75.5'); 
INSERT INTO notlar VALUES ('Sumeyye','85.5'); 

select * from notlar;

Create table talebeler
(
isim varchar(10),
	notlar real
);

INSERT INTO talebeler VALUES ('Orhan','95.5'); 
INSERT INTO talebeler VALUES ('Ali','75.5'); 
INSERT INTO talebeler VALUES ('Musa','45.5'); 
INSERT INTO talebeler VALUES ('Hakan','65.5'); 
INSERT INTO talebeler VALUES ('Adem','75.5'); 
INSERT INTO talebeler VALUES ('Sumeyye','85.5');

select * from talebeler;

select isim from notlar;

--CONSTRAINT
--UNIQUE

CREATE TABLE ogrenciler6
(
 ogrenci_no char(7)unique, 
 isim varchar(20)not null,
 soyisim varchar(25),
 not_ort real, -- ondalikli sayilar icin "real" kullanilir
 kayit_tarih date
);
select * from ogrenciler6;

CREATE TABLE ogrenciler7
(
 ogrenci_no char(7)unique, 
 isim varchar(20)not null,
 soyisim varchar(25),
 not_ort real, -- ondalikli sayilar icin "real" kullanilir
 kayit_tarih date
);
select * from ogrenciler7;

INSERT INTO ogrenciler7 VALUES ('1234567','Gonca','Buket', 75.5,now()); 
INSERT INTO ogrenciler7 VALUES ('1234568','Gonca','Buket', 75.5,now()); 
INSERT INTO ogrenciler7 (ogrenci_no,soyisim,not_ort) VALUES ('1234569','Buket', 85.5);--not null kisitlamasi oldugundan veri ekleyemedik hata verdi

-- PRIMARY KEY atamasi -- 

CREATE TABLE ogrenciler8
(
 ogrenci_no char(7)primary key, 
 isim varchar(20),
 soyisim varchar(25),
 not_ort real, -- ondalikli sayilar icin "real" kullanilir
 kayit_tarih date
);

-- PRIMARAY KEY atamasi 2. yol

CREATE TABLE ogrenciler9
(
 ogrenci_no char(7), 
 isim varchar(20),
 soyisim varchar(25),
 not_ort real, 
 kayit_tarih date,
CONSTRAINT ogr PRIMARY KEY(ogrenci_no)
);

-- PRIMARAY KEY atamasi 3. yol

CREATE TABLE ogrenciler10
(
 ogrenci_no char(7), 
 isim varchar(20),
 soyisim varchar(25),
 not_ort real, 
 kayit_tarih date,
PRIMARY KEY(ogrenci_no)
);

--FOREIGN KEY
/*
Practice 4:
???tedarikciler3??? isimli bir tablo olusturun. Tabloda ???tedarikci_id???, ???tedarikci_ismi???, ???iletisim_isim??? field???lari olsun ve ???tedarikci_id??? yi Primary Key yapin.
???urunler??? isminde baska bir tablo olusturun ???tedarikci_id??? ve ???urun_id??? field???lari olsun ve
???tedarikci_id??? yi Foreign Key yapin.
*/

CREATE TABLE tedarikciler3
(
tedarikci_id char(5)PRIMARY KEY,
tedarikci_ismi varchar(20),
iletisim_isim varchar(20)
);

CREATE TABLE urunler
(
tedarikci_id char(5),
urun_id char(5),
FOREIGN KEY (tedarikci_id) REFERENCES tedarikciler3 (tedarikci_id)
);

select * from tedarikciler3;
select * from urunler;

/*
???calisanlar??? isimli bir Tablo olusturun. Icinde ???id???, ???isim???, ???maas???, ???ise_baslama??? 
field???lari olsun. ???id??? yi Primary Key yapin, ???isim??? i Unique, ???maas??? i Not Null yap??n.
???adresler??? isminde baska bir tablo olusturun.Icinde ???adres_id???, ???sokak???, ???cadde??? ve 
???sehir??? fieldlari olsun. ???adres_id??? field???i ile Foreign Key olu??turun.
*/

CREATE TABLE calisanlar
(
id char(5) PRIMARY KEY,
isim varchar(20)UNIQUE,
maas int NOT NULL,
ise_baslama date
);

CREATE TABLE adresler
(
adres_id char(5),
sokak varchar(15),
cadde varchar(15),
sehir varchar(15),
FOREIGN KEY (adres_id) REFERENCES calisanlar(id)
);

INSERT INTO calisanlar VALUES('10002', 'Mehmet Y??lmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', 'Mehmet Y??lmaz', 5000, '2018-04-14'); -- UNIQUE CONS. Kabul etmez
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Ya??', NULL, '2019-04-12'); -- NOT NULL CONS. Kabul etmez
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14'); -- UNIQUE CONS. Kabul etmez
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14'); -- int degere String girildigi icin kabul etmez
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14'); -- PRIMARY KEY
INSERT INTO calisanlar VALUES( '10002', 'ayse Y??lmaz' ,12000, '2018-04-14'); -- PRIMARY KEY
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14'); -- PRIMARY KEY

INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','A??a Sok', '30.Cad.','Antep');

-- Parent tabloda olmayan id ile child a ekleme yapamayiz
INSERT INTO adresler VALUES('10012','A??a Sok', '30.Cad.','Antep');

-- FK'ye null de??eri atanabilir.
INSERT INTO adresler VALUES(NULL,'A??a Sok', '30.Cad.','Antep');
INSERT INTO adresler VALUES(NULL,'A??a Sok', '30.Cad.','Mara??');

SELECT * FROM calisanlar;
SELECT * FROM adresler;

-- CHECK CONSTRAINT

CREATE TABLE calisanlar1
(
id varchar(15) PRIMARY KEY,
isim varchar(30) UNIQUE,
maas int CHECK (maas>10000),
ise_baslama date
);

INSERT INTO calisanlar1 VALUES ('10002', 'Mehmet Y??lmaz' ,12000, '2018-04-14');

-- DQL -- WHERE KULLANIMI
SELECT * FROM calisanlar;
SELECT isim from calisanlar;

-- Calisanlar tablosundan maasi 5000'den buyuk olan isimleri listeleyiniz
Select isim from calisanlar WHERE maas>5000;
-- Calisanlar tablosundan ismi Veli Han olan tum verileri listeleyiniz.
select * from calisanlar WHERE isim='Veli Han';
-- Calisanlar tablosundan maasi 5000 olan tum verileri listeleyiniz
Select * from calisanlar WHERE maas=5000;
-- DML -- DELETE KOMUTU
Delete from calisanlar; -- Eger parent table baska bir child tablo ile iliskili ise once child tablo silinmelidir
Delete from adresler;
SELECT * FROM adresler;
-- Adresler tablosundan sehri Antep olan verileri silelim
DELETE FROM adresler WHERE sehir='Antep';
-- ismi Nesibe Yilmaz veya Mustafa Bak olan kay??tlar?? silelim.
CREATE TABLE ogrenciler11
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
INSERT INTO ogrenciler11 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler11 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler11 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler11 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler11 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler11 VALUES(127, 'Mustafa Bak', 'Ali', 99);

