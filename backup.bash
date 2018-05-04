#!/bin/bash

dosyayolu=/home/$USER/.turna
backups=/home/$USER/backup/
datetime=$(date +'%Y-%m-%dT%H:%M:%S')
deleteoldname=$(date +'%Y-%m-%d' -d "-7 days")

if [[ -f $dosyayolu ]];
then
echo
echo "Bilgiler bulundu."

else
mkdir $backups
cat > $dosyayolu <<EOF
kadi
sifre
veri
EOF
chmod 444 $dosyayolu
echo Veritabanı Adı
read veritabani
echo Kullanıcı Adı
read YKADI
echo -n Şifre:
read -s YSIFRE

sed -i 's/kadi/'$YKADI'/g' $dosyayolu
sed -i 's/sifre/'$YSIFRE'/g' $dosyayolu
sed -i 's/veri/'$veritabani'/g' $dosyayolu
fi

IFS=$'\r\n' GLOBIGNORE='*' command eval  'XYZ=($(cat "$dosyayolu"))'
user=${XYZ[0]}
pw=${XYZ[1]}
db_name=${XYZ[2]}

mysqldump -h 127.0.0.1 -u $user --password=$pw $db_name | gzip -9 > $backups$db_name-$datetime.sql.gz
clear

if [[ -f $backups$db_name-$datetime.sql.gz ]];
then
printf "%s\n" "Veri Tabanı Oluşturuldu."
else
echo
printf "%s\n" "Veri Tabanı Oluşturulamadı!"
fi

eskiliste=$(find $backups -name "drupal*" -mtime +7)

if [[ "" != $eskiliste ]];
then

printf "%s\n" "Bir Haftadan eski dosya bulundu." "Silinen Dosyalar;" $eskiliste
find $backups -name "$db_name*" -mtime +7 -delete

else
printf "%s\n" "Bir Haftadan eski dosya bulunamadı."
fi
