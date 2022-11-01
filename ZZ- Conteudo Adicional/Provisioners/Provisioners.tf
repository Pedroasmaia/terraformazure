resource "null_resource" "ps" {
  provisioner "local-exec" {
    command = "Get-Process > lista.txt"
    interpreter = ["Powershell", "Command"]
  }
}