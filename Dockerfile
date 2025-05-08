FROM eclipse-temurin:17-jdk

ENV PAYARA_MICRO_VERSION 5.2022.1

# Descarga Payara Micro jar directamente desde Maven Central
ADD https://search.maven.org/remotecontent?filepath=fish/payara/distributions/payara-micro/$PAYARA_MICRO_VERSION/payara-micro-$PAYARA_MICRO_VERSION.jar /opt/payara/payara-micro.jar

# Copia el WAR al contenedor
COPY AlgorithmSimulation-1.0.war /opt/payara/app.war

# Establece el directorio de trabajo
WORKDIR /opt/payara

# Expone el puerto 8080 para HTTP
EXPOSE 8080

# Comando para ejecutar Payara Micro con el WAR desplegado en la raiz
CMD ["java", "-jar", "payara-micro.jar", "--deploy", "app.war", "--contextroot", "/"]
