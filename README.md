

# Desafio Dio - Infraestrutura como Código - Script de Provisionamento de um Servidor Web (Apache)



####     Projeto ainda mais completo e abrangente com mais códigos para: 

##### Infraestrutura como Código - Script de Provisionamento de um Servidor Web (Apache)



Este script de infraestrutura como código provisiona um servidor web Apache em um sistema operacional Linux. Ele automatiza as tarefas de instalação, configuração e inicialização do servidor web.



#### **Funcionalidades:**

- Instala o pacote Apache2

- Cria um arquivo de configuração virtual para o servidor web

- Habilita o módulo SSL para conexões seguras

- Inicializa o serviço Apache2

  

#### **Uso:**

1. Copie o script para um arquivo em seu sistema Linux.

2. Edite o script para especificar as configurações desejadas, como o nome do domínio e o certificado SSL.

3. Execute o script com privilégios de root.

   

#### **Exemplo:**

bash



```bash
#!/bin/bash

# Instala o Apache2
apt-get update
apt-get install apache2

# Cria um arquivo de configuração virtual
cat > /etc/apache2/sites-available/meu-site.conf <<EOF
<VirtualHost *:80>
    ServerName meu-site.com
    DocumentRoot /var/www/meu-site
</VirtualHost>
EOF

# Habilita o módulo SSL
a2enmod ssl

# Inicializa o Apache2
systemctl restart apache2
```



```bash
#!/bin/bash

# Validação de entrada
if [ $# -lt 1 ]; then
  echo "Uso: $0 <nome_do_site>"
  exit 1
fi

# Variáveis
nome_do_site=$1

# Instala o Apache2
apt-get update
apt-get install apache2

# Cria um diretório para o site
mkdir /var/www/$nome_do_site

# Cria um arquivo de configuração virtual
cat > /etc/apache2/sites-available/$nome_do_site.conf <<EOF
<VirtualHost *:80>
    ServerName $nome_do_site
    DocumentRoot /var/www/$nome_do_site
</VirtualHost>
EOF

# Habilita o site
a2ensite $nome_do_site

# Habilita o módulo SSL
a2enmod ssl

# Instala o pacote certbot para obter um certificado SSL
apt-get install certbot

# Obtém um certificado SSL
certbot --apache

# Inicializa o Apache2
systemctl restart apache2

# Logs
echo "Servidor web provisionado com sucesso para $nome_do_site."
```



### **Funcionalidades Adicionais:**



- **Validação de Entrada:** Verifica se o nome do site é fornecido.

- **Logs:** Registra ações executadas pelo script para fins de auditoria.

- **Obtenção Automática de Certificado SSL:** Usa o certbot para obter e instalar um certificado SSL automaticamente.

  

## **Observações:**



- Este script é mais completo e automatiza tarefas adicionais, como a obtenção de um certificado SSL.
- Você pode personalizar o script para atender às necessidades específicas do seu sistema, como alterar a porta ou o diretório raiz do documento.

- Este script é um exemplo básico e pode ser personalizado para atender às necessidades específicas do seu sistema.
- Para usar conexões SSL seguras, você precisará obter um certificado SSL e configurá-lo no arquivo de configuração virtual.

