CREATE TABLE sirketler  (
sirket_id int,  
sirket_isim varchar(20)
);
INSERT INTO sirketler VALUES(100, 'Toyota');  
INSERT INTO sirketler VALUES(101, 'Honda');  
INSERT INTO sirketler VALUES(102, 'Ford');  
INSERT INTO sirketler VALUES(103, 'Hyundai');

CREATE TABLE siparisler  (
siparis_id int,  
sirket_id int, 
siparis_tarihi date
);
INSERT INTO siparisler VALUES(11, 101, '2020-04-17');  
INSERT INTO siparisler VALUES(22, 102, '2020-04-18');  
INSERT INTO siparisler VALUES(33, 103, '2020-04-19');  
INSERT INTO siparisler VALUES(44, 104, '2020-04-20');  
INSERT INTO siparisler VALUES(55,  105, '2020-04-21');

Select * From sirketler
Select * From siparisler

-- SORU) Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve
--       siparis_tarihleri ile yeni bir tablo olusturun

select sirketler.sirket_isim,siparisler.siparis_id,siparisler.siparis_tarihi from sirketler
Inner join siparisler on sirketler.sirket_id=siparisler.sirket_id;

/*
	NOT :
	1) Select’ten sonra tabloda gormek istediginiz sutunlari yazarken Tablo_adi.field_adi seklinde yazin
	2) From’dan sonra tablo ismi yazarken 1.Tablo ismi + INNER JOIN + 2.Tablo ismi yazmaliyiz
	3) Join’i hangi kurala gore yapacaginizi belirtmelisiniz. Bunun icin ON+ kuralimiz yazilmali
 */
 /*
 NOT :
1) Left Join’de ilk tablodaki tum record’lar gosterilir.
2) Ilk tablodaki datalara 2.tablodan gelen ek datalar varsa bu ek datalar ortak datalar icin gosterilir ancak
ortak olmayan datalar icin o kisimlar bos kalir
3) Ilk yazdiginiz Tablonun tamamini aldigi icin hangi tabloyu istedigimize karar verip once onu yazmaliyiz
 */
 /*
2 Tablodaki datalari Birlestirmek icin kullanilir.
Su ana kadar gordugumuz Union,Intersect ve Minus sorgu sonuclari icin kullanilir
Tablolar icin ise JOIN kullanilir
5 Cesit Join vardir
1) INNER JOIN iki Tablodaki ortak datalari gosterir
2) LEFT JOIN Ilk datada olan tum recordlari gosterir
3) RIGHT JOIN Ikinci tabloda olan tum recordlari gosterir
4) FULL JOIN Iki tablodaki tum recordlari gosterir
5) SELF JOIN Bir tablonun kendi icinde Join edilmesi ile olusur
*/
 --LEFT JOIN
Select sirketler.sirket_isim,siparisler.siparis_id,siparisler.siparis_tarihi From sirketler
Left join siparisler on sirketler.sirket_id=siparisler.sirket_id;
 
 -- RIGHT JOIN
Select sirketler.sirket_isim,siparisler.siparis_id,siparisler.siparis_tarihi From sirketler
Inner join siparisler on sirketler.sirket_id=siparisler.sirket_id;

--ORNEK INTERSECT
Select sirket_id From sirketler
Intersect
Select sirket_id From siparisler

--FULL JOIN
Select sirketler.sirket_isim,siparisler.siparis_id,siparisler.siparis_tarihi From sirketler
Full join siparisler on sirketler.sirket_id=siparisler.sirket_id;

CREATE TABLE personel  (
id int,
isim varchar(20),  
title varchar(60),  yonetici_id int
);
INSERT INTO personel VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO personel VALUES(2, 'Veli Cem', 'QA', 3);
INSERT INTO personel VALUES(3, 'Ayse Gul', 'QA Lead', 4);  
INSERT INTO personel VALUES(4, 'Fatma Can', 'CEO', 5);

Select * From personel

--Soru = Her personelin yanina yonetici ismini yazdiran tabloyu olusturunuz

SELECT isim FROM personel
SELECT p1.isim,p2.isim
FROM personel p1 INNER JOIN personel p2 ON p1.yonetici_id=p2.id

-- LIKE CONDITION
drop table musteriler
CREATE TABLE musteriler  (
id int UNIQUE,
isim varchar(50) NOT NULL,
gelir int
);
INSERT INTO musteriler (id, isim, gelir) VALUES (1001, 'Ali', 62000);  
INSERT INTO musteriler (id, isim, gelir) VALUES (1002, 'Ayse', 57500);  
INSERT INTO musteriler (id, isim, gelir) VALUES (1003, 'Feride', 71000);
INSERT INTO musteriler (id, isim, gelir) VALUES (1004, 'Fatma', 42000);  
INSERT INTO musteriler (id, isim, gelir) VALUES (1005, 'Kasim', 44000);
INSERT INTO musteriler (id, isim, gelir) VALUES (1006, 'ahmet', 82000);
INSERT INTO musteriler (id, isim, gelir) VALUES (1007, 'erhan', 92000);
-- Ismi A harfi ile baslayan musterilerin tum bilgilerini yazdiran QUERY yazin
/*
LIKE kullanımında büyük küçük harf gözetmeksizin sonuç almak istersek ILIKE kullanırız
LIKE yerine ~~ sembollerini kullanabiliriz. Eğer büyük küçük harf gözetmeksizin kullanmak istersek ~~* sembollerini kullanırız
*/
SELECT * FROM musteriler WHERE isim ILIKE 'A%'
SELECT * FROM musteriler WHERE isim ~~* 'A%'

