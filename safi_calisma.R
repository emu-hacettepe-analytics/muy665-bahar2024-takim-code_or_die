# readxl paketini yükle
install.packages("readxl")
# dplyr paketini yükleyin
install.packages("dplyr")
library(dplyr)
library(ggplot2)


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

dosya_yolu4 <- "C:/Users/soksuz/OneDrive - adesso Group/Documents/GitHub/muy665-bahar2024-takim-code_or_die-1/toplam_nufus_sayisi.xlsx"
toplamnufus <- read_excel(dosya_yolu4)

print(toplamnufus)


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

# Her yıl için toplam kadın sayısını hesapla

colnames(intiharkadinsayisi)

# Toplam kadın sayısını hesapla
toplam_kadin <- rowSums(intiharkadinsayisi[, c("istanbul", "bati marmara", "ege", "dogu marmara", "bati anadolu", "akdeniz", "orta anadolu", "bati karadeniz", "dogu karadeniz", "kuzeydogu anadolu", "ortadogu anadolu", "güneydogu anadolu")])

# Yılları ve toplam kadın sayılarını içeren yeni bir veri çerçevesi oluştur
toplam_kadin_tablo <- data.frame(
  yil = intiharkadinsayisi$yil,
  toplam_kadin = toplam_kadin
)

# Sonucu yazdır
print(toplam_kadin_tablo)

# Toplam erkek sayısını hesapla
toplam_erkek <- rowSums(intiharerkeksayisi[, c("istanbul", "bati marmara", "ege", "dogu marmara", "bati anadolu", "akdeniz", "orta anadolu", "bati karadeniz", "dogu karadeniz", "kuzeydogu anadolu", "ortadogu anadolu", "güneydogu anadolu")])

str(intiharerkeksayisi)
# Yılları ve toplam erkek sayılarını içeren yeni bir veri çerçevesi oluştur
toplam_erkek_tablo <- data.frame(
  yil = intiharkadinsayisi$yil,
  toplam_erkek = toplam_erkek
)

print(toplam_erkek)

# Sonucu yazdır
print(toplam_erkek_tablo)
 
#Grafik 1- Türkiyedeki yıllara göre intihar oranı -
#Grafik-2 Türkiyedeki bölgelere göre intihar oranı
#Grafik-3 bölgelere göre intihar yoğunluğu bölgenin toplam cinayet sayısı/türkiyedeki cinayet sayısına oranı


türkiye_oran <- (murders$total/murders$population)*100000





# İstanbul'daki intihar sayılarını topla
istanbul_intihar <- sum(intiharkadinsayisi$istanbul)

# Toplam intihar sayılarını hesapla
toplam_intihar <- sum(intiharkadinsayisi[, -1])

# Oranı hesapla
istanbul_oran <- istanbul_intihar / toplam_intihar

# Sonucu yazdır
print(istanbul_oran)


# Bölgeleri seç
bolgeler <- c("istanbul", "bati marmara", "ege", "dogu marmara", "bati anadolu", "akdeniz", "orta anadolu", "bati karadeniz", "dogu karadeniz", "kuzeydogu anadolu", "ortadogu anadolu", "güneydogu anadolu")

# Her bir bölge için İstanbul'daki intihar sayılarını topla
bolge_intihar <- colSums(intiharkadinsayisi[, bolgeler])

# Toplam intihar sayılarını hesapla
toplam_intihar <- sum(intiharkadinsayisi[, -1])

# Her bir bölgenin oranını hesapla
bolge_oranlar <- bolge_intihar / toplam_intihar

# Bölgeleri ve bu bölgelerin oranlarını içeren yeni bir veri çerçevesi oluştur
bolge_oranlari <- data.frame(
  bolge = bolgeler,
  oran = bolge_oranlar
)

# Sonucu yazdır
print(bolge_oranlari)

install.packages("ggplot2")
library(ggplot2)
# Veri setini uzun formata dönüştür
veri_long <- tidyr::pivot_longer(tr_intihar_cinsiyet_kadin, -yil, names_to = "bolge", values_to = "intihar_sayisi")

# Sütun grafiği oluştur
ggplot(veri_long, aes(x = factor(yil), y = intihar_sayisi, fill = bolge)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Yıllara Göre Bölgelerdeki Kadın Intihar Sayıları",
       x = "Yıl",
       y = "Intihar Sayısı",
       fill = "Bölgeler") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Veri setini uzun formata dönüştür erkek
veri_long <- tidyr::pivot_longer(tr_intihar_cinsiyet_erkek, -yil, names_to = "bolge", values_to = "intihar_sayisi")

# Sütun grafiği oluştur
ggplot(veri_long, aes(x = factor(yil), y = intihar_sayisi, fill = bolge)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Yıllara Göre Bölgelerdeki Erkek Intihar Sayıları",
       x = "Yıl",
       y = "Intihar Sayısı",
       fill = "Bölgeler") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Veri setini uzun formata dönüştür erkek
