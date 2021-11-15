[
  {
    "name": "myapp",
    "image": "${app_image}",
    "cpu": ${fargate_cpu},
    "memory": ${fargate_memory},
    "networkMode": "awsvpc",
    "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
          "awslogs-group": "/ecs/myapp",
          "awslogs-region": "${aws_region}",
          "awslogs-stream-prefix": "ecs"
        }
    },
        "environment": [
          {
            "name": "ASP_DB_HOST",
            "value": "${db_host}"
          },
          {
            "name": "ASP_DB_USER",
            "value": "${db_user}"
          },
          {
            "name": "ASP_DB_PASSWORD",
            "value": "${db_password}"
          },
          {
            "name": "ASP_DB_NAME",
            "value": "${db_name}"
          }
        ],
    "portMappings": [
      {
        "containerPort": ${app_port},
        "hostPort": ${app_port}
      }
    ]
  }
]