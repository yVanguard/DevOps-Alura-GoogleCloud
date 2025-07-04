FROM python:3.13.5-alpine3.22
# Usa a imagem base oficial do Python com a versão 3.13.5, baseada no Alpine Linux para leveza

WORKDIR /app
# Define o diretório de trabalho dentro do contêiner

COPY requirements.txt .
# Copia o arquivo de requisitos para o diretório de trabalho

RUN pip install --no-cache-dir -r requirements.txt
# Instala as dependências Python sem usar o cache para reduzir o tamanho da imagem

COPY . .
# Copia todos os arquivos do diretório atual para o diretório de trabalho no contêiner

EXPOSE 8000
# Informa que o contêiner expõe a porta 8000 para conexões externas

CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
# Define o comando para iniciar a aplicação usando Uvicorn, escutando em todas as interfaces na porta 8000