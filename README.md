# Veri tabanının yedeğini alan, aldığı yedekler içerisinde yedi günden önceki yedekleri silen script
Çalışma adımları;
1: İlk kullanımda kullanıcıdan veri tabanı adı, veri tabanı kullanıcı adı ve şifresi (Varsayılan server:127.0.0.1) isteyecek ve bu bilgileri sadece okunabilen /home/$USER/.turna dosyası içerisine kaydedecek, boş bir /home/$USER/backup klasörü oluşturacak. Tekrar kullanıldığında herhangi bir veri istemeyerek bilgileri varolan dosya içeriğinden alacak.
2: Yedek alma işlemi başarılı olduğunda veya olmadığında bilgi mesajı verecek.
3: Bir haftadan eski yedek dosyaları silinecek, silinen dosya isimleri yazdırılacak.

# Çalıştırmak
Bash dili ile yazılmıştır, Linux ortamlarında çalışır.
Çalıştırmak için:Uçbirim(Konsol) ekranına indirilen backup.bash dosyasının yolunu yazın ve ENTER ile çalıştırın.
*Örnek: root@root:~$ '/home/root/Masaüstü/backup.bash'*
