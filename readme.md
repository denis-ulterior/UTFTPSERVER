1: mkdir dhcp-data tftp-data
2: docker-compose build
3: docker-compose up -d


Verificação

Verifique os logs do contêiner:

docker logs <container_id>

Teste o TFTP: Use um cliente TFTP para enviar ou receber arquivos:

tftp 192.168.1.2

Teste o FTP: Conecte-se ao servidor FTP:

ftp 192.168.1.2