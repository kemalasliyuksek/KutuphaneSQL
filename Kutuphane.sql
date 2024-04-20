-- Database olusturur
CREATE DATABASE KUTUPHANE;
-- Olusturulan databaseyi kullanir
USE KUTUPHANE;

-- Odunc tablosunu olusturur
CREATE TABLE odunc (
EmanetTarihi DATE NOT NULL,	-- bos birakilmayan tarih bicimi
TeslimTarihi DATE,
KitapID INT NOT NULL,
UyeID INT NOT NULL,
KutuphaneID INT
);

-- Odunc tablosuna sonradan ID ve o ID'ye otomatik artan birincil anahtar ekler
ALTER TABLE odunc
DROP COLUMN KutuphaneID,
ADD KutuphaneID INT AUTO_INCREMENT PRIMARY KEY;

-- UyeID'yi uyeler tablosundaki ID'ye,
-- KitapID'yi kitaplar tablosundaki ID'ye baglar
ALTER TABLE odunc
ADD FOREIGN KEY(UyeID) REFERENCES uyeler(ID),
ADD FOREIGN KEY(KitapID) REFERENCES kitaplar(ID);

-- Kitaplar tablosunu olusturur
CREATE TABLE kitaplar (
ID INT PRIMARY KEY AUTO_INCREMENT,	-- otomatik artan birincil anahtar
ISBN VARCHAR(13) NOT NULL,
KitapAd VARCHAR(150) NOT NULL,	-- 150 karakter sinirlamali karakter
YayinTarihi DATE,
SayfaSayisi INT,
YayinEviID INT
);

-- YayinEviID'yi yayinevleri tablosundaki ID'ye baglar
ALTER TABLE kitaplar
ADD FOREIGN KEY(YayinEviID) REFERENCES yayinevleri(ID);

-- YazarID ekler ve YazarID ile yazarlar tablosundaki ID'yi baglar
ALTER TABLE kitaplar
ADD YazarID INT,
ADD FOREIGN KEY(YazarID) REFERENCES yazarlar(ID);

-- Uyeler tablosunu olusturur
CREATE TABLE uyeler (
ID INT PRIMARY KEY AUTO_INCREMENT,
Ad VARCHAR(55) NOT NULL,
Soyad VARCHAR(55) NOT NULL,
Cinsiyet VARCHAR(5),
Telefon VARCHAR(11),
EPosta VARCHAR(55),
AdresID INT
);

-- Kategoriler tablosunu olusturur
CREATE TABLE kategoriler (
ID INT PRIMARY KEY AUTO_INCREMENT,
KategoriAdi VARCHAR(55) NOT NULL
);

-- Yazarlar tablosunu olusturur
CREATE TABLE yazarlar (
ID INT PRIMARY KEY AUTO_INCREMENT,
YazarAd VARCHAR(55) NOT NULL,
YazarSoyad VARCHAR(55) NOT NULL
);

-- Yayinevleri tablosunu olusturur
CREATE TABLE yayinevleri (
ID INT PRIMARY KEY AUTO_INCREMENT,
YayinEviAdi VARCHAR(55) NOT NULL,
AdresID INT
);

-- Uyeler tablosuna istenilen verileri ekler
INSERT INTO uyeler (Ad, Soyad, Cinsiyet, Telefon, EPosta, AdresID) VALUES
('Kemal', 'Asliyuksek', 'Erkek', '05111111111', 'kemalasliyuksek@icloud.com', 16),
('Nur', 'Kumbasar', 'Kadin', '05222222222', 'nurkumbasar@icloud.com', 34),
('Salih', 'Zenginal', 'Erkek', '05333333333', 'salihzenginal@icloud.com', 16),
('Harun', 'Kocyigit', 'Erkek', '05444444444', 'harunkocyigit@icloud.com', 16),
('Erdem', 'Atici', 'Erkek', '05555555555', 'erdematici@icloud.com', 16),
('Feyza', 'Asliyuksek', 'Kadin', '05666666666', 'feyzaasliyuksek@icloud.com', 53),
('Ali', 'Veli', 'Erkek', '05777777777', 'aliveli@icloud.com', 35),
('Ayşe', 'Fatma', 'Kadın', '05888888888', 'aysefatma@icloud.com', 52),
('Mehmet', 'Öztürk', 'Erkek', '05999999999', 'mehmetozturk@icloud.com', 61),
('Elif', 'Yılmaz', 'Kadın', '06000000000', 'elifyilmaz@icloud.com', 78),
('Ahmet', 'Demir', 'Erkek', '06111111111', 'ahmetdemir@icloud.com', 81),
('Fatma', 'Gül', 'Kadın', '06222222222', 'fatmagul@icloud.com', 19),
('Hasan', 'Kaya', 'Erkek', '06333333333', 'hasankaya@icloud.com', 10),
('Hatice', 'Özkaya', 'Kadın', '06444444444', 'haticeozkaya@icloud.com', 21),
('İbrahim', 'Yılmaz', 'Erkek', '06555555555', 'ibrahimyilmaz@icloud.com', 42),
('Ayşe', 'Çelik', 'Kadın', '06666666666', 'aysecelik@icloud.com', 3);

