# output "container-name" {
#   value       = docker_container.nodered_container[*].name
#   description = "The name of the container"
# }

# output "ip-address" {
#   value       = [for i in docker_container.nodered_container[*] : join(":", i.network_data[*].ip_address , i.ports[*]["external"])  ]
#   description = "The IP address and external port of the container"
# }

output "application_access" {
   value = {for i in docker_container.app_container[*] : i.name => join(":", i.network_data[*].ip_address , i.ports[*]["external"])}
   description = "Name and socket for each application."
}