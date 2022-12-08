CREATE TABLE personel
(
id int,
isim varchar(50),  sehir varchar(50),  maas int,  
sirket varchar(20)
);
INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel VALUES(456789012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

select * from personel;
delete from personel
--Soru 1)Isme gore toplam maaslari bulun
Select isim,sum(maas) From personel
Group by isim

--Soru 2)Personel tablosundaki isimleri gruplayiniz
Select isim From personel
Group by isim

-- *** HAVING KULLANIMI ***
/*
Having komutu yalnizca "Group By" komutu ile kullanilir
Eger gruplamadan sonra bir sart varsa "Having" komutu kullanilir.
Where kulanimi ile ayni mantikta calisir
*/

--Soru 1) Her sirketin MIN maaslarini eger 4000’den buyukse goster
Select sirket,min(maas) As en_dusuk_maas From personel
Group By sirket
Having min(maas)>4000

--Soru 2) Ayni isimdeki kisilerin aldigi toplam gelir 10000 liradan fazla ise ismi
-- ve toplam maasi gosteren sorgu yaziniz
Select isim,sum(maas) as toplam_maas From personel
Group by isim
Having sum(maas)>10000

-- Eger bir sehirde calisan personel sayisi 1’den coksa sehir ismini ve personel sayisini veren sorgu yaziniz
Select sehir,count(isim) As toplam_personel_sayisi From personel
Group By sehir
Having count(isim)>1

-- Eger bir sehirde alinan MAX maas 5000’den dusukse sehir ismini ve MAX maasi veren sorgu yaziniz
Select sehir,max(maas) As en_yuksek_maas From personel
Group By sehir
Having max(maas)<5000

-- *** UNION KULLANIMI ***

-- 1) Maasi 4000’den cok olan isci isimlerini ve 5000 liradan fazla maas alinan
-- sehirleri gosteren sorguyu yaziniz

Select isim as isim_ve_sehirler, maas From personel Where maas>4000
union
Select sehir,maas From personel Where maas>5000

select * from personel

--Mehmet Ozturk ismindeki kisilerin aldigi maaslari ve Istanbul’daki personelin maaslarini
--bir tabloda gosteren sorgu yaziniz
Select isim As isim_ve_sehir,maas From personel where isim='Mehmet Ozturk'
union
Select sehir,maas From personel Where sehir='Istanbul'
Order By maas Desc - maasa gore buyukten kucuge siraladik

drop table if exists personel;

CREATE TABLE personel
(
id int,
isim varchar(50),  
sehir varchar(50), 
maas int,  
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

CREATE TABLE personel_bilgi  (
id int,
tel char(10) UNIQUE ,  
cocuk_sayisi int,
CONSTRAINT personel_bilgi_fk FOREIGN KEY (id) REFERENCES personel(id)
);
INSERT INTO personel_bilgi VALUES(123456789, '5302345678', 5);  
INSERT INTO personel_bilgi VALUES(234567890, '5422345678', 4);
INSERT INTO personel_bilgi VALUES(345678901, '5354561245', 3);
INSERT INTO personel_bilgi VALUES(456789012, '5411452659', 3);
INSERT INTO personel_bilgi VALUES(567890123, '5551253698', 2);
INSERT INTO personel_bilgi VALUES(456789012, '5524578574', 2);
INSERT INTO personel_bilgi VALUES(123456710, '5537488585', 1);

select * from personel
select * from personel_bilgi

-- id’si 123456789 olan personelin    Personel tablosundan sehir ve maasini, 
-- personel_bilgi  tablosundan da tel ve cocuk sayisini yazdirin
Select sehir As sehir_ve_tel,maas As maas_ve_cocuksayisi From personel Where id=123456789
union
Select tel,cocuk_sayisi From personel_bilgi 

-- *** UNION ALL ***
/*
Union tekrarli verileri teke dusurur ve bize o sekilde sonuc verir
Union All ise tekrarli verilerle birlikte tum sorgulari getirir
*/
--Personel tablosundada maasi 5000’den az olan tum isimleri ve maaslari bulunuz
Select isim,maas From personel Where maas<5000
union all
SELECT isim,maas FROM personel WHERE maas<5000

-- *** INTERSECT (Kesisim) ***
/*
Farkli iki tablodaki otrak verileri INTERSECT komutu ile getirebiliriz. Kumedeki kesisim bolgesi gibi
*/
--Personel tablosundan Istanbul veya Ankara’da calisanlarin id’lerini yazdir
--Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id lerini yazdirin
--Iki sorguyu INTERSECT ile birlestirin

Select id From personel Where sehir In ('Istanbul','Ankara')
Intersect
Select id From personel_bilgi Where cocuk_sayisi In (2,3)

select * from personel

-- Honda,Ford ve Tofas’ta calisan ortak isimde personel varsa listeleyin
Select isim From personel  Where sirket='Honda'
Intersect
Select isim From personel  Where sirket='Ford'
Intersect
Select isim From personel  Where sirket='Tofas'

-- *** EXCEPT ***
/*
Iki sorgulamada harici bir sorgulama istenirse EXCEPT kullanilir.
*/
--5000’den az maas alip Honda’da calismayanlari yazdirin
Select isim,sirket From personel Where maas<5000
EXCEPT
Select isim,sirket From personel Where sirket='Honda'









