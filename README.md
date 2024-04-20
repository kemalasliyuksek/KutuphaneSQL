# KutuphaneSQL

Tablolar:

odunc:
- KutuphaneID (INT, Otomatik Artan, Birincil Anahtar)
- EmanetTarihi (DATE, NOT NULL)
- TeslimTarihi (DATE)
- KitapID (INT, NOT NULL)
- UyeID (INT, NOT NULL)
- Durum (VARCHAR(20), NOT NULL, Varsayılan: 'Teslim Edilmedi')

uyeler:
- ID (INT, Otomatik Artan, Birincil Anahtar)
- Ad (VARCHAR(55), NOT NULL)
- Soyad (VARCHAR(55), NOT NULL)
- Cinsiyet (VARCHAR(5))
- Telefon (VARCHAR(11))
- EPosta (VARCHAR(55))
- AdresID (INT)

kitaplar:
- ID (INT, Otomatik Artan, Birincil Anahtar)
- ISBN (VARCHAR(13), NOT NULL)
- KitapAd (VARCHAR(150), NOT NULL)
- YayinTarihi (DATE)
- SayfaSayisi (INT)
- YayinEviID (INT)
- YazarID (INT)

yazarlar:
- ID (INT, Otomatik Artan, Birincil Anahtar)
- YazarAd (VARCHAR(55), NOT NULL)
- YazarSoyad (VARCHAR(55), NOT NULL)

yayinevleri:
- ID (INT, Otomatik Artan, Birincil Anahtar)
- YayinEviAdi (VARCHAR(55), NOT NULL)
- AdresID (INT)


İlişkiler:

- Bir kitap, birden fazla üyeye ödünç verilebilir (bir kitap - çoklu üye ilişkisi).
- Bir üye, birden fazla kitabı ödünç alabilir (bir üye - çoklu kitap ilişkisi).
- Bir kitap, tek bir yazar tarafından yazılmıştır (bir kitap - bir yazar ilişkisi).
- Bir kitap, tek bir yayınevi tarafından yayınlanmıştır (bir kitap - bir yayınevi ilişkisi).
- Bir üyenin bir adresi vardır (bir üye - bir adres ilişkisi).
- Bir yayınevinin bir adresi vardır (bir yayınevi - bir adres ilişkisi).
