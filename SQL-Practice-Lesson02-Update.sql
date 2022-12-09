/*
* *  CHİLD TABLODA ON DELETE CASCADE KOMUTU YAZILMAZSA  * *
	
1 - Child tablo silinmeden Parent tablo silinmeye calisilirsa PgAdmin Error verir.
yani Child tablo silinmeden Parent tablo silinemez.
2 - Child tablodaki veri silinmeden Parent tabloda ki veri silinmeye calisilirsa
PgAdmin Error verir. Child tablodaki silindikten sonra Parent tablodaki veri silinebilir.
	* *  CHİLD TABLODA ON DELETE CASCADE KOMUTU YAZILIRSA  * *
	
1 - Child tablo silinmeden Parent tablo silinebilir. PgAdmin buna Error vermez.
2 - Child tablodaki veri silinmeden Parent tablodaki veri silinebilir.PgAdmin buna Error vermez.
Parent tablodaki veriyi siler fakat bu durumda Child tablodaki veri de silinir.
*/

CREATE TABLE toptancilar     --> parent
(
vergi_no int PRIMARY KEY,
sirket_ismi VARCHAR(40),
irtibat_ismi VARCHAR(30)
);
INSERT INTO toptancilar VALUES (201, 'IBM', 'Kadir Şen');
INSERT INTO toptancilar VALUES (202, 'Huawei', 'Çetin Hoş');
INSERT INTO toptancilar VALUES (203, 'Erikson', 'Mehmet Gör');
INSERT INTO toptancilar VALUES (204, 'Apple', 'Adem Coş');
select * from toptancilar;

CREATE TABLE malzemeler     --> child
(
ted_vergino int,
malzeme_id int,
malzeme_isim VARCHAR(20),
musteri_isim VARCHAR(25),
CONSTRAINT fk FOREIGN KEY(ted_vergino) REFERENCES toptancilar(vergi_no)
on delete cascade
);
INSERT INTO malzemeler VALUES(201, 1001,'Laptop', 'Aslı Can');
INSERT INTO malzemeler VALUES(202, 1002,'Telefon', 'Fatih Ak');
INSERT INTO malzemeler VALUES(202, 1003,'TV', 'Ramiz Özmen');
INSERT INTO malzemeler VALUES(202, 1004,'Laptop', 'Veli Tan');
INSERT INTO malzemeler VALUES(203, 1005,'Telefon', 'Cemile Al');
INSERT INTO malzemeler VALUES(204, 1006,'TV', 'Ali Can');
INSERT INTO malzemeler VALUES(204, 1007,'Telefon', 'Ahmet Yaman');
SELECT * FROM malzemeler;

-- SORU1: vergi_no’su 202 olan toptancinin sirket_ismi'ni 'VivoBook' olarak güncelleyeniz.
update toptancilar set sirket_ismi = 'VivoBook'
where vergi_no= '202';

select * from toptancilar;

--  SORU2: toptancilar tablosundaki tüm sirket isimlerini 'NOKIA' olarak güncelleyeniz.
update toptancilar set sirket_ismi = 'NOKIA';

select * from toptancilar;

-- SORU3: vergi_no’su 201 olan toptancinin
--sirket_ismi'ni 'nokia' ve irtibat_ismi’ni 'Canan Can' olarak güncelleyiniz.

UPDATE toptancilar set sirket_ismi='nokia', irtibat_ismi='Canan Can'
Where vergi_no=201;

-- SORU4: sirket_ismi nokia olan toptancinin
--irtibat_ismi'ni 'Bilal Han' olarak güncelleyiniz.

update toptancilar set irtibat_ismi='Bilal Han'
Where sirket_ismi='nokia';

-- SORU5: malzemeler tablosundaki 'Telefon' değerlerini 'Phone' olarak güncelleyiniz.
update malzemeler set malzeme_isim='Phone' Where malzeme_isim='Telefon';

select * from malzemeler

-- SORU6: malzemeler tablosundaki malzeme_id değeri 1004'ten büyük olanların
 --malzeme_id'lerini 1 artırarak güncelleyiniz.
 
 update malzemeler set malzeme_id=(malzeme_id+1) Where malzeme_id>1004;
 
 -- SORU7: malzemeler tablosundaki tüm malzemelerin malzeme_id değerini ted_vergino ile toplayarak güncelleyiniz.
 
 update malzemeler set malzeme_id=malzeme_id+ted_vergino
 
 
 -- SORU8: Malzemeler tablosundaki musteri_isim'i Ali Can olan malzeme_isim'ini,
