resource "docker_image" "teste" {
   name = "teste"

   build {
     path = "."
     dockerfile = "Dockerfile"
   }

   depends_on = [
      aws_instance.Ruby
    ]
}