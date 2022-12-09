CREATE TABLE musteriler 
(
urun_id int Primary Key, 
musteri_isim varchar(50), 
urun_isim varchar(50)
);
Drop table musteriler
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange'); 
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange'); 
INSERT INTO musteriler VALUES (20, 'John', 'Apple'); 
INSERT INTO musteriler VALUES (30, 'Amy', 'Palm'); 
INSERT INTO musteriler VALUES (20, 'Mark', 'Apple')
INSERT INTO musteriler VALUES (10, 'Adem', 'Orange'); 
INSERT INTO musteriler VALUES (40, 'John', 'Apricot'); 
INSERT INTO musteriler VALUES (20, 'Eddie', 'Apple');

Select * From musteriler

SELECT * 
FROM musteriler
WHERE urun_isim ='Orange' OR urun_isim ='Apple' OR urun_isim ='Apricot';


SELECT *
FROM musteriler
WHERE urun_isim IN ('Orange', 'Apple', 'Apricot');

Select * from musteriler Where urun_id Not Between 20 and 40

Delete From musteriler Where urun_isim='Palm' and musteri_isim='Amy'
Delete From musteriler where musteri_isim='John' or urun_isim='Apricot'



CREATE TABLE muster 
(
urun_id int, 
mus_isim varchar(50), 
uru_isim varchar(50),
	 Foreign Key(urun_id) References musteriler(urun_id)
 on delete cascAde
);
INSERT INTO muster VALUES (20, 'Mark', 'Apple')
INSERT INTO muster VALUES (10, 'Adem', 'Orange'); 
INSERT INTO muster VALUES (40, 'John', 'Apricot'); 
INSERT INTO muster VALUES (20, 'Eddie', 'Apple');

Select * From muster
Select * From musteriler

Drop table musteriler Cascade

Delete From musteriler Where urun_id=20
Delete From muster Where urun_id=10

CREATE table personel
(
id char(4),
isim varchar(50),
maas int
);
Drop table personel Cascade
Select * From personel

insert into personel values('1001', 'Ali Can', 70000);
insert into personel values('1002', 'Veli Mert', 85000);
insert into personel values('1003', 'Ayşe Tan', 65000);
insert into personel values('1004', 'Derya Soylu', 95000);
insert into personel values('1005', 'Yavuz Bal', 80000);
insert into personel values('1006', 'Sena Beyaz', 100000);

-- id'si 1003 ile 1005 arasında olan personel bilgilerini listeleyiniz
Select * From personel Where id Between '1003' and '1005';
-- D ile Y arasındaki personel bilgilerini listeleyiniz
SELECT * FROM personel WHERE isim BETWEEN 'Derya Soylu' and 'Yavuz Bal';
-- D ile Y arasında olmayan personel bilgilerini listeleyiniz
SELECT * FROM personel WHERE isim NOT BETWEEN 'Derya Soylu' and 'Yavuz Bal';
-- Maaşı 70000 ve ismi Sena olan personeli listeleyiniz
SELECT * FROM personel WHERE maas=70000 and isim='Ali Can';

Drop table calisan Cascade

CREATE TABLE calisan
(
id int, 
isim VARCHAR(50), 
sehir VARCHAR(50), 
maas int, 
isyeri VARCHAR(20)
);

INSERT INTO calisan VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisan VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisan VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisan VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisan VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisan VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisan VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

CREATE TABLE marka
(
marka_id int, 
marka_isim VARCHAR(20), 
calisan_sayisi int
);

INSERT INTO marka VALUES(100, 'Vakko', 12000);
INSERT INTO marka VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO marka VALUES(102, 'Adidas', 10000);
INSERT INTO marka VALUES(103, 'LCWaikiki', 21000);

Select * From calisan
Select * from marka
-- Çalisan sayisi 15.000’den cok olan markalarin isimlerini ve bu markada calisanlarin isimlerini ve 
-- maaşlarini listeleyin.

Select isim,isyeri,maas calisan From calisan Where calisan_sayisi>=15000 

