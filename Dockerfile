FROM eclipse-temurin:17-jdk

# Descarga Payara Micro jar directamente desde Maven Central
ADD https://repo1.maven.org/maven2/fish/payara/extras/payara-micro/5.2022.1/payara-micro-5.2022.1.jar /opt/payara/payara-micro.jar

# Copia el WAR al contenedor
COPY AlgorithmSimulation-1.0.war /opt/payara/app.war

# Establece el directorio de trabajo
WORKDIR /opt/payara

# Expone el puerto 8080 para HTTP
EXPOSE 8080

# Comando para ejecutar Payara Micro con el WAR desplegado en la raiz
CMD ["java", "-jar", "payara-micro.jar", "--deploy", "app.war", "--contextroot", "/"]
