--ODEV
--Ankara'da calısanı olan markaların marka id'lerını ve çalısan sayılarını lısteleyınız

SELECT marka_id,calisan_sayisi from markalar 
Where marka_isim in (Select isyeri From calisanlar2 Where sehir='Ankara');
select * from markalar;
select * from calisanlar2;

