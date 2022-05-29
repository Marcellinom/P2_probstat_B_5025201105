# Praktikum 2 Probstat
## Data Diri
- Nama: Marcellino Mahesa Janitra
- NRP: 5025201105
- Kelas: Probstat B

## Soal 1
Seorang peneliti melakukan penelitian mengenai pengaruh aktivitas 𝐴 terhadap
kadar saturasi oksigen pada manusia. Peneliti tersebut mengambil sampel
sebanyak 9 responden. Pertama, sebelum melakukan aktivitas 𝐴, peneliti mencatat
kadar saturasi oksigen dari 9 responden tersebut. Kemudian, 9 responden tersebut
diminta melakukan aktivitas 𝐴. Setelah 15 menit, peneliti tersebut mencatat kembali
kadar saturasi oksigen dari 9 responden tersebut. Berikut data dari 9 responden
mengenai kadar saturasi oksigen sebelum dan sesudah melakukan aktivitas A
![image](https://cdn.discordapp.com/attachments/810347347237273631/980521703425859674/unknown.png)

- Standar Deviansi
```r
x = c(78,75,67,77,70,72,78,74,77)
y = c(100,95,70,90,90,90,89,90,100)
sd(x-y)
# [1] 6.359595
```

- penghitungan menggunakan t.test two.sided

memasukan variabel variabel yang didapat dari soal kedalam function
```r
t.test(x, y, alternative = 'two.sided', mu = 0, paired = TRUE)
```
![image](https://cdn.discordapp.com/attachments/810347347237273631/980522358014103593/unknown.png)

## Soal 2
Diketahui bahwa mobil dikemudikan rata-rata lebih dari 20.000 kilometer per tahun.
Untuk menguji klaim ini, 100 pemilik mobil yang dipilih secara acak diminta untuk
mencatat jarak yang mereka tempuh. Jika sampel acak menunjukkan rata-rata
23.500 kilometer dan standar deviasi 3900 kilometer. 
- perhitungan menggunakan zsum test greater

memasukan variabel variabel yang didapat dari soal kedalam function
```r
zsum.test(alternative = "greater", conf.level = 0.95, n.x = 100, mean.x = 23500, sigma.x = 3900, mu = 20000)
```
![image](https://cdn.discordapp.com/attachments/810347347237273631/980522710058811412/unknown.png)
- Analisa

berdasarkan output, diketahui ```z 8.9744; dengan p-value < 2.2e-16.```. Terdapat bukti cukup dimana rata rata lebih besar dari 20.000 km/tahun

## Soal 4
Seorang Peneliti sedang meneliti spesies dari kucing di ITS . Dalam penelitiannya
ia mengumpulkan data tiga spesies kucing yaitu kucing oren, kucing hitam dan
kucing putih dengan panjangnya masing-masing.

- import dataset dan bikin jadi 3 grup

```r
dataset = read.table(url("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt"))
dataset$JENIS = as.factor(dataset$V1)
dataset$JENIS = factor(dataset$JENIS, labels = c("grup 1", "grup 2", "grup 3", "grup 4"))

grup_1 = subset(dataset, JENIS == "grup 1")
grup_2 = subset(dataset, JENIS == "grup 2")
grup_3 = subset(dataset, JENIS == "grup 3")
```

- Plot quantil normal grup 1
```r
qqnorm(y = grup_1$V2, ylim = c(0,30))
```
![image](https://cdn.discordapp.com/attachments/810347347237273631/980527807388069989/unknown.png)
- Plot quantil normal grup 2
```r
qqnorm(y = grup_2$V2, ylim = c(0,30))
```
![image](https://cdn.discordapp.com/attachments/810347347237273631/980527987919323186/unknown.png)
- Plot quantil normal grup 3
```r
qqnorm(y = grup_3$V2, ylim = c(0,30))
```
![image](https://media.discordapp.net/attachments/810347347237273631/980528048560545863/unknown.png?width=410&height=367)

- Homogeneity of Variances
```r
# hapus 1st row
dataset = dataset[-1,]
bartlett.test(V2 ~ V1, data = dataset)
```
row pertama dihapus karena bentuk dataset:

![image](https://media.discordapp.net/attachments/810347347237273631/980532228666830938/unknown.png?width=228&height=231)

bartlett test kolom V2 dengan V1, hasil:

![image](https://media.discordapp.net/attachments/810347347237273631/980532075260174356/unknown.png?width=376&height=68)

- Uji coba Anova, mendapat model linear
```r
model_1 = lm(V2 ~ V1, data = dataset)
anova(model_1)
```
![image](https://cdn.discordapp.com/attachments/810347347237273631/980533460785590332/unknown.png)

- Nilai-p dari uji coba ANOVA
```r
TukeyHSD(aov(model_1))
```
Nilai-p: 0.0013 dimana < 0.05

kesimpulan: H0 ditolak.

![image](https://cdn.discordapp.com/attachments/810347347237273631/980533781083615322/unknown.png)

- visualisasi data
```r
ggplot(dataset, aes(x = V1, y = V2)) + geom_boxplot(colour = "black") + scale_x_discrete() + xlab("species") + ylab("length")
```
![image](https://cdn.discordapp.com/attachments/810347347237273631/980536024788783104/unknown.png)