-- Yayinevleri tablosuna istenilen verileri ekler
INSERT INTO yayinevleri (YayinEviAdi, AdresID) VALUES
('İş Bankası Kültür Yayınları', 34),
('Kırmızı Kedi Yayınevi', 6),
('Doğan Kitap', 34),
('Everest Yayınları', 34),
('Tükbit Yayınları', 6),
('Nobel Yayıncılık', 35),
('Güneş Yayınları', 16),
('Yapı Kredi Yayınları', 53),
('Epsilon Yayınları', 34);

-- Yazarlar tablosuna istenilen verileri ekler
INSERT INTO yazarlar (YazarAd, YazarSoyad) VALUES
('Ahmet Hamdi', 'Tanpınar'),
('Oğuz', 'Atay'),
('Orhan', 'Pamuk'),
('Aziz', 'Nesin'),
('Yaşar Kemal', 'Gokceli'),
('Anton', 'Çehov'),
('Fyodor', 'Dostoyevski'),
('Franz', 'Kafka'),
('Yunus', 'Emre'),
('Fuat', 'Safa'),
('Ahmet', 'Rasim'),
('Yakup Kadri', 'Karaosmanoğlu'),
('Sait Faik', 'Abasıyanık'),
('Yusuf', 'Atılgan'),
('Orhan Veli', 'Kanık'),
('Melih Cevdet', 'Anday'),
('Behçet Necatigil', ''),
('Turgut', 'Uysal'),
('Füruzan', ''),
('Ayfer', 'Tunç'),
('Sema', 'Kaynak'),
('Ahmet', 'Altan'),
('Elif', 'Şafak'),
('Gülseren', 'Budayıcıoğlu'),
('Gabriel Garcia', 'Marquez');

-- Kategoriler tablosuna istenilen verileri ekler
INSERT INTO kategoriler (KategoriAdi) VALUES
('Roman'),
('Şiir'),
('Felsefe'),
('Tarih'),
('Bilim'),
('Çocuk Kitabı'),
('Gezi'),
('Biyografi'),
('Fantastik Kurgu'),
('Bilim Kurgu'),
('Polisiye'),
('Mimarlık');

-- Kitaplar tablosuna istenilen verileri ekler
INSERT INTO kitaplar (ISBN, KitapAd, YayinTarihi, SayfaSayisi, YayinEviID, YazarID) VALUES
(9786256013099, 'Sefiller', '1862-02-26', 1472, 1, 5),
(9789753494016, 'Tutunamayanlar', '1972-01-01', 608, 3, 3),
(9786256031477, 'Kürk Mantolu Madonna', '1943-01-01', 304, 1, 6),
(9789752238707, 'İnce Memed', '1955-01-01', 720, 3, 2),
(9786051711145, 'Suç ve Ceza', '1866-11-06', 672, 5, 4),
(9786050112345, 'Metamorfoz', '1915-11-01', 112, 5, 1),
(9789753495237, 'Yüz Yıllık Yalnızlık', '1967-06-05', 480, 2, 3),
(9789754335448, 'Simyacı', '1988-01-01', 224, 2, 7),
(9786050112352, 'Fahrenheit 451', '1953-07-10', 256, 5, 7),
(9789752238714, 'Hayvan Çiftliği', '1945-08-17', 136, 5, 3),
(9789753494752, 'Babalar ve Oğullar', '1860-01-01', 512, 5, 2),
(9789752238721, '1984', '1949-06-08', 328, 5, 1),
(9786251215987, 'Kayıp Zamanın İzinde', '1913-01-01', 3360, 1, 8),
(9786051710296, 'Ulysses', '1922-01-01', 768, 5, 1),
(9789752238738, 'Hamlet', '1603-01-01', 448, 5, 6),
(9789752238745, 'Kral Lear', '1605-01-01', 400, 5, 4),
(9789752238752, 'Romeo ve Juliet', '1597-01-01', 128, 5, 5),
(9789752238769, 'Macbeth', '1606-01-01', 112, 5, 6),
(9789752238776, 'Othello', '1604-01-01', 640, 5, 3);