--Ismi e harfi ile biten musterilerin isimlerini ve gelir’lerini yazdiran QUERY yazin
Select isim,gelir From musteriler Where isim ~~ '%e'
--Isminin icinde er olan musterilerin isimlerini ve gelir’lerini yazdiran QUERY yazin
Select isim, gelir From musteriler Where isim Like '%er%'
--Ismi 5 harfli olup son 4 harfi atma olan musterilerin tum bilgilerini yazdiran QUERY yazin
Select isim From musteriler Where isim Like '_atma'
--Ikinci harfi a olan musterilerin tum bilgilerini yazdiran QUERY yazin
Select * From musteriler Where isim Like '_a%'
--Ucuncu harfi s olan musterilerin tum bilgilerini yazdiran QUERY yazin
Select * From musteriler Where isim Like '__s%'
--Ucuncu harfi s olan ismi 4 harfli musterilerin tum bilgilerini yazdiran QUERY yazin
Select * From musteriler Where isim Like '__s_'
--Ilk harfi F olan en az 4 harfli musterilerin tum bilgilerini yazdiran QUERY yazin
Select * From musteriler Where isim Like 'F___%'
--Ikinci harfi a,4.harfi m olan musterilerin tum bilgilerini yazdiran QUERY yazin
Select * From musteriler Where isim Like '_a_m%'


-- REGEXP_LIKE (~) KULLANIMI

CREATE TABLE kelimeler  (
id int UNIQUE,
kelime varchar(50) NOT NULL,  Harf_sayisi int
);
INSERT INTO kelimeler VALUES (1001, 'hot', 3);  
INSERT INTO kelimeler VALUES (1002, 'hat', 3);  
INSERT INTO kelimeler VALUES (1003, 'hit', 3);  
INSERT INTO kelimeler VALUES (1004, 'hbt', 3);  
INSERT INTO kelimeler VALUES (1008, 'hct', 3);  
INSERT INTO kelimeler VALUES (1005, 'adem', 4);  
INSERT INTO kelimeler VALUES (1006, 'selim', 5);  
INSERT INTO kelimeler VALUES (1007, 'yusuf', 5);
INSERT INTO kelimeler VALUES (1009, 'hAt', 5); 
-- SORU : Ilk harfi h,son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tum bilgilerini  yazdiran
-- QUERY yazin
Select * From kelimeler Where kelime ~ 'h[ai]t'
-- SORU : Ilk harfi h,son harfi t olup 2.harfi a ile k arasinda olan 3 harfli kelimelerin  tum bilgilerini  yazdiran 
-- QUERY yazin
Select * From kelimeler Where kelime ~ 'h[a-k]t'
--Icinde m veya i olan kelimelerin tum bilgilerini yazdiran QUERY yazin
Select * From kelimeler Where kelime ~ '[mi]'
-- SORU : a veya s ile baslayan kelimelerin tum bilgilerini yazdiran QUERY yazin
Select * From kelimeler Where kelime ~* '^[as]'
-- SORU : m veya f ile biten kelimelerin tum bilgilerini yazdiran QUERY yazin
Select * From kelimeler Where kelime ~* '[mf]$'

-- *** NOT LIKE ***

--ilk harfi h olmayan kelimelerin tum bilgilerini yazdiran QUERY yazin
Select * From kelimeler Where kelime Not Like 'h%'
--a harfi icermeyen kelimelerin tum bilgilerini yazdiran QUERY yazin
Select * From kelimeler Where kelime Not Like '%a%'
--ikinci ve ucuncu harfi ‘de’ olmayan kelimelerin tum bilgilerini yazdiran QUERY yazin
Select * From kelimeler Where kelime Not Like '_de%'
--2. harfi e,i veya o olmayan kelimelerin tum bilgilerini yazdiran QUERY yazin
Select * From kelimeler Where kelime !~ '[_eio]'
Select * From kelimeler Where kelime Not Like '[_eio]'-- Bu sekilde dogru sonucu vermiyor

-- *** UPPER – LOWER - INITCAP ***

-- Kelimeler tablosundaki kelime sutunundaki verileri önce hepsi büyük harf, sonra küçük harf ve ilk harfleri 
-- büyük harf olucak şekilde yazdıralım
SELECT UPPER(kelime) as büyükkelime FROM kelimeler
SELECT LOWER(kelime) as kelime FROM kelimeler
SELECT INITCAP(kelime) as kelime FROM kelimeler -- INITCAP istediğimiz sutundaki verilerin ilk harfini büyük yazar
-- Musteriler tablosundan bütün isimleri büyük harf yapınız
SELECT UPPER(isim) FROM musteriler
/*
Eğer birden fazla sütundaki verileri büyük küçük harf yapmak istersek
select lower(title),UPPER(isim) from personel şekilde yapabiliriz
*/
select lower(title),UPPER(isim) from personel
Collapse











