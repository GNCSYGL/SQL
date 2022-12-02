--DDl - data definition lang.
--Create - Tablo Olusturma
CREATE TABLE ogrenciler2
(
 ogrenci_no char(7), 
 isim varchar(20),
 soyisim varchar(25),
 not_ort real, -- ondalikli sayilar icin "real" kullanilir
 kayit_tarih date
);

-- VAROLAN TABLODAN TENI BIR TABLO OLUSTURMA
CREATE TABLE ogrenci_notlari
AS  -- Benzer tablodaki başlıklarla ve data tipleriyle yeni bir tablo oluşturmak için
-- normal tablo oluştururken ki parantezler yerine AS kullanıp Select komutuyla almak istediğimiz verileri alırız
SELECT isim,soyisim,not_ort FROM ogrenciler2;

-- DML - DATA MANIPULATION LANGUAGE 
-- INSERT (Database'e veri ekleme)
insert into ogrenciler2 values ('1234567','Said','Ilhan',85.5, now())
insert into ogrenciler2 values ('1234567','Said','Ilhan',85.5,'2020-12-01');

-- BIR TABLOYA PARCALI VERI EKLEMEK ISTERSEK

insert into ogrenciler2 (isim,soyisim) values ('Erol', 'Evren');

-- DQL - DATA QUERY LANGUAGE
-- SELECT

select * from ogrenciler2; -- Buradaki * sembolu hersey ai anlamindadir














