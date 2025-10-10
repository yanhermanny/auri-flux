# ------------------------------------------------------------
# 🔨 Etapa 1: Build da aplicação
# ------------------------------------------------------------
FROM maven:3.9.9-eclipse-temurin-21 AS build

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Copia os arquivos de configuração primeiro (para cache de dependências)
COPY pom.xml .
COPY src ./src

# Faz o build da aplicação (gera o .jar)
RUN mvn clean package -DskipTests

# ------------------------------------------------------------
# 🚀 Etapa 2: Runtime da aplicação
# ------------------------------------------------------------
FROM eclipse-temurin:21.0.5_11-jre-jammy

# Define o diretório de trabalho
WORKDIR /app

# Cria um usuário e grupo com privilégios mínimos
RUN groupadd --system auriflux && useradd --system --create-home --gid auriflux auriflux

# Copia o jar e define as permissões
COPY --from=build /app/target/*.jar app.jar
RUN chown -R auriflux:auriflux /app

# Define o usuário não-root
USER auriflux

# Define variáveis de ambiente importantes
ENV JAVA_OPTS="-Xms256m -Xmx512m"
ENV TZ=America/Sao_Paulo

# Expõe a porta padrão do Spring Boot
EXPOSE 8080

# Define o ponto de entrada
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]
