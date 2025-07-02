FROM python:3.13.5-alpine3.22

#Define o diretório de trabalho dentro do container
WORKDIR /app

#Copia os arquivos necessários e instala as dependências
#Usamos no-cache-dir para evitar o uso de cache do pip
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

#Copia o restante dos arquivos da aplicação
COPY . .

#Expoe a porta 8000 para acesso externo
EXPOSE 8000

#Comando para  rodar a aplicação usando uvicorn
#O hosto 0.0.0.0 permite que a aplicação seja acessível de fora do container
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