--toptancılar  tablosunda irtibat_ismi 'Adem Coş' olan sirket_ismi ile güncelleyiniz.
 UPDATE malzemeler set malzeme_isim = (SELECT sirket_ismi FROM toptancilar WHERE irtibat_ismi='Adem Coş')
WHERE musteri_isim='Ali Can';


 -- SORU9: malzeme_ismi Laptop olan musteri_isim'ini,
 --sirket_ismi Apple’in irtibat_isim'i ile güncelleyiniz.
 
 update malzemeler set musteri_isim=( select irtibat_ismi From toptancilar Where sirket_ismi='Apple')
 Where malzeme_isim='Laptop';

Create table arac(
id int,
marka varchar(30),
model varchar(30),
fiyat int,
kilometre int,
vites varchar(20)
);
insert into arac values(100, 'Citroen', 'C3', 500000, 5000, 'Otomatik' );
insert into arac values(101, 'Mercedes', 'C180', 900000, 10000, 'Otomatik' );
insert into arac values(102, 'Honda', 'Cıvıc', 400000, 15000, 'Manuel' );
insert into arac values(103, 'Wolkswagen', 'Golf', 350000, 20000, 'Manuel' );
insert into arac values(104, 'Ford', 'Mustang', 750000, 5000, 'Otomatik' );
insert into arac values(105, 'Porsche', 'Panamera', 850000, 5000, 'Otomatik' );
insert into arac values(106, 'Bugatti', 'Veyron', 950000, 5000, 'Otomatik' );
 
Select * from arac
-- SORU: arac tablosundaki en yüksek fiyat'ı listele
 Select max(fiyat) From arac 
----SORU2: arac tablosundaki fiyatların toplamını listele
Select sum(fiyat) From arac
--SORU3: arac tablosundaki fiyat ortalamalarını listele
Select avg(fiyat) From arac--ortalamayi virgullu olarak verir
Select round(avg(fiyat)) From arac--ortalamayi virgulden onceki kismi verir
Select round(avg(fiyat),2) From arac--ortalamayi virgulden sonra iki basamak olacak sekilde verir
--SORU4: arac tablosunda kaç tane araç oldugunu listele
Select count(id) From arac


CREATE TABLE meslekler
(
id int PRIMARY KEY,
isim VARCHAR(50),
soyisim VARCHAR(50),
meslek CHAR(9),
maas int
);
	
INSERT INTO meslekler VALUES(1, 'Ali', 'Can', 'Doktor', '20000' );
INSERT INTO meslekler VALUES(2, 'Veli', 'Cem', 'Mühendis', '18000');
INSERT INTO meslekler VALUES(3, 'Mine', 'Bulut', 'Avukat', '17000');
INSERT INTO meslekler VALUES(4, 'Mahmut', 'Bulut', 'Ögretmen', '15000');
INSERT INTO meslekler VALUES (5, 'Mine', 'Yasa', 'Teknisyen', '13000');
INSERT INTO meslekler VALUES (6, 'Veli', 'Yilmaz', 'Hemşire', '12000');
INSERT INTO meslekler VALUES(7, 'Ali', 'Can', 'Marangoz', '10000' );
INSERT INTO meslekler VALUES(8, 'Veli', 'Cem', 'Tekniker', '14000');

Select * From meslekler

