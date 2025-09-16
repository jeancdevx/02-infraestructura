# Ambiente DEV - Infraestructura Multi-Tier con Terraform

Este proyecto despliega un ambiente de desarrollo completo usando Terraform y Docker con arquitectura multi-tier.

## Arquitectura

La infraestructura incluye:

- **Capa de aplicación**: 3 contenedores Nginx (app1, app2, app3)
- **Capa de persistencia**: PostgreSQL + Redis
- **Capa de monitoreo**: Grafana
- **Redes separadas**: `app_net`, `persistence_net`, `monitor_net`

## Requisitos previos

- Docker instalado y funcionando
- Terraform instalado
- Permisos para ejecutar Docker

## Despliegue

```bash
# Navegar al directorio de infraestructura
cd iac/

# Inicializar Terraform
terraform init

# Revisar el plan de despliegue
terraform plan

# Aplicar la infraestructura
terraform apply -auto-approve
```

## Verificación

```bash
# Verificar que todo funciona
curl http://localhost:8080  # app1
curl http://localhost:8081  # app2
curl http://localhost:8082  # app3
curl http://localhost:3000  # grafana

# Ver información del ambiente
terraform output
```

## Servicios disponibles

| Servicio | URL | Credenciales |
|----------|-----|-------------|
| **App1** | http://localhost:8080 | - |
| **App2** | http://localhost:8081 | - |
| **App3** | http://localhost:8082 | - |
| **Grafana** | http://localhost:3000 | admin/admin |
| **PostgreSQL** | localhost:5432 | example/example |
| **Redis** | localhost:6379 | - |

## Conectividad entre servicios

- Los contenedores de aplicación pueden acceder a PostgreSQL y Redis
- Grafana puede monitorear todos los servicios
- Cada red está aislada según su función

## Limpieza

```bash
# Destruir la infraestructura
terraform destroy -auto-approve
```

## Estructura del proyecto

```
.
├── iac/
│   ├── main.tf              # Configuración del proveedor Docker
│   ├── network.tf           # Definición de redes Docker
│   ├── docker-container.tf  # Contenedores y servicios
└── README.md               #