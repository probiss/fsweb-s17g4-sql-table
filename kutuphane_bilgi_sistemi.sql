-- SQL ifadelerinizi buraya yazınız.
CREATE TABLE `ogrenci`(
    `ogrno` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `ad` VARCHAR(100) NOT NULL,
    `soyad` VARCHAR(100) NOT NULL,
    `dtarih` VARCHAR(100) NOT NULL,
    `cinsiyet` VARCHAR(10) NOT NULL,
    `sinif` VARCHAR(10) NOT NULL,
    `puan` INT UNSIGNED NOT NULL
);
ALTER TABLE
    `ogrenci`  ADD PRIMARY KEY `ogrenci_id_primary`(`id`);
CREATE TABLE `islem`(
    `islemno` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `ogrenci_id` INT NOT NULL,
    `kitap_id` INT NOT NULL,
    `atarih` VARCHAR(100) NOT NULL,
    `vtarih` VARCHAR(100) NOT NULL
);
ALTER TABLE
    `islem`  ADD PRIMARY KEY `islem_id_primary`(`id`);
ALTER TABLE
    `islem`  ADD UNIQUE `islem_ogrenci_id_unique`(`ogrenci_id`);
ALTER TABLE
    `islem` ADD UNIQUE `islem_kitap_id_unique`(`kitap_id`);
CREATE TABLE `yazar`(
    `yazarno` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `ad` VARCHAR(100) NOT NULL,
    `soyad` VARCHAR(100) NOT NULL
);
ALTER TABLE
    `yazar` ADD PRIMARY KEY `yazar_id_primary`(`id`);
CREATE TABLE `kitap`(
    `kitapno` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `ad` VARCHAR(300) NOT NULL,
    `sayfasayisi` INT UNSIGNED NOT NULL,
    `puan` INT UNSIGNED NOT NULL,
    `yazar_id` INT UNSIGNED NOT NULL,
    `tur_id` INT UNSIGNED NOT NULL
);
ALTER TABLE
    `kitap` ADD PRIMARY KEY `kitap_id_primary`(`id`);
ALTER TABLE
    `kitap` ADD UNIQUE `kitap_yazar_id_unique`(`yazar_id`);
ALTER TABLE
    `kitap` ADD UNIQUE `kitap_tur_id_unique`(`tur_id`);
CREATE TABLE `tur`(
    `turno` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `ad` VARCHAR(100) NOT NULL
);
ALTER TABLE
    `tur` ADD PRIMARY KEY `tur_id_primary`(`id`);
ALTER TABLE
    `islem` ADD CONSTRAINT `islem_kitap_id_foreign` FOREIGN KEY(`kitap_id`) REFERENCES `kitap`(`id`);
ALTER TABLE
    `kitap` ADD CONSTRAINT `kitap_tur_id_foreign` FOREIGN KEY(`tur_id`) REFERENCES `tur`(`id`);
ALTER TABLE
    `kitap` ADD CONSTRAINT `kitap_yazar_id_foreign` FOREIGN KEY(`yazar_id`) REFERENCES `yazar`(`id`);
ALTER TABLE
    `islem` ADD CONSTRAINT `islem_ogrenci_id_foreign` FOREIGN KEY(`ogrenci_id`) REFERENCES `ogrenci`(`id`);