-- SORU1: meslekler tablosunu isim'e göre sıralayarak sorgulayınız.
Select * From meslekler Order By isim --isme gore alfabetik olarak siralar
-- SORU2: meslekler tablosunda maas'i buyukten kucuge siralayiniz
Select * From meslekler Order By maas Desc
-- SORU3: meslekler tablosunda isim'i 'Ali' olanları, 
-- maas'a göre büyükten küçüge sıralayarak sorgulayınız
Select * From meslekler Where isim='Ali' Order By maas Desc
-- SORU4: meslekler tablosunda soyisim 'i 'Bulut' olanları,
-- maas sıralı olarak sorgulayınız.
Select * From meslekler Where soyisim='Bulut' Order By maas 
-- SORU5: meslekler tablosunda id degeri 5 den büyük olan,
-- ilk 2 veriyi listeleyiniz
Select * From meslekler Where id>5 limit 2
-- SORU6: meslekler tablosunda maası en yüksek 3 kişinin bilgilerini listeleyiniz
Select * From meslekler Order By maas Desc limit 3
-- SORU7: meslekler tablosunda ilk 2 veriden sonra 5 veriyi getirin
Select * From meslekler OffSet 2 limit 5
-- SORU8: meslekler tablosunda en yüksek maaşı alan 4. 5. 6. kişilerin bilgilerini listele
Select * From meslekler Order By maas Desc Offset 3 limit 3

 -- *** JOIN ***
 
Create table filmler
(film_id int,
film_name varchar(30),
category varchar(30)
);
insert into filmler values (1, 'Eyvah Eyvah', 'Komedi');
insert into filmler values (2, 'Kurtlar Vadisi', 'Aksiyon');
insert into filmler values (3, 'Eltilerin Savasi', 'Komedi');
insert into filmler values (4, 'Aile Arasinda', 'Komedi');
insert into filmler values (5, 'GORA', 'Bilim Kurgu');
insert into filmler values (6, 'Organize Isler', 'Komedi');
insert into filmler values (7, 'Babam ve Oglum', 'Dram');
Create table aktorler
(id int,
actor_name varchar(30),
film_id int
);
insert into aktorler values (1, 'Ata Demirer', 1);
insert into aktorler values (2, 'Necati Sasmaz', 2);
insert into aktorler values (3, 'Gupse Ozay', 3);
insert into aktorler values (4, 'Engin Gunaydin', 4);
insert into aktorler values (5, 'Cem Yilmaz', 5);

Select * From aktorler
Select * From filmler

-- SORU1: Tüm film_name'leri, category'lerini ve filimlerde oynayan actor_name'leri listeleyiniz.

--1. YOL LEFT JOIN
Select film_name,category,actor_name From filmler As A
Left Join aktorler As B
On A.film_id = B.film_id;

--2. YOL RIGHT JOIN
Select film_name,category,actor_name From aktorler As B
Right Join filmler As A
On A.film_id = B.film_id;

-- SORU2: Tüm actor_name'leri ve film_name'lerini listeleyiniz.

--1. YOL LEFT JOIN
Select actor_name,film_name From aktorler As A
Left Join filmler As B
On A.film_id = B.film_id;

--2. YOL LEFT JOIN
Select actor_name,film_name From filmler As B
Right Join aktorler As A
On A.film_id = B.film_id;

create table qa_dersler
(
ders_id int,
ders_ismi varchar(30),
ders_saati varchar(30)
);
insert into qa_dersler values (101, 'Core Java', 40);
insert into qa_dersler values (102, 'Selenium', 30);
insert into qa_dersler values (103, 'API', 15);
insert into qa_dersler values (104, 'SQL', 10);
insert into qa_dersler values (105, 'SDLC', 10);
insert into qa_dersler values (106, 'LAMDA', 12);
create table developer_dersler
(
ders_id int,
ders_ismi varchar(30),
ders_saati varchar(30)
);
insert into developer_dersler values (101, 'Core Java', 40);
insert into developer_dersler values (103, 'API', 15);
insert into developer_dersler values (104, 'SQL', 10);
insert into developer_dersler values (105, 'SDLC', 10);
insert into developer_dersler values (106, 'LAMDA', 12);
insert into developer_dersler values (107, 'Spring Framework', 20);
insert into developer_dersler values (108, 'Micro Services', 12);

Select * From developer_dersler
Select * From qa_dersler
--SORU4: join kullanarak qa_dersleri ve developer_dersleri benzersiz sorgula

--SORU4: join kullanarak qa_dersleri ve developer_dersleri benzersiz sorgula
select A.ders_id, A.ders_ismi,A.ders_saati from qa_dersler as A
left join developer_dersler as B
on A.ders_ismi=B.ders_ismi
union
select B.ders_id, B.ders_ismi,B.ders_saati from qa_dersler as A
right join developer_dersler as B
on A.ders_ismi=B.ders_ismi;

