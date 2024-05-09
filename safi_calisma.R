# readxl paketini yükle
install.packages("readxl")
# dplyr paketini yükleyin
install.packages("dplyr")
library(dplyr)

# intiharsebepsayisi veri çerçevesini oluşturun veya yükleyin
# Örnek olarak:
intiharsebepsayisi <- read.csv("dosya_yolu.csv")

# Tüm sütunları sayısal türe dönüştürme
intiharsebepsayisi <- mutate_all(intiharsebepsayisi, as.numeric)

# Sonucu kontrol etme
str(intiharsebepsayisi)


# readxl paketini kullanarak Excel dosyasını oku
library(readxl)
veri <- read_excel("C:/Users/soksuz/OneDrive - adesso Group/Documents")

# Dosya komutunu bul
getwd()

# Excel'den tablolarını çek


dosya_yolu1 <- "C:/Users/soksuz/OneDrive - adesso Group/Documents/GitHub/muy665-bahar2024-takim-code_or_die-1/tr_intihar_cinsiyet_kadin.xlsx"
intiharkadinsayisi <- read_excel(dosya_yolu1)

print(intiharkadinsayisi)

dosya_yolu2 <- "C:/Users/soksuz/OneDrive - adesso Group/Documents/GitHub/muy665-bahar2024-takim-code_or_die-1/tr_intihar_cinsiyet_erkek.xlsx"
intiharerkeksayisi <- read_excel(dosya_yolu2)

print(intiharerkeksayisi)

dosya_yolu3 <- "C:/Users/soksuz/OneDrive - adesso Group/Documents/GitHub/muy665-bahar2024-takim-code_or_die-1/tr_intihar_sebep.xlsx"
intiharsebepsayisi <- read_excel(dosya_yolu3)

print(intiharsebepsayisi)


# Tabloları özetle

# Her yıl için bölge sütunlarını topla
toplam_kadin_sayisi <- sum(as.matrix(intiharkadinsayisi[, -1]))

# Toplam kadın sayılarını yazdır
print(toplam_kadin_sayisi)


# Her yıl için bölge sütunlarını topla
toplam_erkek_sayisi <- sum(as.matrix(intiharerkeksayisi[, -1]))

# Toplam erkek sayılarını yazdır
print(toplam_erkek_sayisi)


# Her yıl için bölge sütunlarını topla

toplam_intihar_sayisi <- sum(as.matrix(intiharsebepsayisi[, -1]))

# Toplam intihar sayısını yazdır
print(toplam_intihar_sayisi)

#toplam kadın+erkek sebep'e eşit mi
toplam_cinsiyet_sayisi <- toplam_kadin_sayisi+toplam_erkek_sayisi
print(toplam_cinsiyet_sayisi)


# Sonucu yazdır
if (toplam_intihar_sayisi == toplam_cinsiyet_sayisi) {
  print("Her sebep için toplam intihar cinsiyet toplamına sayısına eşittir.\n")
} else {
  print("Her sebep için toplam intihar cinsiyet toplamına sayısına eşit değildir.\n")
}

# Yıllara göre gruplayıp toplam kadın sayılarını hesaplama
toplam_kadin <- intiharkadinsayisi%>%
  group_by(yil) %>%
  summarise(toplam_kadin = sum(istanbul, batimarmara, ege, dogumarmara, batimarmara, ortaanadolu, digerbolgeler))

# Sonucu göster
print(toplam_kadin)