-- Odunc tablosuna istenilen veriler ekler
INSERT INTO odunc (EmanetTarihi, KitapID, UyeID) VALUES
('2024-04-15', 2, 3),
('2024-04-10', 4, 2),
('2024-04-08', 3, 4),
('2024-04-05', 6, 8),
('2024-04-01', 5, 12),
('2024-03-25', 9, 6),
('2024-03-31', 12, 10),
('2024-04-01', 7, 1);

-- Durum'u varsayilan olarak Teslim Edilmedi olarak belirler.
ALTER TABLE odunc
ADD Durum VARCHAR(20) NOT NULL DEFAULT 'Teslim Edilmedi',
ADD CHECK (Durum IN ('Teslim Edildi', 'Teslim Edilmedi', 'Okuyucuda'));

-- TeslimTarihi'ni EmanetTarihi'nden 20 gun sonraya ayarlar
UPDATE odunc
SET TeslimTarihi = DATE_ADD(EmanetTarihi, INTERVAL 20 DAY)
WHERE TeslimTarihi IS NULL;

-- Bugunun tarihi EmanetTarihi ve TeslimTarihi arasindaysa Durum Okuyucuda olur
UPDATE odunc
SET Durum = 'Okuyucuda'
WHERE EmanetTarihi <= CURDATE() AND TeslimTarihi >= CURDATE();

-- TeslimTarihi bugun olanlara 10 gun ekler
UPDATE odunc
SET TeslimTarihi = DATE_ADD(TeslimTarihi, INTERVAL 10 DAY)
WHERE TeslimTarihi = CURDATE();

-- Hangi yazarlar hangi kitaplari yazmistir gosterir
SELECT yz.YazarAd, yz.YazarSoyad, k.KitapAd, k.ID
FROM yazarlar yz
JOIN kitaplar k ON k.YazarID = yz.ID;

-- Durum'u Teslim Edilmedi olanlari gosterir
SELECT k.KitapAd, yz.YazarAd, yz.YazarSoyad, o.Durum
FROM kitaplar k
JOIN yazarlar yz ON k.YazarID = yz.ID
JOIN odunc o ON k.ID = o.KitapID
WHERE o.Durum = 'Teslim Edilmedi';

-- Hangi yazarlar hangi kitaplari yazmistir yayin tarihi yeniden eskiye gore gosterir
SELECT yz.ID, yz.YazarAd, yz.YazarSoyad, k.KitapAd, k.YayinTarihi
FROM kitaplar k
JOIN yazarlar yz ON k.YazarID = yz.ID
ORDER BY k.YayinTarihi DESC;

-- Bugun iade edilecek kitaplari gosterir
SELECT k.ID, k.KitapAd, u.Ad, u.Soyad, o.EmanetTarihi, o.TeslimTarihi
FROM kitaplar k
JOIN odunc o ON k.ID = o.KitapID
JOIN uyeler u ON u.ID = o.UyeID
WHERE o.TeslimTarihi = '2024-04-20' AND o.Durum = 'Teslim Edilmedi';

-- Teslim edilmeyen kitaplari alanlari ve teslim tarihlerini gosterir
SELECT k.KitapAd, u.Ad, u.Soyad, o.Durum, o.TeslimTarihi
FROM kitaplar k
JOIN odunc o ON k.ID = o.KitapID
JOIN uyeler u ON u.ID = o.UyeID
WHERE o.Durum = 'Teslim Edilmedi';

-- TeslimTarihi'ni EmanetTarihi'nden 20 gun sonraya otomatik ayarlar
UPDATE odunc
SET TeslimTarihi = DATE_ADD(EmanetTarihi, INTERVAL 20 DAY)
WHERE TeslimTarihi IS NULL;

-- Tablolari listeler --
SELECT * FROM odunc ORDER BY KutuphaneID ASC;
SELECT * FROM uyeler;
SELECT * FROM kitaplar;
SELECT * FROM yazarlar;
SELECT * FROM yayinevleri;
