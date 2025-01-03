# Imagem base do Ubuntu
FROM ubuntu:22.04

# Atualizar pacotes e instalar os servidores necessários
RUN apt-get update && apt-get install -y \
    isc-dhcp-server \
    tftpd-hpa \
    && apt-get clean

# Criar diretórios para persistência de dados
RUN mkdir -p /data/dhcp /data/tftp /data/ftp
RUN chown -R tftp:tftp /data/tftp
#RUN chmod 777 /data/tftp

# Copiar arquivos de configuração para os locais corretos
COPY dhcpd.conf /etc/dhcp/dhcpd.conf
COPY tftpd-hpa /etc/default/tftpd-hpa

# Expor as portas necessárias
EXPOSE 67/udp 69/udp 21 10000-10100

# Definir o volume para persistência
VOLUME ["/data/dhcp", "/data/tftp", "/data/ftp"]

# Comando para iniciar os serviços
CMD service tftpd-hpa start && \
    tail -f /dev/null
