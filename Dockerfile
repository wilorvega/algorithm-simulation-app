# Usa la imagen oficial de Payara Micro
FROM payara/micro:5.2022.5

# Copia tu archivo WAR al contenedor
COPY AlgorithmSimulation-1.0.war /opt/payara/app.war

# Expone el puerto por defecto (opcional)
EXPOSE 8080

# Comando para ejecutar Payara Micro con el WAR desplegado
CMD ["java", "-jar", "/opt/payara/payara-micro.jar", "--deploy", "/opt/payara/app.war", "--contextRoot", "/"]