veri_long <- tidyr::pivot_longer(tr_intihar_sebep, -yil, names_to = "bolge", values_to = "intihar_sayisi")

# Sütun grafiği oluştur
ggplot(veri_long, aes(x = factor(yil), y = intihar_sayisi, fill = bolge)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Sebeplerine Göre Yıllık İntihar Sayısı ",
       x = "Yıl",
       y = "Intihar Sayısı",
       fill = "Sebepler") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
scale_y_continuous(trans = "log10", breaks = c(0.1, 1, 10, 100, 1000), labels = c("0.1", "1", "10", "100", "1000"))


print(toplam_sebep_tablo)

ggplot(toplam_sebep_tablo, aes(x = yil, y = toplam_sebep)) +
  geom_line() +
  labs(title = "Yıllara Göre Toplam İntihar Sayısı",
       x = "Yıl",
       y = "Toplam İntihar Sayısı") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_x_continuous(breaks = toplam_sebep_tablo$yil)


print(tr_intihar_cinsiyet_erkek)
print(tr_intihar_cinsiyet_kadin)

library(dplyr)

# İki tabloyu satır bazında toplamak
birlesik_tablo <- tr_intihar_cinsiyet_kadin %>%
  mutate(toplam_sebep_kadin = rowSums(select(., -yil))) %>%
  inner_join(tr_intihar_cinsiyet_erkek %>% 
               mutate(toplam_sebep_erkek = rowSums(select(., -yil))), by = "yil") %>%
  select(yil, toplam_sebep_kadin, toplam_sebep_erkek)

# Toplam sebepleri içeren tabloyu yazdır
print(birlesik_tablo)

# Kadın ve erkek intihar sayılarını topla
toplam_tablo <- tr_intihar_cinsiyet_kadin %>%
  inner_join(tr_intihar_cinsiyet_erkek, by = "yil") %>%
  mutate(
    istanbul = istanbul.x + istanbul.y,
    `bati marmara` = `bati marmara.x` + `bati marmara.y`,
    ege = ege.x + ege.y,
    `dogu marmara` = `dogu marmara.x` + `dogu marmara.y`,
    `bati anadolu` = `bati anadolu.x` + `bati anadolu.y`,
    akdeniz = akdeniz.x + akdeniz.y,
    `orta anadolu` = `orta anadolu.x` + `orta anadolu.y`,
    `bati karadeniz` = `bati karadeniz.x` + `bati karadeniz.y`,
    `dogu karadeniz` = `dogu karadeniz.x` + `dogu karadeniz.y`,
    `kuzeydogu anadolu` = `kuzeydogu anadolu.x` + `kuzeydogu anadolu.y`,
    `ortadogu anadolu` = `ortadogu anadolu.x` + `ortadogu anadolu.y`,
    `güneydogu anadolu` = `güneydogu anadolu.x` + `güneydogu anadolu.y`
  ) %>%
  select(yil, istanbul, `bati marmara`, ege, `dogu marmara`, `bati anadolu`, akdeniz, `orta anadolu`, `bati karadeniz`, `dogu karadeniz`, `kuzeydogu anadolu`, `ortadogu anadolu`, `güneydogu anadolu`)

# Yeniden düzenlenmiş tabloyu yazdır
print(toplam_tablo)

print(toplamnufus)



# Satırda yıllar, sütünde bölgeler olan iki tablodaki değerleri birbirine bölme
bolen_tablo <- as.data.frame(matrix(NA, ncol = length(unique(toplamnufus$yil)) + 1, nrow = nrow(toplamnufus)))

# İlk sütun yılları içerecek
bolen_tablo[, 1] <- toplamnufus$yil

# Bölgelerin adlarını belirle
bolgeler <- c("istanbul", "bati marmara", "ege", "dogu marmara", "bati anadolu", "akdeniz", "orta anadolu", "bati karadeniz", "dogu karadeniz", "kuzeydogu anadolu", "ortadogu anadolu", "güneydogu anadolu")

# Her bir bölge için işlemi gerçekleştirme
for (i in 1:length(bolgeler)) {
  bolge <- bolgeler[i]
  
  # İlgili bölgeye ait nüfus değerlerini al
  nufus <- toplamnufus[[bolge]]
  
  # İlgili bölgeye ait intihar sayılarını al
  intihar_sayilari <- toplam_tablo[[bolge]]
  
  # Bölme işlemi
  bolen_tablo[, i + 1] <- as.numeric(gsub(",", "", nufus)) / as.numeric(gsub(",", "", intihar_sayilari))
}

# Sütun isimlerini güncelle
colnames(bolen_tablo) <- c("yil", bolgeler)

# Yeni tabloyu yazdırma
print(bolen_tablo)




